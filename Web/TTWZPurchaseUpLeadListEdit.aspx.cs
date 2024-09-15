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

public partial class TTWZPurchaseUpLeadListEdit : System.Web.UI.Page
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


            DDL_PurchaseMethod.BackColor = Color.CornflowerBlue;
        }
    }

    private void DataPurchaseBinder(string strPurchaseCode)
    {
        string strPurchaseHQL = string.Format(@"select p.*
                        from T_WZPurchase p
                        where p.PurchaseCode = '{0}'", strPurchaseCode);

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        if (dtPurchase != null && dtPurchase.Rows.Count > 0)
        {
            DataRow drPurchase = dtPurchase.Rows[0];

            DDL_PurchaseMethod.SelectedValue = ShareClass.ObjectToString(drPurchase["PurchaseMethod"]);
            

            //加载供应商
            WZPurchaseSupplierBLL wZPurchaseSupplierBLL = new WZPurchaseSupplierBLL();
            string strPurchaseSupplierHQL = "from WZPurchaseSupplier as wZPurchaseSupplier where PurchaseCode = '" + strPurchaseCode + "'";
            IList lstPurchaseSupplier = wZPurchaseSupplierBLL.GetAllWZPurchaseSuppliers(strPurchaseSupplierHQL);
            if (lstPurchaseSupplier != null && lstPurchaseSupplier.Count > 0)
            {
                for (int i = 0; i < lstPurchaseSupplier.Count; i++)
                {
                    WZPurchaseSupplier wZPurchaseSupplier = (WZPurchaseSupplier)lstPurchaseSupplier[i];
                    if (string.IsNullOrEmpty(TXT_Supplier1.Text))
                    {
                        TXT_Supplier1.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier1.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Supplier2.Text))
                    {
                        TXT_Supplier2.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier2.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Supplier3.Text))
                    {
                        TXT_Supplier3.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier3.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Supplier4.Text))
                    {
                        TXT_Supplier4.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier4.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Supplier5.Text))
                    {
                        TXT_Supplier5.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier5.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Supplier6.Text))
                    {
                        TXT_Supplier6.Text = wZPurchaseSupplier.SupplierName;
                        HF_Supplier6.Value = wZPurchaseSupplier.SupplierCode;
                        continue;
                    }
                }
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "CloseAutoSupplier();", true);
            }
            //加载专家
            WZPurchaseExpertBLL wZPurchaseExpertBLL = new WZPurchaseExpertBLL();
            string strPurchaseExpertHQL = "from WZPurchaseExpert as wZPurchaseExpert where PurchaseCode = '" + strPurchaseCode + "'";
            IList lstPurchaseExpert = wZPurchaseExpertBLL.GetAllWZPurchaseExperts(strPurchaseExpertHQL);
            if (lstPurchaseExpert != null && lstPurchaseExpert.Count > 0)
            {
                for (int i = 0; i < lstPurchaseExpert.Count; i++)
                {
                    WZPurchaseExpert wZPurchaseExpert = (WZPurchaseExpert)lstPurchaseExpert[i];
                    if (string.IsNullOrEmpty(TXT_Expert1.Text))
                    {
                        TXT_Expert1.Text = wZPurchaseExpert.ExpertName;
                        HF_Expert1.Value = wZPurchaseExpert.ExpertCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Expert2.Text))
                    {
                        TXT_Expert2.Text = wZPurchaseExpert.ExpertName;
                        HF_Expert2.Value = wZPurchaseExpert.ExpertCode;
                        continue;
                    }
                    if (string.IsNullOrEmpty(TXT_Expert3.Text))
                    {
                        TXT_Expert3.Text = wZPurchaseExpert.ExpertName;
                        HF_Expert3.Value = wZPurchaseExpert.ExpertCode;
                        continue;
                    }
                }
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "CloseAutoExpert();", true);
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string strPurchaseMethod = DDL_PurchaseMethod.SelectedValue;

            string strSupplierName1 = TXT_Supplier1.Text;
            string strSupplier1 = HF_Supplier1.Value;
            string strSupplierName2 = TXT_Supplier2.Text;
            string strSupplier2 = HF_Supplier2.Value;
            string strSupplierName3 = TXT_Supplier3.Text;
            string strSupplier3 = HF_Supplier3.Value;
            string strSupplierName4 = TXT_Supplier4.Text;
            string strSupplier4 = HF_Supplier4.Value;
            string strSupplierName5 = TXT_Supplier5.Text;
            string strSupplier5 = HF_Supplier5.Value;
            string strSupplierName6 = TXT_Supplier6.Text;
            string strSupplier6 = HF_Supplier6.Value;

            string strExpertName1 = TXT_Expert1.Text;
            string strExpert1 = HF_Expert1.Value;
            string strExpertName2 = TXT_Expert2.Text;
            string strExpert2 = HF_Expert2.Value;
            string strExpertName3 = TXT_Expert3.Text;
            string strExpert3 = HF_Expert3.Value;

            if (string.IsNullOrEmpty(strPurchaseMethod))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('供应方式不能为空，请补充！');", true);
                return;
            }

            if (strPurchaseMethod == "询比价" || strPurchaseMethod == "招标" || strPurchaseMethod == "框架")
            {
                //当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3
                bool IsDaiYu = true;
                if (!string.IsNullOrEmpty(strSupplier1) && !string.IsNullOrEmpty(strSupplier2) && !string.IsNullOrEmpty(strSupplier3))
                {
                    IsDaiYu = false;
                }
                if (IsDaiYu)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3！');", true);
                    return;
                }
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


                    //修改
                    wZPurchase.PurchaseMethod = strPurchaseMethod;

                    wZPurchase.SupplierCode1 = strSupplier1;
                    wZPurchase.SupplierCode2 = strSupplier2;
                    wZPurchase.SupplierCode3 = strSupplier3;
                    wZPurchase.SupplierCode4 = strSupplier4;
                    wZPurchase.SupplierCode5 = strSupplier5;
                    wZPurchase.SupplierCode6 = strSupplier6;

                    wZPurchase.ExpertCode1 = strExpert1;
                    wZPurchase.ExpertCode2 = strExpert2;
                    wZPurchase.ExpertCode3 = strExpert3;

                    wZPurchaseBLL.UpdateWZPurchase(wZPurchase, HF_PurchaseCode.Value);

                    //保存供应商
                    #region 供应商1-6逐一保存
                    string strDeleteSupplierSQL = string.Format(@"delete T_WZPurchaseSupplier where PurchaseCode = '{0}'", HF_PurchaseCode.Value);
                    ShareClass.RunSqlCommand(strDeleteSupplierSQL);

                    WZPurchaseSupplierBLL wZPurchaseSupplierBLL = new WZPurchaseSupplierBLL();
                    if (!string.IsNullOrEmpty(strSupplierName1) && !string.IsNullOrEmpty(strSupplier1))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier1);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier1;
                            wZPurchaseSupplier.SupplierName = strSupplierName1;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier1 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    if (!string.IsNullOrEmpty(strSupplierName2) && !string.IsNullOrEmpty(strSupplier2))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier2);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier2;
                            wZPurchaseSupplier.SupplierName = strSupplierName2;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier2 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    if (!string.IsNullOrEmpty(strSupplierName3) && !string.IsNullOrEmpty(strSupplier3))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier3);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier3;
                            wZPurchaseSupplier.SupplierName = strSupplierName3;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier3 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    if (!string.IsNullOrEmpty(strSupplierName4) && !string.IsNullOrEmpty(strSupplier4))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier4);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier4;
                            wZPurchaseSupplier.SupplierName = strSupplierName4;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier4 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    if (!string.IsNullOrEmpty(strSupplierName5) && !string.IsNullOrEmpty(strSupplier5))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier5);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier5;
                            wZPurchaseSupplier.SupplierName = strSupplierName5;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier5 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    if (!string.IsNullOrEmpty(strSupplierName6) && !string.IsNullOrEmpty(strSupplier6))
                    {
                        string strCheckPurchaseSupplierHQL = string.Format(@"select * from T_WZPurchaseSupplier
                                        where PurchaseCode = '{0}'
                                        and SupplierCode = '{1}'", wZPurchase.PurchaseCode, strSupplier6);
                        DataTable dtCheckPurchaseSupplier = ShareClass.GetDataSetFromSql(strCheckPurchaseSupplierHQL, "PurchaseSupplier").Tables[0];
                        if (dtCheckPurchaseSupplier == null || dtCheckPurchaseSupplier.Rows.Count <= 0)
                        {
                            WZPurchaseSupplier wZPurchaseSupplier = new WZPurchaseSupplier();
                            wZPurchaseSupplier.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseSupplier.SupplierCode = strSupplier6;
                            wZPurchaseSupplier.SupplierName = strSupplierName6;
                            wZPurchaseSupplier.IsConfirm = "0";

                            wZPurchaseSupplierBLL.AddWZPurchaseSupplier(wZPurchaseSupplier);

                            //修改供应商使用标记
                            string strUpdateSupplierHQL = "update T_WZSupplier set IsMark = -1 where SupplierCode = '" + strSupplier6 + "'";
                            ShareClass.RunSqlCommand(strUpdateSupplierHQL);
                        }
                    }
                    #endregion

                    //保存专家
                    #region 专家1-3逐一保存
                    string strDeleteExpertSQL = string.Format(@"delete T_WZPurchaseExpert where PurchaseCode = '{0}'", HF_PurchaseCode.Value);
                    ShareClass.RunSqlCommand(strDeleteExpertSQL);

                    WZPurchaseExpertBLL wZPurchaseExpertBLL = new WZPurchaseExpertBLL();
                    if (!string.IsNullOrEmpty(strExpertName1) && !string.IsNullOrEmpty(strExpert1))
                    {
                        string strCheckPurchaseExpertHQL = string.Format(@"select * from T_WZPurchaseExpert
                                                        where PurchaseCode = '{0}'
                                                        and ExpertCode = '{1}'", wZPurchase.PurchaseCode, strExpert1);
                        DataTable dtCheckPurchaseExpert = ShareClass.GetDataSetFromSql(strCheckPurchaseExpertHQL, "PurchaseExpert").Tables[0];
                        if (dtCheckPurchaseExpert == null || dtCheckPurchaseExpert.Rows.Count <= 0)
                        {

                            WZPurchaseExpert wZPurchaseExpert = new WZPurchaseExpert();
                            wZPurchaseExpert.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseExpert.ExpertCode = strExpert1;
                            wZPurchaseExpert.ExpertName = strExpertName1;

                            wZPurchaseExpertBLL.AddWZPurchaseExpert(wZPurchaseExpert);
                        }
                    }
                    if (!string.IsNullOrEmpty(strExpertName2) && !string.IsNullOrEmpty(strExpert2))
                    {
                        string strCheckPurchaseExpertHQL = string.Format(@"select * from T_WZPurchaseExpert
                                                        where PurchaseCode = '{0}'
                                                        and ExpertCode = '{1}'", wZPurchase.PurchaseCode, strExpert2);
                        DataTable dtCheckPurchaseExpert = ShareClass.GetDataSetFromSql(strCheckPurchaseExpertHQL, "PurchaseExpert").Tables[0];
                        if (dtCheckPurchaseExpert == null || dtCheckPurchaseExpert.Rows.Count <= 0)
                        {

                            WZPurchaseExpert wZPurchaseExpert = new WZPurchaseExpert();
                            wZPurchaseExpert.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseExpert.ExpertCode = strExpert2;
                            wZPurchaseExpert.ExpertName = strExpertName2;

                            wZPurchaseExpertBLL.AddWZPurchaseExpert(wZPurchaseExpert);
                        }
                    }
                    if (!string.IsNullOrEmpty(strExpertName3) && !string.IsNullOrEmpty(strExpert3))
                    {
                        string strCheckPurchaseExpertHQL = string.Format(@"select * from T_WZPurchaseExpert
                                                        where PurchaseCode = '{0}'
                                                        and ExpertCode = '{1}'", wZPurchase.PurchaseCode, strExpert3);
                        DataTable dtCheckPurchaseExpert = ShareClass.GetDataSetFromSql(strCheckPurchaseExpertHQL, "PurchaseExpert").Tables[0];
                        if (dtCheckPurchaseExpert == null || dtCheckPurchaseExpert.Rows.Count <= 0)
                        {

                            WZPurchaseExpert wZPurchaseExpert = new WZPurchaseExpert();
                            wZPurchaseExpert.PurchaseCode = wZPurchase.PurchaseCode;

                            wZPurchaseExpert.ExpertCode = strExpert3;
                            wZPurchaseExpert.ExpertName = strExpertName3;

                            wZPurchaseExpertBLL.AddWZPurchaseExpert(wZPurchaseExpert);
                        }
                    }
                    #endregion
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购文件不存在！');", true);
                return;
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "LoadParentLit();", true);
        }
        catch (Exception ex)
        { }
    }


    protected void BT_SelectSupplier1_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier1','TXT_Supplier1');", true);
        //}
    }

    protected void BT_SelectSupplier2_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier2','TXT_Supplier2');", true);
        //}
    }


    protected void BT_SelectSupplier3_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier3','TXT_Supplier3');", true);
        //}
    }



    protected void BT_SelectSupplier4_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier4','TXT_Supplier4');", true);
        //}
    }



    protected void BT_SelectSupplier5_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier5','TXT_Supplier5');", true);
        //}
    }
    

    protected void BT_SelectSupplier6_Click(object sender, EventArgs e)
    {
        string strPurchaseMothod = DDL_PurchaseMethod.SelectedValue;
        //if (strPurchaseMothod == "独家" || strPurchaseMothod == "议价" || strPurchaseMothod == "紧急" || strPurchaseMothod == "小额")
        //{
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier6','TXT_Supplier6');", true);
        //}
    }


    protected void BT_DeleteSupplier1_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        string strPurchaseMethod = DDL_PurchaseMethod.SelectedValue;

        string strSupplierName11 = TXT_Supplier1.Text;
        string strSupplier11 = HF_Supplier1.Value;
        string strSupplierName22 = TXT_Supplier2.Text;
        string strSupplier22 = HF_Supplier2.Value;
        string strSupplierName33 = TXT_Supplier3.Text;
        string strSupplier33 = HF_Supplier3.Value;

        HF_Supplier1.Value = "";
        TXT_Supplier1.Text = "";

        string strSupplierName1 = TXT_Supplier1.Text;
        string strSupplier1 = HF_Supplier1.Value;
        string strSupplierName2 = TXT_Supplier2.Text;
        string strSupplier2 = HF_Supplier2.Value;
        string strSupplierName3 = TXT_Supplier3.Text;
        string strSupplier3 = HF_Supplier3.Value;


        if (strPurchaseMethod == "询比价" || strPurchaseMethod == "招标" || strPurchaseMethod == "框架")
        {
            //当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3
            bool IsDaiYu = true;
            if (!string.IsNullOrEmpty(strSupplier1) && !string.IsNullOrEmpty(strSupplier2) && !string.IsNullOrEmpty(strSupplier3))
            {
                IsDaiYu = false;
            }
            if (IsDaiYu)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3！');", true);

                HF_Supplier1.Value = strSupplier11;
                TXT_Supplier1.Text = strSupplierName11;
                return;
            }
        }

        strHQL = "Update   T_WZPurchase Set SupplierCode1 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);
    }

    protected void BT_DeleteSupplier2_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        strPurchaseCode = HF_PurchaseCode.Value;

        string strPurchaseMethod = DDL_PurchaseMethod.SelectedValue;

        string strSupplierName11 = TXT_Supplier1.Text;
        string strSupplier11 = HF_Supplier1.Value;
        string strSupplierName22 = TXT_Supplier2.Text;
        string strSupplier22 = HF_Supplier2.Value;
        string strSupplierName33 = TXT_Supplier3.Text;
        string strSupplier33 = HF_Supplier3.Value;

        HF_Supplier2.Value = "";
        TXT_Supplier2.Text = "";

        string strSupplierName1 = TXT_Supplier1.Text;
        string strSupplier1 = HF_Supplier1.Value;
        string strSupplierName2 = TXT_Supplier2.Text;
        string strSupplier2 = HF_Supplier2.Value;
        string strSupplierName3 = TXT_Supplier3.Text;
        string strSupplier3 = HF_Supplier3.Value;


        if (strPurchaseMethod == "询比价" || strPurchaseMethod == "招标" || strPurchaseMethod == "框架")
        {
            //当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3
            bool IsDaiYu = true;
            if (!string.IsNullOrEmpty(strSupplier1) && !string.IsNullOrEmpty(strSupplier2) && !string.IsNullOrEmpty(strSupplier3))
            {
                IsDaiYu = false;
            }
            if (IsDaiYu)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3！');", true);

                HF_Supplier2.Value = strSupplier22;
                TXT_Supplier2.Text = strSupplierName22;
                return;
            }
        }

        strHQL = "Update   T_WZPurchase Set SupplierCode2 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        HF_Supplier2.Value = "";
        TXT_Supplier2.Text = "";
    }

    protected void BT_DeleteSupplier3_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        string strPurchaseMethod = DDL_PurchaseMethod.SelectedValue;

        string strSupplierName11 = TXT_Supplier1.Text;
        string strSupplier11 = HF_Supplier1.Value;
        string strSupplierName22 = TXT_Supplier2.Text;
        string strSupplier22 = HF_Supplier2.Value;
        string strSupplierName33 = TXT_Supplier3.Text;
        string strSupplier33 = HF_Supplier3.Value;

        HF_Supplier3.Value = "";
        TXT_Supplier3.Text = "";

        string strSupplierName1 = TXT_Supplier1.Text;
        string strSupplier1 = HF_Supplier1.Value;
        string strSupplierName2 = TXT_Supplier2.Text;
        string strSupplier2 = HF_Supplier2.Value;
        string strSupplierName3 = TXT_Supplier3.Text;
        string strSupplier3 = HF_Supplier3.Value;


        if (strPurchaseMethod == "询比价" || strPurchaseMethod == "招标" || strPurchaseMethod == "框架")
        {
            //当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3
            bool IsDaiYu = true;
            if (!string.IsNullOrEmpty(strSupplier1) && !string.IsNullOrEmpty(strSupplier2) && !string.IsNullOrEmpty(strSupplier3))
            {
                IsDaiYu = false;
            }
            if (IsDaiYu)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('当采购文件〈采购方式〉＝询比价、招标、框架时，供应商个数≥3！');", true);

                HF_Supplier3.Value = strSupplier33;
                TXT_Supplier3.Text = strSupplierName33;
                return;
            }
        }

        strHQL = "Update   T_WZPurchase Set SupplierCode3 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        HF_Supplier3.Value = "";
        TXT_Supplier3.Text = "";
    }

    protected void BT_DeleteSupplier4_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        strHQL = "Update   T_WZPurchase Set SupplierCode4 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        HF_Supplier4.Value = "";
        TXT_Supplier4.Text = "";
    }

    protected void BT_DeleteSupplier5_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        strHQL = "Update   T_WZPurchase Set SupplierCode5 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        HF_Supplier5.Value = "";
        TXT_Supplier5.Text = "";
    }

    protected void BT_DeleteSupplier6_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPurchaseCode;

        strPurchaseCode = HF_PurchaseCode.Value;

        strHQL = "Update   T_WZPurchase Set SupplierCode6 = '' Where PurchaseCode = " + "'" + strPurchaseCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        HF_Supplier6.Value = "";
        TXT_Supplier6.Text = "";
    }


    protected void BT_SelectExpert1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectExpert('HF_Expert1','TXT_Expert1');", true);
    }

    protected void BT_SelectExpert2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectExpert('HF_Expert2','TXT_Expert2');", true);
    }


    protected void BT_SelectExpert3_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectExpert('HF_Expert3','TXT_Expert3');", true);
    }


}