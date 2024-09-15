using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using TakeTopSecurity;

public partial class TTLTCandidateInformation : System.Web.UI.Page
{
    string strCurrentUserType;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strDepartString = "";
        string strHQL;

        if (Session["UserCode"] != null)
        {
            strUserCode = Session["UserCode"].ToString();
            LB_UserCode.Text = strUserCode;
        }
        else
        {
            Session["UserCode"] = LB_UserCode.Text.Trim();
            strUserCode = LB_UserCode.Text.Trim();
        }

        strUserName = ShareClass.GetUserName(strUserCode);
        strCurrentUserType = ShareClass.GetUserType(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "候选人信息", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LoadUserDuty();

            if (strUserCode == "ADMIN")
            {
                LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialAllDepartmentTree(Resources.lang.ZZJGT, TreeView1);

                strHQL = "Select DepartCode,DepartName From T_Department Order By DepartCode ASC";
            }
            else
            {
                string strSystemVersionType = Session["SystemVersionType"].ToString();
                if (strSystemVersionType == "GROUP" | strSystemVersionType == "ENTERPRISE")
                {
                    strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByUserInfor(Resources.lang.ZZJGT, TreeView1, strUserCode);
                    LB_DepartString.Text = strDepartString;

                    strHQL = "Select DepartCode,DepartName From T_Department Where DepartCode in " + strDepartString;
                }
                else
                {
                    LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialAllDepartmentTree(Resources.lang.ZZJGT, TreeView1);

                    strHQL = "Select DepartCode,DepartName From T_Department Order By DepartCode ASC";
                }
            }

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Department");
            DL_BelongDepartment.DataSource = ds;
            DL_BelongDepartment.DataBind();
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;

        Session["UserCode"] = LB_UserCode.Text.Trim();

        string strDepartCode;
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target;
            DataSet ds;

            LoadCandidate(strDepartCode);

            strHQL = "Select DepartCode,DepartName from T_Department where DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Union Select DepartCode,DepartName from T_Department where ParentCode = " + "'" + strDepartCode + "'";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DepartMent");
            DL_BelongDepartment.DataSource = ds;
            DL_BelongDepartment.DataBind();

            LB_DepartCode.Text = strDepartCode;
        }

        Session["UserCode"] = LB_UserCode.Text.Trim();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID = e.Item.Cells[2].Text;

        if (e.CommandName == "Update")
        {
            strHQL = "From LTCandidateInformation as ltCandidateInformation Where ltCandidateInformation.ID = " + strID;
            LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
            lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);
            LTCandidateInformation ltCandidateInformation = (LTCandidateInformation)lst[0];

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LB_ID.Text = strID;
            TB_UserName.Text = ltCandidateInformation.UserName;

