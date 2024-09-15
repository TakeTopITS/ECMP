using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web.UI;

public partial class TTReqAssignRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strReqID = Request.QueryString["ReqID"];

        string strHQL;
        IList lst;
        string strReqName;

        strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);
        Requirement requirement = (Requirement)lst[0];

        strReqID = requirement.ReqID.ToString();
        strReqName = requirement.ReqName.Trim();

        //this.Title = "需求：" + strReqID + "  " + strReqName + " 的所有分派记录！";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ReqID = " + strReqID + " Order by reqAssignRecord.RouteNumber DESC,reqAssignRecord.ID DESC";
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList2.DataSource = lst;
            DataList2.DataBind();

            LB_Title.Text = "需求：" + strReqID + "  " + strReqName + " 的所有分派记录！";

            HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Req&RelatedID=" + strReqID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Req", strReqID));

        }
    }

}
