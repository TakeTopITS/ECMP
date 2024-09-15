using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;


public partial class TTWebServiceList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","WebService设定", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindWebServicesData();
        }
    }

    private void BindWebServicesData() {
        WebServiceBLL webServiceBLL = new WebServiceBLL();
        string strWebServiceSql = "from WebService as webService order by CreateTime desc";
        IList webServiceList = webServiceBLL.GetAllWebServices(strWebServiceSql);

        DG_WebServiceList.DataSource = webServiceList;
        DG_WebServiceList.DataBind();
    }

    protected void DG_WebServiceList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "del")
        {
            string cmdArges = e.CommandArgument.ToString();
            WebServiceBLL webServiceBLL = new WebServiceBLL();
            string strWebServiceSql = "from WebService as webService where ID = " + cmdArges;
            IList listWebService = webServiceBLL.GetAllWebServices(strWebServiceSql);
            if (listWebService != null && listWebService.Count == 1)
            {
                WebService webService = (WebService)listWebService[0];
                webServiceBLL.DeleteWebService(webService);
                Response.Write("<script>alert('删除成功！');</script>");
                //重新加载列表
                BindWebServicesData();
            }

        }
    }

    protected void DG_WebServiceList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton LB = (LinkButton)e.Item.FindControl("LB_Del");
            LB.Attributes.Add("onclick", "return confirm('确定要删除此项记录吗？');");
        }
    }
}