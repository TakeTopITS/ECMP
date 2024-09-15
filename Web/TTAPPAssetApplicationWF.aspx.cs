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

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAPPAssetApplicationWF : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];
        if (strRelatedType == null | strRelatedID == null)
        {
            strRelatedType = "Other";
            strRelatedID = "0";
        }

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strToDoWLDetailID = Request.QueryString["WLDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        if (strRelatedType == "Project")
        {
            //strRelatedType = "项目";
            //this.Title = strRelatedType + ":" + strRelatedID + " 资产领用申请";
        }

        if (strRelatedType == "Other")
        {
            //strRelatedType = "其它";
        }

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ApplyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_FinishTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from AssetType as assetType Order by assetType.SortNumber ASC";
            AssetTypeBLL assetTypeBLL = new AssetTypeBLL();
            lst = assetTypeBLL.GetAllAssetTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();

            strHQL = "from JNUnit as jnUnit Order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            TB_ApplicantCode.Text = LB_UserCode.Text.Trim();
            LB_ApplicantName.Text = LB_UserName.Text.Trim();

            //资产领用
            ShareClass.LoadWFTemplate(strUserCode, "资产领用", DL_TemName);
            LoadAssetApplication(strUserCode, strRelatedType, strRelatedID);

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strAAID;
        IList lst;
        int intWLNumber = 0;

        if (e.CommandName != "Page")
        {
            strAAID = e.Item.Cells[3].Text.Trim();

            intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_SubmitApply.Enabled = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from AssetApplication as assetApplication where assetApplication.AAID = " + strAAID;
                AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
                lst = assetApplicationBLL.GetAllAssetApplications(strHQL);
                AssetApplication assetApplication = (AssetApplication)lst[0];

                LB_AAID.Text = assetApplication.AAID.ToString();
                TB_AAName.Text = assetApplication.AAName.Trim();
                TB_ApplicantCode.Text = assetApplication.ApplicantCode.Trim();
                LB_ApplicantName.Text = assetApplication.ApplicantName.Trim();
                TB_ApplyReason.Text = assetApplication.ApplyReason.Trim();
                DL_Type.SelectedValue = assetApplication.Type;
                DLC_ApplyTime.Text = assetApplication.ApplyTime.ToString("yyyy-MM-dd");
                DLC_FinishTime.Text = assetApplication.FinishTime.ToString("yyyy-MM-dd");
                DL_Status.SelectedValue = assetApplication.Status.Trim();

                LoadAssetApplicationDetail(strAAID);

                intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
                if (intWLNumber > 0)
                {
                    BT_SubmitApply.Enabled = false;
                    BT_NewMain.Visible = false;
                    BT_NewDetail.Visible = false;
                }
                else
                {
                    BT_SubmitApply.Enabled = true;
                    BT_NewMain.Visible = true;
                    BT_NewDetail.Visible = true;
                }

                //从流程中打开的业务单
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    BT_NewMain.Visible = true;
                    BT_NewDetail.Visible = true;
                }


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                string strUserCode = LB_UserCode.Text.Trim();

                intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
                if (intWLNumber > 0)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }

                strHQL = "delete from T_AssetApplication where AAID = " + strAAID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    BT_SubmitApply.Enabled = false;

                    LoadAssetApplication(strUserCode, strRelatedType, strRelatedID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_AAID.Text = "";

        LoadAssetApplicationDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strAAID;

        strAAID = LB_AAID.Text.Trim();

        if (strAAID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }
    }

    protected void AddMain()
    {
        string strAAID, strAAName, strApplyReason, strApplicantCode, strApplicantName;
        string strType, strStatus;
        DateTime dtApplyTime, dtFinishTime;

        string strUserCode = LB_UserCode.Text.Trim();

        strAAName = TB_AAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);
        strType = DL_Type.SelectedValue;
        strStatus = DL_Status.SelectedValue;

        AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
        AssetApplication assetApplication = new AssetApplication();

        assetApplication.AAName = strAAName;
        assetApplication.ApplyReason = strApplyReason;
        assetApplication.ApplicantCode = strApplicantCode;
        assetApplication.ApplicantName = strApplicantName;
        assetApplication.ApplyTime = dtApplyTime;
        assetApplication.FinishTime = dtFinishTime;
        assetApplication.Type = strType;
        assetApplication.Status = strStatus;
        assetApplication.RelatedType = strRelatedType;
        assetApplication.RelatedID = int.Parse(strRelatedID);

        try
        {
            assetApplicationBLL.AddAssetApplication(assetApplication);
            strAAID = ShareClass.GetMyCreatedMaxAssetApplicationID(strUserCode);
            LB_AAID.Text = strAAID;


            BT_SubmitApply.Enabled = true;


            LoadAssetApplication(strUserCode, strRelatedType, strRelatedID);
            LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));


            DL_Status.SelectedValue = "新建";


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateMain()
    {
        string strAAID, strAAName, strApplyReason, strApplicantCode, strApplicantName;
        string strType, strStatus;
        DateTime dtApplyTime, dtFinishTime;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strAAID = LB_AAID.Text.Trim();
        strAAName = TB_AAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);
        strType = DL_Type.SelectedValue;
        strStatus = DL_Status.SelectedValue;

        AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
        strHQL = "from AssetApplication as assetApplication where assetApplication.AAID = " + strAAID;
        lst = assetApplicationBLL.GetAllAssetApplications(strHQL);
        AssetApplication assetApplication = (AssetApplication)lst[0];

        assetApplication.AAName = strAAName;
        assetApplication.ApplyReason = strApplyReason;
        assetApplication.ApplicantCode = strApplicantCode;
        assetApplication.ApplicantName = strApplicantName;
        assetApplication.ApplyTime = dtApplyTime;
        assetApplication.FinishTime = dtFinishTime;
        assetApplication.Type = strType;
        assetApplication.Status = strStatus;
        assetApplication.RelatedType = strRelatedType;
        assetApplication.RelatedID = int.Parse(strRelatedID);
        try
        {
            assetApplicationBLL.UpdateAssetApplication(assetApplication, int.Parse(strAAID));
            LoadAssetApplication(strUserCode, strRelatedType, strRelatedID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select AAID as DetailAAID, * from T_AssetApplication where AAID = " + strAAID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("资产领用", "资产", strAAID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void BT_FindAsset_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strAssetCode, strAssetName, strModelNumber, strSpec;
        string strDepartString;

        TabContainer2.ActiveTabIndex = 0;

        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select * From T_Asset  Where AssetCode Like " + "'" + strAssetCode + "'" + "and AssetName like " + "'" + strAssetName + "'";
        strHQL += " and COALESCE(ModelNumber,'') Like " + "'" + strModelNumber + "'" + " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and Number > 0";
        strHQL += " Order by Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Asset");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        strHQL = "From Item as item Where item.ItemCode Like " + "'" + strAssetCode + "'" + " and item.ItemName like " + "'" + strAssetName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Asset'";

        ItemBLL itemBLL = new ItemBLL();
        IList lst = itemBLL.GetAllItems(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_AssetCode.Text = "";
        TB_AssetName.Text = "";

        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        NB_Number.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = e.Item.Cells[0].Text.Trim();

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From Asset as asset where asset.ID = " + strID;
            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);

            Asset asset = (Asset)lst[0];

            TB_AssetCode.Text = asset.AssetCode.Trim();
            TB_AssetName.Text = asset.AssetName.Trim();
            TB_ModelNumber.Text = asset.ModelNumber.Trim();
            TB_Spec.Text = asset.Spec.Trim();
            NB_Number.Amount = asset.Number;
            DL_Unit.SelectedValue = asset.UnitName;
            TB_Manufacturer.Text = asset.Manufacturer.Trim();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Item as item where ItemCode = " + "'" + strItemCode + "'";
            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);

            if (lst.Count > 0)
            {
                Item item = (Item)lst[0];

                TB_AssetCode.Text = item.ItemCode;
                TB_AssetName.Text = item.ItemName;

                try
                {
                    DL_Type.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_Type.SelectedValue = "";
                }

                DL_Unit.SelectedValue = item.Unit;
                TB_Spec.Text = item.Specification;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            int intWLNumber;
            string strStatus = DL_Status.SelectedValue.Trim();
            string strAAID = LB_AAID.Text.Trim();

            intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
            if (intWLNumber > 0)
            {
                //BT_New.Enabled = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                //BT_New.Enabled = true;
                BT_SubmitApply.Enabled = true;
            }

            string strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                string strHQL = " from AssetApplicationDetail as assetApplicationDetail where assetApplicationDetail.ID = " + strID;

                AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
                IList lst = assetApplicationDetailBLL.GetAllAssetApplicationDetails(strHQL);
                AssetApplicationDetail assetApplicationDetail = (AssetApplicationDetail)lst[0];

                LB_DetailID.Text = assetApplicationDetail.ID.ToString();
                TB_AssetCode.Text = assetApplicationDetail.AssetCode;
                TB_AssetName.Text = assetApplicationDetail.AssetName.Trim();
                TB_Spec.Text = assetApplicationDetail.Spec.Trim();
                NB_Number.Amount = assetApplicationDetail.Number;
                DL_Unit.SelectedValue = assetApplicationDetail.Unit;
                TB_ModelNumber.Text = assetApplicationDetail.ModelNumber.Trim();
                TB_Manufacturer.Text = assetApplicationDetail.Manufacturer.Trim();
                TB_IP.Text = assetApplicationDetail.IP.Trim();

                intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
                if (intWLNumber > 0)
                {
                    BT_SubmitApply.Enabled = false;
                    BT_NewMain.Visible = false;
                    BT_NewDetail.Visible = false;
                }
                else
                {
                    BT_SubmitApply.Enabled = true;
                    BT_NewMain.Visible = true;
                    BT_NewDetail.Visible = true;
                }


                //从流程中打开的业务单
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    BT_NewMain.Visible = true;
                    BT_NewDetail.Visible = true;
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strHQL;
                IList lst;

                string strAssetName = TB_AAName.Text.Trim();
                string strSpec = TB_Spec.Text.Trim();
                decimal deNumber = NB_Number.Amount;
                string strUnit = DL_Unit.SelectedValue;

                intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    return;
                }


                AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
                strHQL = "from AssetApplicationDetail as assetApplicationDetail where assetApplicationDetail.ID = " + strID;
                lst = assetApplicationDetailBLL.GetAllAssetApplicationDetails(strHQL);
                AssetApplicationDetail assetApplicationDetail = (AssetApplicationDetail)lst[0];


                try
                {
                    assetApplicationDetailBLL.DeleteAssetApplicationDetail(assetApplicationDetail);

                    LoadAssetApplicationDetail(strAAID);

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AAID as DetailAAID, * from T_AssetApplication where AAID = " + strAAID;

                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("资产领用", "资产", strAAID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_AssetApplicationDetail where AAID = " + strAAID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }
        }
    }


    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_DetailID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strAAID;

        strAAID = LB_AAID.Text.Trim();

        if (strAAID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strAAID = LB_AAID.Text.Trim();
        int intWLNumber = LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));
        if (intWLNumber > 0 & strToDoWLID == null)
        {
            BT_SubmitApply.Enabled = false;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCZGLDGZLJLBNSCJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        else
        {
            BT_SubmitApply.Enabled = true;
        }

        string strDetailID;

        strDetailID = LB_DetailID.Text.Trim();

        if (strDetailID == "")
        {
            AddDetail();
        }
        else
        {
            UpdateDetail();
        }
    }


    protected void AddDetail()
    {
        string strID;
        string strAAID = LB_AAID.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();
        string strAssetCode = TB_AssetCode.Text.Trim();
        string strAssetName = TB_AssetName.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        decimal deNumber = NB_Number.Amount;
        string strUnit = DL_Unit.SelectedValue;
        string strManufacturer = TB_Manufacturer.Text.Trim();
        string strIP = TB_IP.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();

        AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
        AssetApplicationDetail assetApplicationDetail = new AssetApplicationDetail();

        assetApplicationDetail.AAID = int.Parse(strAAID);
        assetApplicationDetail.AssetCode = strAssetCode;
        assetApplicationDetail.AssetName = strAssetName;
        assetApplicationDetail.ModelNumber = strModelNumber;
        assetApplicationDetail.Spec = strSpec;
        assetApplicationDetail.Number = deNumber;
        assetApplicationDetail.Unit = strUnit;
        assetApplicationDetail.Manufacturer = strManufacturer;
        assetApplicationDetail.IP = strIP;


        assetApplicationDetail.RelatedType = strRelatedType;
        assetApplicationDetail.RelatedID = int.Parse(strRelatedID);

        try
        {
            assetApplicationDetailBLL.AddAssetApplicationDetail(assetApplicationDetail);

            strID = ShareClass.GetMyCreatedMaxAssetApplicationDetailID(strAAID);
            LB_DetailID.Text = strID;

            LoadAssetApplicationDetail(strAAID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select AAID as DetailAAID, * from T_AssetApplication where AAID = " + strAAID;

                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("资产领用", "资产", strAAID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_AssetApplicationDetail where AAID = " + strAAID;
                    ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }

    }

    protected void UpdateDetail()
    {
        string strHQL;
        IList lst;

        string strID = LB_DetailID.Text.Trim();
        string strAAID = LB_AAID.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();
        string strAssetCode = TB_AssetCode.Text.Trim();
        string strAssetName = TB_AssetName.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        decimal deNumber = NB_Number.Amount;
        string strUnit = DL_Unit.SelectedValue;
        string strManufacturer = TB_Manufacturer.Text.Trim();
        string strIP = TB_IP.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();

        AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
        strHQL = "from AssetApplicationDetail as assetApplicationDetail where assetApplicationDetail.ID = " + strID;
        lst = assetApplicationDetailBLL.GetAllAssetApplicationDetails(strHQL);
        AssetApplicationDetail assetApplicationDetail = (AssetApplicationDetail)lst[0];

        assetApplicationDetail.AAID = int.Parse(strAAID);
        assetApplicationDetail.AssetCode = strAssetCode;
        assetApplicationDetail.AssetName = strAssetName;
        assetApplicationDetail.ModelNumber = strModelNumber;
        assetApplicationDetail.Spec = strSpec;
        assetApplicationDetail.Number = deNumber;
        assetApplicationDetail.Unit = strUnit;
        assetApplicationDetail.Manufacturer = strManufacturer;
        assetApplicationDetail.IP = strIP;
        assetApplicationDetail.RelatedType = strRelatedType;
        assetApplicationDetail.RelatedID = int.Parse(strRelatedID);

        try
        {
            assetApplicationDetailBLL.UpdateAssetApplicationDetail(assetApplicationDetail, int.Parse(strID));

            LoadAssetApplicationDetail(strAAID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("资产领用", "资产", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select AAID as DetailAAID, * from T_AssetApplication where AAID = " + strAAID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("资产领用", "资产", strAAID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_AssetApplicationDetail where AAID = " + strAAID;
                    ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected string SubmitApply()
    {
        string strHQL;
        string strAAName, strApplyReason, strCmdText;

        string strAAID, strXMLFileName, strXMLFile2;
        IList lst;

        string strWLID, strTemName, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strAAID = LB_AAID.Text.Trim();
        strAAName = TB_AAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();

        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        XMLProcess xmlProcess = new XMLProcess();
        AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
        strHQL = "from AssetApplication as assetApplication where assetApplication.AAID = " + strAAID;
        lst = assetApplicationBLL.GetAllAssetApplications(strHQL);
        AssetApplication assetApplication = (AssetApplication)lst[0];

        assetApplication.Status = "处理中";

        try
        {
            assetApplicationBLL.UpdateAssetApplication(assetApplication, int.Parse(strAAID));

            strXMLFileName = "资产领用" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = strAAName;
            workFlow.WLType = "资产领用";
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
            workFlow.Description = strApplyReason;
            workFlow.XMLFile = strXMLFile2;
            workFlow.RelatedType = "资产";
            workFlow.RelatedID = assetApplication.AAID;
            workFlow.DIYNextStep = "Yes"; workFlow.IsPlanMainWorkflow = "NO";


            if (CB_SMS.Checked == true)
            {
                workFlow.ReceiveSMS = "Yes";
            }
            else
            {
                workFlow.ReceiveSMS = "No";
            }

            if (CB_Mail.Checked == true)
            {
                workFlow.ReceiveEMail = "Yes";
            }
            else
            {
                workFlow.ReceiveEMail = "No";
            }

            try
            {
                workFlowBLL.AddWorkFlow(workFlow);

                strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

                strCmdText = "select AAID as DetailAAID, * from T_AssetApplication where AAID = " + strAAID;
                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "T_AssetApplication", strXMLFile2);

                LoadRelatedWL("资产领用", "资产", int.Parse(strAAID));

                DL_Status.SelectedValue = "处理中";

                BT_SubmitApply.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZCLYGZLSCCG + "')", true);
            }
            catch
            {
                strWLID = "0";

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZCLYGZLSSCSB + "')", true);
            }
        }
        catch
        {
            strWLID = "0";

        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location)", true);
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();
    }

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '资产领用'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAAID, strStatus;
        strAAID = LB_AAID.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strAAID != "")
        {
            strHQL = "from AssetApplication as assetApplication where assetApplication.AAID = " + strAAID;
            AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
            lst = assetApplicationBLL.GetAllAssetApplications(strHQL);

            AssetApplication assetApplication = (AssetApplication)lst[0];

            assetApplication.Status = strStatus;

            try
            {
                assetApplicationBLL.UpdateAssetApplication(assetApplication, int.Parse(strAAID));
            }
            catch
            {
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
        IList lst = assetApplicationBLL.GetAllAssetApplications(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadAssetApplication(string strApplicantCode, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from AssetApplication as assetApplication where assetApplication.ApplicantCode = " + "'" + strApplicantCode + "'" + " and assetApplication.RelatedType = " + "'" + strRelatedType + "'" + " and assetApplication.RelatedID = " + strRelatedID + "  Order by assetApplication.AAID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from AssetApplication as assetApplication where assetApplication.AAID = " + strWLBusinessID;
        }
        AssetApplicationBLL assetApplicationBLL = new AssetApplicationBLL();
        lst = assetApplicationBLL.GetAllAssetApplications(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadAssetApplicationDetail(string strAAID)
    {
        string strHQL;
        IList lst;

        strHQL = "from AssetApplicationDetail as assetApplicationDetail where assetApplicationDetail.AAID = " + strAAID;
        AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
        lst = assetApplicationDetailBLL.GetAllAssetApplicationDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected int LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        return lst.Count;
    }
}
