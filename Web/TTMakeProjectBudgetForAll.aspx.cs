using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTMakeProjectBudgetForAll : System.Web.UI.Page
{
    string strProjectID, strProjectStatus;
    string strUserCode, strUserName, strProjectName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        Project project = GetProject(strProjectID);

        strProjectName = project.ProjectName.Trim();
        strProjectStatus = project.Status.Trim();

        LB_CurrencyType.Text = project.CurrencyType;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadUnitForDropDownList(DL_Unit);
            LoadProjectBudget(strProjectID);

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            LB_ProjectID.Text = strProjectID;
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;

            if (strProjectStatus == "结案" || strProjectStatus == "挂起" || strProjectStatus == "取消")
            {
                //BT_New.Enabled = false;
                //BT_Update.Enabled = false;
                //BT_Delete.Enabled = false;
            }

            LoadProjectExpenseByAccount(strProjectID, "所有");
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            string strUserCode = LB_UserCode.Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Select")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "Select * From T_ProjectBudget Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectBudget");

                TB_XuHao.Text = ds.Tables[0].Rows[0]["XuHao"].ToString().Trim();
                TB_XiangMuFenBu.Text = ds.Tables[0].Rows[0]["XiangMuFenBu"].ToString();
                TB_XiangMuFenXiang.Text = ds.Tables[0].Rows[0]["XiangMuFenXiang"].ToString();
                TB_XiangMuFenLei.Text = ds.Tables[0].Rows[0]["XiangMuFenLei"].ToString();
                TB_MingChengGuiGe.Text = ds.Tables[0].Rows[0]["XiangMuMingChengHuoGuiGe"].ToString();

                LB_Account.Text = ds.Tables[0].Rows[0]["Account"].ToString();
                lbl_AccountCode.Text = ds.Tables[0].Rows[0]["AccountCode"].ToString();
                LB_AccountName.Text = ds.Tables[0].Rows[0]["Account"].ToString();

                DLC_CreateTime.Text = DateTime.Parse(ds.Tables[0].Rows[0]["CreateTime"].ToString()).ToString("yyyy-MM-dd");

                string strUnit = ds.Tables[0].Rows[0]["DanWei"].ToString();

                try
                {
                    DL_Unit.SelectedValue = strUnit;
                }
                catch
                {
                }

                NB_YuSuanZongLiang.Amount = decimal.Parse(ds.Tables[0].Rows[0]["YuSuanZongLiang"].ToString());
                NB_YuSuanDanJia.Amount = decimal.Parse(ds.Tables[0].Rows[0]["YuSuanDanJia"].ToString());
                NB_YuSuanZongE.Amount = decimal.Parse(ds.Tables[0].Rows[0]["Amount"].ToString());

                TB_BeiZhu.Text = ds.Tables[0].Rows[0]["BeiZhu"].ToString();

                LoadProjectExpenseByAccount(strProjectID, LB_Account.Text);

                if (strProjectStatus == "结案" || strProjectStatus == "挂起" || strProjectStatus == "取消")
                {
                    //BT_New.Enabled = false;
                    //BT_Update.Enabled = false;
                    //BT_Delete.Enabled = false;
                }
                else
                {
                    //BT_New.Enabled = true;
                    //BT_Update.Enabled = true;
                    //BT_Delete.Enabled = true;
                }

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Select")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
                }

            }

            if (e.CommandName == "Delete")
            {
                strHQL = "Delete From T_ProjectBudget Where ID = " + strID;
                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    LB_ID.Text = "";
                    LoadProjectBudget(strProjectID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddBudget();
        }
        else
        {
            UpdateBudget();
        }
    }

    protected void AddBudget()
    {
        string strHQL;

        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_UserCode.Text.Trim();
        string strUserName = LB_UserName.Text.Trim();

        string strXuHao = TB_XuHao.Text.Trim();
        string strXiangMuFenBu = TB_XiangMuFenBu.Text.Trim();
        string strXiangMuFenXiang = TB_XiangMuFenXiang.Text.Trim();
        string strXiangMuFenLei = TB_XiangMuFenLei.Text.Trim();
        string strMingChengGuiGe = TB_MingChengGuiGe.Text.Trim();
        string strAccountName = LB_AccountName.Text.Trim();
        string strDanWei = DL_Unit.SelectedValue.Trim();

        decimal deYuSuanDanJia = NB_YuSuanDanJia.Amount;
        decimal deYuSuanZongLiang = NB_YuSuanZongLiang.Amount;
        decimal deYuSuanZongE = deYuSuanDanJia * deYuSuanZongLiang;

        string strBeiZhu = TB_BeiZhu.Text.Trim();

        string strCreateTime = DLC_CreateTime.Text;

        string strAccountCode = ShareClass.GetAccountCode(strAccountName);

        if (deYuSuanZongLiang == 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存失败，预算总量不能为0，请检查！')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        strHQL = @"Insert Into T_ProjectBudget(XuHao  ,ProjectID  ,XiangMuFenBu ,XiangMuFenXiang,XiangMuFenLei,XiangMuMingChengHuoGuiGe,AccountCode,Account,DanWei
                   ,YuSuanZongLiang,YuSuanDanJia ,Amount,CreatorCode,CreatorName,CreateTime,BeiZhu)";
        strHQL += " Values('" + strXuHao + "'," + strProjectID + ",'" + strXiangMuFenBu + "','" + strXiangMuFenXiang + "','" + strXiangMuFenLei + "','" + strMingChengGuiGe + "','" + strAccountCode + "','" + strAccountName + "','" + strDanWei + "',";
        strHQL += deYuSuanZongLiang.ToString() + "," + deYuSuanDanJia.ToString() + "," + deYuSuanZongE.ToString() + ",'" + strUserCode + "','" + strUserName + "','" + strCreateTime + "','" + strBeiZhu + "')";

        try
        {
            ShareClass.RunSqlCommand(strHQL);
            LB_ID.Text = ShareClass.GetMyCreatedMaxAllProBudgetID(strProjectID);

            LoadProjectBudget(strProjectID);
        }
        catch(Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateBudget()
    {
        string strHQL, strHQL1;

        strProjectID = LB_ProjectID.Text.Trim();

        string strID = LB_ID.Text.Trim();
        string strXuHao = TB_XuHao.Text.Trim();
        string strXiangMuFenBu = TB_XiangMuFenBu.Text.Trim();
        string strXiangMuFenXiang = TB_XiangMuFenXiang.Text.Trim();
        string strXiangMuFenLei = TB_XiangMuFenLei.Text.Trim();
        string strMingChengGuiGe = TB_MingChengGuiGe.Text.Trim();
        string strAccountName = LB_AccountName.Text.Trim();
        string strDanWei = DL_Unit.SelectedValue.Trim();

        decimal deYuSuanDanJia = NB_YuSuanDanJia.Amount;
        decimal deYuSuanZongLiang = NB_YuSuanZongLiang.Amount;
        decimal deYuSuanZongE = deYuSuanDanJia * deYuSuanZongLiang;

        string strBeiZhu = TB_BeiZhu.Text.Trim();

        string strCreateTime = DLC_CreateTime.Text;

        string strAccountCode = ShareClass.GetAccountCode(strAccountName);

        if (deYuSuanZongLiang == 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存失败，预算总量不能为0，请检查！')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        strHQL = "Update T_ProjectBudget Set XuHao = '" + strXuHao + "',XiangMuFenBu ='" + strXiangMuFenBu + "',XiangMuFenXiang= '" + strXiangMuFenXiang + "',";
        strHQL += "XiangMuFenLei ='" + strXiangMuFenLei + "',XiangMuMingChengHuoGuiGe = '" + strMingChengGuiGe + "',AccountCode= " + "'" + strAccountCode + "',Account='" + strAccountName + "',DanWei='" + strDanWei + "',";
        strHQL += "YuSuanZongLiang =" + deYuSuanZongLiang.ToString() + ",YuSuanDanJia=" + deYuSuanDanJia + ",Amount=" + deYuSuanZongE.ToString() + ",";
        strHQL += "BeiZhu = '" + strBeiZhu + "',CreateTime ='" + strCreateTime + "'";
        strHQL += " Where ID = " + strID;

        strHQL1 = @"insert into T_ProjectBudgetChangeLog(BudgetID, Account
      , Description
      , ProjectID
      , Amount
      , CreatorCode
      , CreatorName
      , CreateTime
      , AccountCode
      , CurrencyType
      , XuHao
      , XiangMuFenBu
      , XiangMuFenXiang
      , XiangMuFenLei
      , DanWei
      , YuSuanZongLiang
      , YuSuanDanJia
      , YuSuanZongE
      , BeiZhu
      , XiangMuMingChengHuoGuiGe
      , UpdateTime)
      SelectID,Account
      ,Description
      ,ProjectID
      ,Amount";
        strHQL1 += ",'" + Session["UserCode"].ToString() + "','" + ShareClass.GetUserName(Session["UserCode"].ToString()) + "'";

        strHQL1 += @"
    
      ,CreateTime
      ,AccountCode
      ,CurrencyType
      ,XuHao
      ,XiangMuFenBu
      ,XiangMuFenXiang
      ,XiangMuFenLei
      ,DanWei
      ,YuSuanZongLiang
      ,YuSuanDanJia
      ,YuSuanZongE
      ,BeiZhu
      ,XiangMuMingChengHuoGuiGe
      ,now()
      From T_ProjectBudget Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL1);

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadProjectBudget(strProjectID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProjectBudgetBLL projectBudgetBLL = new ProjectBudgetBLL();
        IList lst = projectBudgetBLL.GetAllProjectBudgets(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        LB_OperatorCode.Text = "所有";
        LB_OperatorName.Text = "";

        LB_Account.Text = "所有";

        LoadProjectExpenseByAccount(strProjectID, "所有");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode, strUserName;
        string strAccount;
        decimal deExpense = 0, deConfirmExpense = 0;

        strID = TreeView1.SelectedNode.Target.Trim();
        strAccount = LB_Account.Text.Trim();

        try
        {
            strID = int.Parse(strID).ToString();

            strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strID;
            ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
            lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();

                if (strAccount == "所有")
                {
                    strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'";
                    strHQL += " Order by proExpense.ID DESC";
                }
                else
                {
                    strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'";
                    strHQL += " and proExpense.Account = " + "'" + strAccount + "'";
                    strHQL += " Order by proExpense.ID DESC";
                }
                ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
                lst = proExpenseBLL.GetAllProExpenses(strHQL);
                DataList1.DataSource = lst;
                DataList1.DataBind();

                ProExpense proExpense = new ProExpense();
                for (int i = 0; i < lst.Count; i++)
                {
                    proExpense = (ProExpense)lst[i];
                    deExpense += proExpense.Amount;
                    deConfirmExpense += proExpense.ConfirmAmount;
                }


                LB_Amount.Text = deExpense.ToString();
                LB_ConfirmProExpense.Text = deConfirmExpense.ToString();

                LB_OperatorCode.Text = strUserCode;
                LB_OperatorName.Text = strUserName;

                LB_Sql.Text = strHQL;
            }
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void LoadProjectBudget(string strProjectID)
    {
        string strHQL;

        decimal deBudget = 0;

        strHQL = "Select * From T_ProjectBudget Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectBudgetByAll");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        ProjectBudget projectBudget = new ProjectBudget();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deBudget += decimal.Parse(ds.Tables[0].Rows[i]["Amount"].ToString());
        }

        LB_ProBudget.Text = deBudget.ToString();
        LB_ProExpense.Text = GetProjectExpense(strProjectID);
        LB_ConfirmProExpense.Text = GetProjectConfirmExpense(strProjectID);

        FinishPercentPicture(strProjectID);
    }

    protected void LoadProjectExpenseByAccount(string strProjectID, string strAccount)
    {
        string strHQL;
        IList lst;

        decimal deExpense = 0, deConfirmExpense = 0;

        if (strAccount == "所有")
        {
            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID;
            strHQL += " Order by proExpense.ID DESC";
        }
        else
        {
            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID;
            strHQL += " and proExpense.Account = " + "'" + strAccount + "'";
            strHQL += " Order by proExpense.ID DESC";
        }

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        lst = proExpenseBLL.GetAllProExpenses(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProExpense proExpense = new ProExpense();
        for (int i = 0; i < lst.Count; i++)
        {
            proExpense = (ProExpense)lst[i];
            deExpense += proExpense.Amount;
            deConfirmExpense += proExpense.ConfirmAmount;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ConfirmAmount.Text = deConfirmExpense.ToString();

        LB_OperatorCode.Text = "所有";
        LB_OperatorName.Text = "";
    }

    protected void FinishPercentPicture(string strProjectID)
    {
        string strAccount;

        decimal deAccountExpense, deAccountBudget;
        decimal deWidth;

        int intWidth;
        int i, j = 0;

        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            strAccount = DataGrid1.Items[i].Cells[7].Text.Trim();

            deAccountBudget = decimal.Parse(DataGrid1.Items[i].Cells[11].Text.Trim());
            deAccountExpense = GetProjectAccountTotalAmount(strProjectID, strAccount);


            if (deAccountBudget == 0)
            {
                deAccountBudget = 1;
                j = 0;
            }
            else
            {
                j = 1;
            }

            deWidth = (deAccountExpense / deAccountBudget) * 100;
            deWidth = System.Decimal.Round(deWidth, 0);

            intWidth = int.Parse(deWidth.ToString());

            if (intWidth > 200)
            {
                intWidth = 200;
            }

            if (j == 0)
            {
                deAccountBudget = 0;

            }

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text = deAccountExpense.ToString();

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_DefaultPercent")).Width = Unit.Pixel(100);

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_DefaultPercent")).Text = deAccountBudget.ToString();
        }
    }

    protected void btn_ExcelToDataTraining_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (ExcelToDBTest() == -1)
        {
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC ;
            return;
        }
        else
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
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
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
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
                        if (dr[i]["序号"].ToString().Trim() != "")
                        {
                            string strXuHao = dr[i]["序号"].ToString().Trim();

                            try
                            {
                                strProjectID = LB_ProjectID.Text.Trim();
                                strUserCode = LB_UserCode.Text.Trim();
                                strUserName = LB_UserName.Text.Trim();

                                string strXiangMuFenBu = dr[i]["项目分部"].ToString().Trim();
                                string strXiangMuFenXiang = dr[i]["项目分项"].ToString().Trim();
                                string strXiangMuFenLei = dr[i]["项目分类"].ToString().Trim();
                                string strMingChengGuiGe = dr[i]["项目名称或规格"].ToString().Trim();
                                string strAccountName = dr[i]["会计科目"].ToString().Trim();
                                string strDanWei = dr[i]["计量单位"].ToString().Trim();

                                decimal deYuSuanDanJia = decimal.Parse(dr[i]["预算单价"].ToString().Trim());
                                decimal deYuSuanZongLiang = decimal.Parse(dr[i]["预算总量"].ToString().Trim());
                                decimal deYuSuanZongE = decimal.Parse(dr[i]["预算总额"].ToString().Trim());

                                string strBeiZhu = dr[i]["备注"].ToString().Trim();

                                string strAccountCode = ShareClass.GetAccountCode(strMingChengGuiGe);

                                strHQL = @"Insert Into T_ProjectBudget(XuHao  ,ProjectID  ,XiangMuFenBu ,XiangMuFenXiang,XiangMuFenLei,XiangMuMingChengHuoGuiGe,AccountCode,Account,DanWei
                   ,YuSuanZongLiang,YuSuanDanJia ,Amount,CreatorCode,CreatorName,CreateTime,BeiZhu)";
                                strHQL += " Values('" + strXuHao + "'," + strProjectID + ",'" + strXiangMuFenBu + "','" + strXiangMuFenXiang + "','" + strXiangMuFenLei + "','" + strMingChengGuiGe + "','" + strAccountCode + "','" + strMingChengGuiGe + "','" + strDanWei + "',";
                                strHQL += deYuSuanDanJia.ToString() + "," + deYuSuanZongLiang.ToString() + "," + deYuSuanZongE.ToString() + ",'" + strUserCode + "','" + strUserName + "',now(),'" + strBeiZhu + "')";

                                ShareClass.RunSqlCommand(strHQL);
                            }
                            catch (Exception err)
                            {
                                LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 1).ToString() + " , " + Resources.lang.DaiMa + ": " + strXuHao + " : " + err.Message.ToString() + "<br/>"; ;

                                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
                                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                            }
                        }
                    }

                    LoadProjectBudget(strProjectID);
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                }
            }
        }
    }

    protected int ExcelToDBTest()
    {
        int j = 0;

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
                        string strXuHao = dr[i]["序号"].ToString().Trim();
                        if (strXuHao == "")
                        {
                            LB_ErrorText.Text += Resources.lang.ZZZXHBNWK ;
                            j = -1;

                            continue;
                        }

                        string strDanWei = dr[i]["计量单位"].ToString().Trim();

                        if (strDanWei != "")
                        {
                            CheckAndAddUnit(strDanWei);
                        }
                        else
                        {
                            LB_ErrorText.Text += Resources.lang.ZZZDWBNWK ;
                            j = -1;

                            continue;
                        }

                        try
                        {
                            decimal deYuSuanDanJia = decimal.Parse(dr[i]["预算单价"].ToString().Trim());
                            decimal deYuSuanZongLiang = decimal.Parse(dr[i]["预算总量"].ToString().Trim());
                            decimal deYuSuanZongE = decimal.Parse(dr[i]["预算总额"].ToString().Trim());
                        }
                        catch
                        {
                            LB_ErrorText.Text += Resources.lang.ZZZYSZLDJZEYWSZ ;
                            j = -1;

                            continue;
                        }
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

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        LB_AccountName.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void CheckAndAddUnit(string strUnitName)
    {
        string strHQL;
        IList lst;

        strHQL = "from JNUnit as jnUnit Where jnUnit.UnitName = " + "'" + strUnitName + "'";
        JNUnitBLL jnUnitBLL = new JNUnitBLL();
        lst = jnUnitBLL.GetAllJNUnits(strHQL);

        JNUnit jnUnit = new JNUnit();

        if (lst.Count == 0)
        {
            jnUnit.UnitName = strUnitName;
            jnUnit.SortNumber = 100;

            jnUnitBLL.AddJNUnit(jnUnit);
        }
    }

    protected decimal GetProjectAccountTotalAmount(string strProjectID, string strAccount)
    {
        string strHQL;

        strHQL = "Select Sum(ConfirmAmount) From T_ProExpense Where ProjectID = " + strProjectID + " and Account = " + "'" + strAccount + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
    }

    protected string GetProjectExpense(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Amount),0) From T_ProExpense Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");


        try
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch
        {
            return "0";
        }
    }


    protected string GetProjectConfirmExpense(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(ConfirmAmount),0) From T_ProExpense Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");


        try
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch
        {
            return "0";
        }
    }

    protected Project GetProject(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project;
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.Status.Trim();
    }

    protected string GetProjectCurrencyType(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.CurrencyType.Trim();
    }

}
