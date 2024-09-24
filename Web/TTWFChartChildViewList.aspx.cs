using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class TTWFChartChildViewList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strTStepID, strGUID, strWLID;

        strGUID = Request.QueryString["GUID"];
        strWLID = Request.QueryString["WLID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DataSet ds1;
            strHQL = "Select StepID from T_WorkFlowTStep where GUID = " + "'" + strGUID + "'";
            ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTStep");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                strTStepID = ds1.Tables[0].Rows[0][0].ToString();

                LoadWFTStepRelatedWF(strTStepID,strWLID);
            }
        }

    }

    protected void LoadWFTStepRelatedWF(string strTStepID,string strWLID)
    {
        string strHQL;

        strHQL = string.Format(@"Select  B.*,E.identifystring From T_WFStepRelatedWF A,T_WorkFlow B,t_workflowtstep C,t_workflowstep D,T_WorkFlowTemplate E 
Where C.Stepid = {0} and A.WFID = {1} and B.WLID = D.WLID and C.SortNumber = D.SortNumber and A.WFChildID = B.WLID  and C.temname = E.TemName", strTStepID,strWLID);

        
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

}