            DL_Gender.SelectedValue = ltCandidateInformation.Gender;
            NB_Age.Amount = ltCandidateInformation.Age;
            TB_CurrentDuty.Text = ltCandidateInformation.CurrentDuty;
            TB_Company.Text = ltCandidateInformation.Company.Trim();
            TB_Department.Text = ltCandidateInformation.Department;
            TB_MobilePhone.Text = ltCandidateInformation.MobilePhone;
            HE_CondidateInformation.Text = ltCandidateInformation.Brief;
            DL_BelongDepartment.SelectedValue = ltCandidateInformation.BelongDepartCode;
            DLC_CreateTime.Text = ltCandidateInformation.CreateTime.ToString("yyyy-MM-dd");
            DL_Status.SelectedValue = ltCandidateInformation.Status;
            IM_MemberPhoto.ImageUrl = ltCandidateInformation.PhotoURL;
            HL_MemberPhoto.NavigateUrl = ltCandidateInformation.PhotoURL;
            DL_Status.SelectedValue = ltCandidateInformation.Status;

            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            BT_UploadPhoto.Enabled = true;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }

        if (e.CommandName == "Delete")
        {
            string strBelongDepartCode;
            string strUserCode = LB_UserCode.Text.Trim();

            try
            {
                strHQL = "Update T_LTCandidateInformation Set Status = '删除' Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                strBelongDepartCode = DL_BelongDepartment.SelectedValue.Trim();

                LoadCandidate(strBelongDepartCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            }
        }
    }

    protected void BT_UploadPhoto_Click(object sender, EventArgs e)
    {
        if (this.FUP_File.PostedFile != null)
        {
            string strFileName1 = FUP_File.PostedFile.FileName.Trim();
            string strID = LB_ID.Text.Trim();
            string strHQL;

            string strLoginUserCode = Session["UserCode"].ToString().Trim();
            int i;

            if (strFileName1 != "")
            {
                //获取初始文件名
                i = strFileName1.LastIndexOf("."); //取得文件名中最后一个"."的索引
                string strNewExt = strFileName1.Substring(i); //获取文件扩展名

                DateTime dtUploadNow = DateTime.Now; //获取系统时间

                string strFileName2 = System.IO.Path.GetFileName(strFileName1);
                string strExtName = Path.GetExtension(strFileName2);
                strFileName2 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtName;


                string strDocSavePath = Server.MapPath("Doc") + "\\UserPhoto\\";
                string strFileName3 = "Doc\\UserPhoto\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUP_File.PostedFile.SaveAs(strFileName4);

                    strHQL = "Update T_LTCandidateInformation Set PhotoURL = " + "'" + strFileName3 + "'" + " Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    IM_MemberPhoto.ImageUrl = strFileName3;
                    HL_MemberPhoto.NavigateUrl = strFileName3;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCHCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void BT_DeletePhoto_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID = LB_ID.Text.Trim();

        try
        {
            strHQL = "Update T_LTCandidateInformation Set PhotoURL = '' Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            IM_MemberPhoto.ImageUrl = "";
            HL_MemberPhoto.NavigateUrl = "";


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DDL_Duty_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strDuty;

        strDuty = DL_Duty.SelectedValue.Trim();

        TB_CurrentDuty.Text = strDuty;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";
        BT_New.Enabled = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddUser();
        }
        else
        {
            UpdateUser();
        }
    }

    protected void AddUser()
    {
        string strUserName = TB_UserName.Text.Trim();
        string strCurrentDuty = TB_CurrentDuty.Text.Trim();
        string strGender = DL_Gender.SelectedValue.Trim();
        decimal deAge = NB_Age.Amount;

        string strMobilePhone = TB_MobilePhone.Text.Trim();
        string strBelongDepartCode = DL_BelongDepartment.SelectedValue.Trim();
        string strBelongDepartName = DL_BelongDepartment.SelectedItem.Text.Trim();
        string strDepartName = TB_Department.Text.Trim();
        string strCreatorCode = Session["UserCode"].ToString().Trim();
        string strCompany = TB_Company.Text.Trim();
        string strDepartment = TB_Department.Text.Trim();

        string strBrief = HE_CondidateInformation.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();

        string strHQL = "Select * From T_LTCandidateInformation Where UserName = " + "'" + strUserName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LTCandidateInformation");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTXMDHXRQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        if (strUserName != "" & strMobilePhone != "")
        {
            try
            {
                LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
                LTCandidateInformation ltCandidateInformation = new LTCandidateInformation();

                ltCandidateInformation.UserName = strUserName;
                ltCandidateInformation.CurrentDuty = strCurrentDuty;
                ltCandidateInformation.MobilePhone = strMobilePhone;
                ltCandidateInformation.Age = int.Parse(deAge.ToString());
                ltCandidateInformation.Company = strCompany;
                ltCandidateInformation.Department = strDepartment;
                ltCandidateInformation.Brief = strBrief;
                ltCandidateInformation.BelongDepartCode = strBelongDepartCode;
                ltCandidateInformation.BelongDepartName = strBelongDepartName;

                ltCandidateInformation.Brief = strBrief;

                ltCandidateInformation.CreatorCode = strCreatorCode;
                ltCandidateInformation.CreateTime = DateTime.Now;
                ltCandidateInformation.Status = strStatus;

                ltCandidateInformationBLL.AddLTCandidateInformation(ltCandidateInformation);

                LB_ID.Text = ShareClass.GetMyCreatedMaxCandidateID(strCreatorCode);

                LoadCandidate(strBelongDepartCode);

                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;
                BT_UploadPhoto.Enabled = true;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJCDMZFHMXWK + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYHDMYHMCMMZWEMAILDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateUser()
    {
        string strHQL;
        IList lst;

        string strID, strGender, strDepartment, strMobilePhone;
        string strBelongDepartCode, strBelongDepartName;
        string strUserName, strDuty, strBrief, strStatus, strCompany;
        decimal deAge;

        strID = LB_ID.Text.Trim();
        strUserName = TB_UserName.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strDepartment = TB_Department.Text.Trim();

        strGender = DL_Gender.SelectedValue.Trim();
        strDuty = TB_CurrentDuty.Text.Trim();
        deAge = NB_Age.Amount;
        strMobilePhone = TB_MobilePhone.Text.Trim();

        strBelongDepartCode = DL_BelongDepartment.SelectedValue.Trim();
        strBelongDepartName = DL_BelongDepartment.SelectedItem.Text.Trim();

        strBrief = HE_CondidateInformation.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strUserName != "" & strMobilePhone != "")
        {
            strHQL = "From LTCandidateInformation as ltCandidateInformation Where ltCandidateInformation.ID = " + strID;
            LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
            lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);
            LTCandidateInformation ltCandidateInformation = (LTCandidateInformation)lst[0];

            try
            {
                //ltCandidateInformation.UserName = strUserName;

                ltCandidateInformation.CurrentDuty = strDuty;
                ltCandidateInformation.Company = strCompany;
                ltCandidateInformation.Department = strDepartment;
                ltCandidateInformation.Gender = strGender;
                ltCandidateInformation.MobilePhone = strMobilePhone;
                ltCandidateInformation.Brief = strBrief;

                ltCandidateInformation.BelongDepartCode = strBelongDepartCode;
                ltCandidateInformation.BelongDepartName = strBelongDepartName;
                ltCandidateInformation.Status = strStatus;

                ltCandidateInformationBLL.UpdateLTCandidateInformation(ltCandidateInformation, int.Parse(strID));

                LoadCandidate(strBelongDepartCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJCDMZFHMXWK + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYHDMYHMCZWEMAILDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }


    protected void btn_ExcelToDB_Click(object sender, EventArgs e)
    {
        string strNewUserName, strUserCode;
        string strErrorUserCodeString = "";

        strUserCode = LB_UserCode.Text.Trim();

        if (ExcelToDBTest() == -1)
        {
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC ;
            return;
        }
        else
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ ;
                return;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ ;
                return;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB ;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ ;
                }
                else
                {
                    for (int i = 0; i < dr.Length; i++)
                    {
                        strNewUserName = dr[i]["姓名"].ToString().Trim();
                        LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
                        string strHQL = "from LTCandidateInformation as ltCandidateInformation where ltCandidateInformation.UserName = '" + strNewUserName + "' ";
                        IList lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);
                        if (lst != null && lst.Count > 0)//存在，则不操作
                        {
                        }
                        else//新增
                        {
                            LTCandidateInformation ltCandidateInformation = new LTCandidateInformation();

                            try
                            {
                                ltCandidateInformation.UserName = dr[i]["姓名"].ToString().Trim();
                                ltCandidateInformation.Gender = dr[i]["性别"].ToString().Trim() == "" ? "男" : dr[i]["性别"].ToString().Trim();
                                ltCandidateInformation.Age = int.Parse(dr[i]["年龄"].ToString().Trim() == "" ? "0" : dr[i]["年龄"].ToString().Trim());

                                ltCandidateInformation.BelongDepartCode = DL_BelongDepartment.SelectedValue;
                                ltCandidateInformation.BelongDepartName = DL_BelongDepartment.SelectedItem.Text;

                                ltCandidateInformation.Department = dr[i]["公司"].ToString().Trim();
                                ltCandidateInformation.Department = dr[i]["部门"].ToString().Trim();
                                ltCandidateInformation.CurrentDuty = dr[i]["当前职务"].ToString().Trim();

                                ltCandidateInformation.MobilePhone = dr[i]["手机"].ToString().Trim();

                                ltCandidateInformation.CreateTime = DateTime.Now;

                                ltCandidateInformation.Status = dr[i]["状态"].ToString().Trim() == "" ? "在职" : dr[i]["状态"].ToString().Trim();
                                ltCandidateInformation.PhotoURL = "";

                                ltCandidateInformationBLL.AddLTCandidateInformation(ltCandidateInformation);
                            }
                            catch (Exception err)
                            {
                                strErrorUserCodeString += strNewUserName + ",";

                                LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strNewUserName + " : " + err.Message.ToString() + "<br/>"; ;

                                LogClass.WriteLogFile(this.GetType().BaseType.Name + "：" + Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strNewUserName + " : " + err.Message.ToString());
                            }

                        }
                        continue;
                    }

                    if (strErrorUserCodeString == "")
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRBWC + "')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRJBWCDXMRYSJDRSBSTRERRORUSERCODESTRINGJC + "')", true);
                    }
                }
            }

            LoadCandidate(DL_BelongDepartment.SelectedValue);
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
        IList lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected int ExcelToDBTest()
    {
        int j = 0;
        string strUserCode;


        strUserCode = LB_UserCode.Text.Trim();

        try
        {

            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ ;
                j = -1;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ ;
                j = -1;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB ;
                j = -1;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                    j = -1;
                }
                else
                {
                    for (int i = 0; i < dr.Length; i++)
                    {
                        string strUserName = dr[i]["姓名"].ToString().Trim();
                        LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
                        string strHQL = "from LTCandidateInformation as ltCandidateInformation where ltCandidateInformation.UserName = '" + strUserName + "' ";
                        IList lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);
                        if (lst != null && lst.Count > 0)//存在，则不操作
                        {
                            LB_ErrorText.Text += Resources.lang.ZZJGCZXTZHDYGDRICYDMTOSTRINGTRIMDRICYXMTOSTRINGTRIMJC;
                            j = -1;
                        }
                        else//新增
                        {
                            LTCandidateInformation ltCandidateInformation = new LTCandidateInformation();
                        }
                        continue;
                    }
                }
            }
        }
        catch (Exception err)
        {
            LB_ErrorText.Text += err.Message.ToString() + "<br/>"; ;

            j = -1;
        }


        return j;
    }

    protected void LoadCandidate(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from LTCandidateInformation as ltCandidateInformation Where ltCandidateInformation.BelongDepartCode = " + "'" + strDepartCode + "'";
        strHQL += " and ltCandidateInformation.Status <> '删除'";
        LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
        lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
    }

    protected void LoadUserDuty()
    {
        string strHQL;
        IList lst;

        strHQL = "from UserDuty as userDuty Order By SortNumber ASC";
        UserDutyBLL userDutyBLL = new UserDutyBLL();
        lst = userDutyBLL.GetAllUserDutys(strHQL);

        DL_Duty.DataSource = lst;
        DL_Duty.DataBind();
        DL_Duty.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected string GetDepartName(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);
        Department department = (Department)lst[0];

        return department.DepartName.Trim();
    }


    protected string GetUserPhotoURL(string strUserCode)
    {
        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember.PhotoURL.Trim();
    }


    /// <summary>
    ///  散列加密
    /// </summary>
    protected string EncryptPasswordShal(string strPlaintext)
    {
        byte[] srcBuffer = System.Text.Encoding.UTF8.GetBytes(strPlaintext);

        System.Security.Cryptography.HashAlgorithm hash = System.Security.Cryptography.HashAlgorithm.Create("SHA1"); //将参数换成“MD5”，则执行 MD5 加密。不区分大小写。
        byte[] destBuffer = hash.ComputeHash(srcBuffer);

        string strHashedText = BitConverter.ToString(destBuffer).Replace("-", "");
        return strHashedText.ToLower();
    }

}
