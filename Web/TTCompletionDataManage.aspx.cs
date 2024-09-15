using System; using System.Resources;
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

public partial class TTCompletionDataManage : System.Web.UI.Page
{
    string strRelatedName, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strDepartCode = GetDepartCode(strUserCode);
        LB_UserCode.Text = strUserCode;

        string strTargetID = Request.QueryString["TargetID"];
        strProjectID = Request.QueryString["ProjectID"];
        //lbl_ProjectID.Text = strProjectID.Trim();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            BindDocGraphType(DL_DocType.SelectedValue.Trim());
            if (strTargetID != null)
            {
                LoadProjectDoc(strTargetID);
            }
            else
            {
                BindInformation();
            }
        }
    }


    protected void LoadProjectDoc(string strTarget)
    {
        string strRelatedType, strRelatedID;
        int intIndex;

        TreeNode node = new TreeNode();
        TreeNode parentNode = new TreeNode();

        intIndex = strTarget.IndexOf("_");
        strRelatedType = strTarget.Substring(0, intIndex);
        strRelatedID = strTarget.Substring(intIndex + 1, strTarget.Length - intIndex - 1);

        if (strRelatedID != "0")
        {
            lbl_ProjectID.Text = strRelatedID;
        }
        else
        {
            lbl_ProjectID.Text = "0";
        }
        BindInformation();
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        BindInformation();
    }

    /// <summary>
    /// 根据情况显示右边列表信息，图纸：收图登记 发图登记,文件：收文登记 发文登记
    /// </summary>
    protected void BindInformation()
    {
        string strtype = DL_DocType.SelectedValue.Trim();
        if (strtype.Equals("图纸"))
        {
            Panel_ProSendFigureRegistration.Visible = true;
            Panel_ProGraphRegistration.Visible = true;
            Panel_ProIssueRegistration.Visible = false;
            Panel_ProReceiptRegistration.Visible = false;
            LoadProGraphRegistration();
            LoadProSendFigureRegistration();
        }
        else if (strtype.Equals("文件"))
        {
            Panel_ProSendFigureRegistration.Visible = false;
            Panel_ProGraphRegistration.Visible = false;
            Panel_ProIssueRegistration.Visible = true;
            Panel_ProReceiptRegistration.Visible = true;
            LoadProReceiptRegistration();
            LoadProIssueRegistration();
        }
    }

    /// <summary>
    /// 收图登记
    /// </summary>
    protected void LoadProGraphRegistration()
    {
        string strHQL;

        strHQL = "Select * From T_ProGraphRegistration Where ArchiveIdentification = 1 ";

        if (lbl_ProjectID.Text.Trim() != "")
        {
            strHQL = "Select * From T_ProGraphRegistration Where ProjectID= " + lbl_ProjectID.Text.Trim() + " and ArchiveIdentification=1 ";
        }

        if (TB_DocName.Text.Trim() != "")
        {
            strHQL += " and (FileName like '%" + TB_DocName.Text.Trim() + "%' or FileNo like '%" + TB_DocName.Text.Trim() + "%') ";
        }
        if (DL_DocGraphType.SelectedValue.Trim() != "" && !string.IsNullOrEmpty(DL_DocGraphType.SelectedValue))
        {
            strHQL += " and DocType = '" + DL_DocGraphType.SelectedValue.Trim() + "' ";
        }
        strHQL += " Order By ID DESC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProGraphRegistration");

        DataGrid3.CurrentPageIndex = 0;
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
        LB_Sql.Text = strHQL;

        LB_FindCondition.Text = "卷";
        LB_Count.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 发图登记
    /// </summary>
    protected void LoadProSendFigureRegistration()
    {
        string strHQL;

        strHQL = "Select * From T_ProSendFigureRegistration Where FileNo in (Select FileNo From T_ProGraphRegistration Where ArchiveIdentification=1 ";

        if (lbl_ProjectID.Text.Trim() != "")
        {
            strHQL = "Select * From T_ProSendFigureRegistration Where FileNo in (Select FileNo From T_ProGraphRegistration Where ProjectID='" + lbl_ProjectID.Text.Trim() + "' and ArchiveIdentification=1 ";
        }

        if (TB_DocName.Text.Trim() != "")
        {
            strHQL += " and (FileName like '%" + TB_DocName.Text.Trim() + "%' or FileNo like '%" + TB_DocName.Text.Trim() + "%') ";
        }
        if (DL_DocGraphType.SelectedValue.Trim() != "" && !string.IsNullOrEmpty(DL_DocGraphType.SelectedValue))
        {
            strHQL += " and DocType = '" + DL_DocGraphType.SelectedValue.Trim() + "' ";
        }
        strHQL += " ) Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProSendFigureRegistration");

        DataGrid5.CurrentPageIndex = 0;
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
        LB_Sql1.Text = strHQL;

        LB_FindCondition2.Text = "卷内件";
        LB_TotalCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 收文登记
    /// </summary>
    protected void LoadProReceiptRegistration()
    {
        string strHQL = "Select * From T_ProReceiptRegistration Where ProjectID='" + lbl_ProjectID.Text.Trim() + "' and ArchiveIdentification=1 ";
        if (TB_DocName.Text.Trim() != "")
        {
            strHQL += " and (FileName like '%" + TB_DocName.Text.Trim() + "%' or DocumentNo like '%" + TB_DocName.Text.Trim() + "%') ";
        }
        if (DL_DocGraphType.SelectedValue.Trim() != "" && !string.IsNullOrEmpty(DL_DocGraphType.SelectedValue))
        {
            strHQL += " and DocType = '" + DL_DocGraphType.SelectedValue.Trim() + "' ";
        }
        strHQL += " Order By ID DESC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProReceiptRegistration");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql.Text = strHQL;

        LB_FindCondition.Text = "卷";
        LB_Count.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 发文登记
    /// </summary>
    protected void LoadProIssueRegistration()
    {
        string strHQL = "Select * From T_ProIssueRegistration Where DocumentNo in (Select DocumentNo From T_ProReceiptRegistration Where ProjectID='" + lbl_ProjectID.Text.Trim() + "' and ArchiveIdentification=1 ";
        if (TB_DocName.Text.Trim() != "")
        {
            strHQL += " and (FileName like '%" + TB_DocName.Text.Trim() + "%' or DocumentNo like '%" + TB_DocName.Text.Trim() + "%') ";
        }
        if (DL_DocGraphType.SelectedValue.Trim() != "" && !string.IsNullOrEmpty(DL_DocGraphType.SelectedValue))
        {
            strHQL += " and DocType = '" + DL_DocGraphType.SelectedValue.Trim() + "' ";
        }
        strHQL += " ) Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProIssueRegistration");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        LB_Sql1.Text = strHQL;

        LB_FindCondition2.Text = "卷内件";
        LB_TotalCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProReceiptRegistration");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected string GetDepartCode(string strUserCode)
    {
        string strDepartCode, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strDepartCode = projectMember.DepartCode.Trim();
        return strDepartCode;
    }

    protected void DataGrid3_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProGraphRegistration");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql1.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProIssueRegistration");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql1.Text.Trim();
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProSendFigureRegistration");
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected string GetStatusValue(string obj)
    {
        string flag = "否";
        if (string.IsNullOrEmpty(obj) || obj.Trim() == "")
        {
            flag = "否";
        }
        else
            flag = "是";
        return flag;
    }

    protected string GetProjectName(string obj)
    {
        if (string.IsNullOrEmpty(obj) || obj.Trim() == "")
        {
            return "";
        }
        else
            return ShareClass.GetProjectName(obj.Trim());
    }

    protected string GetProReceiId(string obj)
    {
        string flag = "";
        if (string.IsNullOrEmpty(obj) || obj.Trim() == "")
        {
            flag = "";
        }
        else
        {
            string strHQL = "from ProReceiptRegistration as proReceiptRegistration where proReceiptRegistration.DocumentNo = '" + obj.Trim() + "' ";
            ProReceiptRegistrationBLL proReceiptRegistrationBLL = new ProReceiptRegistrationBLL();
            IList lst = proReceiptRegistrationBLL.GetAllProReceiptRegistrations(strHQL);
            if (lst.Count > 0 && lst != null)
            {
                ProReceiptRegistration proReceiptRegistration = (ProReceiptRegistration)lst[0];
                flag = proReceiptRegistration.ID.ToString();
            }
        }
        return flag;
    }

    protected string GetProGraphId(string obj)
    {
        string flag = "";
        if (string.IsNullOrEmpty(obj) || obj.Trim() == "")
        {
            flag = "";
        }
        else
        {
            string strHQL = "from ProGraphRegistration as proGraphRegistration where proGraphRegistration.FileNo = '" + obj.Trim() + "' ";
            ProGraphRegistrationBLL proGraphRegistrationBLL = new ProGraphRegistrationBLL();
            IList lst = proGraphRegistrationBLL.GetAllProGraphRegistrations(strHQL);
            if (lst.Count > 0 && lst != null)
            {
                ProGraphRegistration proGraphRegistration = (ProGraphRegistration)lst[0];
                flag = proGraphRegistration.ID.ToString();
            }
        }
        return flag;
    }

    protected void DL_DocType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDocGraphType(DL_DocType.SelectedValue.Trim());
    }

    /// <summary>
    /// 按资料类型绑定类型
    /// </summary>
    /// <param name="strDocType"></param>
    protected void BindDocGraphType(string strDocType)
    {
        if (strDocType == "图纸")
        {
            DataTable dt = GetList("收图登记");
            if (dt != null && dt.Rows.Count > 0)
            {
                DL_DocGraphType.Items.Clear();
                DL_DocGraphType.Items.Insert(0, new ListItem("--Select--", ""));
                SetInterval(DL_DocGraphType, "收图登记", " ");
            }
            else
            {
                DL_DocGraphType.Items.Clear();
                DL_DocGraphType.Items.Insert(0, new ListItem("--Select--", ""));
            }
        }
        else
        {
            DataTable dt = GetList("收文登记");
            if (dt != null && dt.Rows.Count > 0)
            {
                DL_DocGraphType.Items.Clear();
                DL_DocGraphType.Items.Insert(0, new ListItem("--Select--", ""));
                SetInterval(DL_DocGraphType, "收文登记", " ");
            }
            else
            {
                DL_DocGraphType.Items.Clear();
                DL_DocGraphType.Items.Insert(0, new ListItem("--Select--", ""));
            }
        }
    }

    /// <summary>
    /// 获取项目文控类型
    /// </summary>
    protected DataTable GetList(string strParentName)
    {
        string strHQL = "Select * From T_ProDocGraphControl ";
        if (!string.IsNullOrEmpty(strParentName) && strParentName.Trim() != "")
        {
            strHQL += " Where ParentName='" + strParentName.Trim() + "' ";
        }
        strHQL += " Order By SortNo ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProDocGraphControl");
        return ds.Tables[0];
    }

    /// <summary>
    /// 构建类型树结构
    /// </summary>
    /// <param name="DDL"></param>
    /// <param name="strParentName"></param>
    /// <param name="interval"></param>
    protected void SetInterval(DropDownList DDL, string strParentName, string interval)
    {
        interval += "├";

        DataTable list = GetList(strParentName);
        if (list.Rows.Count > 0 && list != null)
        {
            for (int i = 0; i < list.Rows.Count; i++)
            {
                DDL.Items.Add(new ListItem(string.Format("{0}{1}", interval, list.Rows[i]["ClassificationName"].ToString().Trim()), list.Rows[i]["ClassificationName"].ToString().Trim()));

                ///递归
                SetInterval(DDL, list.Rows[i]["ClassificationName"].ToString().Trim(), interval);
            }
        }
    }
}