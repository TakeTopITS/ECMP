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

public partial class TTGoodsShipmentReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strRelatedCode;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == "Project")
        {
        }

        if (strRelatedType == "Other")
        {
        }

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料出库报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            NB_RelatedID.Enabled = true;
            TB_RelatedCode.Enabled = false;
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other" | strRelatedType == "Project")
        {
            NB_RelatedID.Amount = 0;

            NB_RelatedID.Enabled = true;
            TB_RelatedCode.Enabled = false;
        }
        else
        {
            NB_RelatedID.Amount = 0;

            NB_RelatedID.Enabled = false;
            TB_RelatedCode.Enabled = true;
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strStartTime, strEndTime;
        string strApplicant;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strManufacture = TB_Manufacture.Text.Trim();

        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        strRelatedID = NB_RelatedID.Amount.ToString();
        strRelatedCode = TB_RelatedCode.Text.Trim();


        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strManufacture = "%" + strManufacture + "%";


        if (strRelatedType == "Other")
        {
            strHQL = "from GoodsShipmentReport as goodsShipmentReport where ";
            strHQL += " goodsShipmentReport.OperatorName like " + "'" + strApplicant + "'";
            strHQL += " and goodsShipmentReport.ShipmentType <> 'Transfer'";
            strHQL += " and goodsShipmentReport.GoodsCode Like " + "'" + strGoodsCode + "'";
            strHQL += " and goodsShipmentReport.GoodsName like " + "'" + strGoodsName + "'";
            strHQL += " and goodsShipmentReport.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += " and goodsShipmentReport.Spec Like " + "'" + strSpec + "'";
            strHQL += " and goodsShipmentReport.Manufacturer Like " + "'" + strManufacture + "'";
            strHQL += " and to_char(goodsShipmentReport.ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsShipmentReport.ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by goodsShipmentReport.ID DESC";
        }
        else
        {
            if (strRelatedType == "Project")
            {
                strHQL = "from GoodsShipmentReport as goodsShipmentReport where ";
                strHQL += " goodsShipmentReport.OperatorName like " + "'" + strApplicant + "'";
                strHQL += " and goodsShipmentReport.ShipmentType <> 'Transfer'";
                strHQL += " and goodsShipmentReport.GoodsCode Like " + "'" + strGoodsCode + "'";
                strHQL += " and goodsShipmentReport.GoodsName like " + "'" + strGoodsName + "'";
                strHQL += " and goodsShipmentReport.ModelNumber Like " + "'" + strModelNumber + "'";
                strHQL += " and goodsShipmentReport.Spec Like " + "'" + strSpec + "'";
                strHQL += " and goodsShipmentReport.Manufacturer Like " + "'" + strManufacture + "'";
                strHQL += " and to_char(goodsShipmentReport.ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsShipmentReport.ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and goodsShipmentReport.RelatedType = " + "'" + strRelatedType + "'" + " and goodsShipmentReport.RelatedID = " + strRelatedID;
                strHQL += " and goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
                strHQL += " Order by goodsShipmentReport.ID DESC";
            }
            else
            {
                strHQL = "from GoodsShipmentReport as goodsShipmentReport where ";
                strHQL += " goodsShipmentReport.OperatorName like " + "'" + strApplicant + "'";
                strHQL += " and goodsShipmentReport.ShipmentType <> 'Transfer'";
                strHQL += " and goodsShipmentReport.GoodsCode Like " + "'" + strGoodsCode + "'";
                strHQL += " and goodsShipmentReport.GoodsName like " + "'" + strGoodsName + "'";
                strHQL += " and goodsShipmentReport.ModelNumber Like " + "'" + strModelNumber + "'";
                strHQL += " and goodsShipmentReport.Spec Like " + "'" + strSpec + "'";
                strHQL += " and goodsShipmentReport.Manufacturer Like " + "'" + strManufacture + "'";
                strHQL += " and to_char(goodsShipmentReport.ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsShipmentReport.ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and goodsShipmentReport.RelatedType = " + "'" + strRelatedType + "'" + " and goodsShipmentReport.RelatedCode = " + "'" + strRelatedCode + "'";
                strHQL += " and goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
                strHQL += " Order by goodsShipmentReport.ID DESC";
            }
        }
        GoodsShipmentReportBLL goodsShipmentReportBLL = new GoodsShipmentReportBLL();
        lst = goodsShipmentReportBLL.GetAllGoodsShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }



    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strStartTime, strEndTime;
        string strApplicant;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strManufacture = TB_Manufacture.Text.Trim();

        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        strRelatedID = NB_RelatedID.Amount.ToString();
        strRelatedCode = TB_RelatedCode.Text.Trim();


        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strManufacture = "%" + strManufacture + "%";


        if (strRelatedType == "Other")
        {
            strHQL = "Select * from V_GoodsShipmentReport where ";
            strHQL += " OperatorName like " + "'" + strApplicant + "'";
            strHQL += " and ShipmentType <> 'Transfer'";
            strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
            strHQL += " and GoodsName like " + "'" + strGoodsName + "'";
            strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += " and Spec Like " + "'" + strSpec + "'";
            strHQL += " and Manufacturer Like " + "'" + strManufacture + "'";
            strHQL += " and to_char(ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by ID DESC";
        }
        else
        {
            if (strRelatedType == "Project")
            {
                strHQL = "Select * from V_GoodsShipmentReport where ";
                strHQL += " OperatorName like " + "'" + strApplicant + "'";
                strHQL += " and ShipmentType <> 'Transfer'";
                strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
                strHQL += " and GoodsName like " + "'" + strGoodsName + "'";
                strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
                strHQL += " and Spec Like " + "'" + strSpec + "'";
                strHQL += " and Manufacturer Like " + "'" + strManufacture + "'";
                strHQL += " and to_char(ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
                strHQL += " and OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
                strHQL += " Order by ID DESC";
            }
            else
            {
                strHQL = "Select * from V_GoodsShipmentReport where ";
                strHQL += " OperatorName like " + "'" + strApplicant + "'";
                strHQL += " and ShipmentType <> 'Transfer'";
                strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
                strHQL += " and GoodsName like " + "'" + strGoodsName + "'";
                strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
                strHQL += " and Spec Like " + "'" + strSpec + "'";
                strHQL += " and Manufacturer Like " + "'" + strManufacture + "'";
                strHQL += " and to_char(ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and RelatedType = " + "'" + strRelatedType + "'" + " and RelatedCode = " + "'" + strRelatedCode + "'";
                strHQL += " and OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
                strHQL += " Order by ID DESC";
            }
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsApplicationReport");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料出库报表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }


    protected void BT_FindShipmentNO_Click(object sender, EventArgs e)
    {
        string strHQL, strShipmentNO = "0";
        IList lst;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);


        strHQL = "from  GoodsShipmentReport as goodsShipmentReport where goodsShipmentReport.ShipmentNO = " + strShipmentNO;
        strHQL += " and goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsShipmentReport.ID DESC";
        GoodsShipmentReportBLL goodsShipmentReportBLL = new GoodsShipmentReportBLL();
        lst = goodsShipmentReportBLL.GetAllGoodsShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }


    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
    }

}
