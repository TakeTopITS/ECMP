
using System;
using System.Data;

public partial class TTMakeBookInformationPrintMore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["BarCodes"]))
            {

                DataHandler2(Request.QueryString["BarCodes"]);

            }
        }

    }




    private void DataHandler2(string strBookCodes)
    {
        strBookCodes = strBookCodes.EndsWith(",") ? strBookCodes.TrimEnd(',') : strBookCodes;

        strBookCodes = "'" + strBookCodes.Replace(",", "','") + "'";

        string strBookSQL = string.Format(@"
                                select * from T_BookInformation
                                where BarCode in
                                (
                                    {0}
                                )
                                ", strBookCodes);
        DataTable dtBook = ShareClass.GetDataSetFromSql(strBookSQL, "Book").Tables[0];

        if (dtBook != null && dtBook.Rows.Count > 0)
        {

            foreach (DataRow drBook in dtBook.Rows)
            {
                string BookCode = ShareClass.ObjectToString(drBook["BarCode"]);

                string strImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), BookCode, 200, 200);

                drBook["Location"] = strImageUrl;
                drBook["Introduction"] = DateTime.Now.ToString("yyyy-MM-dd");

            }


            DataList1.DataSource = dtBook;
            DataList1.DataBind();
        }
    }




}