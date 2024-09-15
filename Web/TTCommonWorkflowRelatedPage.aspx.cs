using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTCommonWorkflowRelatedPage : System.Web.UI.Page
{
    private string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        string strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        LB_UserCode.Text = strUserCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "工作流关联页面设置", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadCommonWorkflowFormList(strLangCode);

            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
            ddlLangSwitcher.SelectedValue = strLangCode;
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID, strHQL;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            if (e.CommandName == "Update")
            {
                strHQL = "Select * From T_CommonWorkflowRelatedPage Where ID =" + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CommonWorkflowRelatedPage");

                TB_FormName.Text = ds.Tables[0].Rows[0]["FormName"].ToString();
                TB_HomeFormName.Text = ds.Tables[0].Rows[0]["HomeName"].ToString();

                TB_FormNamePageName.Text = ds.Tables[0].Rows[0]["PageName"].ToString();
                TB_FormNameSort.Text = ds.Tables[0].Rows[0]["SortNumber"].ToString();

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                Delete();
            }
        }
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        strLangCode = ddlLangSwitcher.SelectedValue;

        LoadCommonWorkflowFormList(strLangCode);
    }

    protected void BT_CopyForHomeLanguage_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strFromLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();
        try
        {
            strHQL = "Insert Into T_CommonWorkflowRelatedPage(FormName,SortNumber ,PageName,LangCode,HomeName )";
            strHQL += " SELECT FormName,SortNumber ,PageName ," + "'" + strLangCode + "'" + ",HomeName FROM T_CommonWorkflowRelatedPage";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(FormName)) + " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(FormName)) + ltrim(rtrim(LangCode))  From T_CommonWorkflowRelatedPage Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadCommonWorkflowFormList(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
        }
    }

    protected void DL_FormNameRelatedPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_FormNamePageName.Text = DL_FormNameRelatedPage.SelectedValue;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text;

        if (strID == "")
        {
            Add();
        }
        else
        {
            Update();
        }
    }

    protected void Add()
    {
        string strHQL;
        string strFormName,strHomeFormName, strPageName, strSortNumber;

        strFormName = TB_FormName.Text.Trim();
        strHomeFormName = TB_HomeFormName.Text.Trim();
        strPageName = TB_FormNamePageName.Text.Trim();
        strSortNumber = TB_FormNameSort.Text.Trim();

        if (strFormName == "" | strPageName == "" | strSortNumber == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
            return;
        }

        try
        {
            strHQL = "Insert Into T_CommonWorkflowRelatedPage(FormName,HomeName,PageName,LangCode,SortNumber) Values('" + strFormName + "','" + strFormName + "','" + strPageName + "','" + strLangCode + "'," + strSortNumber + ")";
            ShareClass.RunSqlCommand(strHQL);

            LB_ID.Text = GetCommonWorkflowRelatedPageMaxID().ToString();

            LoadCommonWorkflowFormList(ddlLangSwitcher.SelectedValue.Trim());
        }
        catch
        {
        }
    }


    protected void Update()
    {
        string strHQL;
        string strID, strFormName, strHomeFormName, strPageName, strSortNumber;

        try
        {
            strID = LB_ID.Text.Trim();
            strFormName = TB_FormName.Text.Trim();
            strHomeFormName = TB_HomeFormName.Text.Trim();
            strSortNumber = TB_FormNameSort.Text.Trim();
            strPageName = TB_FormNamePageName.Text.Trim();

            strHQL = "Update T_CommonWorkflowRelatedPage Set SortNumber = " + strSortNumber + ",PageName = '" + strPageName + "',FormName = '" + strFormName + "',HomeName ='" + strHomeFormName + "' Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);


            LoadCommonWorkflowFormList(ddlLangSwitcher.SelectedValue.Trim());


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void Delete()
    {
        string strHQL;
        string strID;

        strID =LB_ID.Text.Trim();
        
        try
        {
            strHQL = "Delete From T_CommonWorkflowRelatedPage Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);
            LoadCommonWorkflowFormList(ddlLangSwitcher.SelectedValue.Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void LoadCommonWorkflowFormList(string strLangCode)
    {
        string strHQL = "Select * From T_CommonWorkflowRelatedPage  Where LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CommonWorkflowRelatedPage");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected int GetCommonWorkflowRelatedPageMaxID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_CommonWorkflowRelatedPage";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CommonWorkflowRelatedPage");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

}