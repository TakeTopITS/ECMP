using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTAddTableNameMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            HF_ID.Value = Request.QueryString["id"];
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            BindWebServicesData(id);
        }
    }

    private void BindWebServicesData(int id)
    {
        TableNameMappingBLL tableNameMappingBLL = new TableNameMappingBLL();
        string strTableNameMappingSql = "from TableNameMapping as tableNameMapping where id = " + id;
        IList tableNameMappingList = tableNameMappingBLL.GetAllTableNameMappings(strTableNameMappingSql);
        if (tableNameMappingList != null && tableNameMappingList.Count > 0)
        {
            TableNameMapping tableNameMapping = (TableNameMapping)tableNameMappingList[0];
            TXT_TableName.Value = tableNameMapping.TableName;
            TXT_Description.Value = tableNameMapping.Description;
        }
    }
}