using ProjectMgt.BLL;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWorkFlowTemplateChildTemplateList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strTStepID;

        string strGUID = Request.QueryString["GUID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DataSet ds1;
            strHQL = "Select StepID from T_WorkFlowTStep where GUID = " + "'" + strGUID + "'";
            ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTStep");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                strTStepID = ds1.Tables[0].Rows[0][0].ToString();

                LoadWFTStepRelatedTem(strTStepID);
            }
        }

    }

    protected void LoadWFTStepRelatedTem(string strStepID)
    {
        string strHQL;
        IList lst;

        strHQL = string.Format(@"Select A.*,C.identifystring From T_WFTStepRelatedTem A,t_workflowtstep B,T_WorkFlowTemplate C Where B.Stepid = {0} and A.RelatedStepID = B.StepID and A.relatedwftemname = C.TemName", strStepID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

}