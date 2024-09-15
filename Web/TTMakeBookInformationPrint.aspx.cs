using System;
using System.Drawing;
using System.IO;

public partial class TTMakeBookInformationPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["bartext"]))
            {
                string strBarCode = ShareClass.ObjectToString(Request.QueryString["bartext"]);

                string strDepartment = ShareClass.ObjectToString(Request.QueryString["department"]);
                string strBookName = ShareClass.ObjectToString(Request.QueryString["bookName"]);

                LB_AssetName.Text = strBookName;
                LB_Department.Text = strDepartment;
                LB_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

                string strImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), strBarCode, 200, 200);
                Image1.ImageUrl = strImageUrl;
            }
        }
    }
}