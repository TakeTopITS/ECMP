using System;
using System.Resources;
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

using TakeTopSecurity;
using System.Globalization;


public partial class TTUserInfoExtend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName, strCurrentUserType;

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
      
        if (!IsPostBack)
        {
            if (Request["UserCode"] != null)
            {
                //当前修改的用户编号
                HF_UserCode.Value = Request["UserCode"];

                string strSelectUserCode = Request["UserCode"];

                LB_SelectUserCode.Text = strSelectUserCode;
                LB_SelectUserName.Text = ShareClass.GetUserName(strSelectUserCode);

                LoadUserData(HF_UserCode.Value);
            }

            TakeTopCore.CoreShareClass.InitialAllDepartmentTree(Resources.lang.ZZJGT, TreeView3);
        }
    }

    private void LoadUserData(string userCode)
    {
        string sql = string.Format("select * from T_ProjectMemberExtend where UserCode='{0}' ", userCode);
        var ds = ShareClass.GetDataSetFromSql(sql, "T_ProjectMemberExtend");
        if (ds != null && ds.Tables.Count > 0)
        {
            var dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                var dr = dt.Rows[0];
                TB_TopDepartCode.Text = dr["TopDepartCode"].ToString();
                LB_TopDepartName.Text = dr["TopDepartName"].ToString();
                TB_EntryTotalYearMonth.Text = dr["EntryTotalYearMonth"].ToString();
                DL_OfficeAddress.SelectedValue = dr["OfficeAddress"].ToString();
                DL_UserTypeExtend.SelectedValue = dr["UserTypeExtend"].ToString();
                DL_UserState.SelectedValue = dr["UserState"].ToString();
                DL_ProbationPeriod.SelectedValue = dr["ProbationPeriod"].ToString();
                DLC_TurnOfficialDate.Text = dr["TurnOfficialDate"].ToString();
                DL_HouseRegisterType.SelectedValue = dr["HouseRegisterType"].ToString();
                DL_PoliticalOutlook.SelectedValue = dr["PoliticalOutlook"].ToString();
                TB_ContractCompany.Text = dr["ContractCompany"].ToString();
                if (dr["FirstContractStartTime"] != null && dr["FirstContractStartTime"].ToString() != "")
                {
                    DLC_FirstContractStartTime.Text =
                        DateTime.Parse(dr["FirstContractStartTime"].ToString()).ToString("yyyy-MM-dd");
                }
                if (dr["FirstContractEndTime"] != null && dr["FirstContractEndTime"].ToString() != "")
                {
                    DLC_FirstContractEndTime.Text =
                        DateTime.Parse(dr["FirstContractEndTime"].ToString()).ToString("yyyy-MM-dd");
                }
                DL_FirstContractYears.SelectedValue = dr["FirstContractYears"].ToString();
                if (dr["SecondContractStartTime"] != null && dr["SecondContractStartTime"].ToString() != "")
                {
                    DLC_SecondContractStartTime.Text =
                        DateTime.Parse(dr["SecondContractStartTime"].ToString()).ToString("yyyy-MM-dd");
                }
                if (dr["SecondContractEndTime"] != null && dr["SecondContractEndTime"].ToString() != "")
                {
                    DLC_SecondContractEndTime.Text =
                        DateTime.Parse(dr["SecondContractEndTime"].ToString()).ToString("yyyy-MM-dd");
                }
                DL_SecondContractYears.SelectedValue = dr["SecondContractYears"].ToString();
                if (dr["ThirdContractStartTime"] != null && dr["ThirdContractStartTime"].ToString() != "")
                {
                    DLC_ThirdContractStartTime.Text =
                        DateTime.Parse(dr["ThirdContractStartTime"].ToString()).ToString("yyyy-MM-dd");
                }
                if (dr["ThirdContractEndTime"] != null && dr["ThirdContractEndTime"].ToString() != "")
                {
                    DLC_ThirdContractEndTime.Text =
                        DateTime.Parse(dr["ThirdContractEndTime"].ToString()).ToString("yyyy-MM-dd");
                }
                DL_ThirdContractYears.SelectedValue = dr["ThirdContractYears"].ToString();
                TB_SignContractCount.Text = dr["SignContractCount"].ToString();
                if (dr["ContractStartTime"] != null && dr["ContractStartTime"].ToString() != "")
                {
                    DLC_ContractStartTime.Text =
                        DateTime.Parse(dr["ContractStartTime"].ToString()).ToString("yyyy-MM-dd");
                }

                if (dr["IdcardFrontFileUrl"] != null)
                {
                    HF_IdcardFrontFileName.Value = dr["IdcardFrontFileName"].ToString();
                    HF_IdcardFrontFileUrl.Value = dr["IdcardFrontFileUrl"].ToString();
                    IMG_IdcardFrontFile.ImageUrl = dr["IdcardFrontFileUrl"].ToString();
                    IMG_IdcardFrontFile.Visible = true;
                    LT_IdcardFrontFileText.Text = "<a href='" + IMG_IdcardFrontFile.ImageUrl + "' class=\"notTab\" target=\"_blank\">" + HF_IdcardFrontFileName.Value + "</a>";
                }
                if (dr["IdcardBackFileUrl"] != null)
                {
                    HF_IdcardBackFileName.Value = dr["IdcardBackFileName"].ToString();
                    HF_IdcardBackFileUrl.Value = dr["IdcardBackFileUrl"].ToString();
                    IMG_IdcardBackFile.ImageUrl = dr["IdcardBackFileUrl"].ToString();
                    IMG_IdcardBackFile.Visible = true;
                    LT_IdcardBackFileText.Text = "<a href='" + IMG_IdcardBackFile.ImageUrl + "' class=\"notTab\" target=\"_blank\">" + HF_IdcardBackFileName.Value + "</a>";
                }
                if (dr["AcademicFileUrl"] != null)
                {
                    HF_AcademicFileName.Value = dr["AcademicFileName"].ToString();
                    HF_AcademicFileUrl.Value = dr["AcademicFileUrl"].ToString();
                    LT_AcademicFileText.Text = "<a href='" + HF_AcademicFileUrl.Value + "' class=\"notTab\" target=\"_blank\">" + HF_AcademicFileName.Value + "</a>";
                }
                if (dr["DegreeFileUrl"] != null)
                {
                    HF_DegreeFileName.Value = dr["DegreeFileName"].ToString();
                    HF_DegreeFileUrl.Value = dr["DegreeFileUrl"].ToString();
                    LT_DegreeFileText.Text = "<a href='" + HF_DegreeFileUrl.Value + "' class=\"notTab\" target=\"_blank\">" + HF_DegreeFileName.Value + "</a>";
                }
                if (dr["PreviousLeaveFileUrl"] != null)
                {
                    HF_PreviousLeaveFileName.Value = dr["PreviousLeaveFileName"].ToString();
                    HF_PreviousLeaveFileUrl.Value = dr["PreviousLeaveFileUrl"].ToString();
                    LT_PreviousLeaveFileText.Text = "<a href='" + HF_PreviousLeaveFileUrl.Value + "' class=\"notTab\" target=\"_blank\">" + HF_PreviousLeaveFileName.Value + "</a>";
                }

            }
        }

        if (TB_EntryTotalYearMonth.Text == "")
        {
            //计算司龄
            sql = string.Format("select * from T_ProjectMember where UserCode='{0}' ", userCode);
            ds = ShareClass.GetDataSetFromSql(sql, "T_ProjectMember");
            if (ds != null && ds.Tables.Count > 0)
            {
                var dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    var dr = dt.Rows[0];
                    if (dr["JoinDate"] != null)
                    {
                        HF_JoinDate.Value = DateTime.Parse(dr["JoinDate"].ToString()).ToString("yyyy-MM-dd");
                        TB_EntryTotalYearMonth.Text = GetYearMonth(HF_JoinDate.Value);
                    }
                }
            }
        }
    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = HF_UserCode.Value.Trim();

        if (checkUserExtendDataIsExisted(strUserCode) == 0)
        {
            AddUserExtend();
        }
        else
        {
            UpdateUserExtend();
        }
    }


    private void AddUserExtend()
    {
        DateTime startDate, endDate;
        if (DLC_FirstContractStartTime.Text.Trim() != "" && DLC_FirstContractEndTime.Text.Trim() != "")
        {
            startDate = DateTime.Parse(DLC_FirstContractStartTime.Text.Trim());
            endDate = DateTime.Parse(DLC_FirstContractEndTime.Text.Trim());
        }

        string sql = string.Format(@"INSERT INTO T_ProjectMemberExtend
                (UserCode
            ,TopDepartCode
            ,TopDepartName
            ,EntryTotalYearMonth
            ,OfficeAddress
            ,UserTypeExtend
            ,UserState
            ,ProbationPeriod
            ,TurnOfficialDate
            ,HouseRegisterType
            ,PoliticalOutlook
            ,ContractCompany
            ,ContractType
            ,FirstContractStartTime
            ,FirstContractEndTime
            ,FirstContractYears
            ,SecondContractStartTime
            ,SecondContractEndTime
            ,SecondContractYears
            ,ThirdContractStartTime
            ,ThirdContractEndTime
            ,ThirdContractYears
            ,SignContractCount
            ,ContractStartTime
            ,ContractYears
            ,UrgencyRelation
            ,IdcardFrontFileName
            ,IdcardFrontFileUrl
            ,IdcardBackFileName
            ,IdcardBackFileUrl
            ,AcademicFileName
            ,AcademicFileUrl
            ,DegreeFileName
            ,DegreeFileUrl
            ,PreviousLeaveFileName
            ,PreviousLeaveFileUrl) 
            values('{0}','{1}','{2}','{3}','{4}','{5}',
            '{6}','{7}',case when '{8}'=''then null else '{8}' end,'{9}','{10}',
            '{11}','{12}',case when '{13}'=''then null else '{13}' end,case when '{14}'=''then null else '{14}' end,'{15}',
            case when '{16}'=''then null else '{16}' end,case when '{17}'=''then null else '{17}' end,'{18}',
            case when '{19}'=''then null else '{19}' end,case when '{20}'=''then null else '{20}' end,
            '{21}','{22}',case when '{23}'=''then null else '{23}' end,'{24}','{25}',
            '{26}','{27}','{28}','{29}','{30}',
            '{31}','{32}','{33}','{34}','{35}')",
            HF_UserCode.Value,
            TB_TopDepartCode.Text.Trim(),
            LB_TopDepartName.Text.Trim(),
            TB_EntryTotalYearMonth.Text.Trim(),
            DL_OfficeAddress.Text.Trim(),
            DL_UserTypeExtend.Text.Trim(),
            DL_UserState.Text.Trim(),
            DL_ProbationPeriod.Text.Trim(),
            DLC_TurnOfficialDate.Text.Trim(),
            DL_HouseRegisterType.Text.Trim(),
            DL_PoliticalOutlook.Text.Trim(),
            TB_ContractCompany.Text.Trim(),
            DL_ContractType.Text.Trim(),
            DLC_FirstContractStartTime.Text.Trim(),
            DLC_FirstContractEndTime.Text.Trim(),
            DL_FirstContractYears.Text.Trim(),
            DLC_SecondContractStartTime.Text.Trim(),
            DLC_SecondContractEndTime.Text.Trim(),
            DL_SecondContractYears.Text.Trim(),
            DLC_ThirdContractStartTime.Text.Trim(),
            DLC_ThirdContractEndTime.Text.Trim(),
            DL_ThirdContractYears.Text.Trim(),
            TB_SignContractCount.Text.Trim(),
            DLC_ContractStartTime.Text.Trim(),
            TB_EntryTotalYearMonth.Text.Trim(),
            DL_UrgencyRelation.Text.Trim(),
            HF_IdcardFrontFileName.Value.Trim(),
            HF_IdcardFrontFileUrl.Value.Trim(),
            HF_IdcardBackFileName.Value.Trim(),
            HF_IdcardBackFileUrl.Value.Trim(),
            HF_AcademicFileName.Value.Trim(),
            HF_AcademicFileUrl.Value.Trim(),
            HF_DegreeFileName.Value.Trim(),
            HF_DegreeFileUrl.Value.Trim(),
            HF_PreviousLeaveFileName.Value.Trim(),
            HF_PreviousLeaveFileUrl.Value.Trim()
            );

        try
        {
            ShareClass.RunSqlCommand(sql);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJCDMZFHMXWK + "')", true);
        }
    }

    private void UpdateUserExtend()
    {
        string sql = string.Format(@"UPDATE T_ProjectMemberExtend
   SET TopDepartCode = '{1}'
      ,TopDepartName = '{2}'
      ,EntryTotalYearMonth = '{3}'
      ,OfficeAddress = '{4}'
      ,UserTypeExtend = '{5}'
      ,UserState = '{6}'
      ,ProbationPeriod = '{7}'
      ,TurnOfficialDate = case when '{8}'=''then null else '{8}' end 
      ,HouseRegisterType = '{9}'
      ,PoliticalOutlook = '{10}'
      ,ContractCompany = '{11}'
      ,ContractType = '{12}'
      ,FirstContractStartTime = case when '{13}'=''then null else '{13}' end
      ,FirstContractEndTime = case when '{14}'=''then null else '{14}' end
      ,FirstContractYears = '{15}'
      ,SecondContractStartTime = case when '{16}'=''then null else '{16}' end
      ,SecondContractEndTime = case when '{17}'=''then null else '{17}' end
      ,SecondContractYears = '{18}'
      ,ThirdContractStartTime = case when '{19}'=''then null else '{19}' end
      ,ThirdContractEndTime =case when '{20}'=''then null else '{20}' end
      ,ThirdContractYears = '{21}'
      ,SignContractCount = '{22}'
      ,ContractStartTime = case when '{23}'=''then null else '{23}' end
      ,ContractYears = '{24}'
      ,UrgencyRelation = '{25}'
      ,IdcardFrontFileName = '{26}'
      ,IdcardFrontFileUrl = '{27}'
      ,IdcardBackFileName = '{28}'
      ,IdcardBackFileUrl = '{29}'
      ,AcademicFileName = '{30}'
      ,AcademicFileUrl = '{31}'
      ,DegreeFileName = '{32}'
      ,DegreeFileUrl = '{33}'
      ,PreviousLeaveFileName = '{34}'
      ,PreviousLeaveFileUrl = '{35}'
        WHERE UserCode='{0}' ",
            HF_UserCode.Value,
            TB_TopDepartCode.Text.Trim(),
        LB_TopDepartName.Text.Trim(),
        TB_EntryTotalYearMonth.Text.Trim(),
        DL_OfficeAddress.Text.Trim(),
        DL_UserTypeExtend.Text.Trim(),
        DL_UserState.Text.Trim(),
        DL_ProbationPeriod.Text.Trim(),
        DLC_TurnOfficialDate.Text.Trim(),
        DL_HouseRegisterType.Text.Trim(),
        DL_PoliticalOutlook.Text.Trim(),
        TB_ContractCompany.Text.Trim(),
        DL_ContractType.Text.Trim(),
        DLC_FirstContractStartTime.Text.Trim(),
        DLC_FirstContractEndTime.Text.Trim(),
        DL_FirstContractYears.Text.Trim(),
        DLC_SecondContractStartTime.Text.Trim(),
        DLC_SecondContractEndTime.Text.Trim(),
        DL_SecondContractYears.Text.Trim(),
        DLC_ThirdContractStartTime.Text.Trim(),
        DLC_ThirdContractEndTime.Text.Trim(),
        DL_ThirdContractYears.Text.Trim(),
        TB_SignContractCount.Text.Trim(),
        DLC_ContractStartTime.Text.Trim(),
        TB_EntryTotalYearMonth.Text.Trim(),
        DL_UrgencyRelation.Text.Trim(),
        HF_IdcardFrontFileName.Value.Trim(),
        HF_IdcardFrontFileUrl.Value.Trim(),
        HF_IdcardBackFileName.Value.Trim(),
        HF_IdcardBackFileUrl.Value.Trim(),
        HF_AcademicFileName.Value.Trim(),
        HF_AcademicFileUrl.Value.Trim(),
        HF_DegreeFileName.Value.Trim(),
        HF_DegreeFileUrl.Value.Trim(),
        HF_PreviousLeaveFileName.Value.Trim(),
        HF_PreviousLeaveFileUrl.Value.Trim());

        try
        {
            ShareClass.RunSqlCommand(sql);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJCDMZFHMXWK + "')", true);
        }
    }

    /// <summary>
    /// 计算司龄
    /// </summary>
    /// <param name="startDateStr"></param>
    /// <param name="endDateStr"></param>
    /// <returns></returns>
    private string GetYearMonth(string startDateStr)
    {
        string yearMonth = "";
        DateTime startDate, endDate;
        if (startDateStr != "")
        {
            startDate = DateTime.Parse(startDateStr);
            endDate = DateTime.Now;
            //日期相差月份数
            int month = ((endDate.Year - startDate.Year) * 12) + endDate.Month - startDate.Month;
            yearMonth = string.Format("{0}年{1}月", month / 12, month % 12);
        }

        return yearMonth;
    }

    //计算司龄
    protected void BT_Calc_Click(object sender, EventArgs e)
    {
        TB_EntryTotalYearMonth.Text = GetYearMonth(HF_JoinDate.Value);
    }

    //判断员工扩展属性是不是存在
    protected int checkUserExtendDataIsExisted(string strUserCode)
    {
        string strHQL;

        strHQL = "Select UserCode From T_ProjectMemberExtend Where UserCode = '" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMemberExtend");

        return ds.Tables[0].Rows.Count;
    }

    protected void BT_IdcardFrontFile_Click(object sender, EventArgs e)
    {
        if (this.FUL_IdcardFrontFile.PostedFile != null)
        {
            string strFileName1 = FUL_IdcardFrontFile.PostedFile.FileName.Trim();
            string userCode = HF_UserCode.Value;

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


                string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\";
                if (!Directory.Exists(strDocSavePath))//判断文件夹是否已经存在
                {
                    Directory.CreateDirectory(strDocSavePath);//创建文件夹
                }
                string strFileName3 = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUL_IdcardFrontFile.PostedFile.SaveAs(strFileName4);

                    LT_IdcardFrontFileText.Text = "<a href='" + strFileName3 + "' class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_IdcardFrontFileName.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_IdcardFrontFileUrl.Value = strFileName3;
                    IMG_IdcardFrontFile.ImageUrl = strFileName3;
                    IMG_IdcardFrontFile.Visible = true;

                    //ScriptManager.RegisterStartupScript(UpdatePanel6, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    protected void BT_IdcardBackFile_Click(object sender, EventArgs e)
    {
        if (this.FUL_IdcardBackFile.PostedFile != null)
        {
            string strFileName1 = FUL_IdcardBackFile.PostedFile.FileName.Trim();
            string userCode = HF_UserCode.Value;

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


                string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\";
                if (!Directory.Exists(strDocSavePath))//判断文件夹是否已经存在
                {
                    Directory.CreateDirectory(strDocSavePath);//创建文件夹
                }
                string strFileName3 = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUL_IdcardBackFile.PostedFile.SaveAs(strFileName4);

                    LT_IdcardBackFileText.Text = "<a href='" + strFileName3 + "' class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_IdcardBackFileName.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_IdcardBackFileUrl.Value = strFileName3;
                    IMG_IdcardBackFile.ImageUrl = strFileName3;
                    IMG_IdcardBackFile.Visible = true;

                    //ScriptManager.RegisterStartupScript(UpdatePanel6, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    protected void BT_AcademicFile_Click(object sender, EventArgs e)
    {
        if (this.FUL_AcademicFile.PostedFile != null)
        {
            string strFileName1 = FUL_AcademicFile.PostedFile.FileName.Trim();
            string userCode = HF_UserCode.Value;

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


                string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\";
                if (!Directory.Exists(strDocSavePath))//判断文件夹是否已经存在
                {
                    Directory.CreateDirectory(strDocSavePath);//创建文件夹
                }
                string strFileName3 = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUL_AcademicFile.PostedFile.SaveAs(strFileName4);

                    LT_AcademicFileText.Text = "<a href='" + strFileName3 + "' class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_AcademicFileName.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_AcademicFileUrl.Value = strFileName3;

                    //ScriptManager.RegisterStartupScript(UpdatePanel6, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    protected void BT_DegreeFile_Click(object sender, EventArgs e)
    {
        if (this.FUL_DegreeFile.PostedFile != null)
        {
            string strFileName1 = FUL_DegreeFile.PostedFile.FileName.Trim();

            string userCode = HF_UserCode.Value;

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


                string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\";
                if (!Directory.Exists(strDocSavePath))//判断文件夹是否已经存在
                {
                    Directory.CreateDirectory(strDocSavePath);//创建文件夹
                }
                string strFileName3 = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUL_DegreeFile.PostedFile.SaveAs(strFileName4);

                    LT_DegreeFileText.Text = "<a href='" + strFileName3 + "' class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_DegreeFileName.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_DegreeFileUrl.Value = strFileName3;

                    //ScriptManager.RegisterStartupScript(UpdatePanel6, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }



    protected void BT_PreviousLeaveFile_Click(object sender, EventArgs e)
    {
        if (this.FUL_PreviousLeaveFile.PostedFile != null)
        {
            string strFileName1 = FUL_PreviousLeaveFile.PostedFile.FileName.Trim();
            string userCode = HF_UserCode.Value;

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


                string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\";
                if (!Directory.Exists(strDocSavePath))//判断文件夹是否已经存在
                {
                    Directory.CreateDirectory(strDocSavePath);//创建文件夹
                }
                string strFileName3 = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + userCode + "\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUL_PreviousLeaveFile.PostedFile.SaveAs(strFileName4);

                    LT_PreviousLeaveFileText.Text = "<a href='" + strFileName3 + "' class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_PreviousLeaveFileName.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_PreviousLeaveFileUrl.Value = strFileName3;

                    //ScriptManager.RegisterStartupScript(UpdatePanel6, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }


    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;
        try
        {
            TreeNode treeNode = new TreeNode();
            treeNode = TreeView3.SelectedNode;

            if (treeNode.Target != "0")
            {
                strDepartCode = treeNode.Target.Trim();

                TB_TopDepartCode.Text = strDepartCode;
                LB_TopDepartName.Text = ShareClass.GetDepartName(strDepartCode);
            }
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

}