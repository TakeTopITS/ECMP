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
using System.Data.OleDb;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAssetImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName;

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产期初数据导入", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            DLC_BuyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from AssetType as assetType Order by assetType.SortNumber ASC";
            AssetTypeBLL assetTypeBLL = new AssetTypeBLL();
            lst = assetTypeBLL.GetAllAssetTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);

            LB_OwnerCode.Text = strUserCode;
            LB_OwnerName.Text = strUserName;

            //2013-07-18 Liujp 
            BindAssetData(DL_Type.SelectedValue.Trim(), TB_WHName.Text.Trim());
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_WHName.Text = treeNode.Target.Trim();
        }
    }

    protected void BT_FindAsset_Click(object sender, EventArgs e)
    {
        BindAssetData(DL_Type.SelectedValue.Trim(), TB_WHName.Text.Trim());
    }

    protected void btn_ExcelToDataTraining_Click(object sender, EventArgs e)
    {
        string strAssetCode = "";
        int i = 0;

        string strUserCode = LB_UserCode.Text;

        if (ExcelToDBTest() == -1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRSBEXECLBLDSJYCJC + "')", true);

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
                    AssetBLL assetBLL = new AssetBLL();
                    Asset asset = new Asset();

                    for (i = 0; i < dr.Length; i++)
                    {
                        strAssetCode = dr[i]["代码"].ToString().Trim();

                        if (strAssetCode != "")
                        {
                            try
                            {
                                asset.AssetCode = dr[i]["代码"].ToString().Trim();
                                asset.AssetName = dr[i]["名称"].ToString().Trim();
                                asset.Type = dr[i]["类型"].ToString().Trim();
                                asset.Spec = dr[i]["规格"].ToString().Trim();
                                asset.ModelNumber = dr[i]["型号"].ToString().Trim();
                                asset.Number = decimal.Parse(dr[i]["数量"].ToString().Trim());
                                asset.Price = decimal.Parse(dr[i]["单价"].ToString().Trim());
                                asset.CurrencyType = dr[i]["币别"].ToString().Trim();
                                asset.UnitName = dr[i]["单位"].ToString().Trim();
                                asset.Position = dr[i]["存放仓库"].ToString().Trim();
                                asset.Manufacturer = dr[i]["供应商"].ToString().Trim();
                                asset.OwnerCode = strUserCode;
                                asset.OwnerName = ShareClass.GetUserName(strUserCode);
                                asset.BuyTime = DateTime.Now;
                                asset.PhotoURL = "";
                                asset.Memo = "";
                                asset.Status = "在用";

                                assetBLL.AddAsset(asset);
                            }
                            catch (Exception err)
                            {
                                LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strAssetCode + " : " + err.Message.ToString() + "<br/>"; ;

                                LogClass.WriteLogFile(this.GetType().BaseType.Name + "：" + Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strAssetCode + " : " + err.Message.ToString());
                            }

                        }
                    }

                    //2013-07-18 Liujp 
                    BindAssetData(DL_Type.SelectedValue.Trim(), TB_WHName.Text.Trim());

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                }
            }
        }
    }

    protected int ExcelToDBTest()
    {
        string strHQL;

        string strCIOID, strID, strAssetCode, strManufacturer, strMemo;
        string strUserCode = LB_UserCode.Text;


        int j = 0;

        try
        {
            IList lst;

            strCIOID = lbl_CheckId.Text.Trim();
            strID = LB_ID.Text.Trim();

            strManufacturer = TB_Manufacturer.Text.Trim();
            strMemo = TB_Memo.Text.Trim();

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
                    AssetBLL assetBLL = new AssetBLL();
                    Asset asset = new Asset();

                    for (int i = 0; i < dr.Length; i++)
                    {
                        strAssetCode = dr[i]["代码"].ToString().Trim();

                        if (strAssetCode.Length > 20)
                        {
                            LB_ErrorText.Text += Resources.lang.DaiMa + ": " + strAssetCode + " " + Resources.lang.ZZCDDY20WDRSB;
                            j = -1;

                            continue;
                        }

                        if (dr[i]["代码"].ToString().Trim() != "")
                        {
                            strHQL = "From Asset as asset Where asset.AssetCode = " + "'" + strAssetCode + "'";
                            lst = assetBLL.GetAllAssets(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {

                            }
                            else//新增
                            {
                                asset.AssetCode = dr[i]["代码"].ToString().Trim();
                                asset.AssetName = dr[i]["名称"].ToString().Trim();

                                if (CheckAssetType(dr[i]["类型"].ToString().Trim()) > 0)
                                {
                                    asset.Type = dr[i]["类型"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGJCSJLBCZCLPLXDRILXTOSTRINGTRIMJC + " " + dr[i]["类型"].ToString().Trim();
                                    j = -1;
                                }
                                asset.Spec = dr[i]["规格"].ToString().Trim();
                                asset.ModelNumber = dr[i]["型号"].ToString().Trim();

                                try
                                {
                                    asset.Number = decimal.Parse(dr[i]["数量"].ToString().Trim());
                                    asset.Price = decimal.Parse(dr[i]["单价"].ToString().Trim());
                                }
                                catch
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGSLHDJBSSZJC;
                                    j = -1;
                                }

                                if (CheckUnit(dr[i]["单位"].ToString().Trim()) > 0)
                                {
                                    asset.UnitName = dr[i]["单位"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGJCSJLBCZCDWDRIDWTOSTRINGTRIMJC + " " + dr[i]["单位"].ToString().Trim();
                                    j = -1;
                                }

                                if (CheckCurrency(dr[i]["币别"].ToString().Trim()) > 0)
                                {
                                    asset.CurrencyType = dr[i]["币别"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGJCSJLBCZCBBDRIBBTOSTRINGTRIMJC + " " + dr[i]["币别"].ToString().Trim();
                                    j = -1;
                                }

                                if (CheckWareHouse(dr[i]["存放仓库"].ToString().Trim()) > 0)
                                {

                                    asset.Position = dr[i]["存放仓库"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += Resources.lang.ZZJGJCSJLBCZCCKDRICFCKTOSTRINGTRIMJC + " " + dr[i]["存放仓库"].ToString().Trim();
                                    j = -1;
                                }

                                asset.Manufacturer = dr[i]["供应商"].ToString().Trim();

                                asset.OwnerCode = strUserCode;
                                asset.OwnerName = ShareClass.GetUserName(strUserCode);

                                asset.BuyTime = DateTime.Now;

                                asset.Memo = "";
                                asset.Status = "在用";

                            }

                            continue;
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

    protected int CheckAssetType(string strAssetType)
    {
        string strHQL;
        IList lst;

        strHQL = "From AssetType as assetType Where assetType.Type = " + "'" + strAssetType + "'";
        AssetTypeBLL assetTypeBLL = new AssetTypeBLL();

        lst = assetTypeBLL.GetAllAssetTypes(strHQL);

        return lst.Count;
    }

    protected int CheckWareHouse(string strWareHouseName)
    {
        string strHQL;


        strHQL = "Select * From T_WareHouse Where WHName = " + "'" + strWareHouseName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WareHouse");

        return ds.Tables[0].Rows.Count;
    }

    protected int CheckCurrency(string strCurrency)
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Where currencyType = " + "'" + strCurrency + "'";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        return lst.Count;
    }

    protected int CheckUnit(string strUnit)
    {
        string strHQL;

        strHQL = "Select * From T_JNUnit Where UnitName = " + "'" + strUnit + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_JNUnit");

        return ds.Tables[0].Rows.Count;
    }

    protected void BindAssetData(string assetType, string assetWareHouse)
    {
        string strHQL;
        IList lst;

        string strAssetType, strAssetCode, strAssetName, strModelNumber, strSpec;
        string strWareHouse;
        string strUserCode, strDepartString;

        DataGrid4.CurrentPageIndex = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetType = DL_Type.SelectedValue.Trim();
        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();

        strHQL = "From Asset as asset Where asset.Type = '" + strAssetType + "' ";//and asset.Position='" + strWareHouse + "' ";
        strHQL += " and asset.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " and asset.Number > 0 and asset.Status = '在用' ";

        if (!string.IsNullOrEmpty(strAssetCode))
        {
            strHQL += " and asset.AssetCode Like '%" + strAssetCode + "%' ";
        }
        if (!string.IsNullOrEmpty(strAssetName))
        {
            strHQL += " and asset.AssetName like '%" + strAssetName + "%' ";
        }
        if (!string.IsNullOrEmpty(strModelNumber))
        {
            strHQL += " and asset.ModelNumber Like '%" + strModelNumber + "%' ";
        }
        if (!string.IsNullOrEmpty(strSpec))
        {
            strHQL += " and asset.Spec Like '%" + strSpec + "%' ";
        }

        strHQL += " Order by asset.BuyTime DESC ";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_AssetCode.Text = "";
        TB_AssetName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strAssetCode;
            string strUserCode = LB_UserCode.Text;

            strID = e.Item.Cells[0].Text;
            strAssetCode = ((Button)e.Item.FindControl("BT_AssetCode")).Text.Trim();

            strHQL = "from Asset as asset where asset.ID = " + "'" + strID + "'";
            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);
            Asset asset = (Asset)lst[0];

            LB_ID.Text = asset.ID.ToString();
            TB_AssetCode.Text = asset.AssetCode.Trim();
            LB_OwnerCode.Text = asset.OwnerCode;
            lbl_CheckId.Text = asset.CheckInID.ToString();
            LB_OwnerName.Visible = true;
            LB_OwnerName.Text = ShareClass.GetUserName(asset.OwnerCode);

            TB_AssetCode.Text = asset.AssetCode;
            TB_AssetName.Text = asset.AssetName;
            TB_ModelNumber.Text = asset.ModelNumber;
            NB_Number.Amount = asset.Number;
            DL_Unit.SelectedValue = asset.UnitName;
            DL_Type.SelectedValue = asset.Type;
            TB_ModelNumber.Text = asset.ModelNumber;
            TB_Spec.Text = asset.Spec;
            TB_WHName.Text = asset.Position;

            NB_Price.Amount = asset.Price;
            DLC_BuyTime.Text = asset.BuyTime.ToString("yyyy-MM-dd");

            TB_Manufacturer.Text = asset.Manufacturer;
            TB_Memo.Text = asset.Memo.Trim();

        }
    }

    protected bool IsAssetData(string strassetcode)
    {
        //是物料的话，返回true;否则返回false
        bool flag = true;
        string strHQL = "Select AssetCode From T_Asset Where AssetCode='" + strassetcode + "' and Number > 0 and Status = '在用' ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Asset");
        if (ds.Tables[0].Rows.Count > 0 && ds != null)
        {
            flag = true;
        }
        else
        {
            flag = false;
        }
        return flag;
    }

    protected void AddFirstAssetAdjustRecord(string strAssetID)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strHQL = "from AssetAdjustRecord as assetAdjustRecord where assetAdjustRecord.AssetID = " + strAssetID;
        strHQL += " Order by assetAdjustRecord.ID DESC";
        AssetAdjustRecordBLL assetAdjustRecordBLL = new AssetAdjustRecordBLL();
        lst = assetAdjustRecordBLL.GetAllAssetAdjustRecords(strHQL);

        if (lst.Count == 0)
        {
            strHQL = "Insert Into T_AssetAdjustRecord(AssetID,CheckInID,AssetCode,AssetName,Number,UnitName,";
            strHQL += "OwnerCode,OwnerName,Type,ModelNumber,Spec,Position,IP,Price,BuyTime,Manufacturer,Memo,Status,AdjusterCode,AdjusterName,AdjustTime)";
            strHQL += " Select ID,CheckInID ,AssetCode,AssetName,Number,UnitName,";
            strHQL += "OwnerCode,OwnerName,Type,ModelNumber,Spec,Position,IP,Price,BuyTime,Manufacturer,Memo,Status,ApplicantCode,ApplicantName,now()";
            strHQL += " From T_Asset Where ID = " + strAssetID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void LoadAssetByAssetID(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Asset as asset where asset.ID = " + strID;
        strHQL += " Order by asset.Number DESC,asset.ID DESC";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }

    protected void LoadAssetBySql(string strHQL)
    {
        IList lst;

        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }


    protected void DL_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindAssetData(DL_Type.SelectedValue.Trim(), TB_WHName.Text.Trim());
    }

}







