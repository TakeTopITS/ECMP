using System;
using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Drawing;
using System.Data;

public partial class TTWZPurchaseDelegateList : System.Web.UI.Page
{
    string strUserCode;
    string strUserNeme;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
        strUserNeme = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "期初数据导入", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        string strPurchaseHQL = string.Format(@"select p.*,e.UserName as PurchaseEngineerName,
                    t.UserName as TenderCompetentName,
                    c.UserName as ControlMoneyName,
                    d.UserName as DisciplinarySupervisionName,
                    e1.UserName as ExpertCode1Name,
                    e2.UserName as ExpertCode2Name,
                    e3.UserName as ExpertCode3Name,
                    m.UserName as PurchaseManagerName,
                    i.UserName as DecisionName,
                    u.UserName as UpLeaderName,
                    s1.SupplierName as SupplierCode1Name,
                    s2.SupplierName as SupplierCode2Name,
                    s3.SupplierName as SupplierCode3Name,
                    s4.SupplierName as SupplierCode4Name,
                    s5.SupplierName as SupplierCode5Name,
                    s6.SupplierName as SupplierCode6Name
                    from T_WZPurchase p
                    left join T_ProjectMember e on p.PurchaseEngineer = e.UserCode
                    left join T_ProjectMember t on p.TenderCompetent = t.UserCode
                    left join T_ProjectMember c on p.ControlMoney = c.UserCode
                    left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                    left join T_ProjectMember e1 on p.ExpertCode1 = e1.UserCode
                    left join T_ProjectMember e2 on p.ExpertCode2 = e2.UserCode
                    left join T_ProjectMember e3 on p.ExpertCode3 = e3.UserCode
                    left join T_ProjectMember m on p.PurchaseManager = m.UserCode
                    left join T_ProjectMember i on p.Decision = i.UserCode
                    left join T_ProjectMember u on p.UpLeader = u.UserCode
                    left join T_WZSupplier s1 on p.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on p.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on p.SupplierCode3 = s3.SupplierCode
                    left join T_WZSupplier s4 on p.SupplierCode4 = s4.SupplierCode
                    left join T_WZSupplier s5 on p.SupplierCode5 = s5.SupplierCode
                    left join T_WZSupplier s6 on p.SupplierCode6 = s6.SupplierCode
                    where (p.Decision = '{0}' or p.UpLeader = '{0}')
                    ", strUserCode);

        string strProgress = DDL_Progress.SelectedValue;
        if (!string.IsNullOrEmpty(strProgress))
        {
            strPurchaseHQL += " and p.Progress = '" + strProgress + "'";
        }

        strPurchaseHQL += " order by p.MarkTime desc ";

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        LB_Sql.Text = strPurchaseHQL;
        LB_RecordCount.Text = dtPurchase.Rows.Count.ToString();
    }

