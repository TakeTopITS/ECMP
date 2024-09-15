using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMBidNoticeContentFileView : System.Web.UI.Page
{
    string strUserCode, strBidSupplierID, strBidStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strBidSupplierID = Request.QueryString["BidSupplierID"];
        strBidStatus = Request.QueryString["BidStatus"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strBidStatus == "Y")
            {
                LoadBMBidNoticeContentFileList(strBidSupplierID);
            }
        }
    }

    protected void LoadBMBidNoticeContentFileList(string strBidSupplierID)
    {
        string strHQL;

        strHQL = "Select distinct A.ID as FileID, A.* From T_BMBidNoticeContentFile A, T_BMBidNoticeContent B,T_BMAnnInvitation C, T_BMSupplierBid D";
        strHQL += " Where A.BidNoticeContentID = B.ID And B.BidPlanID = C.BidPlanID And C.ID = D.AnnInvitationID";
        strHQL += " and D.ID = " + strBidSupplierID + " ";
        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
        {
            strHQL += " and A.FileName like '%" + TextBox1.Text.Trim() + "%'";
        }
        strHQL += " Order By A.ID DESC ";
        
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidNoticeContentFile");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
    
    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMBidNoticeContentFileList(strBidSupplierID);
    }

  

}