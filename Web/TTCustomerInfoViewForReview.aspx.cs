using System;
using System.Resources;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Xml.Linq;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCustomerInfoViewForReview : System.Web.UI.Page
{
    string strCustomerCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName;


        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strCustomerCode = Request.QueryString["CustomerCode"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); 
        if (Page.IsPostBack == false)
        {
            strHQL = "from Customer as customer where customer.CustomerCode = " + "'" + strCustomerCode + "'";
            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);

            DataList2.DataSource = lst;
            DataList2.DataBind();

            Customer customer = (Customer)lst[0];

            LB_ReviewStatus.Text = customer.ReviewStatus;

            HL_RelatedContactInfor.Enabled = true;
            HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;

            LoadCustomerQuestion(strCustomerCode);
            LoadCustomerRelatedProject(strCustomerCode);
            LoadCustomerRelatedGoodsSaleOrder(strCustomerCode);
            LoadCustomerRelatedGoodsReturnOrder(strCustomerCode);

            LoadGoodsSaleQuotationOrder(strCustomerCode);
            LoadRelatedConstract(strCustomerCode);

            LoadCustomerGoodsAfterService(strCustomerCode);

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];

                if (strProductType != "ERP" & strProductType != "CRM" & strProductType != "SIMP" & strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "DEMO")
                {
                    TabPanel3.Visible = false;
                    TabPanel5.Visible = false;
                    TabPanel6.Visible = false;
                    TabPanel8.Visible = false;
                }
            }
            catch
            {

            }
        }
    }

    protected void BT_Approve_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

      
        string strComment;

        strComment = TB_Comment.Text.Trim();

        strHQL = "from Customer as customer where customer.CustomerCode=" + "'" + strCustomerCode + "'";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);
        Customer customer = (Customer)lst[0];

        customer.Comment = strComment;
        customer.ReviewStatus = "SUCCESS";

     

        try
        {
            customerBLL.UpdateCustomer(customer, strCustomerCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZPZBACG + "')", true);

            LB_ReviewStatus.Text = "SUCCESS";

            LoadCustomerInfor(strCustomerCode);

            //推送信息给客服主管
            try
            {
                string strCreatorCode = customer.CreatorCode.Trim();
                string strNofiInfo = Resources.lang.ZZNDKHBAYBPZTGQGZ;
                Action action = new Action(delegate ()
                {
                    try
                    {
                        Msg msg = new Msg();
                        msg.SendMSM("Message",strCreatorCode, strNofiInfo, "ADMIN");
                    }
                    catch (Exception ex)
                    {
                    }
                });
                System.Threading.Tasks.Task.Factory.StartNew(action);
            }
            catch (Exception ex)
            {
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZPZBASBQJC + "')", true);
        }
    }

    protected void BT_Refuse_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strComment;

        strComment = TB_Comment.Text.Trim();

        strHQL = "from Customer as customer where customer.CustomerCode=" + "'" + strCustomerCode + "'";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);
        Customer customer = (Customer)lst[0];

        customer.Comment = strComment;
        customer.ReviewStatus = "Refused";

        try
        {
            customerBLL.UpdateCustomer(customer, strCustomerCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZQQBACG + "')", true);

            LB_ReviewStatus.Text = "Refused";

            LoadCustomerInfor(strCustomerCode);

            //推送信息给客服主管
            try
            {
                string strCreatorCode = customer.CreatorCode.Trim();
                string strNofiInfo = Resources.lang.ZZNDKHBAYBJQQGZ;
                Action action = new Action(delegate ()
                {
                    try
                    {
                        Msg msg = new Msg();
                        msg.SendMSM("Message",strCreatorCode, strNofiInfo, "ADMIN");
                    }
                    catch (Exception ex)
                    {
                    }
                });
                System.Threading.Tasks.Task.Factory.StartNew(action);
            }
            catch (Exception ex)
            {
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZQQBASBQJC + "')", true);
        }
    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGoodsSN = ((Button)e.Item.FindControl("BT_GoodsSN")).Text.Trim();

            for (int i = 0; i < DataGrid9.Items.Count; i++)
            {
                DataGrid9.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsAfterSaleTask(strGoodsSN);
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strTaskID = ((Button)e.Item.FindControl("BT_TaskID")).Text.Trim();

            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsApplicationDetail("AfterSale", strTaskID);
        }
    }

    protected void LoadCustomerInfor(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Customer as customer where customer.CustomerCode = " + "'" + strCustomerCode + "'";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataList2.DataSource = lst;
        DataList2.DataBind();
    }

    protected void LoadGoodsAfterSaleTask(string strGoodsSN)
    {
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectTask as projectTask where projectTask.GoodsSN = " + "'" + strGoodsSN + "'" + " Order by projectTask.TaskID ASC";
        ProjectTask projectTask = new ProjectTask();
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void LoadGoodsApplicationDetail(string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where ";
        strHQL += " goodsApplicationDetail.AAID in (Select goodsApplication.AAID From GoodsApplication as goodsApplication Where goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID + ")";

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid8.DataSource = lst;
        DataGrid8.DataBind();
    }


    protected void LoadRelatedConstract(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.Status <> '归档'";
        strHQL += " and constract.RelatedCustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by constract.SignDate DESC";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadGoodsSaleQuotationOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleQuotationOrder as goodsSaleQuotationOrder where ";
        strHQL += " goodsSaleQuotationOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by goodsSaleQuotationOrder.QOID DESC";
        GoodsSaleQuotationOrderBLL goodsSaleQuotationOrderBLL = new GoodsSaleQuotationOrderBLL();
        lst = goodsSaleQuotationOrderBLL.GetAllGoodsSaleQuotationOrders(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
    }

    protected void LoadCustomerRelatedProject(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID in (select projectCustomer.ProjectID from ProjectCustomer as projectCustomer where projectCustomer.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadCustomerRelatedGoodsSaleOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadCustomerRelatedGoodsReturnOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsReturnOrder as goodsReturnOrder where goodsReturnOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadCustomerQuestion(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID in (Select customerRelatedQuestion.QuestionID From CustomerRelatedQuestion as customerRelatedQuestion Where customerRelatedQuestion.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        strHQL += " order by customerQuestion.ID DESC";
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadCustomerGoodsAfterService(string strCustomerCode)
    {
        string strHQL;


        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where CustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Or FinalCustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");

        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();
    }


}
