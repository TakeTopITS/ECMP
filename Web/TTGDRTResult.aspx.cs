using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDRTResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            //DataBinder();

            DataProjectBinder();
            //DataPipingClassBinder();


            DG_List.DataSource = null;
            DG_List.DataBind();
        }
    }


    private void DataProjectBinder()
    {
        GDProjectBLL gDProjectBLL = new GDProjectBLL();
        string strGDProjectHQL = "from GDProject as gDProject";
        IList listGDProject = gDProjectBLL.GetAllGDProjects(strGDProjectHQL);

        DDL_GDProject.DataSource = listGDProject;
        DDL_GDProject.DataTextField = "ProjectName";
        DDL_GDProject.DataValueField = "ProjectCode";
        DDL_GDProject.DataBind();

        DDL_GDProject.Items.Insert(0, new ListItem("", ""));
    }


    private void DataGDLineWeldBinder(string strProjectCode)
    {
        GDLineWeldBLL gDLineWeldBLL = new GDLineWeldBLL();
        string strGDLineWeldHQL = "from GDLineWeld as gDLineWeld where ProjectCode = '" + strProjectCode + "'";
        IList listGDLineWeld = gDLineWeldBLL.GetAllGDLineWelds(strGDLineWeldHQL);

        DDL_Isom_no.DataSource = listGDLineWeld;
        DDL_Isom_no.DataTextField = "";
        DDL_Isom_no.DataValueField = "";
        DDL_Isom_no.DataBind();

        DDL_Isom_no.Items.Insert(0, new ListItem("", ""));
    }


    private void DataBinder()
    {
        GDPressureTestBLL gDPressureTestBLL = new GDPressureTestBLL();
        string strGDPressureTestHQL = "from GDPressureTest as gDPressureTest";
        string strProjectCode = DDL_GDProject.SelectedValue;
        if (!string.IsNullOrEmpty(strProjectCode))
        {
            strGDPressureTestHQL += "";
        }
        string strIsom_no = DDL_Isom_no.SelectedValue;
        if (!string.IsNullOrEmpty(strIsom_no))
        {
            strGDPressureTestHQL += "";
        }

        IList listGDPressureTest = gDPressureTestBLL.GetAllGDPressureTests(strGDPressureTestHQL);

        DG_List.DataSource = listGDPressureTest;
        DG_List.DataBind();
    }


    protected void DG_List_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "del")
        {
            string cmdArges = e.CommandArgument.ToString();
            GDPressureTestBLL gDPressureTestBLL = new GDPressureTestBLL();
            string strGDPressureTestSql = "from GDPressureTest as gDPressureTest where ID = " + cmdArges;
            IList listGDPressureTest = gDPressureTestBLL.GetAllGDPressureTests(strGDPressureTestSql);
            if (listGDPressureTest != null && listGDPressureTest.Count == 1)
            {
                GDPressureTest gDPressureTest = (GDPressureTest)listGDPressureTest[0];
                gDPressureTestBLL.DeleteGDPressureTest(gDPressureTest);

                //重新加载列表
                DataBinder();


            }

        }
    }

    protected void BT_Search_Click(object sender, EventArgs e)
    {
        DataBinder();
    }
}