    protected void DG_List_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Pager)
        {
            string cmdName = e.CommandName;

            for (int i = 0; i < DG_List.Items.Count; i++)
            {
                DG_List.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;


            if (cmdName == "click")
            {
                string cmdArges = e.CommandArgument.ToString();

                DataPurchaseSupplierBinder(cmdArges);

                HF_PurchaseCode.Value = cmdArges;

                //加载专家列表
                DataWZPurchaseExpertBinder(cmdArges);

                //加载决策记录
                DataPurchaseDecisionBinder(cmdArges);


                string strDecision, strProgress;
                decimal dePlanMoney;
                string strHQL = "from WZPurchase as wZPurchase Where wZPurchase.PurchaseCode = " + "'" + cmdArges + "'";
                WZPurchaseBLL wZPurchaseBLL = new WZPurchaseBLL();

                try
                {
                    IList lst = wZPurchaseBLL.GetAllWZPurchases(strHQL);
                    WZPurchase wZPurchase = (WZPurchase)lst[0];

                    strDecision = wZPurchase.Decision.Trim();
                    strProgress = wZPurchase.Progress.Trim();
                    dePlanMoney = wZPurchase.PlanMoney;

                    if (strDecision == strUserCode & strProgress == "报批" & dePlanMoney < 300000)
                    {
                        BT_Decision.Enabled = true;
                    }
                }
                catch
                {

                }

            }
        }
    }

    protected void DG_List_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_List.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text.Trim();
        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();
    }

    private void DataPurchaseSupplierBinder(string strPurchaseCode)
    {
        //加载供应商
        string strPurchaseSupplierHQL = string.Format(@"select s.*,ps.PurchaseCode,p.UserName as PushPersonName from T_WZSupplier s
                    left join T_WZPurchaseSupplier ps on s.SupplierCode = ps.SupplierCode
                    left join T_ProjectMember p on s.PushPerson = p.UserCode
                    where PurchaseCode = '{0}'", strPurchaseCode);
        DataTable dtPurchaseSupplier = ShareClass.GetDataSetFromSql(strPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];

        DG_Supplier.DataSource = dtPurchaseSupplier;
        DG_Supplier.DataBind();

        LB_SupplierRecord.Text = dtPurchaseSupplier.Rows.Count.ToString();
    }

    protected void DG_Supplier_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Pager)
        {
            string cmdName = e.CommandName;

            for (int i = 0; i < DG_Supplier.Items.Count; i++)
            {
                DG_Supplier.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;
        }
    }


    private void DataWZPurchaseExpertBinder(string strPurchaseCode)
    {
        //加载专家
        string strPurchaseExpertHQL = string.Format(@"select * from T_WZPurchaseExpert
                    where PurchaseCode = '{0}'", strPurchaseCode);
        DataTable dtPurchaseExpert = ShareClass.GetDataSetFromSql(strPurchaseExpertHQL, "PurchaseExpert").Tables[0];

        DDL_Bids.DataSource = dtPurchaseExpert;

        DDL_Bids.DataTextField = "ExpertName";
        DDL_Bids.DataValueField = "ExpertCode";

        DDL_Bids.DataBind();

        DDL_Bids_SelectedIndexChanged(null, null);
    }

    private void DataSupplierApplyBinder(string strPurchaseCode, string strExpertCode)
    {
        //查询采购文件信息绑定
        string strWZSupplierApplyCommentHQL = string.Format(@"select a.*,
                        s1.SupplierName as SupplierCode1Name,
                        s2.SupplierName as SupplierCode2Name,
                        s3.SupplierName as SupplierCode3Name
                         from T_WZSupplierApplyComment a
                        left join T_WZSupplier s1 on a.SupplierCode1 = s1.SupplierCode
                        left join T_WZSupplier s2 on a.SupplierCode2 = s2.SupplierCode
                        left join T_WZSupplier s3 on a.SupplierCode3 = s3.SupplierCode 
                        where PurchaseCode = '{0}'
                        and ExpertCode = '{1}'", strPurchaseCode, strExpertCode);
        DataTable dtWZSupplierApplyComment = ShareClass.GetDataSetFromSql(strWZSupplierApplyCommentHQL, "WZSupplierApplyComment").Tables[0];
        if (dtWZSupplierApplyComment != null && dtWZSupplierApplyComment.Rows.Count == 1)
        {
            //修改
            DataRow drSupplierApplyComment = dtWZSupplierApplyComment.Rows[0];

            TXT_Suggest.Text = ShareClass.ObjectToString(drSupplierApplyComment["Suggest"]);

            HF_SupplierCode1.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1"]);
            TXT_SupplierCode1.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1Name"]);
            HF_SupplierCode2.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2"]);
            TXT_SupplierCode2.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2Name"]);
            HF_SupplierCode3.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3"]);
            TXT_SupplierCode3.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3Name"]);
        }
    }


    private void DataPurchaseDecisionBinder(string strPurchaseCode)
    {
        //加载决策
        string strPurchaseDecisionHQL = string.Format(@"select a.*,
                    s1.SupplierName as SupplierName1,
                    s2.SupplierName as SupplierName2,
                    s3.SupplierName as SupplierName3
                    from T_WZPurchaseDecision a
                    left join T_WZSupplier s1 on a.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on a.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on a.SupplierCode3 = s3.SupplierCode 
                    where a.PurchaseCode = '{0}'", strPurchaseCode);

        DataTable dtPurchaseDecision = ShareClass.GetDataSetFromSql(strPurchaseDecisionHQL, "PurchaseDecision").Tables[0];
        if (dtPurchaseDecision != null && dtPurchaseDecision.Rows.Count > 0)
        {
            DataRow drPurchaseDecision = dtPurchaseDecision.Rows[0];

            TXT_DecisionDesc.Text = ShareClass.ObjectToString(drPurchaseDecision["DecisionDesc"]);

            TXT_DecisionTime.Text = ShareClass.ObjectToString(drPurchaseDecision["DecisionTime"]);

            //TXT_Decision.Text = ShareClass.ObjectToString(drPurchaseDecision["Decision"]);

            TXT_Decision.Text = strUserNeme;

        }
        else
        {
            TXT_Decision.ReadOnly = true;
            TXT_DecisionTime.ReadOnly = true;

            TXT_Decision.Text = strUserNeme;
            TXT_DecisionTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }


        //加载供应商
        WZPurchaseSupplierBLL wZPurchaseSupplierBLL = new WZPurchaseSupplierBLL();
        string strPurchaseSupplierHQL = "from WZPurchaseSupplier as wZPurchaseSupplier where PurchaseCode = '" + strPurchaseCode + "'";
        IList lstPurchaseSupplier = wZPurchaseSupplierBLL.GetAllWZPurchaseSuppliers(strPurchaseSupplierHQL);

        DL_DecisionSupplier1.DataSource = lstPurchaseSupplier;
        DL_DecisionSupplier1.DataBind();
        DL_DecisionSupplier1.Items.Insert(0, new ListItem("--Select--", ""));

        DL_DecisionSupplier2.DataSource = lstPurchaseSupplier;
        DL_DecisionSupplier2.DataBind();
        DL_DecisionSupplier2.Items.Insert(0, new ListItem("--Select--", ""));

        DL_DecisionSupplier3.DataSource = lstPurchaseSupplier;
        DL_DecisionSupplier3.DataBind();
        DL_DecisionSupplier3.Items.Insert(0, new ListItem("--Select--", ""));


        string strWZSupplierApplyCommentHQL = string.Format(@"select a.*,
                        s1.SupplierName as SupplierCode1Name,
                        s2.SupplierName as SupplierCode2Name,
                        s3.SupplierName as SupplierCode3Name
                         from T_WZSupplierApplyComment a
                        left join T_WZSupplier s1 on a.SupplierCode1= s1.SupplierCode
                        left join T_WZSupplier s2 on a.SupplierCode2= s2.SupplierCode
                        left join T_WZSupplier s3 on a.SupplierCode3= s3.SupplierCode 
                        where PurchaseCode = '{0}'  ", strPurchaseCode, strUserCode);

        DataTable dtWZSupplierApplyComment = ShareClass.GetDataSetFromSql(strWZSupplierApplyCommentHQL, "SupplierApplyComment").Tables[0];
        if (dtWZSupplierApplyComment != null )
        {
            //修改
            DataRow drSupplierApplyComment = dtWZSupplierApplyComment.Rows[0];

            DL_DecisionSupplier1.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1"]);
            DL_DecisionSupplier2.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2"]);
            DL_DecisionSupplier3.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3"]);
        }

    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        string strDecisionSupplier1 = DL_DecisionSupplier1.SelectedValue;
        string strDecisionSupplier2 = DL_DecisionSupplier2.SelectedValue;
        string strDecisionSupplier3 = DL_DecisionSupplier3.SelectedValue;

        string strDecisionDesc = TXT_DecisionDesc.Text.Trim();
        string strDecision = TXT_Decision.Text.Trim();
        string strDecisionTime = TXT_DecisionTime.Text.Trim();

        DateTime dtDecisionTime = DateTime.Now;
        DateTime.TryParse(strDecisionTime, out dtDecisionTime);

        string strPurchaseDecisionHQL = string.Format(@"from WZPurchaseDecision as wZPurchaseDecision
                    where wZPurchaseDecision.PurchaseCode = '{0}'", HF_PurchaseCode.Value);
        WZPurchaseDecisionBLL wZPurchaseDecisionBLL = new WZPurchaseDecisionBLL();

        try
        {
            IList lstPurchaseDecision = wZPurchaseDecisionBLL.GetAllWZPurchaseDecisions(strPurchaseDecisionHQL);
            if (lstPurchaseDecision != null && lstPurchaseDecision.Count > 0)
            {
                WZPurchaseDecision wZPurchaseDecision = (WZPurchaseDecision)lstPurchaseDecision[0];

                wZPurchaseDecision.SupplierCode1 = strDecisionSupplier1;
                wZPurchaseDecision.SupplierCode2 = strDecisionSupplier2;
                wZPurchaseDecision.SupplierCode3 = strDecisionSupplier3;

                wZPurchaseDecision.DecisionDesc = strDecisionDesc;
                wZPurchaseDecision.Decision = strDecision;

                wZPurchaseDecision.DecisionTime = dtDecisionTime;

                wZPurchaseDecisionBLL.UpdateWZPurchaseDecision(wZPurchaseDecision, wZPurchaseDecision.ID);
            }
            else
            {
                WZPurchaseDecision wZPurchaseDecision = new WZPurchaseDecision();

                wZPurchaseDecision.SupplierCode1 = strDecisionSupplier1;
                wZPurchaseDecision.SupplierCode2 = strDecisionSupplier2;
                wZPurchaseDecision.SupplierCode3 = strDecisionSupplier3;

                wZPurchaseDecision.DecisionDesc = strDecisionDesc;
                wZPurchaseDecision.Decision = strDecision;

                wZPurchaseDecision.DecisionTime = dtDecisionTime;

                wZPurchaseDecisionBLL.AddWZPurchaseDecision(wZPurchaseDecision);
            }

            string strHQL;
            //采购文件
            strHQL = "Update T_WZPurchase Set Progress = '决策' Where PurchaseCode = " + "'" + HF_PurchaseCode.Value + "'";
            ShareClass.RunSqlCommand(strHQL);

            //报价单
            strHQL = "Update T_WZPurchaseOfferRecord Set Progress = '决策'  Where PurchaseCode = " + "'" + HF_PurchaseCode.Value + "'";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存成功！');", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + ex.Message.ToString() + "');", true);
        }
    }


    protected void BT_SaveCancel_Click(object sender, EventArgs e)
    {
        string strDecisionSupplier1 = DL_DecisionSupplier1.SelectedValue;
        string strDecisionSupplier2 = DL_DecisionSupplier2.SelectedValue;
        string strDecisionSupplier3 = DL_DecisionSupplier3.SelectedValue;

        string strDecisionDesc = TXT_DecisionDesc.Text.Trim();
        string strDecision = TXT_Decision.Text.Trim();
        string strDecisionTime = TXT_DecisionTime.Text.Trim();

        DateTime dtDecisionTime = DateTime.Now;
        DateTime.TryParse(strDecisionTime, out dtDecisionTime);

        string strPurchaseDecisionHQL = string.Format(@"from WZPurchaseDecision as wZPurchaseDecision
                    where wZPurchaseDecision.PurchaseCode = '{0}'", HF_PurchaseCode.Value);
        WZPurchaseDecisionBLL wZPurchaseDecisionBLL = new WZPurchaseDecisionBLL();

        try
        {
            IList lstPurchaseDecision = wZPurchaseDecisionBLL.GetAllWZPurchaseDecisions(strPurchaseDecisionHQL);
            if (lstPurchaseDecision != null && lstPurchaseDecision.Count > 0)
            {
                WZPurchaseDecision wZPurchaseDecision = (WZPurchaseDecision)lstPurchaseDecision[0];

                wZPurchaseDecisionBLL.DeleteWZPurchaseDecision(wZPurchaseDecision);

                string strHQL;
                //采购文件
                strHQL = "Update T_WZPurchase Set Progress = '报批' Where PurchaseCode = " + "'" + HF_PurchaseCode.Value + "'";
                ShareClass.RunSqlCommand(strHQL);

                //报价单
                strHQL = "Update T_WZPurchaseOfferRecord Set Progress = '报批'  Where PurchaseCode = " + "'" + HF_PurchaseCode.Value + "'";
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('取消成功！');", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + ex.Message.ToString() + "');", true);
        }
    }


    protected void BT_Decision_Click(object sender, EventArgs e)
    {
        TXT_DecisionDesc.Enabled = true ;
        BT_DecisionCancel.Enabled = false;
    }

    protected void BT_DecisionCancel_Click(object sender, EventArgs e)
    {
        TXT_DecisionDesc.Text = "";
        TXT_DecisionDesc.Enabled = false;
    }

    protected void DDL_Bids_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strExpertCode = DDL_Bids.SelectedValue;
        DataSupplierApplyBinder(HF_PurchaseCode.Value, strExpertCode);
    }


    protected void BT_Search_Click(object sender, EventArgs e)
    {
        DataBinder();
    }


    protected void BT_DecisionSupplier1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier1','TXT_Supplier1');", true);
    }



    protected void BT_DecisionSupplier2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier2','TXT_Supplier2');", true);
    }



    protected void BT_DecisionSupplier3_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier3','TXT_Supplier3');", true);
    }


}