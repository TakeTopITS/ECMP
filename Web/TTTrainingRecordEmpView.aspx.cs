using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTTrainingRecordEmpView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strusercode = Request.QueryString["UserCode"];
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            BindTRTrainingRecordEmpData(strusercode);
        }
    }

    protected void BindTRTrainingRecordEmpData(string strusercode)
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRTrainingRecordEmp A,T_ProjectMember B Where A.UserCode=B.UserCode and A.UserCode='" + strusercode + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRTrainingRecordEmp");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        lbl_sql1.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql1.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRTrainingRecordEmp");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}