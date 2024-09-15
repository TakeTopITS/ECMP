using System; using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTUserInfor_StudentCostListNot : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["UserCode"] != null)
        {
            strUserCode = Session["UserCode"].ToString();
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            DataYearMonthBinder();

            DataBinder();
        }
    }




    private void DataBinder()
    {
        string strHQL;

        string strYear = DDL_SYear.SelectedValue;
        string strMonth = DDL_SMonth.SelectedValue;

        strHQL = string.Format(@"select s.*,m.ClassName from T_ProjectMemberStudent s
                            left join T_ProjectMemberClass  m on s.ClassID = m.ID
                            left join T_ProjectMemberGrade g on m.GradeID = g.ID
                            where s.UserCode
                            not in (
                            select StudentCode from T_ProjectMemberStudentCost
                            where to_char( CollectTime, 'yyyy-mm-dd' ) like '{0}%{1}%'
                            AND Status = 'FINISHED'
                            )
                            and g.DepartCode in {2}  Order By s.UserCode DESC", strYear, strMonth, LB_DepartString.Text);

        DataTable dtStudent = ShareClass.GetDataSetFromSql(strHQL, "Student").Tables[0];

        DG_List.DataSource = dtStudent;
        DG_List.DataBind();

        LB_Sql.Text = strHQL;
    }




    protected void DG_List_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        if (cmdName == "click")
        {
            for (int i = 0; i < DG_List.Items.Count; i++)
            {
                DG_List.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            string cmdArges = e.CommandArgument.ToString();

            string strHQL;
            IList lst;

            strHQL = "from ProjectMemberStudent as projectMemberStudent where UserCode = '" + cmdArges + "'";

            ProjectMemberStudentBLL projectMemberStudentBLL = new ProjectMemberStudentBLL();
            lst = projectMemberStudentBLL.GetAllProjectMemberStudents(strHQL);
            if (lst != null && lst.Count > 0)
            {
                ProjectMemberStudent projectMemberStudent = (ProjectMemberStudent)lst[0];

            }
        }
    }


    protected void DG_List_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_List.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataTable dtStudent = ShareClass.GetDataSetFromSql(strHQL, "Student").Tables[0];

        DG_List.DataSource = dtStudent;
        DG_List.DataBind();

    }



    private void DataYearMonthBinder()
    {



        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_SYear.SelectedValue = DateTime.Now.Year.ToString();

        for (int i = 1; i <= 12; i++)
        {

            DDL_SMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        string strSCurrentMonth = DateTime.Now.Month.ToString();

        DDL_SMonth.SelectedValue = strSCurrentMonth;
    }




    protected void BT_Seach_Click(object sender, EventArgs e)
    {
        DataBinder();
    }

}