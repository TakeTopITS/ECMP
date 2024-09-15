using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTProjectExpenseAndMemberIncome : System.Web.UI.Page
{
    string strIsMobileDevice, strProjectID;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;

        strProjectID = Request.QueryString["ProjectID"];

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();


        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadProExpense(strProjectID);

            GetProjectTotalAmount(strProjectID);

            LoadMemberIncome(strProjectID);
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";


        decimal deShiJiRiXin, deMeiGongLiFeiYong;

        deShiJiRiXin = NB_ShiJiRiXin.Amount;
        deMeiGongLiFeiYong = NB_MeiGongLiFeiYong.Amount;

        NB_GongLiShu.Amount = decimal.Parse(GetMemberTotalGongLiShu(strProjectID));
        NB_CheFei.Amount = decimal.Parse(GetDriverWorkhour(strProjectID)) * deShiJiRiXin + decimal.Parse(GetMemberTotalGongLiShu(strProjectID)) * deMeiGongLiFeiYong;
        NB_CanFei.Amount = decimal.Parse(GetMemberTotalCanfei(strProjectID));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }


    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddExpense();
        }
        else
        {
            UpdateExpense();
        }
    }

    protected void AddExpense()
    {
        string strHQL;

        decimal deKeSheGuanLiFeiBiLi, deJianChaFeiBiLi, deGongLiShu, deCheFei, deCanFei, deShiJiRiXin, deMeiGongLiFeiYong;
        decimal deTotalAmount, deShengYuFenPeiKuan;

        deShiJiRiXin = NB_ShiJiRiXin.Amount;
        deMeiGongLiFeiYong = NB_MeiGongLiFeiYong.Amount;


        deTotalAmount = decimal.Parse(LB_TotalAmount.Text);

        deKeSheGuanLiFeiBiLi = NB_KeSheGuanLiFeiBiLi.Amount;
        deJianChaFeiBiLi = NB_JianChaFeiBiLi.Amount;
        deGongLiShu = NB_GongLiShu.Amount;

        NB_CheFei.Amount = decimal.Parse(GetDriverWorkhour(strProjectID)) * deShiJiRiXin + decimal.Parse(GetMemberTotalGongLiShu(strProjectID)) * deMeiGongLiFeiYong;
        deCheFei = NB_CheFei.Amount;

        deCanFei = NB_CanFei.Amount;

        deShiJiRiXin = NB_ShiJiRiXin.Amount;
        deMeiGongLiFeiYong = NB_MeiGongLiFeiYong.Amount;

        deShengYuFenPeiKuan = deTotalAmount - (deTotalAmount * deKeSheGuanLiFeiBiLi) - (deTotalAmount * deJianChaFeiBiLi) - deCheFei - deCanFei;

        try
        {
            strHQL = "Insert Into T_ProExpense_JHKC(ProjectID,KeSheGuanLiFeiBiLi,JianChaFeiBiLi,ShiJiRixin,MeiGongLiFeiYong,GongLiShu,CheFei,CanFei,KeSheGuanLiFei,JianChaFei,ShengYuFenPeiKuan)";
            strHQL += " Values(" + strProjectID + "," + deKeSheGuanLiFeiBiLi.ToString() + "," + deJianChaFeiBiLi.ToString() + "," + deShiJiRiXin.ToString() + "," + deMeiGongLiFeiYong.ToString() + "," + deGongLiShu.ToString() + "," + deCheFei.ToString() + "," + deCanFei.ToString() + "," + (deTotalAmount * deKeSheGuanLiFeiBiLi).ToString() + "," + (deTotalAmount * deJianChaFeiBiLi).ToString() + "," + deShengYuFenPeiKuan + ")";

            ShareClass.RunSqlCommand(strHQL);

            LB_ID.Text = GetMaxMyCreatedProjectExpenseID();

            LoadProExpense(strProjectID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateExpense()
    {
        string strHQL;

        string strID;
        strID = LB_ID.Text;

        decimal deKeSheGuanLiFeiBiLi, deJianChaFeiBiLi, deGongLiShu, deCheFei, deCanFei, deShiJiRiXin, deMeiGongLiFeiYong;
        decimal deTotalAmount, deShengYuFenPeiKuan;

        deShiJiRiXin = NB_ShiJiRiXin.Amount;
        deMeiGongLiFeiYong = NB_MeiGongLiFeiYong.Amount;

        deTotalAmount = decimal.Parse(LB_TotalAmount.Text);
        deKeSheGuanLiFeiBiLi = NB_KeSheGuanLiFeiBiLi.Amount;
        deJianChaFeiBiLi = NB_JianChaFeiBiLi.Amount;
        deGongLiShu = NB_GongLiShu.Amount;

        NB_CheFei.Amount = decimal.Parse(GetDriverWorkhour(strProjectID)) * deShiJiRiXin + decimal.Parse(GetMemberTotalGongLiShu(strProjectID)) * deMeiGongLiFeiYong;
        deCheFei = NB_CheFei.Amount;

        deCanFei = NB_CanFei.Amount;

        deShiJiRiXin = NB_ShiJiRiXin.Amount;
        deMeiGongLiFeiYong = NB_MeiGongLiFeiYong.Amount;

        deShengYuFenPeiKuan = deTotalAmount - (deTotalAmount * deKeSheGuanLiFeiBiLi) - (deTotalAmount * deJianChaFeiBiLi) - deCheFei - deCanFei;

        try
        {
            strHQL = "Update T_ProExpense_JHKC Set KeSheGuanLiFeiBiLi= " + deKeSheGuanLiFeiBiLi.ToString() + ",JianChaFeiBiLi =" + deJianChaFeiBiLi.ToString();
            strHQL += ",ShiJiRiXin =" + deShiJiRiXin.ToString() + ",MeiGongLiFeiYong =" + deMeiGongLiFeiYong.ToString();
            strHQL += ",GongLiShu=" + deGongLiShu.ToString() + ",CheFei=" + deCheFei.ToString() + ",CanFei=" + deCanFei.ToString();
            strHQL += ",KeSheGuanLiFei = " + (deTotalAmount * deKeSheGuanLiFeiBiLi).ToString() + ",JianChaFei = " + (deTotalAmount * deJianChaFeiBiLi).ToString();
            strHQL += ",ShengYuFenPeiKuan = " + deShengYuFenPeiKuan.ToString();
            strHQL += " Where ID = " + strID;

            ShareClass.RunSqlCommand(strHQL);

            LoadProExpense(strProjectID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }

    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strID;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;

                strHQL = "Select * From T_ProExpense_JHKC  Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense_JHKC");

                NB_KeSheGuanLiFeiBiLi.Amount = decimal.Parse(ds.Tables[0].Rows[0]["KeSheGuanLiFeiBiLi"].ToString());
                NB_JianChaFeiBiLi.Amount = decimal.Parse(ds.Tables[0].Rows[0]["JianChaFeiBiLi"].ToString());

                NB_ShiJiRiXin.Amount = decimal.Parse(ds.Tables[0].Rows[0]["ShiJiRiXin"].ToString());
                NB_MeiGongLiFeiYong.Amount = decimal.Parse(ds.Tables[0].Rows[0]["MeiGongLiFeiYong"].ToString());

                NB_GongLiShu.Amount = decimal.Parse(ds.Tables[0].Rows[0]["GongLiShu"].ToString());

                NB_CheFei.Amount = decimal.Parse(ds.Tables[0].Rows[0]["CheFei"].ToString());
                NB_CanFei.Amount = decimal.Parse(ds.Tables[0].Rows[0]["CanFei"].ToString());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }


            if (e.CommandName == "Delete")
            {
                try
                {
                    strHQL = "Delete From T_ProExpense_JHKC Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadProExpense(strProjectID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void BT_SaveMemberIncome_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strWorkhour, strIncome;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid1.Items.Count; j++)
            {
                strID = DataGrid1.Items[j].Cells[0].Text;

                strWorkhour = ((TextBox)(DataGrid1.Items[j].FindControl("TB_WorkHour"))).Text.Trim();
                strIncome = ((TextBox)(DataGrid1.Items[j].FindControl("TB_Income"))).Text.Trim();

                strHQL = "Update T_ProjectMemberIncome_JHKC Set Workhour = " + strWorkhour + ",MemberIncome = " + strIncome + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }


    protected void BT_RefreshWorkhour_Click(object sender, EventArgs e)
    {
        string strID, strUserCode;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid1.Items.Count; j++)
            {
                strID = DataGrid1.Items[j].Cells[0].Text;
                strUserCode = DataGrid1.Items[j].Cells[1].Text;

                ((TextBox)(DataGrid1.Items[j].FindControl("TB_WorkHour"))).Text = GetMemberTotalWorkhour(strUserCode, strProjectID);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.SuoXingWanCheng + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.SuoXingWanChengQingJianCha + "')", true);
        }
    }


    protected void LoadProExpense(string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_ProExpense_JHKC Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense_JHKC");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadMemberIncome(string strProjectID)
    {
        string strHQL;

        strHQL = "Insert Into T_ProjectMemberIncome_JHKC(ProjectID,MemberCode,MemberName,Workhour,MemberIncome)";
        strHQL += " Select A.ProjectID,A.UserCode,A.UserName,(Select COALESCE(Sum(B.ConfirmManHour),0) From T_DailyWork B Where B.ProjectID = A.ProjectID and B.UserCode = A.UserCode) as Workhour ,0 From T_RelatedUser A Where A.ProjectID = " + strProjectID;
        strHQL += " and A.UserCode Not in (Select MemberCode From T_ProjectMemberIncome_JHKC  Where ProjectID = " + strProjectID + ")";
        ShareClass.RunSqlCommand(strHQL);

        strHQL = "Select * From T_ProjectMemberIncome_JHKC Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMemberIncome_JHKC");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected string GetMemberTotalWorkhour(string strUserCode, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(ConfirmManHour),0) From T_DailyWork Where UserCode = '" + strUserCode + "' and ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected string GetMemberTotalGongLiShu(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(GongLiShu),0) From T_DailyWork Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected string GetDriverWorkhour(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(ConfirmManHour),0) From T_DailyWork Where ProjectID = " + strProjectID;
        strHQL += " And UserCode In (Select UserCode From T_ProjectMember Where Duty = '司机')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected string GetMemberTotalCanfei(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(CanFei),0) From T_DailyWork Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected string GetMaxMyCreatedProjectExpenseID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_ProExpense_JHKC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense_JHKC");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected void GetProjectTotalAmount(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(sum(GongZuoLiang * DanJia),0) From T_ProjectWorkload_JHKC Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");

        if (ds.Tables[0].Rows.Count > 0)
        {
            LB_TotalAmount.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            LB_TotalAmount.Text = "0";
        }
    }


}


