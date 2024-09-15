using System; using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCarManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName, strDepartString;
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","车辆管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "车辆管理---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            CarApplyFormBLL carApplyFormBLL = new CarApplyFormBLL();

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "From CarApplyForm as carApplyForm Where ";
            strHQL += " carApplyForm.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and carApplyForm.ID not in (Select carAssignForm.ApplyFormID from CarAssignForm as carAssignForm) ";
            strHQL += " and carApplyForm.BackTime > now()";
            strHQL += " Order By carApplyForm.DepartTime DESC";
            lst = carApplyFormBLL.GetAllCarApplyForms(strHQL);
          
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            strHQL = "From CarApplyForm as carApplyForm Where ";
            strHQL += " carApplyForm.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and (carApplyForm.ID  in (Select carAssignForm.ApplyFormID from CarAssignForm as carAssignForm) ";                
            strHQL += " or carApplyForm.BackTime <= now())";
            strHQL += " Order By carApplyForm.DepartTime DESC";
            lst = carApplyFormBLL.GetAllCarApplyForms(strHQL);
          
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;
        }
    }   

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        CarApplyFormBLL carApplyFormBLL = new CarApplyFormBLL();
        IList lst = carApplyFormBLL.GetAllCarApplyForms(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        CarApplyFormBLL carApplyFormBLL = new CarApplyFormBLL();
        IList lst = carApplyFormBLL.GetAllCarApplyForms(strHQL);


        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

}
