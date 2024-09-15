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


public partial class TTStudentManagement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserCode"] != null)
        {
            strUserCode = Session["UserCode"].ToString();
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            DataBinder(LB_BelongDepartCode.Text.Trim());

            DataClassBinder();
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            LB_BelongDepartCode.Text = strDepartCode;
            TB_BelongDepartName.Text = strDepartName;

            DataBinder(strDepartCode);
        }
    }

    private void DataBinder(string strBelongDepartCode)
    {
        string strHQL;

        if (strBelongDepartCode == "")
        {
            strHQL = string.Format(@"select s.*,c.ClassName from T_ProjectMemberStudent s
                    , T_ProjectMemberClass  c ,
                     T_ProjectMemberGrade g where s.ClassID =  c.ID and c.GradeID = g.ID
                                        and (g.DepartCode in
                    {0} 
                    or 
                    s.CreatUserCode = '{1}') Order By s.UserCode DESC", LB_DepartString.Text, strUserCode);
        }
        else
        {
            strHQL = string.Format(@"select s.*,c.ClassName from T_ProjectMemberStudent s
                    , T_ProjectMemberClass  c ,
                     T_ProjectMemberGrade g where s.ClassID =  c.ID and c.GradeID = g.ID
                         and g.DepartCode = '{0}'  Order By s.UserCode DESC", strBelongDepartCode);
        }

        DataTable dtStudent = ShareClass.GetDataSetFromSql(strHQL, "Student").Tables[0];

        DG_List.DataSource = dtStudent;
        DG_List.DataBind();

        LB_Sql.Text = strHQL;

        LB_StudentNumber.Text = "学生数：" + dtStudent.Rows.Count.ToString() ;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStudentCode, strStudentName;
        string strClassName;
        strStudentCode = "'" + "%" + TB_UserCode.Text.Trim() + "%" + "'";
        strStudentName = "'" + "%" + TB_UserName.Text.Trim() + "%" + "'";
        strClassName = "'" + "%" + DDL_StudentClass.SelectedItem.Text.Trim() + "%" + "'";

        strHQL = string.Format(@"select s.*,c.ClassName from T_ProjectMemberStudent s
                    , T_ProjectMemberClass  c ,
                     T_ProjectMemberGrade g where s.ClassID =  c.ID and c.GradeID = g.ID
                                        and (g.DepartCode in
                    {0} 
                    or 
                    s.CreatUserCode = '{1}') and ( s.UserCode Like {2} and s.UserName Like {3} and s.StudentClass Like {4}) Order By s.UserCode DESC", LB_DepartString.Text, strUserCode, strStudentCode, strStudentName,strClassName);

        DataTable dtStudent = ShareClass.GetDataSetFromSql(strHQL, "Student").Tables[0];

        DG_List.DataSource = dtStudent;
        DG_List.DataBind();

        LB_Sql.Text = strHQL;

        LB_StudentNumber.Text = "学生数：" + dtStudent.Rows.Count.ToString() ;
    }


    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        LB_BelongDepartCode.Text = "";
        TB_BelongDepartName.Text = "";
    }


    private void DataClassBinder()
    {
        string strClassHQL = string.Format(@"select c.* from T_ProjectMemberClass c 
                    left join T_ProjectMemberGrade g on c.GradeID = g.ID
                    where 
                    (
                    g.DepartCode in {0} 
                    or c.UserCode = '{1}' 
                    )
                    ", LB_DepartString.Text, strUserCode);
        DataTable dtClass = ShareClass.GetDataSetFromSql(strClassHQL, "Class").Tables[0];

        DDL_StudentClass.DataSource = dtClass;

        DDL_StudentClass.DataBind();

        DDL_StudentClass.Items.Insert(0, new ListItem("", ""));

    }


    protected void DG_List_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_List.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataTable dtStudent = ShareClass.GetDataSetFromSql(strHQL, "Student").Tables[0];

        DG_List.DataSource = dtStudent;
        DG_List.DataBind();
    }

  

}