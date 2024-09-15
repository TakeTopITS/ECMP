using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTTableNameMapppingList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            BindTableNameMappingsData();
        }
    }

    private void BindTableNameMappingsData()
    {
        TableNameMappingBLL tableNameMappingBLL = new TableNameMappingBLL();
        string strTableNameMappingSql = "from TableNameMapping as tableNameMapping";
        IList tableNameMappingList = tableNameMappingBLL.GetAllTableNameMappings(strTableNameMappingSql);

        DG_TableNameMappingList.DataSource = tableNameMappingList;
        DG_TableNameMappingList.DataBind();
    }

    protected void DG_TableNameMappingList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "del")
        {
            string cmdArges = e.CommandArgument.ToString();
            TableNameMappingBLL tableNameMappingBLL = new TableNameMappingBLL();
            string strTableNameMappingSql = "from TableNameMapping as tableNameMapping where ID = " + cmdArges;
            IList tableNameMappingList = tableNameMappingBLL.GetAllTableNameMappings(strTableNameMappingSql);
            if (tableNameMappingList != null && tableNameMappingList.Count == 1)
            {
                TableNameMapping tableNameMapping = (TableNameMapping)tableNameMappingList[0];
                tableNameMappingBLL.DeleteTableNameMapping(tableNameMapping);
                Response.Write("<script>alert('删除成功！');</script>");
                //重新加载列表
                BindTableNameMappingsData();
            }

        }
    }


    protected void DG_TableNameMappingList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton LB = (LinkButton)e.Item.FindControl("LB_Del");
            LB.Attributes.Add("onclick", "return confirm('确定要删除此项记录吗？');");
        }
    }
}