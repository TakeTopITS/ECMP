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

public partial class TTWZPurchaseDecisionList : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "期初数据导入", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        string strPurchaseHQL = string.Format(@"select distinct p.*,
                    m.UserName as PurchaseEngineerName,
                    t.UserName as TenderCompetentName,
                    c.UserName as ControlMoneyName,
                    d.UserName as DisciplinarySupervisionName,
                    e1.Name as ExpertCode1Name,
                    e2.Name as ExpertCode2Name,
                    e3.Name as ExpertCode3Name,
                    j.UserName as PurchaseManagerName,
                    s.UserName as DecisionName,
                    u.UserName as UpLeaderName,
                    s1.SupplierName as SupplierCode1Name,
                    s2.SupplierName as SupplierCode2Name,
                    s3.SupplierName as SupplierCode3Name,
                    s4.SupplierName as SupplierCode4Name,
                    s5.SupplierName as SupplierCode5Name,
                    s6.SupplierName as SupplierCode6Name
                    from T_WZPurchase p
                    left join T_ProjectMember m on p.PurchaseEngineer = m.UserCode
                    left join T_ProjectMember t on p.TenderCompetent = t.UserCode
                    left join T_ProjectMember c on p.ControlMoney = c.UserCode
                    left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                    left join T_WZExpert e1 on p.ExpertCode1 = e1.ExpertCode
                    left join T_WZExpert e2 on p.ExpertCode2 = e2.ExpertCode
                    left join T_WZExpert e3 on p.ExpertCode3 = e3.ExpertCode
                    left join T_ProjectMember j on p.PurchaseManager = j.UserCode
                    left join T_ProjectMember s on p.Decision = s.UserCode
                    left join T_ProjectMember u on p.UpLeader = u.UserCode
                    left join T_WZSupplier s1 on p.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on p.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on p.SupplierCode3 = s3.SupplierCode
                    left join T_WZSupplier s4 on p.SupplierCode4 = s4.SupplierCode
                    left join T_WZSupplier s5 on p.SupplierCode5 = s5.SupplierCode
                    left join T_WZSupplier s6 on p.SupplierCode6 = s6.SupplierCode
                    where 
                  
                    p.Progress in ('评标') 
                    and 
                    (p.PurchaseEngineer = '{0}'
                    or p.TenderCompetent = '{0}'
                    or p.ControlMoney = '{0}'
                    or p.DisciplinarySupervision = '{0}'
                    or p.ExpertCode1 = '{0}'
                    or p.ExpertCode2 = '{0}'
                    or p.ExpertCode3 = '{0}'
                    or p.PurchaseManager = '{0}'
                    )
                    order by p.MarkTime desc", strUserCode);
        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        DateTime dtPurchaseEndTime;
        string strProgress;

        for (int i = 0; i < dtPurchase.Rows.Count; i++)
        {
            dtPurchaseEndTime = DateTime.Parse(dtPurchase.Rows[i]["PurchaseEndTime"].ToString());
            strProgress = dtPurchase.Rows[i]["Progress"].ToString();

            if((strProgress == "询价" | strProgress == "评标") & dtPurchaseEndTime <= DateTime .Now )
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = true;
            }
            else
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = false;
            }
        }

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

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "AlertProjectPage('TTWZPurchaseDecisionListEdit.aspx?PurchaseCode=" + cmdArges + "');", true);
            }
        }
    }


    protected void BT_SortPurchaseCode_Click(object sender, EventArgs e)
    {
        DG_List.CurrentPageIndex = 0;

        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        string strPurchaseHQL = string.Format(@"select distinct p.*,
                    m.UserName as PurchaseEngineerName,
                    t.UserName as TenderCompetentName,
                    c.UserName as ControlMoneyName,
                    d.UserName as DisciplinarySupervisionName,
                    e1.Name as ExpertCode1Name,
                    e2.Name as ExpertCode2Name,
                    e3.Name as ExpertCode3Name,
                    j.UserName as PurchaseManagerName,
                    s.UserName as DecisionName,
                    u.UserName as UpLeaderName,
                    s1.SupplierName as SupplierCode1Name,
                    s2.SupplierName as SupplierCode2Name,
                    s3.SupplierName as SupplierCode3Name,
                    s4.SupplierName as SupplierCode4Name,
                    s5.SupplierName as SupplierCode5Name,
                    s6.SupplierName as SupplierCode6Name
                    from T_WZPurchase p
                    left join T_ProjectMember m on p.PurchaseEngineer = m.UserCode
                    left join T_ProjectMember t on p.TenderCompetent = t.UserCode
                    left join T_ProjectMember c on p.ControlMoney = c.UserCode
                    left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                    left join T_WZExpert e1 on p.ExpertCode1 = e1.ExpertCode
                    left join T_WZExpert e2 on p.ExpertCode2 = e2.ExpertCode
                    left join T_WZExpert e3 on p.ExpertCode3 = e3.ExpertCode
                    left join T_ProjectMember j on p.PurchaseManager = j.UserCode
                    left join T_ProjectMember s on p.Decision = s.UserCode
                    left join T_ProjectMember u on p.UpLeader = u.UserCode
                    left join T_WZSupplier s1 on p.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on p.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on p.SupplierCode3 = s3.SupplierCode
                    left join T_WZSupplier s4 on p.SupplierCode4 = s4.SupplierCode
                    left join T_WZSupplier s5 on p.SupplierCode5 = s5.SupplierCode
                    left join T_WZSupplier s6 on p.SupplierCode6 = s6.SupplierCode
                    where 
                 
                    p.Progress in ('评标')
                    and 
                    (p.PurchaseEngineer = '{0}'
                    or p.TenderCompetent = '{0}'
                    or p.ControlMoney = '{0}'
                    or p.DisciplinarySupervision = '{0}'
                    or p.ExpertCode1 = '{0}'
                    or p.ExpertCode2 = '{0}'
                    or p.ExpertCode3 = '{0}'
                    or p.PurchaseManager = '{0}'
                    )
                    ", strUserCode);

        if (!string.IsNullOrEmpty(HF_SortPurchaseCode.Value))
        {
            strPurchaseHQL += " order by p.PurchaseCode desc";

            HF_SortPurchaseCode.Value = "";
        }
        else
        {
            strPurchaseHQL += " order by p.PurchaseCode asc";

            HF_SortPurchaseCode.Value = "asc";
        }

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];
        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        LB_Sql.Text = strPurchaseHQL;

        DateTime dtPurchaseEndTime;
        string strProgress;

        for (int i = 0; i < dtPurchase.Rows.Count; i++)
        {
            dtPurchaseEndTime = DateTime.Parse(dtPurchase.Rows[i]["PurchaseEndTime"].ToString());
            strProgress = dtPurchase.Rows[i]["Progress"].ToString();

            if ((strProgress == "询价" | strProgress == "评标") & dtPurchaseEndTime <= DateTime.Now)
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = true;
            }
            else
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = false;
            }
        }

        LB_RecordCount.Text = dtPurchase.Rows.Count.ToString();
    }

    protected void BT_SortProjectCode_Click(object sender, EventArgs e)
    {
        DG_List.CurrentPageIndex = 0;

        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        string strPurchaseHQL = string.Format(@"select distinct p.*,
                    m.UserName as PurchaseEngineerName,
                    t.UserName as TenderCompetentName,
                    c.UserName as ControlMoneyName,
                    d.UserName as DisciplinarySupervisionName,
                    e1.Name as ExpertCode1Name,
                    e2.Name as ExpertCode2Name,
                    e3.Name as ExpertCode3Name,
                    j.UserName as PurchaseManagerName,
                    s.UserName as DecisionName,
                    u.UserName as UpLeaderName,
                    s1.SupplierName as SupplierCode1Name,
                    s2.SupplierName as SupplierCode2Name,
                    s3.SupplierName as SupplierCode3Name,
                    s4.SupplierName as SupplierCode4Name,
                    s5.SupplierName as SupplierCode5Name,
                    s6.SupplierName as SupplierCode6Name
                    from T_WZPurchase p
                    left join T_ProjectMember m on p.PurchaseEngineer = m.UserCode
                    left join T_ProjectMember t on p.TenderCompetent = t.UserCode
                    left join T_ProjectMember c on p.ControlMoney = c.UserCode
                    left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                    left join T_WZExpert e1 on p.ExpertCode1 = e1.ExpertCode
                    left join T_WZExpert e2 on p.ExpertCode2 = e2.ExpertCode
                    left join T_WZExpert e3 on p.ExpertCode3 = e3.ExpertCode
                    left join T_ProjectMember j on p.PurchaseManager = j.UserCode
                    left join T_ProjectMember s on p.Decision = s.UserCode
                    left join T_ProjectMember u on p.UpLeader = u.UserCode
                    left join T_WZSupplier s1 on p.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on p.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on p.SupplierCode3 = s3.SupplierCode
                    left join T_WZSupplier s4 on p.SupplierCode4 = s4.SupplierCode
                    left join T_WZSupplier s5 on p.SupplierCode5 = s5.SupplierCode
                    left join T_WZSupplier s6 on p.SupplierCode6 = s6.SupplierCode
                    where 
                  
                    p.Progress in ('评标')
                    and 
                    (p.PurchaseEngineer = '{0}'
                    or p.TenderCompetent = '{0}'
                    or p.ControlMoney = '{0}'
                    or p.DisciplinarySupervision = '{0}'
                    or p.ExpertCode1 = '{0}'
                    or p.ExpertCode2 = '{0}'
                    or p.ExpertCode3 = '{0}'
                    or p.PurchaseManager = '{0}'
                    )
                    ", strUserCode);

        if (!string.IsNullOrEmpty(HF_SortProjectCode.Value))
        {
            strPurchaseHQL += " order by p.ProjectCode desc";

            HF_SortProjectCode.Value = "";
        }
        else
        {
            strPurchaseHQL += " order by p.ProjectCode asc";

            HF_SortProjectCode.Value = "asc";
        }

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        LB_Sql.Text = strPurchaseHQL;

        DateTime dtPurchaseEndTime;
        string strProgress;

        for (int i = 0; i < dtPurchase.Rows.Count; i++)
        {
            dtPurchaseEndTime = DateTime.Parse(dtPurchase.Rows[i]["PurchaseEndTime"].ToString());
            strProgress = dtPurchase.Rows[i]["Progress"].ToString();

            if ((strProgress == "询价" | strProgress == "评标") & dtPurchaseEndTime <= DateTime.Now)
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = true;
            }
            else
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = false;
            }
        }

        LB_RecordCount.Text = dtPurchase.Rows.Count.ToString();
    }

    protected void BT_SortPurchaseStartTime_Click(object sender, EventArgs e)
    {
        DG_List.CurrentPageIndex = 0;

        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        string strPurchaseHQL = string.Format(@"select distinct p.*,
                    m.UserName as PurchaseEngineerName,
                    t.UserName as TenderCompetentName,
                    c.UserName as ControlMoneyName,
                    d.UserName as DisciplinarySupervisionName,
                    e1.Name as ExpertCode1Name,
                    e2.Name as ExpertCode2Name,
                    e3.Name as ExpertCode3Name,
                    j.UserName as PurchaseManagerName,
                    s.UserName as DecisionName,
                    u.UserName as UpLeaderName,
                    s1.SupplierName as SupplierCode1Name,
                    s2.SupplierName as SupplierCode2Name,
                    s3.SupplierName as SupplierCode3Name,
                    s4.SupplierName as SupplierCode4Name,
                    s5.SupplierName as SupplierCode5Name,
                    s6.SupplierName as SupplierCode6Name
                    from T_WZPurchase p
                    left join T_ProjectMember m on p.PurchaseEngineer = m.UserCode
                    left join T_ProjectMember t on p.TenderCompetent = t.UserCode
                    left join T_ProjectMember c on p.ControlMoney = c.UserCode
                    left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                    left join T_WZExpert e1 on p.ExpertCode1 = e1.ExpertCode
                    left join T_WZExpert e2 on p.ExpertCode2 = e2.ExpertCode
                    left join T_WZExpert e3 on p.ExpertCode3 = e3.ExpertCode
                    left join T_ProjectMember j on p.PurchaseManager = j.UserCode
                    left join T_ProjectMember s on p.Decision = s.UserCode
                    left join T_ProjectMember u on p.UpLeader = u.UserCode
                    left join T_WZSupplier s1 on p.SupplierCode1 = s1.SupplierCode
                    left join T_WZSupplier s2 on p.SupplierCode2 = s2.SupplierCode
                    left join T_WZSupplier s3 on p.SupplierCode3 = s3.SupplierCode
                    left join T_WZSupplier s4 on p.SupplierCode4 = s4.SupplierCode
                    left join T_WZSupplier s5 on p.SupplierCode5 = s5.SupplierCode
                    left join T_WZSupplier s6 on p.SupplierCode6 = s6.SupplierCode
                    where 
                  
                    p.Progress in ('评标')
                    and 
                    (p.PurchaseEngineer = '{0}'
                    or p.TenderCompetent = '{0}'
                    or p.ControlMoney = '{0}'
                    or p.DisciplinarySupervision = '{0}'
                    or p.ExpertCode1 = '{0}'
                    or p.ExpertCode2 = '{0}'
                    or p.ExpertCode3 = '{0}'
                    or p.PurchaseManager = '{0}'
                    )
                    ", strUserCode);

        if (!string.IsNullOrEmpty(HF_SortPurchaseStartTime.Value))
        {
            strPurchaseHQL += " order by p.PurchaseStartTime desc";

            HF_SortPurchaseStartTime.Value = "";
        }
        else
        {
            strPurchaseHQL += " order by p.PurchaseStartTime asc";

            HF_SortPurchaseStartTime.Value = "asc";
        }

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();

        LB_Sql.Text = strPurchaseHQL;

        DateTime dtPurchaseEndTime;
        string strProgress;

        for (int i = 0; i < dtPurchase.Rows.Count; i++)
        {
            dtPurchaseEndTime = DateTime.Parse(dtPurchase.Rows[i]["PurchaseEndTime"].ToString());
            strProgress = dtPurchase.Rows[i]["Progress"].ToString();

            if ((strProgress == "询价" | strProgress == "评标") & dtPurchaseEndTime <= DateTime.Now)
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = true;
            }
            else
            {
                ((LinkButton)(DG_List.Items[i].FindControl("LIB_Tender"))).Visible = false;
            }
        }

        LB_RecordCount.Text = dtPurchase.Rows.Count.ToString();
    }
    

    /// <summary>
    ///  重新加载列表
    /// </summary>
    protected void BT_RelaceLoad_Click(object sender, EventArgs e)
    {
        DataBinder();

    }

}