using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;

public partial class TTWorkflowFormDataSearch : System.Web.UI.Page
{
    private const string searchQueryTemplate = @"
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT WFD.WLID
      ,TemplateName
	  ,WF.WLName
      ,FieldName
      ,ParentXPath
      ,FieldXPath
      ,FieldValue
      ,FieldAttributes
  FROM T_WorkFlowFormData WFD
  LEFT JOIN T_WorkFlow WF ON WFD.WLID = WF.WLID
  WHERE WFD.TemplateName LIKE '%{0}%'
	AND WFD.FieldName LIKE '%{1}%'
	AND WFD.FieldXPath LIKE '%{2}%'
	AND WFD.ParentXPath LIKE '%{3}%'
	AND WFD.FieldAttributes LIKE '%{4}%'
	AND WFD.FieldValue LIKE '%{5}%'
    AND WF.WLName LIKE '%{6}%'
";

    const string tableName = "WorkflowFormData";

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            var query = @"select TemName from T_WorkFlowTemplate order by TemName";
            var templateNames = "TemplateNames";
            var temps = ShareClass.GetDataSetFromSql(query, templateNames);
            foreach (DataRow dataRow in temps.Tables[templateNames].Rows)
            {
                DL_TempName.Items.Add(dataRow.Field<string>("TemName"));
            }

            DL_TempName.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        int wfId = -1;
        

        var query = string.Format(searchQueryTemplate,
            DL_TempName.SelectedValue.ToString(),
            TB_FieldName.Text.Trim(),
            TB_FieldXPath.Text.Trim(),
            TB_ParentXPath.Text.Trim(),
            TB_FieldAttributes.Text.Trim(),
            TB_FieldValue.Text.Trim(),
            TB_WLName.Text.Trim());

        if (int.TryParse(TB_WFID.Text, out wfId))
        {
            query += string.Format("AND WFD.WLID = {0}\n", wfId);
        }
        else if (!string.IsNullOrEmpty(TB_WFID.Text.Trim()) && !int.TryParse(TB_WFID.Text, out wfId))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.GZLBHZNSZS + "')", true);
            return;
        }

        query += "ORDER BY ID";

        var result = ShareClass.GetDataSetFromSql(query, tableName);
        DataGrid1.DataSource = result;
        DataGrid1.DataBind();
        LB_ResultCount.Text = result.Tables[tableName].Rows.Count.ToString();
        LB_Sql.Text = query;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string query = LB_Sql.Text;

        var result = ShareClass.GetDataSetFromSql(query, tableName);
        DataGrid1.DataSource = result;
        DataGrid1.DataBind();
    }
}