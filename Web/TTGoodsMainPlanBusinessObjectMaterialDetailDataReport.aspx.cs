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

public partial class TTGoodsMainPlanBusinessObjectMaterialDetailDataReport : System.Web.UI.Page
{
    string strPlanVerID;
    string strPlanMRPVerID;
    string strRelatedType;
    string strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        DataSet ds;

        strPlanVerID = Request.QueryString["PlanVerID"];
        strPlanMRPVerID = Request.QueryString["PlanMRPVerID"];

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];


        //this.Title = "盘点报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        LB_PlanVersion.Text = "PlanVer:" + strPlanVerID + " MRPVer:" + strPlanMRPVerID + " RelatedType: " + strRelatedType + " ID: " + strRelatedID;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "Select OnOrder,OnProduction,OnLine From T_ItemMainPlanMRPVersion Where PlanVerID = " + strPlanVerID + " and  PlanMRPVerID = " + strPlanMRPVerID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");
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

            strHQL = "Select RelatedType,RelatedID,ItemCode,ItemName,ModelNumber,Specification,Brand,Unit,sum(TotalRequireNumber) as TotalRequireNumber,sum(TotalCheckOutNumber) as TotalCheckOutNumber,Sum(MoreThanCheckOutNumber) as MoreThanCheckOutNumber,sum(LessThanCheckInNumber) as LessThanCheckInNumber,sum(TotalCheckInNumber) as TotalCheckInNumber,sum(TotalReturnNumber) as TotalReturnNumber From V_GoodsMainPlanBusinessObjectMaterialDataSummaryReport";
            strHQL += " Where ((PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID + ")) Or (PlanVerID = 0 and PlanMRPVerID = 0)" + " and RelatedType = '" + strRelatedType + "' and RelatedID = " + strRelatedID;
            strHQL += " Group By RelatedType,RelatedID,ItemCode,ItemName,ModelNumber,Specification,Brand,Unit";
            ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsMainPlanMaterialDataReport");

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
    public decimal GetGoodsNoCheckInNumberByHavePurchase(string strRelatedType, string strRelatedID, string strGoodsCode, string strModelNumber, string strSpecification, string strUnit, string strTotalCheckInNumber)
    {
        string strHQL;
        decimal deOrderNumber;

        try
        {
            strHQL = "Select COALESCE(Number,0) From T_GoodsPurRecord ";
            strHQL += " Where POID in (Select POID From T_GoodsPurchaseOrder Where RelatedType =" + "'" + strRelatedType + "' and RelatedID = " + strRelatedID + ")";
            strHQL += " and GoodsCode = " + "'" + strGoodsCode.Trim() + "'";
            strHQL += " and ModelNumber =" + "'" + strModelNumber.Trim() + "'";
            strHQL += " and Spec  = " + "'" + strSpecification.Trim() + "'";
            strHQL += " and Unit = " + "'" + strUnit.Trim() + "'";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deOrderNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
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
        catch
        {
            return 0;
        }
    }
}
