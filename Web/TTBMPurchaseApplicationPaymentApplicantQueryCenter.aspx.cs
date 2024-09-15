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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTBMPurchaseApplicationPaymentApplicantQueryCenter : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "分包付款查询", strUserCode);
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

            //LoadBMPurchaseApplicationList();
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[0].Text.Trim();

            if (e.CommandName == "Update")
            {
                try
                {
                    for (int i = 0; i < DataGrid2.Items.Count; i++)
                    {
                        DataGrid2.Items[i].ForeColor = Color.Black;
                    }
                    e.Item.ForeColor = Color.Red;

                    LoadRelatedWL("分包付款申请", "项目", int.Parse(strID));

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch
                {

                }
            }
        }
    }


    protected void LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMPurchaseApplicationList();
    }

    protected void LoadBMPurchaseApplicationList()
    {
        DataGrid2.CurrentPageIndex = 0;

        string strHQL;

        strHQL = "Select * From T_BMPurchaseApplication Where 1=1";

        if (!string.IsNullOrEmpty(TB_ApplicantInformation.Text.Trim()))
        {
            strHQL += " and (Name like '%" + TB_ApplicantInformation.Text.Trim() + "%' or Remark like '%" + TB_ApplicantInformation.Text.Trim() + "%') ";
        }
        if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
        {
            strHQL += " and Application like '%" + TextBox2.Text.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(DLC_StartTime.Text.Trim()))
        {
            strHQL += " and '" + DLC_StartTime.Text.Trim() + "'::date-ApplicationDate::date<=0 ";
        }
        if (!string.IsNullOrEmpty(DLC_EndTime.Text.Trim()))
        {
            strHQL += " and '" + DLC_EndTime.Text.Trim() + "'::date-ApplicationDate::date>=0 ";
        }

        strHQL += " and ProjectID in (Select ProjectID From T_Project Where ProjectName Like " + "'%" + TB_ProjectName.Text.Trim() + "%')";

        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication");


        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

}