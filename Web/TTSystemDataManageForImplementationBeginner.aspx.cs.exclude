using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Net.Http;
using System.Web;
using System.Web.UI;

public partial class TTSystemDataManageForImplementationBeginner : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        //判断 初始阶段数据清除  模组是否存在
        if (checkModuleIsExisted("实施阶段数据管理") == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            string strHQL1;

            strHQL1 = "Select * from T_SystemDataManageForBeginer Where OperationName = 'ClearData' and IsForbit = 'YES'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_SystemDataManageForBeginer");
            if (ds.Tables[0].Rows.Count > 0)
            {
                BT_ClearAssetData.Visible = false;
                BT_ClearDepartmentData.Visible = false;
                BT_ClearItemData.Visible = false;
                BT_ClearMaterialData.Visible = false;
                BT_ClearUserData.Visible = false;
                BT_ClearProjectData.Visible = false;
                BT_ClearWorkflowData.Visible = false;
                BT_ClearCustomerData.Visible = false;
                BT_ClearVendorData.Visible = false;

                BT_ForbitClear.Enabled = false;
            }
        }
    }

    protected void BT_BackupDB_Click(object sender, EventArgs e)
    {
        string strHQL1, strHQL2, strHQL3;
        DataSet ds1, ds2;

        try
        {
            //备份数据库
            ShareClass.BackupCurrentSiteDB(ShareClass.GetSystemDBName(), ShareClass.GetSystemDBBackupSaveDir(), strUserName, "SELF");

            strHQL1 = "Select * from T_SystemDataManageForBeginer Where OperationName = 'ClearData' and IsForbit = 'NO'";
            ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_SystemDataManageForBeginer");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                //备份成功后，让这些按钮可用
                BT_ClearAssetData.Visible = true;
                BT_ClearDepartmentData.Visible = true;
                BT_ClearItemData.Visible = true;
                BT_ClearMaterialData.Visible = true;
                BT_ClearUserData.Visible = true;
                BT_ClearProjectData.Visible = true;
                BT_ClearWorkflowData.Visible = true;
                BT_ClearCustomerData.Visible = true;
                BT_ClearVendorData.Visible = true;
            }

            try
            {
                strHQL2 = "Select * from T_SystemDataManageForBeginer Where OperationName = 'ClearData' and IsBackup = 'NO'";
                ds2 = ShareClass.GetDataSetFromSql(strHQL2, "T_SystemDataManageForBeginer");
                if (ds2.Tables[0].Rows.Count == 0)
                {
                    strHQL3 = string.Format(@"Insert Into T_SystemDataManageForBeginer(OperationName,IsForbit,OperatorCode,OperatorName,Operatetime,IsBackup)
                      Values('{0}','{1}','{2}','{3}',now(),'YES')", "ClearData", "NO", strUserCode, strUserName);
                    ShareClass.RunSqlCommand(strHQL2);
                }
                else
                {
                    strHQL3 = "Update T_SystemDataManageForBeginer Set IsBackup = 'YES' Where OperationName = 'ClearData'";
                    ShareClass.RunSqlCommand(strHQL2);
                }
            }
            catch
            {
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('备份成功！')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + HttpContext.Current.Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('备份失败，请检查！')", true);
        }
    }

    protected void BT_ClearDepartmentData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();


            strHQL = "Truncate Table T_Department";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }

        }
    }

    protected void BT_ClearUserData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"Delete From T_ProjectMember 
                    Delete From T_ActorGroupDetail Where UserCode NOt In(Select UserCode From T_ProjectMember)
                    Delete From T_RelatedUser Where UserCode NOt In(Select UserCode From T_ProjectMember)
                    Delete From T_WorkflowstepDetail Where OperatorCode NOt In(Select UserCode From T_ProjectMember)
                    Delete From T_WorkFlow Where CreatorCode Not In(Select UserCode From T_ProjectMember)";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearItemData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"truncate table T_Item
                    truncate table T_ItemBOM
                    truncate table T_ItemBOMVersion";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearAssetData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"Truncate table T_Asset
                Truncate table T_AssetAdjustRecord
                Truncate table T_AssetApplication
                Truncate table T_AssetApplicationDetail
                Truncate table T_AssetCheckInOrder
                Truncate table T_AssetCheckInOrderDetail
                Truncate table T_AssetMTRecord
                Truncate table T_AssetPurchaseOrder
                Truncate table T_AssetPurRecord
                Truncate table T_AssetReturnDetail
                Truncate table T_AssetReturnOrder
                Truncate table T_AssetScrape
                Truncate table T_AssetCheckInOrder
                Truncate table T_AssetCheckInOrderDetail
                Truncate table T_AssetShipmentDetail
                Truncate table T_AssetShipmentOrder
                Truncate table T_AssetUserRecord";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearMaterialData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"truncate table T_Goods
                    truncate table T_GoodsAdjustRecord
                    truncate table T_GoodsApplication
                    truncate table T_GoodsApplicationDetail
                    truncate table T_GoodsBorrowOrder
                    truncate table T_GoodsBorrowOrderDetail
                    truncate table T_GoodsCheckInOrder
                    truncate table T_GoodsCheckInOrderDetail
                    truncate table T_GoodsDeliveryOrder
                    truncate table T_GoodsDeliveryOrderDetail
                    truncate table T_GoodsMTRecord
                    truncate table T_GoodsProductionOrder
                    truncate table T_GoodsProductionOrderDetail
                    truncate table T_GoodsPurchaseOrder
                    truncate table T_GoodsPurRecord
                    truncate table T_GoodsReturnOrder
                    truncate table T_GoodsReturnDetail
                    truncate table T_GoodsSaleOrder
                    truncate table T_GoodsSaleQuotationOrder
                    truncate table T_GoodsSaleQuotationOrderDetail
                    truncate table T_GoodsSaleRecord
                    truncate table T_GoodsSaleRecord
                    truncate table T_GoodsScrape
                    truncate table T_GoodsShipmentDetail
                    truncate table T_GoodsShipmentOrder
                    truncate table T_GoodsSupplyOrder
                    truncate table T_GoodsSupplyOrderDetail
                    truncate table T_GoodsUserRecord
                    truncate table T_ProjectRelatedItem
                    truncate table T_ProjectRelatedItemBOM
                ";
            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearCustomerData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = "Truncate Table T_Customer";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearVendorData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = "Truncate Table T_Vendor";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }

        }
    }

    protected void BT_ClearProjectData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"Delete From T_ProjectTask Where ProjectID Not in (Select ProjectID From T_Project)
                    Delete From T_TaskAssignRecord Where TaskID Not In (Select TaskID From T_ProjectTask)
                    Delete From T_Collaboration Where RelatedType = 'PROJECT' And RelatedID Not in (Select ProjectID From T_Project)
                ";
            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }
        }
    }

    protected void BT_ClearWorkflowData_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Page.IsValid)
        {
            Random a = new Random();

            strHQL = @"Delete From T_WorkFlow Where TemName Not In (Select TemName From T_WorkFlowTemplate)";

            if (checkIsCanClear())
            {
                ShareClass.RunSqlCommand(strHQL);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除成功！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('清除失败，应该是没有备份数据库，请检查！')", true);
            }

        }
    }

    protected void BT_ForbitClear_Click(object sender, EventArgs e)
    {
        string strHQL2;

        if (Page.IsValid)
        {
            Random a = new Random();

            if (checkIsCanClear())
            {
                try
                {
                    strHQL2 = "Update T_SystemDataManageForBeginer Set IsForbit = 'YES' Where OperationName = 'ClearData'";
                    ShareClass.RunSqlCommand(strHQL2);

                    BT_ClearAssetData.Visible = false;
                    BT_ClearDepartmentData.Visible = false;
                    BT_ClearItemData.Visible = false;
                    BT_ClearMaterialData.Visible = false;
                    BT_ClearUserData.Visible = false;
                    BT_ClearProjectData.Visible = false;
                    BT_ClearWorkflowData.Visible = false;

                    BT_ForbitClear.Enabled = false;

                    //删除 实施阶段数据管理 模组
                    strHQL2 = "Delete From T_ProModuleLevel Where ModuleName = '实施阶段数据管理'";
                    ShareClass.RunSqlCommand(strHQL2);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('禁用成功！')", true);
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('禁用失败，请检查！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBMYCWJC + "')", true);
                return;
            }
        }
    }

    //检查是否可以清除数据
    protected bool checkIsCanClear()
    {
        string strHQL1;

        strHQL1 = "Select * from T_SystemDataManageForBeginer Where OperationName = 'ClearData' and IsForbit = 'NO' and IsBackup = 'YES'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_SystemDataManageForBeginer");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //判断 初始阶段数据清除  模组是否存在
    protected bool checkModuleIsExisted(string strModuleName)
    {
        string strHQL;

        strHQL = "Select *  From T_ProModuleLevel Where ModuleName = '实施阶段数据管理'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}