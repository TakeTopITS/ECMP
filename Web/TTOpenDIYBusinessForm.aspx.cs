using System;
using System.Web.UI;

public partial class TTOpenDIYBusinessForm : System.Web.UI.Page
{
    string strTaskRecordID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strTaskRecordID = Request.QueryString["RecordID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            string strTemName, strIdentifyString;

            strTemName = ShareClass.getRelatedBusinessFormTemName("TaskRecord", strTaskRecordID);
            strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);


            HL_StartupBusinessForm.NavigateUrl = "top.layer.open({  type: 2 , content: 'TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=" + strTaskRecordID + "&IdentifyString=" + strIdentifyString + "'})";


            // HL_StartupBusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=" + strTaskRecordID + "&TemName=" + strTemName + "";
            HL_StartupBusinessForm.Target = "_top";

            //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
            if (ShareClass.getRelatedBusinessFormTemName("TaskRecord", strTaskRecordID) == "")
            {
                HL_StartupBusinessForm.Visible = false;
            }
        }
    }

}