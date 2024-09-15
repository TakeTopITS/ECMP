using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZProjectBrowse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["strProjectCode"]))
            {
                string strProjectCode = Request.QueryString["strProjectCode"].ToString();
                HF_ID.Value = strProjectCode;

                BindProjectData(strProjectCode);
            }
            else
            {
                return;
            }
        }
    }


    private void BindProjectData(string strProjectCode)
    {
        string strWZProjectHQL = string.Format(@"select p.*,
                        pp.UserName as ProjectManagerName,
                        pd.UserName as DelegateAgentName,
                        pm.UserName as PurchaseManagerName,
                        pe.UserName as PurchaseEngineerName,
                        pc.UserName as ContracterName,
                        pk.UserName as CheckerName,
                        ps.UserName as SafekeepName,
                        pa.UserName as MarkerName,
                        pb.UserName as SupplementEditorName
                        from T_WZProject p
                        left join T_ProjectMember pp on p.ProjectManager = pp.UserCode
                        left join T_ProjectMember pd on p.DelegateAgent = pd.UserCode
                        left join T_ProjectMember pm on p.PurchaseManager = pm.UserCode
                        left join T_ProjectMember pe on p.PurchaseEngineer = pe.UserCode
                        left join T_ProjectMember pc on p.Contracter = pc.UserCode
                        left join T_ProjectMember pk on p.Checker = pk.UserCode
                        left join T_ProjectMember ps on p.Safekeep = ps.UserCode
                        left join T_ProjectMember pa on p.Marker = pa.UserCode
                        left join T_ProjectMember pb on p.SupplementEditor = pb.UserCode
                        where p.ProjectCode = '{0}'", strProjectCode);
        DataTable dtProject = ShareClass.GetDataSetFromSql(strWZProjectHQL, "Project").Tables[0];
        if (dtProject != null && dtProject.Rows.Count > 0)
        {
            DataRow drProject = dtProject.Rows[0];

            TXT_ProjectCode.Text = ShareClass.ObjectToString(drProject["ProjectCode"]);

            
            TXT_ProjectManager.Text = ShareClass.ObjectToString(drProject["ProjectManagerName"]);
            HF_ProjectManager.Value = ShareClass.ObjectToString(drProject["ProjectManager"]);
            TXT_PurchaseManager.Text = ShareClass.ObjectToString(drProject["PurchaseManagerName"]);
            HF_PurchaseManager.Value = ShareClass.ObjectToString(drProject["PurchaseManager"]);
            TXT_StartTime.Text = ShareClass.ObjectToString(drProject["StartTime"]);
            TXT_EndTime.Text = ShareClass.ObjectToString(drProject["EndTime"]);
            TXT_ProjectName.Text = ShareClass.ObjectToString(drProject["ProjectName"]);
            TXT_PowerPurchase.Text = ShareClass.ObjectToString(drProject["PowerPurchase"]);
            TXT_StoreRoom.Text = ShareClass.ObjectToString(drProject["StoreRoom"]);
            TXT_ProjectDesc.Text = ShareClass.ObjectToString(drProject["ProjectDesc"]);

            TXT_BuildUnit.Text = ShareClass.ObjectToString(drProject["BuildUnit"]);

            TXT_DelegateAgent.Text = ShareClass.ObjectToString(drProject["DelegateAgentName"]);
            HF_DelegateAgent.Value = ShareClass.ObjectToString(drProject["DelegateAgent"]);

            TXT_PurchaseEngineer.Text = ShareClass.ObjectToString(drProject["PurchaseEngineerName"]);
            HF_PurchaseEngineer.Value = ShareClass.ObjectToString(drProject["PurchaseEngineer"]);

            TXT_SupervisorUnit.Text = ShareClass.ObjectToString(drProject["SupervisorUnit"]);

            TXT_Checker.Text = ShareClass.ObjectToString(drProject["CheckerName"]);
            HF_Checker.Value = ShareClass.ObjectToString(drProject["Checker"]);

            TXT_Contracter.Text = ShareClass.ObjectToString(drProject["ContracterName"]);
            HF_Contracter.Value = ShareClass.ObjectToString(drProject["Contracter"]);

            TXT_Safekeep.Text = ShareClass.ObjectToString(drProject["SafekeepName"]);
            HF_Safekeep.Value = ShareClass.ObjectToString(drProject["Safekeep"]);

            TXT_MarkTime.Text = ShareClass.ObjectToString(drProject["MarkTime"]);

            TXT_Marker.Text = ShareClass.ObjectToString(drProject["MarkerName"]);
            HF_Marker.Value = ShareClass.ObjectToString(drProject["Marker"]);

            TXT_SupplementEditor.Text = ShareClass.ObjectToString(drProject["SupplementEditorName"]);
            HF_SupplementEditor.Value = ShareClass.ObjectToString(drProject["SupplementEditor"]);

            TXT_SelfCost.Text = ShareClass.ObjectToString(drProject["SelfCost"]);

            TXT_ContractMoney.Text = ShareClass.ObjectToString(drProject["ContractMoney"]);
            TXT_AcceptMoney.Text = ShareClass.ObjectToString(drProject["AcceptMoney"]);
            TXT_ProjectTax.Text = ShareClass.ObjectToString(drProject["ProjectTax"]);
            TXT_TheFreight.Text = ShareClass.ObjectToString(drProject["TheFreight"]);

            TXT_SendMoney.Text = ShareClass.ObjectToString(drProject["SendMoney"]);
            TXT_FinishingRate.Text = ShareClass.ObjectToString(drProject["FinishingRate"]);

            TXT_ForCost.Text = ShareClass.ObjectToString(drProject["ForCost"]);
            TXT_TheBudget.Text = ShareClass.ObjectToString(drProject["TheBudget"]);

            TXT_Progress.Text = ShareClass.ObjectToString(drProject["Progress"]);
            TXT_IsMark.Text = ShareClass.ObjectToString(drProject["IsMark"]);

            TXT_RelatedCode.Text = ShareClass.ObjectToString(drProject["RelatedCode"]);


        }
    }
}