using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTNewCustomList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            BindCustomModuleData();
        }
    }

    private void BindCustomModuleData()
    {
        CustomModuleBLL customModuleBLL = new CustomModuleBLL();
        string strCustomModuleSql = "from CustomModule as customModule";
        IList customModuleList = customModuleBLL.GetAllCustomModules(strCustomModuleSql);

        DG_CustomerModuleList.DataSource = customModuleList;
        DG_CustomerModuleList.DataBind();
    }

    protected void DG_CustomerModuleList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "del")
        {
            string cmdArges = e.CommandArgument.ToString();
            CustomModuleBLL customModuleBLL = new CustomModuleBLL();
            string strCustomModuleSql = "from CustomModule as customModule where ID = " + cmdArges;
            IList customModuleList = customModuleBLL.GetAllCustomModules(strCustomModuleSql);
            if (customModuleList != null && customModuleList.Count == 1)
            {
                CustomModule customModule = (CustomModule)customModuleList[0];
                customModuleBLL.DeleteCustomerModule(customModule);
                Response.Write("<script>alert('删除成功！');</script>");
                //重新加载列表
                BindCustomModuleData();
            }

        }
    }

    protected void DG_CustomerModuleList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton LB = (LinkButton)e.Item.FindControl("LB_Del");
            LB.Attributes.Add("onclick", "return confirm('确定要删除此项记录吗？');");
        }
    }
}