using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZPurchaseListDetail : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                HF_PurchaseCode.Value = strPurchaseCode;
                DataPurchaseBinder(strPurchaseCode);
            }


            TXT_PurchaseName.BackColor = Color.CornflowerBlue;
            TXT_ProjectCode.BackColor = Color.CornflowerBlue;
        }
    }

    private void DataPurchaseBinder(string strPurchaseCode)
    {
        string strPurchaseHQL = string.Format(@"select p.*,e.UserName as PurchaseEngineerName,
                        u.UserName as UpLeaderName,
                        m.UserName as PurchaseManagerName,d.UserName as DisciplinarySupervisionName,
                        c.UserName as ControlMoneyName
                        from T_WZPurchase p
                        left join T_ProjectMember e on p.PurchaseEngineer = e.UserCode
                        left join T_ProjectMember u on p.UpLeader = u.UserCode
                        left join T_ProjectMember m on p.PurchaseManager = m.UserCode
                        left join T_ProjectMember d on p.DisciplinarySupervision = d.UserCode
                        left join T_ProjectMember c on p.ControlMoney = c.UserCode
                        where p.PurchaseCode = '{0}'", strPurchaseCode);
        
        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        if (dtPurchase != null && dtPurchase.Rows.Count > 0)
        {
            DataRow drPurchase = dtPurchase.Rows[0];

            TXT_PurchaseName.Text = ShareClass.ObjectToString(drPurchase["PurchaseName"]);
            TXT_ProjectCode.Text = ShareClass.ObjectToString(drPurchase["ProjectCode"]);
            HF_PurchaseEngineer.Value = ShareClass.ObjectToString(drPurchase["PurchaseEngineer"]);
            HF_DelegateAgent.Value = ShareClass.ObjectToString(drPurchase["Decision"]);
            HF_PurchaseManager.Value = ShareClass.ObjectToString(drPurchase["PurchaseManager"]);
        }
    }





    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string strPurchaseName = TXT_PurchaseName.Text.Trim();
            string strProjectCode = TXT_ProjectCode.Text;
            string strPurchaseEngineer = HF_PurchaseEngineer.Value;
            string strDelegateAgent = HF_DelegateAgent.Value;
            string strPurchaseManager = HF_PurchaseManager.Value;


            if (string.IsNullOrEmpty(strPurchaseName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('文件名称不能为空，请补充！');", true);
                return;
            }
            if (string.IsNullOrEmpty(strProjectCode))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('项目编码不能为空，请补充！');", true);
                return;
            }
            if (string.IsNullOrEmpty(strPurchaseEngineer))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购工程师不能为空，请补充！');", true);
                return;
            }
            if (string.IsNullOrEmpty(strDelegateAgent))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('委托代理人不能为空，请补充！');", true);
                return;
            }
            if (string.IsNullOrEmpty(strPurchaseManager))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购经理不能为空，请补充！');", true);
                return;
            }

            WZPurchaseBLL wZPurchaseBLL = new WZPurchaseBLL();

            WZPurchase wZPurchase = new WZPurchase();

            

            if (!string.IsNullOrEmpty(HF_PurchaseCode.Value))
            {

                string strPurchaseHQL = "from WZPurchase as wZPurchase where PurchaseCode = '" + HF_PurchaseCode.Value + "'";
                IList listPurchase = wZPurchaseBLL.GetAllWZPurchases(strPurchaseHQL);
                if (listPurchase != null && listPurchase.Count > 0)
                {
                    wZPurchase = (WZPurchase)listPurchase[0];


                    if (wZPurchase.Progress != "录入")
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购文件进度不为录入，不允许修改！');", true);
                        return;
                    }


                    wZPurchase.PurchaseName = strPurchaseName;
                    wZPurchase.ProjectCode = strProjectCode;
                    wZPurchase.PurchaseEngineer = strPurchaseEngineer;
                    wZPurchase.Decision = strDelegateAgent;
                    wZPurchase.PurchaseManager = strPurchaseManager;

                    wZPurchase.MarkTime = DateTime.Now;

                    //修改
                    wZPurchaseBLL.UpdateWZPurchase(wZPurchase, HF_PurchaseCode.Value);

                }
            }
            else
            {
                //增加
                wZPurchase.PurchaseName = strPurchaseName;
                wZPurchase.ProjectCode = strProjectCode;
                wZPurchase.PurchaseEngineer = strPurchaseEngineer;
                wZPurchase.Decision = strDelegateAgent;
                wZPurchase.PurchaseManager = strPurchaseManager;

                //采购编号
                string strNewPurchaseCode = CreateNewPurchaseCode();

                wZPurchase.PurchaseCode = strNewPurchaseCode;
                
                wZPurchase.MarkTime = DateTime.Now;
                wZPurchase.Progress = "录入";

                wZPurchaseBLL.AddWZPurchase(wZPurchase);

            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "LoadParentLit();", true);
        }
        catch (Exception ex)
        { }
    }



    /// <summary>
    ///  生成采购单Code
    /// </summary>
    private string CreateNewPurchaseCode()
    {
        string strNewPurchaseCode = string.Empty;
        string strYearMonthString = DateTime.Now.ToString("yyyyMM");
        try
        {
            lock (this)
            {
                bool isExist = true;
                string strPurchaseCodeHQL = "select count(1) as RowNumber from T_WZPurchase  Where PurchaseCode Like " + "'" + strYearMonthString + "%" + "'";
                DataTable dtPurchaseCode = ShareClass.GetDataSetFromSql(strPurchaseCodeHQL, "PurchaseCode").Tables[0];
                int intPurchaseCodeNumber = int.Parse(dtPurchaseCode.Rows[0]["RowNumber"].ToString());
                intPurchaseCodeNumber = intPurchaseCodeNumber + 1;
                do
                {
                    StringBuilder sbPurchaseCode = new StringBuilder();
                    for (int j = 4 - intPurchaseCodeNumber.ToString().Length; j > 0; j--)
                    {
                        sbPurchaseCode.Append("0");
                    }
                    strNewPurchaseCode = strYearMonthString + sbPurchaseCode.ToString() + intPurchaseCodeNumber.ToString();

                    //验证新的采购编号是否存在
                    string strCheckNewPurchaseCodeHQL = "select count(1) as RowNumber from T_WZPurchase where PurchaseCode = '" + strNewPurchaseCode + "'";
                    DataTable dtCheckNewPurchaseCode = ShareClass.GetDataSetFromSql(strCheckNewPurchaseCodeHQL, "CheckNewPurchaseCode").Tables[0];
                    int intCheckNewPurchaseCode = int.Parse(dtCheckNewPurchaseCode.Rows[0]["RowNumber"].ToString());
                    if (intCheckNewPurchaseCode == 0)
                    {
                        isExist = false;
                    }
                    else
                    {
                        intPurchaseCodeNumber++;
                    }
                } while (isExist);
            }
        }
        catch (Exception ex) { }
        return strNewPurchaseCode;
    }


}