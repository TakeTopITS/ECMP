using System;
using System.Resources;
using System.IO;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopCore;
using PushSharp.Core;
using TakeTopGantt.models;
using DayPilot.Web.Ui;

public partial class TTProjectRelatedItem : System.Web.UI.Page
{
    string strUserCode, strProjectID, strProjectName;
    decimal deSumItemBomCost = 0, deTakeTopBOM, SumProjectItemBomCost = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();

        string strProjectBomVerID;
        string strItemCode;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "AutoHeight", "autoheight();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll1", "SaveScroll();");
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll2", "GoodsListIDSaveScroll();");

        if (Page.IsPostBack != true)
        {
            LoadUnit();
            LoadProductProcess();

            if (LB_ItemCode.Items.Count > 0)
            {
                strItemCode = LB_ItemCode.Items[0].Text.Trim();

                LoadItemBomVersion(strItemCode);
            }

            LoadProjectRelatedItem(strProjectID);
            LoadProjectItemBomVersion(strProjectID);

            if (DL_ChangeProjectItemBomVersionID.Items.Count > 0)
            {
                strProjectBomVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim();

                try
                {
                    TakeTopBOM.InitialProjectItemBomTree(strProjectID, strProjectBomVerID, TreeView2);

                    LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strProjectBomVerID).ToString("F2");
                }
                catch (Exception err)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
                }
            }

            HL_RelatedItemAndBom.NavigateUrl = "TTItemDataAndBomSet.aspx?RelatedType=PROJECT&RelatedID=" + strProjectID;
            HL_ProjectItemBomToPlan.NavigateUrl = "TTProjectItemBomToPlan.aspx?ProjectID=" + strProjectID;

            HL_ProjectRelatedItemReport.NavigateUrl = "TTProjectRelatedItemReport.aspx?ProjectID=" + strProjectID;

            DL_RelatedType.SelectedValue = "SYSTEM";

            LoadItemByItemType("SYSTEM", strProjectID, DL_ProjectItemType.SelectedValue);
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strItemRelatedType, strItemType;

        strItemRelatedType = DL_RelatedType.SelectedValue.Trim();
        strItemType = DL_ProjectItemType.SelectedValue.Trim();

        LoadItemByItemType(strItemRelatedType, strProjectID, strItemType);
    }

    protected void DL_ProjectItemType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strItemRelatedType, strItemType;

        strItemRelatedType = DL_RelatedType.SelectedValue.Trim();
        strItemType = DL_ProjectItemType.SelectedValue.Trim();

        LoadItemByItemType(strItemRelatedType, strProjectID, strItemType);
    }

    protected void BT_FindItemName_Click(object sender, EventArgs e)
    {
        string strItemRelatedType, strItemType;

        strItemRelatedType = DL_RelatedType.SelectedValue.Trim();
        strItemType = DL_ProjectItemType.SelectedValue.Trim();

        LoadItemByItemType(strItemRelatedType, strProjectID, strItemType);
    }

    protected void LB_ItemCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strItemCode;
        strItemCode = LB_ItemCode.SelectedValue.Trim();

        LoadItem(strItemCode);

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll1", "RestoreScroll();", true);
    }

    protected void LoadItem(string strItemCode)
    {
        string strHQL;
        IList lst;

        string strVerID, strVerType;

        int intTreeDepth;
        intTreeDepth = int.Parse(LB_TreeDepth.Text.Trim());

        strHQL = "From Item as item where item.ItemCode = " + "'" + strItemCode + "'";
        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);
        Item item = (Item)lst[0];

        TB_ItemCode.Text = item.ItemCode.Trim();
        TB_ItemName.Text = item.ItemName.Trim();
        DL_ItemType.SelectedValue = item.Type.Trim();
        TB_SmallType.Text = item.SmallType.Trim();
        DL_Unit.SelectedValue = item.Unit;
        TB_ModelNumber.Text = item.ModelNumber.Trim();
        TB_Specification.Text = item.Specification.Trim();
        TB_Brand.Text = item.Brand;

        NB_PurchasePrice.Amount = item.PurchasePrice;
        NB_SalePrice.Amount = item.SalePrice;

        NB_PULeadTime.Amount = item.PULeadTime;
        NB_MFLeadTime.Amount = item.MFLeadTime;
        NB_HRCost.Amount = item.HRCost;
        NB_MFCost.Amount = item.MFCost;
        NB_MTCost.Amount = item.MTCost;
        TB_DefaultProcess.Text = item.DefaultProcess.Trim();

        LB_ChildItemCode.Text = item.ItemCode.Trim();
        LB_ChildItemName.Text = item.ItemName.Trim();

        DL_ChildItemUnitToBom.SelectedValue = item.Unit;
        TB_ChildDefaultProcess.Text = item.DefaultProcess.Trim();

        IM_ItemPhoto.ImageUrl = item.PhotoURL.Trim();

        LoadItemBomVersion(strItemCode);

        if (DL_VersionID.Items.Count > 0)
        {
            strVerID = DL_VersionID.SelectedItem.Text.Trim();
            strVerType = GetItemBomVersionType(strItemCode, strVerID);
            DL_ChangeVersionType.SelectedValue = strVerType;

            HL_ItemRelatedDoc.NavigateUrl = "TTItemRelatedDoc.aspx?ItemBomID=" + DL_VersionID.SelectedValue;

            try
            {
                TakeTopBOM.InitialItemBomTreeForNew(strItemCode, strVerID, strItemCode, strVerID, TreeView1);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
            }
        }
        else
        {
            strVerID = "0";

            try
            {
                TakeTopBOM.InitialItemBomTreeForNew(strItemCode, strVerID, strItemCode, strVerID, TreeView1);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
            }
        }

        LB_TopItemCode.Text = strItemCode;
        LB_TopItemName.Text = GetItemName(strItemCode);

        BT_AddToProject.Enabled = true;
    }

    protected void DL_ChildVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strItemCode, strBomVerID;

        strItemCode = LB_ChildItemCode.Text.Trim();
        strBomVerID = DL_ChildVersionID.SelectedItem.Text.Trim();

        DL_VersionID.SelectedValue = GetItemBomID(strItemCode, strBomVerID);
        DL_ChangeVersionType.SelectedValue = GetItemBomVersionType(strItemCode, strBomVerID);

        try
        {
            TakeTopBOM.InitialItemBomTreeForNew(strItemCode, strBomVerID, strItemCode, strBomVerID, TreeView1);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
        }
    }

    protected void DL_VersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strItemCode, strBomVerID;

        strItemCode = LB_TopItemCode.Text.Trim();
        strBomVerID = DL_VersionID.SelectedItem.Text.Trim();

        DL_ChangeVersionType.SelectedValue = GetItemBomVersionType(strItemCode, strBomVerID);

        HL_ItemRelatedDoc.NavigateUrl = "TTItemRelatedDoc.aspx?ItemBomID=" + DL_VersionID.SelectedValue;

        try
        {
            TakeTopBOM.InitialItemBomTreeForNew(strItemCode, strBomVerID, strItemCode, strBomVerID, TreeView1);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode, strItemName, strBomVerID, strUnit, strDefaultProcess;
            decimal deNumber, deReservedNumber;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strID = e.Item.Cells[1].Text;
            strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ID = " + strID;
            ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
            lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);
            ProjectRelatedItem projectRelatedItem = (ProjectRelatedItem)lst[0];

            strItemCode = projectRelatedItem.ItemCode.Trim();
            strItemName = projectRelatedItem.ItemName.Trim();
            strBomVerID = projectRelatedItem.BomVersionID.ToString();
            strUnit = projectRelatedItem.Unit;
            deNumber = projectRelatedItem.Number;
            deReservedNumber = projectRelatedItem.ReservedNumber;
            strDefaultProcess = projectRelatedItem.DefaultProcess.Trim();

            //取得物料属性
            LoadItem(strItemCode);

            //取得物料BOM版本号
            LoadItemBomVersion(strItemCode);

            TB_FirstDirectory.Text = projectRelatedItem.FirstDirectory;
            TB_SecondDirectory.Text = projectRelatedItem.SecondDirectory;
            TB_ThirdDirectory.Text = projectRelatedItem.ThirdDirectory;
            TB_FourthDirectory.Text = projectRelatedItem.FourthDirectory;

            LB_ProjectItemID.Text = projectRelatedItem.ID.ToString();
            LB_ChildItemCode.Text = strItemCode;
            LB_ChildItemName.Text = strItemName;
            DL_ChildVersionID.SelectedValue = GetItemBomID(strItemCode, strBomVerID);
            DL_ChildItemUnitToBom.SelectedValue = strUnit;
            NB_ChildItemNumberToBom.Amount = deNumber;
            NB_ChildItemReservedNumberToBom.Amount = deReservedNumber;
            TB_ChildDefaultProcess.Text = strDefaultProcess;

            HL_ItemRelatedDoc.NavigateUrl = "TTItemRelatedDoc.aspx?ItemBomID=" + DL_ChildVersionID.SelectedValue;

            strHQL = "Select AleadyPurchased + AleadyCheckIn + AleadyCheckOut + AleadyProduction From T_ProjectRelatedItem Where ID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");
            if (decimal.Parse(ds.Tables[0].Rows[0][0].ToString()) == 0)
            {
                BT_DeleteToProject.Enabled = true;
            }
            else
            {
                BT_DeleteToProject.Enabled = false;
            }

            LB_TopItemCode.Text = strItemCode;
            LB_TopItemName.Text = strItemName;

            DL_VersionID.SelectedValue = GetItemBomID(strItemCode, strBomVerID);
            DL_ChangeVersionType.SelectedValue = GetItemBomVersionType(strItemCode, strBomVerID);

            try
            {
                TakeTopBOM.InitialItemBomTreeForNew(strItemCode, strBomVerID, strItemCode, strBomVerID, TreeView1);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
            }

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll2", "GoodsListIDRestoreScroll();", true);
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popParentProjectItemWindow','false') ", true);
    }

    protected void btn_ExcelToDataTraining_Click(object sender, EventArgs e)
    {
        string strItemCode;
        strProjectID = Request.QueryString["ProjectID"];

        //先导入物料主数据
        if (ExcelToDataTrainingForItem() == -1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导入失败，数据有误，请检查！')", true);
            return;
        }

        //导入项目关联物料数据
        if (ExelToDBTestForProjectItem() == -1)
        {
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC;

            return;
        }
        else
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
                return;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
                return;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                }
                else
                {
                    for (int i = 0; i < dr.Length; i++)
                    {
                        strItemCode = dr[i]["代码"].ToString().Trim();

                        if (strItemCode != "")
                        {
                            ItemBLL itemBLL = new ItemBLL();
                            Item item = new Item();
                            string strHQL = "From Item as item Where item.ItemCode = " + "'" + strItemCode + "'";
                            IList lst = itemBLL.GetAllItems(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {
                                //判断物料是否在项目预算中已存在
                                if (CheckProjectRelatedItemIsExisted(strItemCode, strProjectID))
                                {
                                    LB_ErrorText.Text += "错误，代码： " + strItemCode + "已存在，不能重复添加，请检查！";
                                    continue;
                                }

                                try
                                {
                                    item = (Item)lst[0];

                                    ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
                                    ProjectRelatedItem projectRelatedItem = new ProjectRelatedItem();

                                    projectRelatedItem.ProjectID = int.Parse(strProjectID);
                                    projectRelatedItem.ItemCode = dr[i]["代码"].ToString().Trim();
                                    projectRelatedItem.ItemName = dr[i]["名称"].ToString().Trim();

                                    projectRelatedItem.FirstDirectory = dr[i]["一级目录"].ToString().Trim();
                                    projectRelatedItem.SecondDirectory = dr[i]["二级目录"].ToString().Trim();
                                    projectRelatedItem.ThirdDirectory = dr[i]["三级目录"].ToString().Trim();
                                    projectRelatedItem.FourthDirectory = dr[i]["四级目录"].ToString().Trim();


                                    projectRelatedItem.BomVersionID = int.Parse(dr[i]["BOM版本"].ToString().Trim());
                                    projectRelatedItem.Number = decimal.Parse(dr[i]["数量"].ToString().Trim());
                                    projectRelatedItem.Unit = dr[i]["单位"].ToString().Trim();
                                    projectRelatedItem.ReservedNumber = decimal.Parse(dr[i]["保留数量"].ToString().Trim());
                                    projectRelatedItem.DefaultProcess = dr[i]["缺省工艺"].ToString().Trim();
                                    projectRelatedItem.Status = dr[i]["状态"].ToString().Trim();

                                    projectRelatedItem.AleadyPurchased = decimal.Parse(dr[i]["已采购量"].ToString().Trim());

                                    try
                                    {
                                        projectRelatedItem.AleadyPick = decimal.Parse(dr[i]["已领料量"].ToString().Trim());
                                    }
                                    catch
                                    {
                                        projectRelatedItem.AleadyPick = 0;
                                    }

                                    projectRelatedItem.AleadyCheckOut = decimal.Parse(dr[i]["已出库量"].ToString().Trim());
                                    projectRelatedItem.AleadyCheckIn = decimal.Parse(dr[i]["已入库量"].ToString().Trim());
                                    projectRelatedItem.AleadyProduction = decimal.Parse(dr[i]["已生产量"].ToString().Trim());
                                    try
                                    {
                                        projectRelatedItem.AleadySale = decimal.Parse(dr[i]["已销售量"].ToString().Trim());
                                    }
                                    catch
                                    {
                                        projectRelatedItem.AleadySale = 0;
                                    }

                                    projectRelatedItem.PurchasePrice = decimal.Parse(dr[i]["单价"].ToString().Trim());
                                    projectRelatedItem.SalePrice = decimal.Parse(dr[i]["单价"].ToString().Trim());

                                    projectRelatedItem.Comment = dr[i]["备注"].ToString().Trim();

                                    projectRelatedItem.ModelNumber = item.ModelNumber;
                                    projectRelatedItem.Specification = item.Specification;
                                    projectRelatedItem.Brand = item.Brand;
                                    projectRelatedItem.ItemType = item.SmallType;
                                    projectRelatedItem.PhotoURL = item.PhotoURL;

                                    projectRelatedItemBLL.AddProjectRelatedItem(projectRelatedItem);
                                }
                                catch (Exception err)
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strItemCode + " : " + err.Message.ToString() + "<br/>"; ;
                                    LogClass.WriteLogFile(this.GetType().BaseType.Name + "：" + Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strItemCode + " : " + err.Message.ToString());
                                }
                            }

                            continue;
                        }
                    }

                    LoadProjectRelatedItem(strProjectID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                }
            }
        }
    }

    protected int ExelToDBTestForProjectItem()
    {
        int j = 0;

        string strItemCode;

        try
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
                j = -1;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
                j = -1;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
                j = -1;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                    j = -1;
                }
                else
                {
                    for (int i = 0; i < dr.Length; i++)
                    {
                        strItemCode = dr[i]["代码"].ToString().Trim();

                        if (strItemCode != "")
                        {
                            ItemBLL itemBLL = new ItemBLL();
                            string strHQL = "From Item as item Where item.ItemCode = " + "'" + strItemCode + "'";
                            IList lst = itemBLL.GetAllItems(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {
                                CheckAndAddUnit(dr[i]["单位"].ToString().Trim());


                                try
                                {
                                    decimal.Parse(dr[i]["已领料量"].ToString().Trim());
                                    decimal.Parse(dr[i]["已销售量"].ToString().Trim());
                                }
                                catch
                                {
                                    j = -1;

                                    LB_ErrorText.Text += "模板表格过时，请下载最新的导入模板表！";
                                    continue;
                                }


                                try
                                {
                                    decimal.Parse(dr[i]["数量"].ToString().Trim());
                                    decimal.Parse(dr[i]["保留数量"].ToString().Trim());
                                    decimal.Parse(dr[i]["已采购量"].ToString().Trim());
                                    decimal.Parse(dr[i]["已出库量"].ToString().Trim());
                                    decimal.Parse(dr[i]["已生产量"].ToString().Trim());
                                }
                                catch
                                {
                                    j = -1;

                                    LB_ErrorText.Text += Resources.lang.ZZZDRSBSLBLSLYWSZ;
                                    continue;
                                }

                            }
                            else//新增
                            {
                                j = -1;

                                LB_ErrorText.Text += strItemCode + Resources.lang.ZZZWLDMBCZQJC;
                                continue;
                            }

                        }
                    }
                }
            }
        }
        catch (Exception err)
        {
            LB_ErrorText.Text += err.Message.ToString() + "<br/>"; ;

            j = -1;
        }

        return j;
    }

    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = "项目" + strProjectID + "关联物料_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + a.Next(100, 999) + ".xls";
                CreateExcel(fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }

    private void CreateExcel(string fileName)
    {
        string strHQL;

        strHQL = string.Format(@" SELECT  A.ID 序号,A.FirstDirectory 一级目录
              ,A.SecondDirectory 二级目录
              ,A.ThirdDirectory 三级目录
              ,A.FourthDirectory 四级目录
              ,A.ItemCode 代码
              ,A.ItemName 名称
			  ,B.Type 属性（采购件、自制件、外协件、交付件）
			  ,B.BigType 大类（物料、资产）
              ,A.ModelNumber 型号
              ,A.Specification 规格
              ,A.Brand 品牌

              ,A.Number 数量
              ,A.Unit 单位
              ,A.PurchasePrice 单价

               ,A.Number * A.PurchasePrice 金额

               , '注册证号' 注册证号
               ,'注册证号' 包装方式

              ,A.Comment 备注
              ,A.BomVersionID BOM版本

              ,A.Status 状态
              ,A.ReservedNumber 保留数量
              ,A.DefaultProcess 缺省工艺
              ,A.AleadyPurchased 已采购量
              ,A.AleadyCheckIn 已入库量
              ,A.AleadyPick 已领料量
              ,A.AleadyCheckOut 已出库量
            
              ,A.AleadyProduction 已生产量
              ,A.AleadySale 已销售量
							
			  FROM T_ProjectRelatedItem A,T_Item B  Where A.ItemCode = B.ItemCode AND  A.ProjectID = {0} Order By A.ID DESC", strProjectID);


        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }



    //----------------------------------------导入物料主文件--------------------------------------
    protected int ExcelToDataTrainingForItem()
    {
        string strBigType;
        string strItemCode, strDefaultProcess, strCurrencyType;
        decimal dePULeadTime, deMFLeadTime, dePurchasePrice, deSalePrice, deHRCost, deMTCost, deMFCost, deSafetyStock, deLossRate;

        int intWarrantyPeriod;

        if (ExelToDBTestForItem() == -1)
        {
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC;

            return -1;
        }
        else
        {
            dePurchasePrice = NB_PurchasePrice.Amount;
            deSalePrice = NB_SalePrice.Amount;
            deSafetyStock = NB_SalePrice.Amount;
            strCurrencyType = "人民币";
            dePULeadTime = NB_PULeadTime.Amount;
            deMFLeadTime = NB_MFLeadTime.Amount;
            deHRCost = NB_HRCost.Amount;
            deMTCost = NB_MTCost.Amount;
            deMFCost = NB_MFCost.Amount;

            deSafetyStock = 0;
            deLossRate = 0;

            strDefaultProcess = TB_DefaultProcess.Text.Trim();
            intWarrantyPeriod = 0;

            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
                return -1;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
                return -1;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click444", "alert('" + Resources.lang.ZZEXCLEBDRSB + "')", true);
                return -1;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                    return -1;
                }
                else
                {
                    for (int i = 0; i < dr.Length; i++)
                    {
                        strItemCode = dr[i]["代码"].ToString().Trim();

                        if (strItemCode != "")
                        {
                            ItemBLL itemBLL = new ItemBLL();
                            string strHQL = "From Item as item Where item.ItemCode = " + "'" + strItemCode + "'";
                            IList lst = itemBLL.GetAllItems(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {
                            }
                            else//新增
                            {
                                Item item = new Item();

                                item.ItemCode = dr[i]["代码"].ToString().Trim();
                                item.ItemName = dr[i]["名称"].ToString().Trim();
                                item.Type = dr[i]["属性（采购件、自制件、外协件、交付件）"].ToString().Trim(); ;
                                strBigType = dr[i]["大类（物料、资产）"].ToString().Trim();

                                item.BigType = "";
                                if (strBigType == "物料")
                                {
                                    item.BigType = "Goods";
                                }
                                if (strBigType == "资产")
                                {
                                    item.BigType = "Asset";
                                }

                                item.SmallType = dr[i]["小类（物料或资产类型）"].ToString().Trim();
                                item.Specification = dr[i]["规格"].ToString().Trim();
                                item.ModelNumber = dr[i]["型号"].ToString().Trim();
                                item.Brand = dr[i]["品牌"].ToString().Trim();
                                item.Unit = dr[i]["单位"].ToString().Trim();

                                item.RegistrationNumber = dr[i]["注册证号"].ToString().Trim();
                                item.PackingType = dr[i]["包装方式"].ToString().Trim();

                                item.PULeadTime = dePULeadTime;
                                item.MFLeadTime = deMFCost;

                                item.PurchasePrice = dePurchasePrice;
                                item.SalePrice = deSalePrice;
                                item.CurrencyType = strCurrencyType;

                                item.HRCost = deHRCost;
                                item.MFCost = deMFCost;
                                item.MTCost = deMTCost;
                                item.MFLeadTime = deMFLeadTime;

                                item.SafetyStock = deSafetyStock;
                                item.LossRate = deLossRate;

                                item.DefaultProcess = strDefaultProcess;
                                item.WarrantyPeriod = intWarrantyPeriod;

                                item.PhotoURL = "";


                                item.RelatedType = "SYSTEM";
                                item.RelatedID = 0;

                                itemBLL.AddItem(item);

                                strHQL = "Insert Into T_ItemBomVersion(ItemCode,VerID,Type,RelatedType,RelatedID) Values(" + "'" + strItemCode + "'" + ",1,'基准','SYSTEM',0)";
                                ShareClass.RunSqlCommand(strHQL);

                                //strHQL = "Insert Into T_ItemBom(ItemCode,ParentItemCode,ChildItemCode,Number,Unit,DefaultProcess,ChildItemVerID,VerID)";
                                //strHQL += " Values(" + "'" + strItemCode + "'" + "," + "'" + strItemCode + "'" + "," + "'" + strItemCode + "'" + ",1," + "'" + dr[i]["单位"].ToString().Trim() + "'" + "," + "'" + strDefaultProcess + "'" + ",1,1)";
                                //ShareClass.RunSqlCommand(strHQL);


                                strHQL = @"Insert Into T_ItemBom(ItemCode,ParentItemCode,ChildItemCode,ChildItemName,ChildItemType,ChildItemSpecification,
                                       ChildItemModelNumber,ChildItemBrand,Number,ReservedNumber,LossRate,Unit,ChildItemPhotoURL,DefaultProcess,PULeadTime,MFLeadTime,HRCost,MTCost,MFCost,
                                       PurchasePrice,SalePrice,ChildItemVerID,VerID,BelongItemCode,BelongVerID,KeyWord,ParentKeyWord)";
                                strHQL += " Values('" + strItemCode + "','" + strItemCode + "','" + strItemCode + "','" + item.ItemName.Trim() + "','" + item.SmallType.Trim() + "','" + item.Specification.Trim() + "','" + item.ModelNumber.Trim() + "','" + item.Brand.Trim() + "',1,0,0," + "'" + item.Unit.Trim() + "','" + item.PhotoURL.Trim() + "','" + strDefaultProcess + "'," + item.PULeadTime.ToString() + "," + item.MFLeadTime.ToString() + "," + deHRCost.ToString() + "," + deMTCost.ToString() + "," + deMFCost.ToString() + "," + dePurchasePrice.ToString() + "," + deSalePrice.ToString() + ",1,1,'" + strItemCode + "',1,'" + strItemCode + "1" + strItemCode + "1" + "','" + strItemCode + "1" + strItemCode + "1" + "')";
                                ShareClass.RunSqlCommand(strHQL);


                            }
                            continue;
                        }
                    }

                    //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                }

                return 1;
            }
        }
    }

    protected int ExelToDBTestForItem()
    {
        int j = 0;

        string strItemCode;

        if (FileUpload_Training.HasFile == false)
        {
            LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
            j = -1;
        }
        string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
        if (IsXls != ".xls" & IsXls != ".xlsx")
        {
            LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
            j = -1;
        }
        string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
        string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
        string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
        FileInfo fi = new FileInfo(strDocSavePath + newfilename);
        if (fi.Exists)
        {
            LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
            j = -1;
        }
        else
        {
            FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
            string strpath = strDocSavePath + newfilename;

            //DataSet ds = ExcelToDataSet(strpath, filename);
            //DataRow[] dr = ds.Tables[0].Select();
            //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
            //int rowsnum = ds.Tables[0].Rows.Count;

            DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
            DataRow[] dr = dt.Select();                        //定义一个DataRow数组
            int rowsnum = dt.Rows.Count;
            if (rowsnum == 0)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                j = -1;
            }
            else
            {
                for (int i = 0; i < dr.Length; i++)
                {
                    strItemCode = dr[i]["代码"].ToString().Trim();

                    if (strItemCode != "")
                    {
                        CheckAndAddUnit(dr[i]["单位"].ToString().Trim());

                        string strBigType = dr[i]["大类（物料、资产）"].ToString().Trim();
                        if (strBigType != "物料" & strBigType != "资产")
                        {
                            LB_ErrorText.Text += "导入失败，大类只能设为 物料 或 资产，不能为 " + strBigType + " 请检查！";
                            j = -1;
                        }

                        string strSmallType = dr[i]["小类（物料或资产类型）"].ToString().Trim();
                        if (CheckSmallType(strSmallType, strBigType) == 0)
                        {
                            if (strBigType != "物料")
                            {
                                LB_ErrorText.Text += "导入失败，小类：" + strSmallType + " 不存在，请先在【基础数据（外置）】模块设置！";
                            }
                            else
                            {
                                LB_ErrorText.Text += "导入失败，小类：" + strSmallType + " 不存在，请先在【物料类型】模块设置！";
                            }

                            j = -1;
                        }
                    }
                }
            }
        }

        return j;
    }

    protected int CheckSmallType(string strType, string strBigType)
    {
        string strHQL;

        if (strBigType == "物料")
        {
            strHQL = "Select Type From T_GoodsType Where Type = '" + strType + "'";
        }
        else
        {
            strHQL = "Select Type From T_AssetType Where Type = '" + strType + "'";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsType");

        return ds.Tables[0].Rows.Count;
    }

    protected void CheckAndAddUnit(string strUnitName)
    {
        string strHQL;
        IList lst;

        strHQL = "from JNUnit as jnUnit Where jnUnit.UnitName = " + "'" + strUnitName + "'";
        JNUnitBLL jnUnitBLL = new JNUnitBLL();
        lst = jnUnitBLL.GetAllJNUnits(strHQL);

        JNUnit jnUnit = new JNUnit();

        if (lst.Count == 0)
        {
            jnUnit.UnitName = strUnitName;
            jnUnit.SortNumber = 100;

            jnUnitBLL.AddJNUnit(jnUnit);
        }
    }


    protected void DL_ProductProcess2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProcessName = DL_ProductProcess2.SelectedValue.Trim();

        string strChildBomProcess = TB_ChildDefaultProcess.Text.Trim();

        if (strChildBomProcess != "")
        {
            TB_ChildDefaultProcess.Text = strChildBomProcess + "," + strProcessName;
        }
        else
        {
            TB_ChildDefaultProcess.Text = strProcessName;
        }
    }

    protected void BT_AddToProject_Click(object sender, EventArgs e)
    {
        string strItemCode, strItemName, strUnit, strDefaultProcess;
        int intVerID;
        decimal deNumber, deReservedNumber;

        strItemCode = LB_ChildItemCode.Text.Trim();
        strItemName = LB_ChildItemName.Text.Trim();

        //判断物料是否在项目预算中已存在
        if (CheckProjectRelatedItemIsExisted(strItemCode, strProjectID))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提示，此物料已存在，不能重复添加，请检查！')", true);
            return;
        }

        try
        {
            intVerID = int.Parse(DL_ChildVersionID.SelectedItem.Text.Trim());
        }
        catch
        {
            intVerID = 1;
        }

        deNumber = NB_ChildItemNumberToBom.Amount;
        deReservedNumber = NB_ChildItemReservedNumberToBom.Amount;
        strUnit = DL_ChildItemUnitToBom.SelectedValue.Trim();
        strDefaultProcess = TB_ChildDefaultProcess.Text.Trim();


        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        ProjectRelatedItem projectRelatedItem = new ProjectRelatedItem();

        projectRelatedItem.FirstDirectory = TB_FirstDirectory.Text;
        projectRelatedItem.SecondDirectory = TB_SecondDirectory.Text;
        projectRelatedItem.ThirdDirectory = TB_ThirdDirectory.Text;
        projectRelatedItem.FourthDirectory = TB_FourthDirectory.Text;

        projectRelatedItem.ProjectID = int.Parse(strProjectID);
        projectRelatedItem.ItemCode = strItemCode;
        projectRelatedItem.ItemName = strItemName;
        projectRelatedItem.ItemType = TB_SmallType.Text.Trim();
        projectRelatedItem.Specification = TB_Specification.Text.Trim();
        projectRelatedItem.ModelNumber = TB_ModelNumber.Text.Trim();
        projectRelatedItem.Brand = TB_Brand.Text.Trim();


        projectRelatedItem.BomVersionID = intVerID;
        projectRelatedItem.Number = deNumber;
        projectRelatedItem.ReservedNumber = deReservedNumber;
        projectRelatedItem.Unit = strUnit;
        projectRelatedItem.Status = "新建";
        projectRelatedItem.DefaultProcess = strDefaultProcess;
        projectRelatedItem.PhotoURL = IM_ItemPhoto.ImageUrl;

        projectRelatedItem.PurchasePrice = NB_PurchasePrice.Amount;
        projectRelatedItem.SalePrice = NB_SalePrice.Amount;
        projectRelatedItem.PULeadTime = NB_PULeadTime.Amount;
        projectRelatedItem.MFLeadTime = NB_MFLeadTime.Amount;
        projectRelatedItem.HRCost = NB_HRCost.Amount;
        projectRelatedItem.MFCost = NB_MFCost.Amount;
        projectRelatedItem.MTCost = NB_MTCost.Amount;

        try
        {
            projectRelatedItemBLL.AddProjectRelatedItem(projectRelatedItem);

            LoadProjectRelatedItem(strProjectID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJRXMCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJRSBJC + "')", true);
        }
    }

    //判断物料是否在项目预算中已存在
    protected bool CheckProjectRelatedItemIsExisted(string strItemCode, string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_ProjectRelatedItem Where ItemCode = '" + strItemCode + "' and ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static Item GetItem(string strItemCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Item as item where item.ItemCode = " + "'" + strItemCode + "'";
        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);

        if (lst.Count > 0)
        {
            Item item = (Item)lst[0];
            return item;
        }
        else
        {
            return null;
        }
    }

    protected void BT_DeleteToProject_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strItemCode, strVerID;

        strID = LB_ProjectItemID.Text.Trim();
        strItemCode = LB_ChildItemCode.Text.Trim();
        strVerID = DL_ChildVersionID.SelectedItem.Text.Trim();

        try
        {

            strHQL = "Select coalesce((coalesce(AleadyPurchased,0) + coalesce(AleadyCheckIn,0) + coalesce(AleadyCheckOut,0) + coalesce(AleadyProduction,0)),0) From T_ProjectRelatedItem Where ID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");
            if (decimal.Parse(ds.Tables[0].Rows[0][0].ToString()) == 0)
            {
                //更改父项目相应物料数量
                UpdateParentItemByFromParentItem(strProjectID, strID);

                strHQL = "Delete From T_ProjectRelatedItem Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                LoadProjectRelatedItem(strProjectID);

                BT_DeleteToProject.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('失败，此物资预算已被采用，不能删除，请检查！')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSCSBJC + "')", true);
        }
    }

    //更改父项目相应物料数量
    protected void UpdateParentItemByFromParentItem(string strProjectID, string strID)
    {
        string strHQL;
        string strFromParentID, strItemCode, strParentProjectID, strNumber;

        strHQL = "Select FromParentID,ItemCode,Number From T_ProjectRelatedItem Where ID =" + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectReltedItem");

        strFromParentID = ds.Tables[0].Rows[0]["FromParentID"].ToString();

        if (strFromParentID != "0" & strFromParentID != null)
        {
            strParentProjectID = ShareClass.GetProject(strProjectID).ParentID.ToString();
            strItemCode = ds.Tables[0].Rows[0]["ItemCode"].ToString().Trim();

            strHQL = "Select coalesce(Sum(Number),0) From T_ProjectRelatedItem Where FromParentID = " + strFromParentID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");
            strNumber = ds.Tables[0].Rows[0][0].ToString();

            strHQL = "Update T_ProjectRelatedItem Set Number = Number + " + strNumber + " Where ItemCode = '" + strItemCode + "' and ProjectID = " + strParentProjectID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void BT_DeleteAllProjectItem_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID;

        try
        {
            strHQL = "Select coalesce((sum(coalesce(AleadyPurchased,0) + coalesce(AleadyCheckIn,0) + coalesce(AleadyCheckOut,0) + coalesce(AleadyProduction,0))),0),ID From T_ProjectRelatedItem Where ProjectID = " + strProjectID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");
            if (decimal.Parse(ds.Tables[0].Rows[0][0].ToString()) == 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    strID = ds.Tables[0].Rows[0]["ID"].ToString();

                    //更改父项目相应物料数量
                    UpdateParentItemByFromParentItem(strProjectID, strID);
                }

                strHQL = "Delete From T_ProjectRelatedItem Where ProjectID = " + strProjectID;
                ShareClass.RunSqlCommand(strHQL);

                LoadProjectRelatedItem(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBWZYSYBCYBNSCQJC + "')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSCSBJC + "')", true);
        }
    }

    protected void BT_TransferProjectBom_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strVerID;

        try
        {
            strVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim();

            strHQL = "Delete From T_ProjectRelatedItemBom Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
            ShareClass.RunSqlCommand(strHQL);

            try
            {
                SolidifyProjectItemBom(strProjectID, strVerID);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
            }

            strHQL = "Update T_ProjectRelatedItem Set Status = '固化' Where ProjectID = " + strProjectID;
            ShareClass.RunSqlCommand(strHQL);

            LoadProjectRelatedItem(strProjectID);

            TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView2);
            LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strVerID).ToString("F2");

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGHBOMCG + "')", true);


        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCXZJXGCPZXMLHZJXMCPBOMBBH + "')", true);
        }
    }

    //把物资固化到项目BOM中
    public static void SolidifyProjectItemBom(string strProjectID, string strVerID)
    {
        string strHQL; ;
        IList lst;

        string strProjectName;
        string strItemCode, strItemName, strUnit, strBomVersionID;
        decimal deNumber, deReservedNumber;
        string strParentGuid, strChildGuid, strDefaultProcess;

        strProjectName = ShareClass.GetProjectName(strProjectID);
        strParentGuid = Guid.NewGuid().ToString();

        Item item = new Item();
        ProjectRelatedItem projectRelatedItem = new ProjectRelatedItem();

        ProjectRelatedItemBomBLL projectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();
        ProjectRelatedItemBom projectRelatedItemBom = new ProjectRelatedItemBom();

        projectRelatedItemBom.ProjectID = int.Parse(strProjectID);
        projectRelatedItemBom.ItemCode = strProjectID;
        projectRelatedItemBom.ItemName = strProjectName;

        projectRelatedItemBom.ParentGuid = strParentGuid;
        projectRelatedItemBom.ChildGuid = strParentGuid;

        projectRelatedItemBom.Number = 1;
        projectRelatedItemBom.ReservedNumber = 0;
        projectRelatedItemBom.Unit = "个";
        projectRelatedItemBom.VerID = int.Parse(strVerID);

        projectRelatedItemBom.ItemType = "成品";
        projectRelatedItemBom.Specification = GetProjectSpecification(strProjectID);
        projectRelatedItem.Brand = "";
        projectRelatedItem.ModelNumber = "";

        projectRelatedItemBom.PULeadTime = 0;
        projectRelatedItemBom.MFLeadTime = 0;

        projectRelatedItemBom.PurchasePrice = 0;
        projectRelatedItemBom.SalePrice = 0;
        projectRelatedItemBom.MFCost = 0;
        projectRelatedItemBom.HRCost = 0;
        projectRelatedItemBom.MTCost = 0;

        projectRelatedItemBom.Comment = "项目名称";
        projectRelatedItemBom.DefaultProcess = "自制";
        projectRelatedItemBom.PhotoURL = "";
        projectRelatedItemBom.SortNumber = 0;

        projectRelatedItemBomBLL.AddProjectRelatedItemBom(projectRelatedItemBom);

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID;
        strHQL += " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            projectRelatedItem = (ProjectRelatedItem)lst[i];

            strItemCode = projectRelatedItem.ItemCode.Trim();
            strItemName = projectRelatedItem.ItemName.Trim();

            strBomVersionID = projectRelatedItem.BomVersionID.ToString();
            strChildGuid = Guid.NewGuid().ToString();

            deNumber = projectRelatedItem.Number;
            deReservedNumber = projectRelatedItem.ReservedNumber;
            strUnit = projectRelatedItem.Unit.Trim();
            strDefaultProcess = projectRelatedItem.DefaultProcess.Trim();

            projectRelatedItemBom.ProjectID = int.Parse(strProjectID);
            projectRelatedItemBom.ItemCode = strItemCode;
            projectRelatedItemBom.ItemName = strItemName;

            projectRelatedItemBom.ParentGuid = strParentGuid;
            projectRelatedItemBom.ChildGuid = strChildGuid;

            projectRelatedItemBom.Number = deNumber;
            projectRelatedItemBom.ReservedNumber = deReservedNumber;
            projectRelatedItemBom.Unit = strUnit;
            projectRelatedItemBom.VerID = int.Parse(strVerID);

            if (projectRelatedItem.ItemType != null)
            {
                projectRelatedItemBom.ItemType = projectRelatedItem.ItemType;
            }
            else
            {
                projectRelatedItemBom.ItemType = "";
            }

            if (projectRelatedItem.Specification != null)
            {
                projectRelatedItemBom.Specification = projectRelatedItem.Specification;
            }
            else
            {
                projectRelatedItemBom.Specification = "";
            }

            if (projectRelatedItem.ModelNumber != null)
            {
                projectRelatedItem.ModelNumber = projectRelatedItem.ModelNumber;
            }
            else
            {
                projectRelatedItem.ModelNumber = "";
            }

            if (projectRelatedItem.Brand != null)
            {
                projectRelatedItem.Brand = projectRelatedItem.Brand;
            }
            else
            {
                projectRelatedItem.Brand = "";
            }

            projectRelatedItemBom.PULeadTime = projectRelatedItem.PULeadTime;
            projectRelatedItemBom.MFLeadTime = projectRelatedItem.MFLeadTime;

            projectRelatedItemBom.PurchasePrice = projectRelatedItem.PurchasePrice;
            projectRelatedItemBom.SalePrice = projectRelatedItem.SalePrice;

            projectRelatedItemBom.MFCost = projectRelatedItem.MFCost;
            projectRelatedItemBom.HRCost = projectRelatedItem.HRCost;
            projectRelatedItemBom.MTCost = projectRelatedItem.MTCost;

            projectRelatedItemBom.Comment = "物料资料";
            projectRelatedItemBom.DefaultProcess = strDefaultProcess;
            projectRelatedItemBom.PhotoURL = projectRelatedItem.PhotoURL;
            projectRelatedItemBom.SortNumber = 0;


            projectRelatedItemBomBLL.AddProjectRelatedItemBom(projectRelatedItemBom);

            SolidifyProjectItemBomForAll(strProjectID, strVerID, strItemCode, deNumber + deReservedNumber, strBomVersionID, strChildGuid, strItemCode, strBomVersionID);
        }
    }

    public static void SolidifyProjectItemBomForAll(string strProjectID, string strVerID, string strItemCode, Decimal deParentNumber, string strBomVersionID, string strParentGuid, string strBelongItemCode, string strBelongVerID)
    {
        string strHQL;
        IList lst1, lst2;

        string strChildGuid;
        decimal deNumber, deReservedNumber;

        string strChildItemVerID, strChildItemCode, strChildItemName;

        Item item = new Item();
        ProjectRelatedItem projectRelatedItem = new ProjectRelatedItem();
        ProjectRelatedItemBom projectRelatedItemBom = new ProjectRelatedItemBom();
        ProjectRelatedItemBomBLL projectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();

        TreeNode node = new TreeNode();
        ItemBom itemBom = new ItemBom();

        strHQL = "From ItemBom as itemBom Where itemBom.ParentItemCode = " + "'" + strItemCode + "'";
        strHQL += " And itemBom.KeyWord <> itemBom.ParentKeyWord";
        strHQL += " And itemBom.BelongItemCode = " + "'" + strBelongItemCode + "'" + " And itemBom.BelongVerID = " + strBelongVerID;
        strHQL += " Order By itemBom.SortNumber ASC,itemBom.ID ASC";
        ItemBomBLL itemBomBLL = new ItemBomBLL();
        lst1 = itemBomBLL.GetAllItemBoms(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            itemBom = (ItemBom)lst1[i];

            strChildGuid = Guid.NewGuid().ToString();
            strChildItemCode = itemBom.ChildItemCode.Trim();
            strChildItemName = GetItemName(strChildItemCode);
            strChildItemVerID = itemBom.ChildItemVerID.ToString();



            projectRelatedItemBom.ProjectID = int.Parse(strProjectID);
            projectRelatedItemBom.ItemCode = strChildItemCode;
            projectRelatedItemBom.ItemName = strChildItemName;

            projectRelatedItemBom.ParentGuid = strParentGuid;
            projectRelatedItemBom.ChildGuid = strChildGuid;

            deNumber = itemBom.Number * deParentNumber;
            deReservedNumber = itemBom.ReservedNumber * deParentNumber;

            projectRelatedItemBom.Number = deNumber;
            projectRelatedItemBom.ReservedNumber = deReservedNumber;
            projectRelatedItemBom.Unit = itemBom.Unit.Trim();
            projectRelatedItemBom.VerID = int.Parse(strVerID);

            projectRelatedItemBom.ItemType = itemBom.ChildItemType;
            projectRelatedItemBom.Specification = itemBom.ChildItemSpecification;
            projectRelatedItemBom.ModelNumber = itemBom.ChildItemModelNumber;
            projectRelatedItemBom.Brand = itemBom.ChildItemBrand;

            projectRelatedItemBom.PhotoURL = itemBom.ChildItemPhotoURL;

            projectRelatedItemBom.PULeadTime = itemBom.PULeadTime;
            projectRelatedItemBom.MFLeadTime = itemBom.MFLeadTime;

            projectRelatedItemBom.PurchasePrice = itemBom.PurchasePrice;
            projectRelatedItemBom.SalePrice = itemBom.SalePrice;

            projectRelatedItemBom.MFCost = itemBom.MFCost;
            projectRelatedItemBom.HRCost = itemBom.HRCost;
            projectRelatedItemBom.MTCost = itemBom.MTCost;

            projectRelatedItemBom.Comment = "物料资料";
            projectRelatedItemBom.DefaultProcess = itemBom.DefaultProcess.Trim();

            projectRelatedItemBom.SortNumber = 0;

            projectRelatedItemBomBLL.AddProjectRelatedItemBom(projectRelatedItemBom);

            strHQL = "From ItemBom as itemBom Where itemBom.ParentItemCode = " + "'" + strChildItemCode + "'";
            strHQL += " And itemBom.KeyWord <> itemBom.ParentKeyWord";
            strHQL += " And itemBom.BelongItemCode = " + "'" + strBelongItemCode + "'" + " And itemBom.BelongVerID = " + strBelongVerID;
            strHQL += " Order By itemBom.SortNumber ASC,itemBom.ID ASC";
            lst2 = itemBomBLL.GetAllItemBoms(strHQL);
            if (lst2.Count > 0)
            {
                SolidifyProjectItemBomForAll(strProjectID, strVerID, strChildItemCode, deNumber + deReservedNumber, strChildItemVerID, strChildGuid, strBelongItemCode, strBelongVerID);
            }
        }
    }


    //取得项目BOM物资已采购量
    public static decimal GetAleadyPurchasedNumber(string strBomRecordID)
    {
        string strHQL;

        strHQL = "Select coalesce(Sum(Number),0) From T_GoodsPurRecord Where SourceType = 'ProjectBOMRecord' and SourceID = " + strBomRecordID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得项目BOM物资已生产量
    public static decimal GetAleadyProductionNumber(string strBomRecordID)
    {
        string strHQL;

        strHQL = "Select coalesce(Sum(Number),0) From T_GoodsProductionOrderDetail Where SourceType = 'ProjectBOMRecord' and SourceID = " + strBomRecordID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrderDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得项目BOM物资已出库量
    public static decimal GetAleadyCheckOutNumber(string strBomRecordID)
    {
        string strHQL;

        strHQL = "Select coalesce(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'ProjectBOMRecord' and SourceID = " + strBomRecordID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得项目BOM物资已入库量
    public static decimal GetAleadyCheckInNumber(string strBomRecordID)
    {
        string strHQL;

        strHQL = "Select coalesce(Sum(Number),0) From T_GoodsCheckInOrderDetail Where SourceType = 'ProjectBOMRecord' and SourceID = " + strBomRecordID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    public static string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];
        string strProjectName = project.ProjectName.Trim();
        return strProjectName;
    }

    public static string GetProjectSpecification(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.ProjectDetail.Trim();
    }

    public static string GetItemName(string strItemCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Item as item where item.ItemCode = " + "'" + strItemCode + "'";
        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);

        if (lst.Count > 0)
        {
            Item item = (Item)lst[0];
            return item.ItemName.Trim();
        }
        else
        {
            return "";
        }
    }


    protected void BT_CopyFromParentProject_Click(object sender, EventArgs e)
    {
        string strParentProjectID;

        strParentProjectID = ShareClass.GetProject(strProjectID).ParentID.ToString();

        LoadParentProjectRelatedItem(strParentProjectID);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popParentProjectItemWindow','false') ", true);
    }

    protected void CB_SelectAll_CheckedChanged(object sender, EventArgs e)
    {
        if (CB_SelectAll.Checked == true)
        {
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                ((CheckBox)DataGrid1.Items[i].FindControl("CB_Select")).Checked = true;
            }
        }
        else
        {
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                ((CheckBox)DataGrid1.Items[i].FindControl("CB_Select")).Checked = false;
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popParentProjectItemWindow','false') ", true);
    }

    protected void BT_CopyFromParentItem_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strID, strNumber, strItemCode;

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            if (((CheckBox)DataGrid1.Items[i].FindControl("CB_Select")).Checked == true)
            {
                strID = DataGrid1.Items[i].Cells[1].Text;
                strItemCode = DataGrid1.Items[i].Cells[2].Text;

                //判断物料是否在项目预算中已存在
                if (CheckProjectRelatedItemIsExisted(strItemCode, strProjectID))
                {
                    continue;
                }

                strNumber = ((TextBox)(DataGrid1.Items[i].FindControl("TB_Number"))).Text;
                try
                {
                    decimal.Parse(strNumber);
                }
                catch
                {
                    strNumber = "0";
                }

                try
                {
                    strHQL = string.Format(@"INSERT INTO [dbo].[T_ProjectRelatedItem]
                       ([ProjectID]
                       ,[ItemCode]
                       ,[ItemName]
                       ,[BomVersionID]
                       ,[Number]
                       ,[Unit]
                       ,[Status]
                       ,[ReservedNumber]
                       ,[DefaultProcess]
                       ,[AleadyPurchased]
                       ,[AleadyPick]
                       ,[AleadyCheckIn]
                       ,[AleadyCheckOut]
                       ,[Specification]
                       ,[ModelNumber]
                       ,[PhotoURL]
                       ,[ItemType]
                       ,[AleadyProduction]
                       ,[HRCost]
                       ,[MTCost]
                       ,[MFCost]
                       ,[PULeadTime]
                       ,[MFLeadTime]
                       ,[PurchasePrice]
                       ,[SalePrice]
                       ,[Brand]
                       ,[FromParentID])
                        Select 
                       {0}
                       ,[ItemCode]
                       ,[ItemName]
                       ,[BomVersionID]
                       ,{1}
                       ,[Unit]
                       ,[Status]
                       ,[ReservedNumber]
                       ,[DefaultProcess]
                       ,0
                       ,0
                       ,0
                       ,0
                       ,[Specification]
                       ,[ModelNumber]
                       ,[PhotoURL]
                       ,[ItemType]
                       ,0
                       ,[HRCost]
                       ,[MTCost]
                       ,[MFCost]
                       ,[PULeadTime]
                       ,[MFLeadTime]
                       ,[PurchasePrice]
                       ,[SalePrice]
                       ,[Brand],{2} From T_ProjectRelatedItem Where ID = {2}", strProjectID, strNumber, strID);
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = string.Format(@"Update T_ProjectRelatedItem Set Number = Number - {0} Where ID = {1}", strNumber, strID);
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch
                {
                }
            }
        }

        LoadProjectRelatedItem(strProjectID);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZWC + "')", true);
        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popParentProjectItemWindow','false') ", true);
    }


    protected void BT_MaterialBudgetFind_Click(object sender, EventArgs e)
    {
        LoadProjectRelatedItem(strProjectID);
    }

    protected void BT_NewVersion_Click(object sender, EventArgs e)
    {
        int intVerID;
        string strID;

        intVerID = int.Parse(NB_NewProjectItemBomVerID.Amount.ToString());

        if (GetProjectItemBomVersionCount(strProjectID, intVerID.ToString()) == 0)
        {
            ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
            ProjectItemBomVersion projectItemBomVersion = new ProjectItemBomVersion();

            projectItemBomVersion.ProjectID = int.Parse(strProjectID);
            projectItemBomVersion.VerID = intVerID;
            projectItemBomVersion.Type = "备用";

            try
            {
                projectItemBomVersionBLL.AddProjectItemBomVersion(projectItemBomVersion);

                LoadProjectItemBomVersion(strProjectID);

                strID = GetProjectItemBomVersionID(strProjectID, intVerID.ToString());

                DL_ChangeProjectItemBomVersionID.SelectedValue = strID;

                try
                {
                    TakeTopBOM.InitialProjectItemBomTree(strProjectID, intVerID.ToString(), TreeView2);
                    LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, intVerID.ToString()).ToString("F2");
                }
                catch (Exception err)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBCXMZKNCZCBBHJC + "')", true);
        }
    }

    protected void BT_DeleteVersion_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strVerID;

        if (DL_ChangeProjectItemBomVersionID.Items.Count == 1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBMXMBXBLYGJHBB + "')", true);
            return;
        }

        strVerID = NB_NewProjectItemBomVerID.Amount.ToString();


        try
        {
            strHQL = "Delete From T_ProjectItemBomVersion Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Delete From T_ProjectRelatedItemBom Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
            ShareClass.RunSqlCommand(strHQL);

            LoadProjectItemBomVersion(strProjectID);

            if (DL_VersionID.Items.Count > 0)
            {
                strVerID = int.Parse(NB_NewProjectItemBomVerID.Amount.ToString()).ToString();

                try
                {
                    TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView2);
                    LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strVerID).ToString("F2");
                }
                catch (Exception err)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void DL_ChangeProjecrItemBomVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID;
        string strVerType;


        strID = DL_ChangeProjectItemBomVersionID.SelectedValue.Trim();
        strVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim();

        strVerType = GetProjectItemBomVersionType(strProjectID, strVerID);
        DL_ChangeProjectItemBomVersionType.SelectedValue = strVerType;

        try
        {
            TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView2);
            LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strVerID).ToString("F2");
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
        }
    }

    protected void DL_ChangeProjectItemBomVersionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strType;
        string strHQL;


        if (DL_ChangeProjectItemBomVersionID.Items.Count > 0)
        {
            strID = DL_ChangeProjectItemBomVersionID.SelectedValue.Trim();
            strType = DL_ChangeProjectItemBomVersionType.SelectedValue.Trim();

            if (strType == "在用")
            {
                strHQL = "update T_ProjectItemBomVersion Set Type = '备用' where Type = '在用' and ProjectID = " + strProjectID;
                ShareClass.RunSqlCommand(strHQL);
            }

            if (strType == "基准")
            {
                strHQL = "update T_ProjectItemBomVersion Set Type = '备用' where Type = '基准' and ProjectID = " + strProjectID;
                ShareClass.RunSqlCommand(strHQL);
            }

            strHQL = "Update T_ProjectItemBomVersion Set Type = " + "'" + strType + "'" + " Where ID = " + strID;

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBBLXYGG + "')", true);
            }
            catch
            {
            }
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strItemCode;

        int intDepth;

        try
        {
            TreeNode treeNode = new TreeNode();
            treeNode = TreeView2.SelectedNode;

            intDepth = treeNode.Depth;
            LB_TreeDepth.Text = intDepth.ToString();

            strID = treeNode.Target;

            strHQL = "From ProjectRelatedItemBom as projectRelatedItemBom where projectRelatedItemBom.ID = " + strID;
            ProjectRelatedItemBomBLL projectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();
            lst = projectRelatedItemBomBLL.GetAllProjectRelatedItemBoms(strHQL);

            ProjectRelatedItemBom projectRelatedItemBom = (ProjectRelatedItemBom)lst[0];

            strItemCode = projectRelatedItemBom.ItemCode.Trim();
            try
            {
                LB_SelectType.Text = GetItem(strItemCode).Type;
            }
            catch
            {
            }

            LB_ItemBomID.Text = strID;
            NB_SelectBOMNumber.Amount = projectRelatedItemBom.Number;
            NB_SelectBOMReservedNumber.Amount = projectRelatedItemBom.ReservedNumber;
            try
            {
                DL_SelectBOMUnit.SelectedValue = projectRelatedItemBom.Unit;
            }
            catch
            {
            }

            LB_SelectItemCode.Text = strItemCode;
            LB_SelectItemName.Text = projectRelatedItemBom.ItemName;

            TB_BomDefaultProcess.Text = projectRelatedItemBom.DefaultProcess.Trim();

            TB_SelectModelNumber.Text = projectRelatedItemBom.ModelNumber;
            TB_SelectSpecification.Text = projectRelatedItemBom.Specification;

            LB_SelectGuid.Text = projectRelatedItemBom.ChildGuid.Trim();
            LB_SelectParentGuid.Text = projectRelatedItemBom.ParentGuid.Trim();

            NB_SortNumber.Amount = projectRelatedItemBom.SortNumber;

            BT_UpdateFormBom.Enabled = true;
            BT_DeleteFormBom.Enabled = true;

            HL_ItemBomRelatedDoc.NavigateUrl = "TTDocumentTreeView.aspx?RelatedType=BOM&RelatedItemCode=" + strItemCode + "&RelatedID=" + projectRelatedItemBom.VerID.ToString();
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
        }
    }

    protected void DL_ProductProcess3_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProcessName = DL_ProductProcess3.SelectedValue.Trim();
        string strBOMProcess = TB_BomDefaultProcess.Text.Trim();

        if (strBOMProcess != "")
        {
            TB_BomDefaultProcess.Text = strBOMProcess + "," + strProcessName;
        }
        else
        {
            TB_BomDefaultProcess.Text = strProcessName;
        }
    }

    protected void BT_UpdateFormBom_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strVerID, strTopItemCode, strUnit, strDefaultProcess;
        decimal deNumber, deReservedNumber, deLossRate;
        int intSortNumber;

        strVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text;
        strID = LB_ItemBomID.Text.Trim();
        strTopItemCode = LB_TopItemCode.Text.Trim();

        deNumber = NB_SelectBOMNumber.Amount;
        deReservedNumber = NB_SelectBOMReservedNumber.Amount;
        strUnit = DL_SelectBOMUnit.SelectedValue.Trim();

        strDefaultProcess = TB_BomDefaultProcess.Text.Trim();
        intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        try
        {
            strHQL = "From ProjectRelatedItemBom as projectRelatedItemBom where projectRelatedItemBom.ID = " + strID;
            ProjectRelatedItemBomBLL projectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();
            lst = projectRelatedItemBomBLL.GetAllProjectRelatedItemBoms(strHQL);

            ProjectRelatedItemBom projectRelatedItemBom = (ProjectRelatedItemBom)lst[0];

            projectRelatedItemBom.Number = deNumber;
            projectRelatedItemBom.ReservedNumber = deReservedNumber;
            projectRelatedItemBom.Unit = strUnit;

            projectRelatedItemBom.DefaultProcess = strDefaultProcess;
            projectRelatedItemBom.SortNumber = int.Parse(NB_SortNumber.Amount.ToString());

            projectRelatedItemBomBLL.UpdateProjectRelatedItemBom(projectRelatedItemBom, int.Parse(strID));

            TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView2);
            LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strVerID).ToString("F2");

            BT_DeleteFormBom.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGXGSBJC + "')", true);
        }
    }

    protected void BT_DeleteFormBom_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strID, strVerID, strTopItemCode, strChildItemCode, strSelectItemGuid; ;

        strVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text;
        strID = LB_ItemBomID.Text.Trim();
        strTopItemCode = LB_TopItemCode.Text.Trim();
        strChildItemCode = LB_ChildItemCode.Text.Trim();
        strSelectItemGuid = LB_SelectGuid.Text.Trim();

        try
        {
            strHQL = "Delete From T_ProjectRelatedItemBom Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            //删除分支
            DeleteProjectRelatedItemWholeBomDataToTreeForNew(strSelectItemGuid);

            if (strTopItemCode == strChildItemCode)
            {
                TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView2);
                LB_ProRelatedItemBomCost.Text = TakeTopBOM.SumProjectItemBomCost(strProjectID, strVerID).ToString("F2");
            }

            BT_UpdateFormBom.Enabled = false;
            BT_DeleteFormBom.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    //删除引用BOM的整个分支节点
    public static void DeleteProjectRelatedItemWholeBomDataToTreeForNew(string strParentGuid)
    {
        string strHQL, strHQLPart;
        IList lst;

        string strChildGuid;

        Item item = new Item();

        strHQL = "From ProjectRelatedItemBom as projectRelatedProjectRelatedItemBom where projectRelatedProjectRelatedItemBom.ParentGuid = " + "'" + strParentGuid + "'";
        ProjectRelatedItemBomBLL projectRelatedProjectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();
        lst = projectRelatedProjectRelatedItemBomBLL.GetAllProjectRelatedItemBoms(strHQL);
        if (lst.Count > 0)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                ProjectRelatedItemBom projectRelatedProjectRelatedItemBom = (ProjectRelatedItemBom)lst[i];
                strChildGuid = projectRelatedProjectRelatedItemBom.ChildGuid.Trim();

                try
                {
                    strHQLPart = "Delete from T_ProjectRelatedItemBom Where ID = " + projectRelatedProjectRelatedItemBom.ID.ToString();
                    CoreShareClass.RunSqlCommand(strHQLPart);
                }
                catch
                {

                }

                DeleteProjectRelatedItemWholeBomDataToTreeForNew(strChildGuid);
            }
        }
    }

    protected void LoadProductProcess()
    {
        string strHQL = "From ProductProcess as productProcess Order By productProcess.SortNumber ASC";
        ProductProcessBLL productProcessBLL = new ProductProcessBLL();
        IList lst = productProcessBLL.GetAllProductProcesss(strHQL);

        DL_ProductProcess2.DataSource = lst;
        DL_ProductProcess2.DataBind();

        DL_ProductProcess3.DataSource = lst;
        DL_ProductProcess3.DataBind();
    }

    protected void LoadItemBomVersion(string strItemCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From ItemBomVersion as itemBomVersion Where itemBomVersion.ItemCode = " + "'" + strItemCode + "'" + " Order by itemBomVersion.VerID DESC";
        ItemBomVersionBLL itemBomVersionBLL = new ItemBomVersionBLL();
        lst = itemBomVersionBLL.GetAllItemBomVersions(strHQL);

        DL_ChildVersionID.DataSource = lst;
        DL_ChildVersionID.DataBind();

        DL_VersionID.DataSource = lst;
        DL_VersionID.DataBind();
    }

    protected void LoadProjectItemBomVersion(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectItemBomVersion as projectItemBomVersion Where projectItemBomVersion.ProjectID = " + strProjectID + " Order by projectItemBomVersion.VerID DESC";
        ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
        lst = projectItemBomVersionBLL.GetAllProjectItemBomVersions(strHQL);

        DL_ChangeProjectItemBomVersionID.DataSource = lst;
        DL_ChangeProjectItemBomVersionID.DataBind();

        if (DL_ChangeProjectItemBomVersionID.Items.Count > 0)
        {
            string strVerType = GetProjectItemBomVersionType(strProjectID, DL_ChangeProjectItemBomVersionID.SelectedItem.Text);
            DL_ChangeProjectItemBomVersionType.SelectedValue = strVerType;
        }
    }

    protected int GetProjectItemBomVersionCount(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectItemBomVersion as projectItemBomVersion where projectItemBomVersion.ProjectID = " + strProjectID + " and projectItemBomVersion.VerID =" + strVerID;
        ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
        lst = projectItemBomVersionBLL.GetAllProjectItemBomVersions(strHQL);

        return lst.Count;
    }

    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID;
        strHQL += " and ItemCode Like '%" + TB_FindItemCode.Text.Trim() + "%'";
        strHQL += " and ItemName Like '%" + TB_FindItemName.Text.Trim() + "%'";
        strHQL += " and Specification Like '%" + TB_FindItemSpec.Text.Trim() + "%'";
        strHQL += " and ModelNumber Like '%" + TB_FindModelNumber.Text.Trim() + "%'";
        strHQL += " Order by projectRelatedItem.ID DESC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        strHQL = "Select Sum(Number * PurchasePrice) From T_ProjectRelatedItem Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");

        LB_ProjectItemAmount.Text = ds.Tables[0].Rows[0][0].ToString();
    }

    protected void LoadParentProjectRelatedItem(string strParentProjectID)
    {
        string strHQL;
        IList lst;

        string strItemCode;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strParentProjectID;
        strHQL += " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ProjectRelatedItem projectRelatedItem;

        for (int i = 0; i < lst.Count; i++)
        {
            projectRelatedItem = (ProjectRelatedItem)lst[i];

            strItemCode = projectRelatedItem.ItemCode.Trim();

            //判断物料是否在项目预算中已存在
            if (CheckProjectRelatedItemIsExisted(strItemCode, strProjectID))
            {
                DataGrid1.Items[i].ForeColor = Color.Red;
            }
        }
    }

    protected void LoadItemByItemType(string strRelatedType, string strRelatedID, string strItemType)
    {
        string strHQL;

        string strItemName = "%" + TB_ProjectItemName.Text.Trim() + "%";
        string strItemCode = "%" + TB_ProjectItemCode.Text.Trim() + "%";
        string strSpecification = "%" + TB_ProjectItemSpec.Text.Trim() + "%";
        string strModelNumber = "%" + TB_ProjectModelNumber.Text.Trim() + "%";
        string strBrand = "%" + TB_ProjectBrand.Text.Trim() + "%";

        strHQL = "Select ItemCode, ItemCode || '  ' || ItemName as ProjectItemName From T_Item Where Type =" + "'" + strItemType + "'";
        if (strRelatedType == "SYSTEM")
        {
            strHQL += " and RelatedType = " + "'" + strRelatedType + "'";
            strHQL += " and RelatedID = '0'";
        }

        if (strRelatedType == "PROJECT")
        {
            strHQL += " and RelatedType = " + "'" + strRelatedType + "'";
            strHQL += " and RelatedID = " + strRelatedID;
        }

        if (strRelatedType == "OTHER")
        {
            strHQL += " and RelatedType != 'SYSTEM' and RelatedID != " + strRelatedID;
        }

        strHQL += " and ItemName Like " + "'" + strItemName + "'";
        strHQL += " and ItemCode Like '" + strItemCode + "'";
        strHQL += " and Specification Like '" + strSpecification + "'";
        strHQL += " and Brand Like " + "'" + strBrand + "'";
        strHQL += " and ModelNumber Like '" + strModelNumber + "'";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectItem");

        LB_ItemCode.DataSource = ds;
        LB_ItemCode.DataBind();
    }

    protected void LoadUnit()
    {
        string strHQL;
        IList lst;

        strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
        JNUnitBLL jnUnitBLL = new JNUnitBLL();
        lst = jnUnitBLL.GetAllJNUnits(strHQL);
        DL_Unit.DataSource = lst;
        DL_Unit.DataBind();

        DL_ChildItemUnitToBom.DataSource = lst;
        DL_ChildItemUnitToBom.DataBind();

        DL_SelectBOMUnit.DataSource = lst;
        DL_SelectBOMUnit.DataBind();
    }


    protected string GetItemBomVersionType(string strItemCode, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ItemBomVersion as itemBomVersion where itemBomVersion.ItemCode = " + "'" + strItemCode + "'" + " and itemBomVersion.VerID = " + strVerID;
        ItemBomVersionBLL itemBomVersionBLL = new ItemBomVersionBLL();
        lst = itemBomVersionBLL.GetAllItemBomVersions(strHQL);
        ItemBomVersion itemBomVersion = (ItemBomVersion)lst[0];

        return itemBomVersion.Type.Trim();
    }

    protected string GetProjectItemBomVersionType(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectItemBomVersion as projectItemBomVersion where projectItemBomVersion.ProjectID = " + strProjectID + " and projectItemBomVersion.VerID = " + strVerID;
        ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
        lst = projectItemBomVersionBLL.GetAllProjectItemBomVersions(strHQL);
        ProjectItemBomVersion projectItemBomVersion = (ProjectItemBomVersion)lst[0];

        return projectItemBomVersion.Type.Trim();
    }

    protected string GetProjectItemBomVersionID(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectItemBomVersion as projectItemBomVersion where projectItemBomVersion.ProjectID = " + strProjectID + " and projectItemBomVersion.VerID = " + strVerID;
        ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
        lst = projectItemBomVersionBLL.GetAllProjectItemBomVersions(strHQL);
        ProjectItemBomVersion projectItemBomVersion = (ProjectItemBomVersion)lst[0];

        return projectItemBomVersion.ID.ToString();
    }

    protected string GetItemBomID(string strItemCode, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ItemBomVersion as itemBomVersion where itemBomVersion.ItemCode = " + "'" + strItemCode + "'" + " and itemBomVersion.VerID = " + strVerID;
        ItemBomVersionBLL itemBomVersionBLL = new ItemBomVersionBLL();
        lst = itemBomVersionBLL.GetAllItemBomVersions(strHQL);
        ItemBomVersion itemBomVersion = (ItemBomVersion)lst[0];

        return itemBomVersion.ID.ToString();
    }


}
