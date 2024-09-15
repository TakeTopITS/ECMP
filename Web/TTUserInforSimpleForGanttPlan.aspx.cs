using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserInforSimpleForGanttPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPlanID, strUserCode;

        strPlanID = Request.QueryString["PlanID"];
        strUserCode = ShareClass.GetProjectPlanLeaderCode(strPlanID);


        if (Page.IsPostBack == false)
        {
            strHQL = "from WorkType as workType Order by workType.SortNo ASC";
            BookReaderTypeBLL bookReaderTypeBLL = new BookReaderTypeBLL();
            lst = bookReaderTypeBLL.GetAllBookReaderType(strHQL);
            DL_WorkType.DataSource = lst;
            DL_WorkType.DataBind();
            DL_WorkType.Items.Insert(0, new ListItem("--Select--", ""));

            DLLoadDepartMent();

            if (strUserCode != "")
            {
                strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";

                ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
                lst = projectMemberBLL.GetAllProjectMembers(strHQL);

                ProjectMember projectMember = (ProjectMember)lst[0];

                TB_UserCode.Text = projectMember.UserCode;
                TB_UserName.Text = projectMember.UserName;
                TB_Gender.Text = projectMember.Gender.Trim();
                TB_Age.Text = projectMember.Age.ToString();

                TB_Duty.Text = projectMember.Duty;
                TB_JobTitle.Text = projectMember.JobTitle;

                if (projectMember.PhotoURL.Trim() != "")
                {
                    IM_MemberPhoto.ImageUrl = projectMember.PhotoURL.Trim();
                }
                else
                {
                    IM_MemberPhoto.ImageUrl = "Images/DefaultUserPhoto.png";
                }

                DL_Department.SelectedValue = projectMember.DepartCode;
                TB_ChildDepartment.Text = projectMember.ChildDepartment;
                TB_OfficePhone.Text = projectMember.OfficePhone;
                TB_MobilePhone.Text = projectMember.MobilePhone;
                TB_EMail.Text = projectMember.EMail;
                TB_WorkScope.Text = projectMember.WorkScope;
                TB_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
                DL_UserType.SelectedValue = projectMember.UserType.Trim();
                LB_Status.Text = projectMember.Status.Trim();
                TB_RefUserCode.Text = projectMember.RefUserCode;
                TB_UserRTXCode.Text = projectMember.UserRTXCode;
                NB_SortNumber.Text = projectMember.SortNumber.ToString();
                DL_WorkType.SelectedValue = projectMember.WorkType.Trim();
                DL_AllowDevice.SelectedValue = projectMember.AllowDevice.Trim();
            }
        }
    }

    protected void DLLoadDepartMent()
    {
        string strHQL = "from Department as department";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        IList lst = departmentBLL.GetAllDepartments(strHQL);

        DL_Department.DataSource = lst;
        DL_Department.DataBind();
    }

}
