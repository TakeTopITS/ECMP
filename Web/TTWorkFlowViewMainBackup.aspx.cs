using System;
using System.Data;

public partial class TTWorkFlowViewMainBackup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string strWLName;
        string strHQL;
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        string strWLID = Request.QueryString["WLID"];
        if (strWLID == "0")
        {
            return;
        }

        strHQL = "Select * from T_WorkFlowBackup where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");

        strWLName = ds.Tables[0].Rows[0]["WLName"].ToString();

        this.Title = Resources.lang.GongZuoLiu + strWLID + " " + strWLName;
    }
}
