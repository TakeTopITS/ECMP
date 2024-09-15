using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAllReq : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;


        strLangCode = Session["LangCode"].ToString();

        string strUserName = Session["UserName"].ToString();

        //this.Title = "所有需求状态";

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有需求", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from Requirement as requirement ";
            strHQL += " Where requirement.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by requirement.ReqID DESC";
            RequirementBLL requirementBLL = new RequirementBLL();
            lst = requirementBLL.GetAllRequirements(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();


            LB_Sql.Text = strHQL;

            LB_QueryScope.Text = Resources.lang.ZZXQSQZSY;


            strHQL = "from ReqStatus as reqStatus";
            strHQL += " Where reqStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by reqStatus.SortNumber ASC";
            ReqStatusBLL reqStatusBLL = new ReqStatusBLL();
            lst = reqStatusBLL.GetAllReqStatuss(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = GetDepartName(strDepartCode);

            LB_QueryScope.Text = Resources.lang.ZZZBuMen + strDepartName;

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);

            strHQL = "from Requirement as requirement where requirement.ApplicantCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ") Order by requirement.ReqID DESC";
            RequirementBLL requirementBLL = new RequirementBLL();
            lst = requirementBLL.GetAllRequirements(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;
        }


    }

    protected void BT_AllReq_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        LB_QueryScope.Text = Resources.lang.ZZXQSQZSY;

        DataGrid1.Visible = false;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";

        string strDepartString = LB_DepartString.Text.Trim();
        strHQL = "from Requirement as requirement ";
        strHQL += " Where requirement.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by requirement.ReqID DESC";
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = GetUserName(strOperatorCode);

        string strHQL = "from Requirement as requirement where requirement.ApplicantCode = " + "'" + strOperatorCode + "'" + " order by requirement.ReqID DESC";

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        LB_DepartCode.Text = "";

        LB_QueryScope.Text = Resources.lang.Applicant + ":" + strOperatorCode + strOperatorName;

        RequirementBLL requirementBLL = new RequirementBLL();
        IList lst = requirementBLL.GetAllRequirements(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strHQL;
        string strOperatorCode = LB_OperatorCode.Text;
        string strOperatorName;
        string strDepartCode, strDepartName;

        string strDepartString = LB_DepartString.Text.Trim();

        if (LB_OperatorCode.Text == "")
        {
            strHQL = "from Requirement as requirement where requirement.Status = " + "'" + strStatus + "'";
            strHQL += " and requirement.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by requirement.ReqID DESC";

            LB_QueryScope.Text = Resources.lang.ZZApplicantAll + " " + Resources.lang.ZhuangTai + ":" + strStatus;
        }


        else
        {
            if (LB_DepartCode.Text == "")
            {
                strOperatorName = GetUserName(strOperatorCode);
                strHQL = "from Requirement as requirement where requirement.ApplicantCode = " + "'" + strOperatorCode + "'" + " and " + "requirement.Status = " + "'" + strStatus + "'";
                strHQL += " and requirement.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
                strHQL += " order by requirement.ReqID DESC";
                LB_QueryScope.Text = Resources.lang.Applicant + ":" + strOperatorCode + strOperatorName + " " + Resources.lang.ZhuangTai + ":" + strStatus;
            }
            else
            {
                strDepartCode = LB_DepartCode.Text.Trim();
                strDepartName = LB_DepartName.Text.Trim();
                strHQL = "from Requirement as requirement where requirement.ApplicantCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ") and " + "requirement.Status = " + "'" + strStatus + "'";
                strHQL += " and requirement.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
                strHQL += " order by requirement.ReqID DESC";
                LB_QueryScope.Text = Resources.lang.ZZZBuMen + strDepartName + " &nbsp;&nbsp;需求状态：" + strStatus;

            }
        }

        RequirementBLL requirementBLL = new RequirementBLL();
        IList lst = requirementBLL.GetAllRequirements(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        RequirementBLL requirementBLL = new RequirementBLL();
        IList lst = requirementBLL.GetAllRequirements(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected string GetDepartName(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);

        Department department = (Department)lst[0];

        return department.DepartName.Trim();

    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }

}
