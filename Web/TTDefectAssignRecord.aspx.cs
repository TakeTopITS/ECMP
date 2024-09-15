using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTDefectAssignRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strDefectID = Request.QueryString["DefectID"];

        string strHQL;
        IList lst;
        string strDefectName;

        strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);
        Defectment defectment = (Defectment)lst[0];

        strDefectID = defectment.DefectID.ToString();
        strDefectName = defectment.DefectName.Trim();

        //this.Title = "缺陷：" + strDefectID + "  " + strDefectName + " 的所有分派记录！";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.DefectID = " + strDefectID + " Order by defectAssignRecord.RouteNumber DESC,defectAssignRecord.ID DESC";
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataList2.DataSource = lst;
            DataList2.DataBind();

            LB_Title.Text = "缺陷：" + strDefectID + "  " + strDefectName + " 的所有分派记录！";

            HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Defect&RelatedID=" + strDefectID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Defect", strDefectID));
        }
    }

}
