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
using NPOI.SS.Formula.Functions;


public partial class TTCustomerVisitReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        strUserCode = Session["UserCode"].ToString();



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
            DLC_VisitStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_VisitEndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");


            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            LoadIndustryType(DL_IndustryType);
            LoadCustomerQuestionType();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        string strBelongAgencyName = "%" + TB_AgencyName.Text.Trim() + "%";
        string strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";
        string strContactPerson = "%" + TB_ContactName.Text.Trim() + "%";
        string strContactType = "%" + TB_ContactType.Text.Trim() + "%";
        string strIsImportant = "%" + DL_IsImportant.SelectedValue.Trim() + "%";

        string strProductType = "%" + DL_IndustryType.SelectedValue.Trim() + "%";
        string strOperatorName = "%" + TB_OperatorName.Text.Trim() + "%";
        string strVisitStartTime = DateTime.Parse(DLC_VisitStartTime.Text).ToString("yyyyMMdd");
        string strVisitEndTime = DateTime.Parse(DLC_VisitEndTime.Text).ToString("yyyyMMdd");
        string strVisitType = "%" + DL_CustomerQuestionType.SelectedValue.Trim() + "%";

        strHQL = string.Format(@"Select B.ID,A.BelongAgencyName,A.CustomerName,C.ContactPerson,C.PhoneNumber as ContactType,C.SummitTime,C.Type as VisitType,C.IsImportant,A.Type as ProductType,C.OperatorName From T_Customer A,T_CustomerRelatedQuestion B,T_CustomerQuestion C
                        Where A.CustomerCode = B.CustomerCode and B.QuestionID = C.ID
                         And (A.BelongAgencyName Like '{0}' and A.CustomerName Like '{1}' and C.ContactPerson Like '{2}' and C.Type Like '{3}' 
                         And (to_char( C.SummitTime,'yyyymmdd') >= '{4}' and to_char( C.SummitTime,'yyyymmdd') <=  '{5}') and C.Type Like '{6}'  And C.IsImportant Like '{7}' and A.Type Like '{8}'  And C.OperatorName Like '{9}')
                         And A.BelongDepartcode in {10}",
                              strBelongAgencyName, strCustomerName, strContactPerson, strContactType, strVisitStartTime, strVisitEndTime, strVisitType, strIsImportant, strProductType, strOperatorName, strDepartString
                              );

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "');", true);
        }
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        string strBelongAgencyName = "%" + TB_AgencyName.Text.Trim() + "%";
        string strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";
        string strContactPerson = "%" + TB_ContactName.Text.Trim() + "%";
        string strContactType = "%" + TB_ContactType.Text.Trim() + "%";
        string strIsImportant = "%" + DL_IsImportant.SelectedValue.Trim() + "%";

        string strProductType = "%" + DL_IndustryType.SelectedValue.Trim() + "%";
        string strOperatorName = "%" + TB_OperatorName.Text.Trim() + "%";
        string strVisitStartTime = DateTime.Parse(DLC_VisitStartTime.Text).ToString("yyyyMMdd");
        string strVisitEndTime = DateTime.Parse(DLC_VisitEndTime.Text).ToString("yyyyMMdd");
        string strVisitType = "%" + DL_CustomerQuestionType.SelectedValue.Trim() + "%";

        strHQL = string.Format(@"Select B.ID,A.BelongAgencyName,A.CustomerName,C.ContactPerson,C.PhoneNumber as ContactType,C.SummitTime,C.Type as VisitType,C.IsImportant,A.Type as ProductType,C.OperatorName From T_Customer A,T_CustomerRelatedQuestion B,T_CustomerQuestion C
                        Where A.CustomerCode = B.CustomerCode and B.QuestionID = C.ID
                         And (A.BelongAgencyName Like '{0}' and A.CustomerName Like '{1}' and C.ContactPerson Like '{2}' and C.Type Like '{3}' 
                         And (to_char( C.SummitTime,'yyyymmdd') >= '{4}' and to_char( C.SummitTime,'yyyymmdd') <=  '{5}') and C.Type Like '{6}'  And C.IsImportant Like '{7}' and A.Type Like '{8}'  And C.OperatorName Like '{9}')
                         And A.BelongDepartcode in {10}",
                              strBelongAgencyName, strCustomerName, strContactPerson, strContactType, strVisitStartTime, strVisitEndTime, strVisitType, strIsImportant, strProductType, strOperatorName, strDepartString
                              );

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");
        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "客户拜访统计表" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    protected void LoadIndustryType(DropDownList DL_Type)
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Order By industryType.SortNumber ASC";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        DL_Type.DataSource = lst;
        DL_Type.DataBind();

        DL_Type.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadCustomerQuestionType()
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestionType as customerQuestionType Order By customerQuestionType.SortNumber ASC";
        CustomerQuestionTypeBLL customerQuestionTypeBLL = new CustomerQuestionTypeBLL();
        lst = customerQuestionTypeBLL.GetAllCustomerQuestionTypes(strHQL);

        DL_CustomerQuestionType.DataSource = lst;
        DL_CustomerQuestionType.DataBind();

        DL_CustomerQuestionType.Items.Insert(0, new ListItem("--Select--", ""));
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
