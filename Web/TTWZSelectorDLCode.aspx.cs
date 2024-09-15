using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorDLCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        WZMaterialDLBLL wZMaterialDLBLL = new WZMaterialDLBLL();
        string strMaterialDLHQL = "from WZMaterialDL as wZMaterialDL";
        IList listMaterialDL = wZMaterialDLBLL.GetAllWZMaterialDLs(strMaterialDLHQL);

        DG_List.DataSource = listMaterialDL;
        DG_List.DataBind();
    }


    protected void DG_List_ItemCommand(object source, DataGridCommandEventArgs e)
    {
            if (e.Item.ItemType != ListItemType.Pager)
            {
                string cmdName = e.CommandName;

                for (int i = 0; i < DG_List.Items.Count; i++)
                {
                    DG_List.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                if (cmdName.Trim() == "operate")
                {
                    string cmdArges = e.CommandArgument.ToString();


                    Button btShowCollect = (Button)e.Item.FindControl("BT_ShowCollect");
                    string strShowText = btShowCollect.Text;
                    if (strShowText == "展开")
                    {
                        DG_List.Visible = true;
                        //绑定中类
                        string strZLSQL = string.Format(@"select * from T_WZMaterialZL
                                    where DLCode = '{0}'", cmdArges);

                        DataTable dtZL = ShareClass.GetDataSetFromSql(strZLSQL, "ZL").Tables[0];

                        DataGrid dgZL = (DataGrid)e.Item.FindControl("DG_MaterialZL");

                        dgZL.DataSource = dtZL;
                        dgZL.DataBind();

                        //改变按钮文本
                        btShowCollect.Text = "收缩";
                    }
                    else {
                        DG_List.Visible = false;

                        //改变按钮文本
                        btShowCollect.Text = "展开";
                    }
                    
                }
            }
       
    }



}