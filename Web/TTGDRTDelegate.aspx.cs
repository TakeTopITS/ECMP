using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDRTDelegate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            //DataBinder();
            DataProjectBinder();
            DataPipingClassBinder();

            DG_List.DataSource = null;
            DG_List.DataBind();

            DG_Piping.DataSource = null;
            DG_Piping.DataBind();
        }
    }


    private void DataProjectBinder()
    {
        GDProjectBLL gDProjectBLL = new GDProjectBLL();
        string strGDProjectHQL = "from GDProject as gDProject";
        IList listGDProject = gDProjectBLL.GetAllGDProjects(strGDProjectHQL);

        DDL_GDProject.DataSource = listGDProject;
        DDL_GDProject.DataTextField = "ProjectCode";
        DDL_GDProject.DataValueField = "ProjectCode";
        DDL_GDProject.DataBind();

        DDL_GDProject.Items.Insert(0, new ListItem("", ""));
    }


    private void DataPipingClassBinder()
    {
        GDPipingClassBLL gDPipingClassBLL = new GDPipingClassBLL();
        string strGDPipingClassHQL = "from GDPipingClass as gDPipingClass";
        IList listGDPipingClass = gDPipingClassBLL.GetAllGDPipingClasss(strGDPipingClassHQL);

        DDL_GDPipingClass.DataSource = listGDPipingClass;
        DDL_GDPipingClass.DataTextField = "LevelClass";
        DDL_GDPipingClass.DataValueField = "LevelClass";
        DDL_GDPipingClass.DataBind();

        DDL_GDPipingClass.Items.Insert(0, new ListItem("", ""));
    }


    private void DataBinder()
    {
        GDPressureTestBLL gDPressureTestBLL = new GDPressureTestBLL();
        string strGDPressureTestHQL = "from GDPressureTest as gDPressureTest";
        IList listGDPressureTest = gDPressureTestBLL.GetAllGDPressureTests(strGDPressureTestHQL);

        DG_List.DataSource = listGDPressureTest;
        DG_List.DataBind();
    }


    protected void DG_List_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "click")
        {
            string cmdArges = e.CommandArgument.ToString();

            for (int i = 0; i < DG_List.Items.Count; i++)
            {
                DG_List.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

        }
    }



    protected void DG_Piping_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "click")
        {
            string cmdArges = e.CommandArgument.ToString();

            //点击单线图号

            string strGDIsomJointSQL = string.Format(@"select * from T_GDIsomJoint
                        where Isom_no = '{0}'", cmdArges);
            DataTable dtGDIsomJoint = ShareClass.GetDataSetFromSql(strGDIsomJointSQL, "IsomJoint").Tables[0];

            DG_List.DataSource = dtGDIsomJoint;
            DG_List.DataBind();

        }
    }

    protected void BT_Search_Click(object sender, EventArgs e)
    {
        string strProjectCode = DDL_GDProject.SelectedValue;
        string strPipingClass = DDL_GDPipingClass.SelectedValue;

        //查询单线图号
        string strGDLineWeldSQL = string.Format(@"select i.Isom_no,COUNT(i.Isom_no) as IsomCount from T_GDIsomJoint i
                left join T_GDLineWeld l on i.Isom_no = l.Isom_no
                left join T_GDPipingClass p on l.LineLevel = p.LineLevel
                where l.ProjectCode = '{1}'
                and p.LevelClass = '{0}'
                group by i.Isom_no", strPipingClass, strProjectCode);
        DataTable dtGDLineWeld = ShareClass.GetDataSetFromSql(strGDLineWeldSQL, "GDLineWeld").Tables[0];

        DG_Piping.DataSource = dtGDLineWeld;
        DG_Piping.DataBind();
    }

    protected void BT_CreateNewLotNo_Click(object sender, EventArgs e)
    {

    }
}