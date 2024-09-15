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

public partial class TTWZPurchaseScaling : System.Web.UI.Page
{
    string strUserCode;
    string strUserNeme;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
        strUserNeme = Session["UserNeme"] == null ? "" : Session["UserNeme"].ToString();

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
                    where  p.PurchaseEngineer = '{0}'
                    ", strUserCode);

       

        string strProgress = DDL_Progress.SelectedValue;
        if (!string.IsNullOrEmpty(strProgress))
        {
            //strPurchaseHQL += " and p.Progress = '" + strProgress + "'";
        }

        strPurchaseHQL += " order by p.MarkTime desc ";

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        LB_Sql.Text = strPurchaseHQL;
        LB_RecordCount.Text = dtPurchase.Rows.Count.ToString();
    }

    protected void DDL_Progress_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBinder();

        DataPurchaseDetailBinder("---");

        DataPurchaseSupplierBinder("---");
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

                DataPurchaseDetailBinder(cmdArges);

                DataPurchaseSupplierBinder(cmdArges);

                HF_PurchaseCode.Value = cmdArges;
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

    private void DataPurchaseDetailBinder(string strPurchaseCode)
    {
        string strWZPurchaseDetailHQL = string.Format(@"select d.*,p.PlanCode,o.ObjectName,o.Model,o.Criterion,o.Grade,s.UnitName from T_WZPurchaseDetail d
                                left join T_WZPickingPlanDetail p on d.PlanDetailID = p.ID
                                left join T_WZObject o on d.ObjectCode = o.ObjectCode
                                left join T_WZSpan s on o.Unit = s.ID
                                where d.PurchaseCode= '{0}'
                                order by o.DLCode,o.ObjectName,o.Model", strPurchaseCode);
        DataTable dtWZPurchaseDetail = ShareClass.GetDataSetFromSql(strWZPurchaseDetailHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtWZPurchaseDetail;
        DG_PurchaseDetail.DataBind();

        LB_Sql2.Text = strWZPurchaseDetailHQL;

        LB_ShowCount.Text = dtWZPurchaseDetail.Rows.Count.ToString();
 
    }


    protected void DG_PurchaseDetail_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_PurchaseDetail.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql2.Text.Trim();
        DataTable dtWZPurchaseDetail = ShareClass.GetDataSetFromSql(strHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtWZPurchaseDetail;
        DG_PurchaseDetail.DataBind();
    }


    private void DataPurchaseSupplierBinder(string strPurchaseCode)
    {
        //加载供应商
        string strPurchaseSupplierHQL = string.Format(@"select s.*,ps.PurchaseCode,p.UserName as PushPersonName from T_WZSupplier s
                    left join T_WZPurchaseSupplier ps on s.SupplierCode = ps.SupplierCode
                    left join T_ProjectMember p on s.PushPerson = p.UserCode
                    where PurchaseCode = '{0}'
                     and ((s.SupplierCode in (Select SupplierCode1 From T_WZPurchaseDecision Where PurchaseCode = '{0}')
                           Or (s.SupplierCode in (Select SupplierCode2 From T_WZPurchaseDecision Where PurchaseCode = '{0}'))
                           or (s.SupplierCode in (Select SupplierCode3 From T_WZPurchaseDecision Where PurchaseCode = '{0}'))))", strPurchaseCode);
        DataTable dtPurchaseSupplier = ShareClass.GetDataSetFromSql(strPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];

        DG_Supplier.DataSource = dtPurchaseSupplier;
        DG_Supplier.DataBind();

        LB_Sql3.Text = strPurchaseSupplierHQL;

        LB_SupplierRecord.Text = dtPurchaseSupplier.Rows.Count.ToString();
    }

    protected void DG_PurchaseDetail_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strSupplierCode, strPurchaseCode;
        string strTotalMoney;

        strPurchaseCode = HF_PurchaseCode.Value;

        if (e.Item.ItemType != ListItemType.Pager)
        {
            string cmdName = e.CommandName;

            for (int i = 0; i < DG_PurchaseDetail.Items.Count; i++)
            {
                DG_PurchaseDetail.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strSupplierCode = e.Item.Cells[1].Text;

            try
            {
                strHQL = "Update T_WZPurchaseDetail Set SupplierCode = " + "'" + strSupplierCode + "'" + " Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                strHQL += " and ID in (Select PurchaseDetailID From  T_WZPurchaseOfferRecord Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                strHQL += " and  SupplierCode = " + "'" + strSupplierCode + "')";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_WZPurchaseDetail Set ApplyMoney = A.ApplyMoney  From T_WZPurchaseOfferRecord A,T_WZPurchaseDetail B";
                strHQL += "  Where A.PurchaseCode = B.PurchaseCode AND A.PurchaseDetailID = B.ID  AND A.PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_WZPurchaseDetail Set TotalMoney = PurchaseNumber * ApplyMoney Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Select Sum(TotalMoney) From T_WZPurchaseDetail Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WZPurchaseDetail ");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    strTotalMoney = "0";
                }
                else
                {
                    strTotalMoney = ds.Tables[0].Rows[0][0].ToString();
                }

                strHQL = "Update T_WZPurchase Set TotalMoney = " + strTotalMoney + " Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('定标成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('定标失败，请检查！');", true);
            }
        }
    }

    protected void DG_Supplier_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strSupplierCode, strPurchaseCode;
        string strTotalMoney;

        strPurchaseCode = HF_PurchaseCode.Value;

        if (e.Item.ItemType != ListItemType.Pager)
        {
            string cmdName = e.CommandName;

            for (int i = 0; i < DG_Supplier.Items.Count; i++)
            {
                DG_Supplier.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strSupplierCode = e.Item.Cells[1].Text;

            try
            {
                strHQL = "Update T_WZPurchaseDetail Set SupplierCode = " + "'" + strSupplierCode + "'" + " Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                strHQL += " and ID in (Select PurchaseDetailID From  T_WZPurchaseOfferRecord Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                strHQL += " and  SupplierCode = " + "'" + strSupplierCode + "')";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_WZPurchaseDetail Set ApplyMoney = A.ApplyMoney  From T_WZPurchaseOfferRecord A,T_WZPurchaseDetail B";
                strHQL += "  Where A.PurchaseCode = B.PurchaseCode AND A.PurchaseDetailID = B.ID  AND A.PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_WZPurchaseDetail Set TotalMoney = PurchaseNumber * ApplyMoney Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Select Sum(TotalMoney) From T_WZPurchaseDetail Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WZPurchaseDetail ");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    strTotalMoney = "0";
                }
                else
                {
                    strTotalMoney = ds.Tables[0].Rows[0][0].ToString();
                }

                strHQL = "Update T_WZPurchase Set TotalMoney = " + strTotalMoney + " Where PurchaseCode = " + "'" + strPurchaseCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('定标成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('定标失败，请检查！');", true);
            }
        }
    }
}