using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;


public partial class TTAPPTaskAssignRecordForAfterServiceSAAS : System.Web.UI.Page
{
    public SignModel signModel;

    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        try
        {
            //扫码功能必须
            signModel = TakeTopCore.WXHelper.GetWXInfo(Request.Url.ToString());
            if (signModel != null)
            {
                if (signModel.appId == null)
                {
                    signModel.appId = "";
                }
            }
        }
        catch
        {
            signModel = new SignModel();
            signModel.appId = "";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadTaskAssignRecordForTop10(strUserCode);
        }
    }

    protected void BT_FindAll_Click(object sender, EventArgs e)
    {
        string strAssignManName;

        strAssignManName = TB_AssignManName.Text.Trim();
        LoadTaskAssignRecordForAll(strAssignManName, strUserCode);
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strQrCode;

        strQrCode = TB_QrCode.Text.Trim();

        LoadTaskAssignRecord(strQrCode);
    }

    protected void DataList2_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strHQL;

        string strID, strTemName, strIdentifyString;
        string strURL;

        if (DataList2.Items.Count > 0)
        {
            strID = DataList2.DataKeys[e.Item.ItemIndex].ToString();
            strHQL = "Select * From T_RelatedBusinessForm Where RelatedType='TaskRecord' and RelatedID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

            if (ds.Tables[0].Rows.Count > 0)
            {
                strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();
                strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);

                strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=" + strID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
            }
        }
    }


    protected void LoadTaskAssignRecordForAll(string strAssignManName, string strOperatorCode)
    {
        string strHQL;

        strAssignManName = "%" + strAssignManName + "%";

        strHQL = "Select * From T_TaskAssignRecord Where AssignManName Like '" + strAssignManName + "' and  OperatorCode = '" + strOperatorCode + "'";
        strHQL += " Order By RouteNumber DESC,ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
        DataList2.DataSource = ds;
        DataList2.DataBind();
    }

    protected void LoadTaskAssignRecord(string strQrCode)
    {
        string strHQL;

        strHQL = "Select * From T_TaskAssignRecord Where QrCode = '" + strQrCode + "'";
        strHQL += " Order By RouteNumber DESC,ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
        DataList2.DataSource = ds;
        DataList2.DataBind();
    }

    protected void LoadTaskAssignRecordForTop10(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select * From T_TaskAssignRecord Where OperatorCode = '" + strOperatorCode + "'";
        strHQL += " Order By ID DESC limit 10";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
        DataList2.DataSource = ds;
        DataList2.DataBind();
    }

}
