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

public partial class TTLTCandidateManage : System.Web.UI.Page
{
    string strCurrentUserType;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strHQL;

        string strUserCode, strUserName, strDepartString;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strCurrentUserType = ShareClass.GetUserType(strUserCode);

        //LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
        //bool blVisible = ltCandidateInformationBLL.GetAuthobility("人事管理", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}


        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            LB_LTCandidateInformationOwner.Text = "";

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByUserInfor(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "Select * From T_LTCandidateInformation Where BelongDepartCode in " + strDepartString;
            strHQL += " Order By CreateTime ASC";
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_LTCandidateInformation");
            DataGrid1.DataSource = ds1;
            DataGrid1.DataBind();

            LB_UserNumber.Text = Resources.lang.GCXD + " : " + ds1.Tables[0].Rows.Count.ToString();
            LB_Sql.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strDepartName;
        int intCount;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            strHQL = "Select * From T_LTCandidateInformation Where BelongDepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Order By CreateTime ASC";
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_LTCandidateInformation");
            DataGrid1.DataSource = ds1;
            DataGrid1.DataBind();

            intCount = ds1.Tables[0].Rows.Count;

            LB_LTCandidateInformationOwner.Text = strDepartName + " ：";
            LB_UserNumber.Text = Resources.lang.GCXD + " : " + intCount.ToString();

            LB_DepartCode.Text = strDepartCode;
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
      

        LB_LTCandidateInformationOwner.Text = "";

        string strUserName = "%" + TB_UserName.Text.Trim() + "%";
        string strDepartString = LB_DepartString.Text.Trim();
        string strStatus = "%" + DL_Status.SelectedValue + "%";
        string strCompany = "%" + TB_Company.Text.Trim() + "%";
        string strCurrentDuty = "%" + TB_CurrentDuty.Text.Trim() + "%";
        string strBriefKeyWord = "%" + TB_BriefKeyWord.Text.Trim() + "%";


        strHQL = "Select * from T_LTCandidateInformation where ";
        strHQL += " UserName Like " + "'" + strUserName + "'";
        strHQL += " and Status Like " + "'" + strStatus + "'";
        strHQL += " and Company Like " + "'" + strCompany + "'";
        strHQL += " and CurrentDuty Like " + "'" + strCurrentDuty + "'";
        strHQL += " and Brief Like " + "'" + strBriefKeyWord + "'";
        strHQL += " and BelongDepartCode in " + strDepartString;
        strHQL += " Order by CreateTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LTCandidateInformation");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_UserNumber.Text = Resources.lang.GCXD + " : " + ds.Tables[0].Rows.Count.ToString();
        LB_Sql.Text = strHQL;

        LB_DepartCode.Text = "";
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LTCandidateInformation");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = "候选人信息_" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
                string strDepartCode = LB_DepartCode.Text.Trim();

                CreateExcel(strDepartCode, fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }

    private void CreateExcel(string strDepartCode, string fileName)
    {
        string strHQL;
   

        if (strDepartCode == "")//所有成员的情况
        {
            string strUserName = "%" + TB_UserName.Text.Trim() + "%";
            string strDepartString = LB_DepartString.Text.Trim();
            string strStatus = "%" + DL_Status.SelectedValue + "%";
            string strCompany = "%" + TB_Company.Text.Trim() + "%";
            string strCurrentDuty = "%" + TB_CurrentDuty.Text.Trim() + "%";
            string strBriefKeyWord = "%" + TB_BriefKeyWord.Text.Trim() + "%";


            strHQL = string.Format(@"Select UserName 姓名,Gender 性别,Age 年龄,Company 公司,Department 部门,
                CurrentDuty 职责, MobilePhone 移动电话,CreateTime 创建日期, Status 状态,BelongDepartCode 归属部门代码, BelongDepartName 归属部门名称
                    From T_LTCandidateInformation Where BelongDepartCode in ") + strDepartString + " ";
            strHQL += " and UserName Like " + "'" + strUserName + "'";
            strHQL += " and Status Like " + "'" + strStatus + "'";
            strHQL += " and Company Like " + "'" + strCompany + "'";
            strHQL += " and CurrentDuty Like " + "'" + strCurrentDuty + "'";
            strHQL += " and Brief Like " + "'" + strBriefKeyWord + "'";
            strHQL += " Order by CreateTime ASC";
        }
        else//按组织架构查询的
        {
            strHQL = string.Format(@"Select UserName 姓名,Gender 性别,Age 年龄,Company 公司,Department 部门,
                CurrentDuty 职责, MobilePhone 移动电话,CreateTime 创建日期, Status 状态,BelongDepartCode 归属部门代码, BelongDepartName 归属部门名称
                    From T_LTCandidateInformation Where DepartCode = ") + "'" + strDepartCode + "'";
            strHQL += " Order by CreateTime ASC";
        }

        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }

}