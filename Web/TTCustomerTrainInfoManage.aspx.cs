using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;

public partial class TTCustomerTrainInfoManage : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            BindCheckData();
        }
    }

    protected void BindCheckData()
    {
        BindTRTrainingRecordEmpData();
        BindTREmployeeTrainingData();
        BindTRSpecialOperationsData();
        BindTRSpecialEquipmentData();
        BindTRHolderWelderData();
        BindTRPostCertificateData();
    }

    protected void BindTRTrainingRecordEmpData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRTrainingRecordEmp A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRTrainingRecordEmp");

        DataGrid6.CurrentPageIndex = 0;
        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
        lbl_sql6.Text = strHQL;
    }

    protected void DataGrid6_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql6.Text.Trim();
        DataGrid6.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRTrainingRecordEmp");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

    protected void BindTREmployeeTrainingData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TREmployeeTraining A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TREmployeeTraining");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        lbl_sql1.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql1.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TREmployeeTraining");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void BindTRSpecialOperationsData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRSpecialOperations A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRSpecialOperations");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql2.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql2.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRSpecialOperations");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void BindTRSpecialEquipmentData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRSpecialEquipment A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRSpecialEquipment");

        DataGrid3.CurrentPageIndex = 0;
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
        lbl_sql3.Text = strHQL;
    }

    protected void DataGrid3_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql3.Text.Trim();
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRSpecialEquipment");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void BindTRHolderWelderData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRHolderWelder A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRHolderWelder");

        DataGrid4.CurrentPageIndex = 0;
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
        lbl_sql4.Text = strHQL;
    }

    protected void DataGrid4_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql4.Text.Trim();
        DataGrid4.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRHolderWelder");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void BindTRPostCertificateData()
    {
        string strHQL = "select A.*,B.UserName,B.BirthDay,B.WorkType,B.IDCard,B.Gender from T_TRPostCertificate A,T_ProjectMember B Where A.UserCode=B.UserCode ";
        strHQL += " and A.UserCode = '" + strUserCode.Trim() + "' Order By A.ID ASC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRPostCertificate");

        DataGrid5.CurrentPageIndex = 0;
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
        lbl_sql5.Text = strHQL;
    }

    protected void DataGrid5_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql5.Text.Trim();
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TRPostCertificate");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }
}