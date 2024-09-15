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

public partial class TTUserInforView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Request.QueryString["UserCode"];

        string strHQL;
        IList lst;

        string strUserName = GetUserName(strUserCode);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_BirthDay.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_JoinDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from WorkType as workType Order by workType.SortNo ASC";
            BookReaderTypeBLL bookReaderTypeBLL = new BookReaderTypeBLL();
            lst = bookReaderTypeBLL.GetAllBookReaderType(strHQL);
            DL_WorkType.DataSource = lst;
            DL_WorkType.DataBind();
            DL_WorkType.Items.Insert(0, new ListItem("--Select--", ""));

            strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);

            ProjectMember projectMember = (ProjectMember)lst[0];

            TB_UserCode.Text = projectMember.UserCode;
            TB_UserName.Text = projectMember.UserName;
            DL_Gender.SelectedValue = projectMember.Gender.Trim();
            TB_Age.Text = projectMember.Age.ToString();

            TB_Duty.Text = projectMember.Duty;
            TB_JobTitle.Text = projectMember.JobTitle;

            TB_Department.Text = projectMember.DepartCode.Trim() + " " + projectMember.DepartName.Trim();
            TB_ChildDepartment.Text = projectMember.ChildDepartment.Trim();
            TB_OfficePhone.Text = projectMember.OfficePhone;
            TB_MobilePhone.Text = projectMember.MobilePhone;
            TB_EMail.Text = projectMember.EMail;

            TB_RefUserCode.Text = projectMember.RefUserCode.Trim();
            NB_SortNumber.Text = projectMember.SortNumber.ToString();

            TB_WorkScope.Text = projectMember.WorkScope;
            DLC_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
            DL_Status.SelectedValue = projectMember.Status.Trim();

            TB_EnglishName.Text = projectMember.EnglishName.Trim();
            TB_Nationality.Text = projectMember.Nationality.Trim();
            TB_NativePlace.Text = projectMember.NativePlace.Trim();
            TB_HuKou.Text = projectMember.HuKou.Trim();
            TB_Residency.Text = projectMember.Residency.Trim();
            TB_Address.Text = projectMember.Address.Trim();
            DLC_BirthDay.Text = projectMember.BirthDay.ToString("yyyy-MM-dd");
            DLC_LunarBirthday.Text = projectMember.LunarBirthDay.ToString("yyyy-MM-dd");
            DL_MaritalStatus.SelectedValue = projectMember.MaritalStatus.Trim();
            TB_Degree.Text = projectMember.Degree.Trim();
            TB_Major.Text = projectMember.Major.Trim();
            TB_GraduateSchool.Text = projectMember.GraduateSchool.Trim();
            TB_IDCard.Text = projectMember.IDCard.Trim();
            TB_BloodType.Text = projectMember.BloodType.Trim();
            NB_Height.Text = projectMember.Height.ToString();
            TB_Language.Text = projectMember.Language.Trim();
            TB_UrgencyPerson.Text = projectMember.UrgencyPerson.Trim();
            TB_UrgencyCall.Text = projectMember.UrgencyCall.Trim();
            TB_Introducer.Text = projectMember.Introducer.Trim();
            TB_IntroducerDepartment.Text = projectMember.IntroducerDepartment.Trim();
            TB_IntroducerRelation.Text = projectMember.IntroducerRelation.Trim();
            TB_UserRTXCode.Text = projectMember.UserRTXCode.Trim();
            TB_Comment.Text = projectMember.Comment.Trim();

            DL_UserType.SelectedValue = projectMember.UserType.Trim();
            DL_WorkType.SelectedValue = projectMember.WorkType.Trim();
            DL_AllowDevice.SelectedValue = projectMember.AllowDevice.Trim();

            if (projectMember.PhotoURL.Trim() != "")
            {
                IM_MemberPhoto.ImageUrl = projectMember.PhotoURL.Trim();
            }
            else
            {
                IM_MemberPhoto.ImageUrl = "Images/DefaultUserPhoto.png";
            }

            LoadWorkExperienceList(strUserCode);
            LoadEducationExperienceList(strUserCode);
            LoadFamilyMemberList(strUserCode);
            LoadTransactionList(strUserCode);
            LoadPartTimeJobList(strUserCode);
        }
    }

    protected void LoadPartTimeJobList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From PartTimeJob as partTimeJob Where partTimeJob.UserCode = " + "'" + strUserCode + "'" + " Order By partTimeJob.ID ASC";
        PartTimeJobBLL partTimeJobBLL = new PartTimeJobBLL();
        lst = partTimeJobBLL.GetAllPartTimeJobs(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadWorkExperienceList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkExperience as workExperience where workExperience.UserCode = " + "'" + strUserCode + "'";
        WorkExperienceBLL workExperienceBLL = new WorkExperienceBLL();
        lst = workExperienceBLL.GetAllWorkExperiences(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void LoadEducationExperienceList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from EducationExperience as educationExperience where educationExperience.UserCode = " + "'" + strUserCode + "'";
        EducationExperienceBLL educationExperienceBLL = new EducationExperienceBLL();
        lst = educationExperienceBLL.GetAllEducationExperiences(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadFamilyMemberList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from FamilyMember as familyMember where familyMember.UserCode = " + "'" + strUserCode + "'";
        FamilyMemberBLL familyMemberBLL = new FamilyMemberBLL();
        lst = familyMemberBLL.GetAllFamilyMembers(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadTransactionList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserTransactionRecord as userTransactionRecord Where userTransactionRecord.UserCode = " + "'" + strUserCode + "'" + " Order By userTransactionRecord.ID ASC";
        UserTransactionRecordBLL userTransactionRecordBLL = new UserTransactionRecordBLL();
        lst = userTransactionRecordBLL.GetAllUserTransactionRecords(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected string GetUserName(string strUserCode)
    {
        string strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        ProjectMember projectMember = (ProjectMember)lst[0];

        string strUserName = projectMember.UserName;

        return strUserName.Trim();

    }
}