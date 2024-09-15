using System;
using System.Data;
using System.Web;

public partial class TTPrintBarCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["BusinessCodes"]))
            {
                DataHandler2(HttpUtility.UrlDecode(Request.QueryString["BusinessCodes"]), HttpUtility.UrlDecode(Request.QueryString["BusinessType"]));
            }
        }
    }


    private void DataHandler2(string strBusinessCodes, string strBusinessType)
    {
        string strBusinessSQL = "";
        string strBusinessCode = "";


        strBusinessCodes = strBusinessCodes.EndsWith(",") ? strBusinessCodes.TrimEnd(',') : strBusinessCodes;

        if (strBusinessType == "AssetManage")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,AssetCode as BusinessCode,(AssetName ||':'|| Spec) as BusinessName,AssetCode as SN,AssetCode as BarCode ,Spec as StartupDate from T_Asset
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }

        if (strBusinessType == "MakeAsset")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,AssetCode as BusinessCode,(AssetName ||':'|| Spec) as BusinessName,AssetCode as SN,AssetCode as BarCode ,Spec as StartupDate from T_AssetCheckInOrderDetail
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }

        if (strBusinessType == "GoodsManage")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,GoodsCode as BusinessCode,(GoodsName ||':'|| Spec) as BusinessName,SN,SN as BarCode ,Spec as StartupDate from T_Goods
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }

        if (strBusinessType == "MakeGoods")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,GoodsCode as BusinessCode,(GoodsName ||':'|| Spec) as BusinessName,SN,SN as BarCode ,Spec as StartupDate from T_GoodsCheckInOrderDetail
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }

        if (strBusinessType == "GoodsCheckOut")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,GoodsCode as BusinessCode,(GoodsName ||':'|| Spec) as BusinessName,SN,SN as BarCode ,Spec as StartupDate from T_GoodsShipmentDetail
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }

        if (strBusinessType == "MakeBook")
        {
            strBusinessSQL = string.Format(@"
                                select distinct ID,ReferenceNo as BusinessCode,BookName as BusinessName,Author as SN,Author as BarCode ,to_char(CreateTime,112) as StartupDate from T_BookInformation
                                where ID in
                                (
                                    {0}
                                )
                                ", strBusinessCodes);
        }


        DataTable dtBusiness = ShareClass.GetDataSetFromSql(strBusinessSQL, "Business").Tables[0];

        if (dtBusiness != null && dtBusiness.Rows.Count > 0)
        {
            foreach (DataRow drBusiness in dtBusiness.Rows)
            {
                strBusinessCode = ShareClass.ObjectToString(drBusiness["BusinessCode"]);

                if (strBusinessCode != "")
                {
                    try
                    {
                        string strImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), strBusinessCode, 200, 200);
                        drBusiness["BarCode"] = strImageUrl;
                        drBusiness["StartupDate"] = DateTime.Now.ToString("yyyy-MM-dd");
                    }
                    catch
                    {
                    }
                }

            }


            DataList1.DataSource = dtBusiness;
            DataList1.DataBind();
        }
    }

}




