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

public partial class TTGoodsApplicationReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == "Project")
        {
            strRelatedType = "Project";
        }

        if (strRelatedType == "Other")
        {
            strRelatedType = "Other";
        }

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料领用报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strStartTime, strEndTime;

        string strApplicant = TB_Applicant.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = "%" + strApplicant + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        if (strRelatedType == "Other")
        {
            strHQL = "  Select A.ID,A.AAID,A.GoodsCode ,  A.GoodsName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.IP,A.CheckOutNumber, B.GAAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID";
            strHQL += "  from T_GoodsApplicationDetail A,T_GoodsApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Goodscode Like " + "'" + strGoodsCode + "'";
            strHQL += "  and A.GoodsName like " + "'" + strGoodsName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";
        }
        else
        {
            strHQL = "  Select A.ID,A.AAID,A.GoodsCode ,  A.GoodsName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.IP,A.CheckOutNumber, B.GAAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID";
            strHQL += "  from T_GoodsApplicationDetail A,T_GoodsApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Goodscode Like " + "'" + strGoodsCode + "'";
            strHQL += "  and A.GoodsName like " + "'" + strGoodsName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";

            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";
        }

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsApplicationReport");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message.ToString());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + ex.Message.ToString() + "');", true);
        }
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strStartTime, strEndTime;

        string strApplicant = TB_Applicant.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = "%" + strApplicant + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";


        if (strRelatedType == "Other")
        {
            strHQL = "  Select A.ID,A.AAID,A.GoodsCode ,  A.GoodsName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.IP,A.CheckOutNumber, B.GAAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID";
            strHQL += "  from T_GoodsApplicationDetail A,T_GoodsApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Goodscode Like " + "'" + strGoodsCode + "'";
            strHQL += "  and A.GoodsName like " + "'" + strGoodsName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";
        }
        else
        {
            strHQL = "  Select A.ID,A.AAID,A.GoodsCode ,  A.GoodsName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.IP,A.CheckOutNumber, B.GAAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID";
            strHQL += "  from T_GoodsApplicationDetail A,T_GoodsApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Goodscode Like " + "'" + strGoodsCode + "'";
            strHQL += "  and A.GoodsName like " + "'" + strGoodsName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
          
            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";
        }


        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsApplicationReport");
        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料领用报表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }


    protected void BT_FindAAID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString, strAAID = "0";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        //strAAID = NB_AAID.Amount.ToString();

        strHQL = "Select * From  V_GoodsApplicationReport where AAID = " + strAAID;
        strHQL += " and ApplicantCode   in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsApplicationReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
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
