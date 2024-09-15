using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTDepartmentInfoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode,strDepartName;
        
        strDepartCode = Request.QueryString["DepartCode"].Trim();

        strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);

        Department department = (Department)lst[0];

        strDepartName = department.DepartName.Trim();

        //this.Title = Resources.lang.ZZZBuMen + strDepartCode + " " + strDepartName + " 资料！";


        string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack == false)
        {

            TB_DepartCode.Text = strDepartCode;
            TB_DepartName.Text = strDepartName;
            TB_ParentCode.Text = department.ParentCode.Trim();


            strHQL = "from DepartmentUser as departmentUser where departmentUser.DepartCode = " + "'" + strDepartCode + "'";
            DepartmentUserBLL departmentUserBLL = new DepartmentUserBLL();
            lst = departmentUserBLL.GetAllDepartmentUsers(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }
}