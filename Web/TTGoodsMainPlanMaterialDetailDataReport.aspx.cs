using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsMainPlanMaterialDetailDataReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strPlanVerID = Request.QueryString["PlanVerID"];
        string strMRPVerID = Request.QueryString["MRPVerID"];

        //this.Title = "盘点报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        LB_PlanVersion.Text = "PlanVer:" + strPlanVerID + " MRPVer:" + strMRPVerID;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "Select OnOrder,OnProduction,OnLine From T_ItemMainPlanMRPVersion Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strMRPVerID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString().Trim() == "YES")
                {
                    CB_OnOrder.Checked = true;
                }
                else
                {
                    CB_OnOrder.Checked = false;
                }
                if (ds.Tables[0].Rows[0][1].ToString().Trim() == "YES")
                {
                    CB_OnProduction.Checked = true;
                }
                else
                {
                    CB_OnProduction.Checked = false;
                }
                if (ds.Tables[0].Rows[0][2].ToString().Trim() == "YES")
                {
                    CB_OnLine.Checked = true;
                }
                else
                {
                    CB_OnLine.Checked = false;
                }
            }

            strHQL = "Select PlanVerID,ItemCode,ItemName,ModelNumber,Specification,Brand,Unit, sum(TotalRequireNumber) as TotalRequireNumber,sum(TotalCheckOutNumber) as TotalCheckOutNumber,sum(MoreThanCheckOutNumber) as MoreThanCheckOutNumber, sum(LessThanCheckInNumber) as LessThanCheckInNumber,sum(TotalCheckInNumber) as TotalCheckInNumber, sum(TotalReturnNumber) as TotalReturnNumber From V_GoodsMainPlanMaterialDataSummaryReport";
            strHQL += " Where PlanVerID = " + strPlanVerID + " and (PlanMRPVerID = " + strMRPVerID + " or PlanMRPVerID = 0)";
            strHQL += " Group By PlanVerID,ItemCode,ItemName,ModelNumber,Specification,Brand,Unit";

            ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsMainPlanMaterialDataSummaryReport");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }

    //取得当月结余库存量
    public decimal GetGoodsInventoryNumber(string strGoodsCode, string strModelNumber, string strSpecification, string strUnit)
    {
        string strHQL;
        decimal deInventoryNumber;


        try
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_Goods";
            strHQL += " Where GoodsCode = " + "'" + strGoodsCode.Trim() + "'";
            strHQL += " and ModelNumber =" + "'" + strModelNumber.Trim() + "'";
            strHQL += " and Spec = " + "'" + strSpecification.Trim() + "'";
            strHQL += " and UnitName = " + "'" + strUnit.Trim() + "'";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deInventoryNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deInventoryNumber = 0;
            }
        }
        catch
        {
            deInventoryNumber = 0;
        }

        return deInventoryNumber;
    }

    //取得已订购未入库量
    public decimal GetGoodsNoCheckInNumberByHavePurchase(string strRelatedID, string strGoodsCode, string strModelNumber, string strSpecification, string strUnit, string strTotalCheckInNumber)
    {
        string strHQL;
        decimal deOrderNumber;

        try
        {
            strHQL = "Select COALESCE(Number,0) From T_GoodsPurRecord ";
            strHQL += " Where POID in (Select POID From T_GoodsPurchaseOrder )";
            strHQL += " and GoodsCode = " + "'" + strGoodsCode.Trim() + "'";
            strHQL += " and ModelNumber =" + "'" + strModelNumber.Trim() + "'";
            strHQL += " and Spec  = " + "'" + strSpecification.Trim() + "'";
            strHQL += " and Unit = " + "'" + strUnit.Trim() + "'";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deOrderNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deOrderNumber = 0;
            }
        }
        catch
        {
            deOrderNumber = 0;
        }


        if ((deOrderNumber - decimal.Parse(strTotalCheckInNumber)) > 0)
        {
            return deOrderNumber - decimal.Parse(strTotalCheckInNumber);
        }
        else
        {
            return 0;
        }

    }

}
