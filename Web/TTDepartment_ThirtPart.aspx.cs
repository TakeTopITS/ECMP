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
using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopSecurity;
using TakeTopCore;


public partial class TTDepartment_ThirtPart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        //this.Title = "第三方部门设置"; 

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView3, strUserCode);
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_ParentCodeNew.Text = strDepartCode;
            LB_ParentNameNew.Text = ShareClass.GetDepartName(strDepartCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        TB_DepartCodeNew.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strDepartCode;

        strDepartCode = TB_DepartCodeNew.Text.Trim();

        AddDepartment();
    }

    protected void AddDepartment()
    {
        string strHQL;

        string strDepartCode = TB_DepartCodeNew.Text.Trim();
        string strDepartName = TB_DepartNameNew.Text.Trim();
        string strParentCode = TB_ParentCodeNew.Text.Trim();
        string strUserCode = Session["UserCode"].ToString();
        string strAuthority = DL_AuthorityNew.SelectedValue.Trim();

        string strWorkAddress = TB_WorkAddressNew.Text.Trim();
        string strIsDefaultAddress = DL_IsDefaultWorkAddressNew.SelectedValue.Trim();
        string strLongitude = TB_LongitudeNew.Text.Trim();
        string strLatitude = TB_LatitudeNew.Text.Trim();


        if (strDepartCode != "" | strDepartName != "" | strParentCode != "")
        {
            DepartmentBLL departmentBLL = new DepartmentBLL();
            Department department = new Department();
            department.DepartCode = strDepartCode;
            department.DepartName = strDepartName;
            department.ParentCode = strParentCode;
            department.CreatorCode = strUserCode;
            department.Authority = strAuthority;
            department.ProductLineRelated = "NO";

            department.WorkAddress = strWorkAddress;
            department.IsDefaultAddress = strIsDefaultAddress;
            department.Longitude = strLongitude;
            department.Latitude = strLatitude;

            try
            {
                departmentBLL.AddDepartment(department);

                //更新部门其它信息
                UpdateNewDepartmentOtherInformation(strDepartCode);

                TB_DepartCode.Text = TB_DepartCodeNew.Text;
                TB_DepartName.Text = TB_DepartNameNew.Text;
                TB_ParentCode.Text = TB_ParentCodeNew.Text;
                DL_Authority.SelectedValue = DL_AuthorityNew.SelectedValue;

                TB_ContactPerson.Text = TB_ContactPersonNew.Text;
                TB_CompanyAddress.Text = TB_CompanyAddressNew.Text;

                TB_WorkAddress.Text = TB_WorkAddressNew.Text;
                DL_IsDefaultWorkAddress.SelectedValue = DL_IsDefaultWorkAddressNew.SelectedValue;
                TB_Latitude.Text = TB_LatitudeNew.Text;
                TB_Longitude.Text = TB_LongitudeNew.Text;

                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

                strHQL = "INSERT INTO T_DepartmentUser(DepartCode,DepartName,UserCode,UserName)";
                strHQL += " Values(" + "'" + strDepartCode + "'" + "," + "'" + strDepartName + "'" + "," + "'" + strUserCode + "'" + "," + "'" + GetUserName(strUserCode) + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Insert Into T_DepartUserInforRelatedUser(DepartCode,UserCode,UserName,EffectDate)";
                strHQL += " Values(" + "'" + strDepartCode + "'" + "," + "'" + strUserCode + "'" + "," + "'" + ShareClass.GetUserName(strUserCode) + "'" + ",now())";
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);

                LB_DepartCode.Text = strDepartCode;

                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;

                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJCDMZFHMXWK + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBMDMBMMCHSJBMBNWKJC + "')", true);
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        int intChildCount, intMemberCount;
        string strHQL;
        IList lst;

        string strOldDepartCode = LB_DepartCode.Text.Trim();

        string strDepartCode = TB_DepartCode.Text.Trim();
        string strDepartName = TB_DepartName.Text.Trim();
        string strParentCode = TB_ParentCode.Text.Trim();
        string strUserCode = Session["UserCode"].ToString();
        string strAuthority = DL_Authority.SelectedValue.Trim();

        if (strDepartCode != "" | strDepartName != "" | strParentCode != "")
        {
            intChildCount = GetChildNodeCount(strDepartCode);
            intMemberCount = GetMemberCount(strDepartCode);

            if (intChildCount == 0 & intMemberCount == 0)
            {
                strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
                DepartmentBLL departmentBLL = new DepartmentBLL();
                lst = departmentBLL.GetAllDepartments(strHQL);

                Department department = (Department)lst[0];
                department.DepartCode = strDepartCode;
                department.DepartName = strDepartName;
                department.ParentCode = strParentCode;
                department.CreatorCode = strUserCode;
                department.Authority = strAuthority;

                department.WorkAddress = TB_WorkAddress.Text.Trim();
                department.IsDefaultAddress = DL_IsDefaultWorkAddress.SelectedValue;
                department.Longitude = TB_Longitude.Text.Trim();
                department.Latitude = TB_Latitude.Text.Trim();

                try
                {
                    departmentBLL.UpdateDepartment(department, strOldDepartCode);

                    //更新部门其它信息
                    UpdateDepartmentOtherInformation(strDepartCode);

                    TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
                    TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJCDMZFHMXWK + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCBMCZXJBMHYCYZCBMBNGG + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBMDMBMMCHSJBMBNWKJC + "')", true);
        }
    }

    protected void UpdateDepartmentOtherInformation(string strDepartCode)
    {
        string strHQL1;
        strHQL1 = "Update T_Department Set CompanyAddress = '" + TB_CompanyAddress.Text.Trim() + "',ContactPerson = '" + TB_ContactPerson.Text.Trim() + "' Where DepartCode = '" + strDepartCode + "'";
        ShareClass.RunSqlCommand(strHQL1);
    }

    protected void UpdateNewDepartmentOtherInformation(string strDepartCode)
    {
        string strHQL1;
        strHQL1 = "Update T_Department Set CompanyAddress = '" + TB_CompanyAddressNew.Text.Trim() + "',ContactPerson = '" + TB_ContactPersonNew.Text.Trim() + "' Where DepartCode = '" + strDepartCode + "'";
        ShareClass.RunSqlCommand(strHQL1);
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        int intChildCount, intMemberCount;

        string strDepartCode = TB_DepartCode.Text.Trim();
        string strUserCode = Session["UserCode"].ToString();

        intChildCount = GetChildNodeCount(strDepartCode);
        intMemberCount = GetMemberCount(strDepartCode);

        if (intChildCount == 0 & intMemberCount == 0)
        {

            string strHQL = "Delete from T_Department where DepartCode = " + "'" + strDepartCode + "'";

            try
            {
                ShareClass.RunSqlCommand(strHQL);


                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;
                BT_Adjust.Enabled = false;

                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCBMCZXJBMHHYCYZCBMBNSC + "')", true);
        }
    }

    protected void DL_Authority_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strDepartCode = TB_DepartCode.Text.Trim();

        string strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        IList lst = departmentBLL.GetAllDepartments(strHQL);

        Department department = (Department)lst[0];

        department.Authority = DL_Authority.SelectedValue.Trim();

        try
        {
            departmentBLL.UpdateDepartment(department, strDepartCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXYGG + "')", true);
        }
        catch
        {
        }
    }

    protected void BT_Adjust_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode = TB_DepartCode1.Text.Trim().ToUpper();
        string strDepartName = TB_DepartName1.Text.Trim();
        string strParentCode = TB_ParentCode1.Text.Trim();
        string strUserCode = Session["UserCode"].ToString();

        string strDepartString = LB_DepartString.Text.Trim();
        if (TakeTopAuthority.VerifyDepartCode(strParentCode, strUserCode, strDepartString) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSJDM0H1ZNYADMINYHSZBZGKFWJC + "')", true);
            return;
        }

        strHQL = "from Department as department where department.DepartCode = " + "'" + strParentCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);

        if (lst.Count > 0)
        {
            Department department = (Department)lst[0];

            department.DepartCode = strDepartCode;
            department.DepartName = strDepartName;
            department.ParentCode = strParentCode;

            department.WorkAddress = TB_WorkAddress.Text.Trim();
            department.IsDefaultAddress = DL_IsDefaultWorkAddress.SelectedValue;
            department.Longitude = TB_Longitude.Text.Trim();
            department.Latitude = TB_Latitude.Text.Trim();

            try
            {
                departmentBLL.UpdateDepartment(department, strDepartCode);

                //更新部门其它信息
                UpdateDepartmentOtherInformation(strDepartCode);

                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBMDZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBMDZSBJCSFMXWK + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSJBMBCZBNDZ + "')", true);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strHQL;
        string strUserCode = Session["UserCode"].ToString();
        string strCreatorCode;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            DepartmentBLL departmentBLL = new DepartmentBLL();
            strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
            lst = departmentBLL.GetAllDepartments(strHQL);

            Department department = (Department)lst[0];

            TB_DepartCode.Text = strDepartCode;
            TB_DepartName.Text = department.DepartName.Trim();
            TB_ParentCode.Text = department.ParentCode;

            TB_DepartCode1.Text = strDepartCode;
            TB_DepartName1.Text = department.DepartName.Trim();
            TB_ParentCode1.Text = department.ParentCode;
            DL_Authority.SelectedValue = department.Authority.Trim();

            TB_WorkAddress.Text = department.WorkAddress.Trim();
            DL_IsDefaultWorkAddress.SelectedValue = department.IsDefaultAddress.Trim();
            TB_Longitude.Text = department.Longitude.Trim();
            TB_Latitude.Text = department.Latitude.Trim();

            LB_DepartCode.Text = strDepartCode;

            strCreatorCode = department.CreatorCode.Trim();
            LB_CreatorCode.Text = strCreatorCode;

            //取得部门其它信息
            GetDepartmentOtherInformation(strDepartCode);

            if (strCreatorCode == strUserCode)
            {
                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;
                BT_Adjust.Enabled = true;
                DL_Authority.Enabled = true;
            }
            else
            {
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;
                BT_Adjust.Enabled = false;
                DL_Authority.Enabled = false;
            }


            LoadDepartmentUser(strDepartCode);
            LoadDepartUserInforRelatedUser(strDepartCode);
        }
    }

    protected void GetDepartmentOtherInformation(string strDepartCode)
    {
        string strHQL1;
        strHQL1 = "Select CompanyAddress,ContactPerson From T_Department Where DepartCode = '" + strDepartCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_Department");

        TB_CompanyAddress.Text = ds.Tables[0].Rows[0][0].ToString();
        TB_ContactPerson.Text = ds.Tables[0].Rows[0][1].ToString();
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCreatorCode, strOperatorCode;

        string strID = e.Item.Cells[0].Text.Trim();
        string strDepartCode = TB_DepartCode.Text.Trim();

        if (e.CommandName != "Page")
        {
            strCreatorCode = LB_CreatorCode.Text.Trim();
            strOperatorCode = Session["UserCode"].ToString().Trim();

            if (strOperatorCode == strCreatorCode)
            {
                strHQL = "from DepartmentUser as departmentUser where departmentUser.ID = " + strID;
                DepartmentUserBLL departmentUserBLL = new DepartmentUserBLL();
                lst = departmentUserBLL.GetAllDepartmentUsers(strHQL);

                DepartmentUser departmentUser = (DepartmentUser)lst[0];

                try
                {
                    departmentUserBLL.DeleteDepartmentUser(departmentUser);
                    LoadDepartmentUser(strDepartCode);
                }
                catch
                {
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCBMBSNCJNBNSCGLXYH + "')", true);
            }
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strDepartCode, strDepartName, strCreatorCode, strOperatorCode;

        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        if (e.CommandName != "Page")
        {
            strDepartCode = TB_DepartCode.Text.Trim();
            strDepartName = TB_DepartName.Text.Trim();

            strCreatorCode = LB_CreatorCode.Text.Trim();
            strOperatorCode = Session["UserCode"].ToString().Trim();

            if (strOperatorCode == strCreatorCode)
            {
                if (TabContainer1.ActiveTabIndex == 0)
                {
                    DepartmentUserBLL departmentUserBLL = new DepartmentUserBLL();
                    DepartmentUser departmentUser = new DepartmentUser();

                    departmentUser.DepartCode = strDepartCode;
                    departmentUser.DepartName = strDepartName;
                    departmentUser.UserCode = strUserCode;
                    departmentUser.UserName = strUserName;

                    try
                    {
                        departmentUserBLL.AddDepartmentUser(departmentUser);
                        LoadDepartmentUser(strDepartCode);
                    }
                    catch
                    {
                    }
                }

                if (TabContainer1.ActiveTabIndex == 1)
                {
                    DepartUserInforRelatedUserBLL departUserInforRelatedUserBLL = new DepartUserInforRelatedUserBLL();
                    DepartUserInforRelatedUser departUserInforRelatedUser = new DepartUserInforRelatedUser();

                    departUserInforRelatedUser.DepartCode = strDepartCode;
                    departUserInforRelatedUser.UserCode = strUserCode;
                    departUserInforRelatedUser.UserName = strUserName;
                    departUserInforRelatedUser.EffectDate = DateTime.Now;

                    try
                    {
                        departUserInforRelatedUserBLL.AddDepartUserInforRelatedUser(departUserInforRelatedUser);
                        LoadDepartUserInforRelatedUser(strDepartCode);
                    }
                    catch
                    {
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCBMBSNCJNBNTJGLYH + "')", true);
            }
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = e.Item.Cells[0].Text.Trim();
        string strDepartCode = TB_DepartCode.Text.Trim();

        if (e.CommandName != "Page")
        {
            string strHQL;


            strHQL = "Delete From T_DepartUserInforRelatedUser Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            LoadDepartUserInforRelatedUser(strDepartCode);
        }
    }


    protected void LoadDepartmentUser(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from DepartmentUser as departmentUser where departmentUser.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentUserBLL departmentUserBLL = new DepartmentUserBLL();
        lst = departmentUserBLL.GetAllDepartmentUsers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadDepartUserInforRelatedUser(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from DepartUserInforRelatedUser as departUserInforRelatedUser where departUserInforRelatedUser.DepartCode = " + "'" + strDepartCode + "'";
        DepartUserInforRelatedUserBLL departAssetRelateduserBLL = new DepartUserInforRelatedUserBLL();
        lst = departAssetRelateduserBLL.GetAllDepartUserInforRelatedUsers(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }


    protected int GetChildNodeCount(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Department as department where department.ParentCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);

        return lst.Count;
    }

    protected int GetMemberCount(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}
