using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTNewCustomAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            string strLangCode = Session["LangCode"].ToString();

            strHQL = " from WLType as wlType";
            strHQL += " Where wlType.LangCode = " + "'" + strLangCode + "'";
            strHQL += " Order by wlType.SortNumber ASC";
            WLTypeBLL wlTypeBLL = new WLTypeBLL();
            lst = wlTypeBLL.GetAllWLTypes(strHQL);
            DL_WLType.DataSource = lst;
            DL_WLType.DataBind();
            DL_WLType.Items.Insert(0, new ListItem("--Select--", ""));


            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                HF_ID.Value = Request.QueryString["id"];
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                BindCustomerModuleData(id);

            }
        }
    }

    private void BindCustomerModuleData(int id)
    {
        CustomModuleBLL customerModuleBLL = new CustomModuleBLL();
        string strCustomModuleSql = "from CustomModule as customModule where id = " + id;
        IList customModuleList = customerModuleBLL.GetAllCustomModules(strCustomModuleSql);
        if (customModuleList != null && customModuleList.Count > 0)
        {
            CustomModule customModule = (CustomModule)customModuleList[0];
            DL_CustomerModule.SelectedValue = customModule.CustomType;
            DL_WLType.SelectedValue = customModule.Type;
            DL_WLType_SelectedIndexChanged(null, null);
            DL_WFTemplate.SelectedValue = customModule.IdentifyString;
        }
    }


    /// <summary>
    ///  类型
    /// </summary>
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName,IdentifyString From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Authority = '所有'";

        strHQL += " Order by CreateTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        CustomModuleBLL customModuleBLL = new CustomModuleBLL();
        CustomModule customModule = new CustomModule();
        customModule.CustomModuleName = DL_CustomerModule.SelectedItem.Text;
        customModule.CustomType = DL_CustomerModule.SelectedItem.Value;
        customModule.Type = DL_WLType.SelectedItem.Value;
        customModule.TemName = DL_WFTemplate.SelectedItem.Text;
        customModule.IdentifyString = DL_WFTemplate.SelectedItem.Value;
        if (!string.IsNullOrEmpty(this.HF_ID.Value) && this.HF_ID.Value != "0")
        {
            int intID = 0;
            int.TryParse(this.HF_ID.Value, out intID);
            customModuleBLL.UpdateCustomModule(customModule, intID);
        }
        else {
            customModuleBLL.AddCustomModule(customModule);
        }
        //Response.Write("<script>alert('保存成功！');</script>");
        Response.Redirect("TTNewCustomList.aspx");
    }
}