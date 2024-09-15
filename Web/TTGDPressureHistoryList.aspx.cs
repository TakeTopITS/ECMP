using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDPressureHistoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataTestPressureBinder();
        }
    }

    private void DataTestPressureBinder()
    {
        GDPressureBLL gDPressureBLL = new GDPressureBLL();
        string strGDPressureHQL = "from GDPressure as gDPressure";
        IList listGDPressure = gDPressureBLL.GetAllGDPressures(strGDPressureHQL);

        DDL_Testlopp.DataSource = listGDPressure;
        DDL_Testlopp.DataBind();

        DDL_Testlopp.Items.Insert(0, new ListItem("", ""));
    }

    protected void DG_PictureList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "edit")
        {

        }
    }

    protected void DDL_Testlopp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(DDL_Testlopp.SelectedValue))
        {
            GDLineWeldBLL gDPressureBLL = new GDLineWeldBLL();
            string strGDLineWeldHQL = "from GDLineWeld as gDLineWeld where PressurePack1 = '" + DDL_Testlopp.SelectedValue + "'";
            IList listGDLineWeld = gDPressureBLL.GetAllGDLineWelds(strGDLineWeldHQL);
            DG_PictureList.DataSource = listGDLineWeld;
            DG_PictureList.DataBind();
        }
    }
}