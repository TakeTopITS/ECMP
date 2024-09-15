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
using System.Data;
using System.Drawing;

public partial class TTWZTurnDetailBrowse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            string strTurnCode = string.Empty;
            if (!string.IsNullOrEmpty(Request.QueryString["TurnCode"]))
            {
                strTurnCode = Request.QueryString["TurnCode"].ToString();
            }
            else
            {
                strTurnCode = "";
            }

            BindTurnData(strTurnCode);

            DataTurnDetailBinder(strTurnCode);
        }
    }


    private void BindTurnData(string strTurnCode)
    {
        WZTurnBLL wZTurnBLL = new WZTurnBLL();
        string strWZTurnHQL = "from WZTurn as wZTurn where TurnCode = '" + strTurnCode + "'";
        IList listWZTurn = wZTurnBLL.GetAllWZTurns(strWZTurnHQL);
        if (listWZTurn != null && listWZTurn.Count == 1)
        {
            WZTurn wZTurn = (WZTurn)listWZTurn[0];

            LB_TurnCode.Text = wZTurn.TurnCode.Trim();
            LB_ProjectName.Text = wZTurn.ProjectName.Trim();
            LB_TurnDate.Text = wZTurn.TurnTime.ToString("yyyy-MM-dd");
            LB_PickingUnit.Text = wZTurn.PickingUnit.Trim();
            LB_CurrentDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LB_PurchaseManager.Text = ShareClass.GetUserName(wZTurn.PurchaseEngineer.Trim());
            LB_MaterialPersonName.Text = ShareClass.GetUserName(wZTurn.MaterialPerson.Trim());
        }


    }

    private void DataTurnDetailBinder(string strTurnCode)
    {
        string strWZTurnDetailHQL = string.Format(@"select d.*,o.Model,o.ObjectName,s.UnitName,p.PlanCode as PickingPlanCode,m.UserName as MaterialPersonName from T_WZTurnDetail d
                            left join T_WZObject o on d.ObjectCode = o.ObjectCode 
                            left join T_WZPickingPlanDetail p on d.PlanCode = p.ID 
                           left join T_WZSpan s on o.Unit = s.ID
                            left join T_ProjectMember m on d.MaterialPerson = m.UserCode
                            where d.TurnCode= '{0}'", strTurnCode);
        DataTable dtTurnDetail = ShareClass.GetDataSetFromSql(strWZTurnDetailHQL, "WZTurnDetail").Tables[0];

        DG_TurnDetail.DataSource = dtTurnDetail;
        DG_TurnDetail.DataBind();

        LB_TurnDetail.Text = strWZTurnDetailHQL;
    }

    protected void DG_TurnDetail_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_TurnDetail.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_TurnDetail.Text.Trim();
        DataTable dtWZTurnDetail = ShareClass.GetDataSetFromSql(strHQL, "TurnDetail").Tables[0];

        DG_TurnDetail.DataSource = dtWZTurnDetail;
        DG_TurnDetail.DataBind();
    }


}