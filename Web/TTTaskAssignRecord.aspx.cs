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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTTaskAssignRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strTaskID = Request.QueryString["TaskID"];

        string strHQL;

        string strTask;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "Select * From T_TaskAssignRecord Where TaskID = " + strTaskID + " Order By RouteNumber DESC,ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList2.DataSource = ds;
            DataList2.DataBind();

            strTask = ShareClass.GetProjectTaskName(strTaskID);
            LB_Title.Text = "任务：" + strTaskID + "  " + strTask + " 的所有分派记录！";

            LoadGoodsApplicationDetail("AfterSale", strTaskID);

            HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Task&RelatedID=" + strTaskID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Task", strTaskID));

            string strSystemVersionType = Session["SystemVersionType"].ToString();
            string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
            if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
            {
                Table_Material.Visible = false;
            }
        }
    }

    protected void LoadGoodsApplicationDetail(string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where ";
        strHQL += " goodsApplicationDetail.AAID in (Select goodsApplication.AAID From GoodsApplication as goodsApplication Where goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID + ")";

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }
}
