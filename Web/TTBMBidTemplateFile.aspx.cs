using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTBMBidTemplateFile : System.Web.UI.Page
{
    private string strUserCode, strBidPlanID;
    private string strSupplierType;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strBidPlanID = Request.QueryString["BidPlanID"];
        strSupplierType = Request.QueryString["SupplierType"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadBMBidTemplateFileList(strBidPlanID, strSupplierType);
        }
    }

    protected void LoadBMBidTemplateFileList(string strBidPlanID, string strSupplierType)
    {
        string strHQL;

        strHQL = "Select * From T_BMBidTemplateFile Where BidPlanID='" + strBidPlanID + "' and SupplierType = '" + strSupplierType + "'";

        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
        {
            strHQL += " and FileName like '%" + TextBox1.Text.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
        {
            strHQL += " and BidPlanName like '%" + TextBox2.Text.Trim() + "%' ";
        }
        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected string UploadAttach()
    {
        //上传附件
        if (AttachFile.HasFile)
        {
            string strFileName1, strExtendName;

            strFileName1 = this.AttachFile.FileName;//获取上传文件的文件名,包括后缀
            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);

            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;

            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";

            FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

            if (fi.Exists)
            {
                return "1";
            }
            else
            {
                try
                {
                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                    return "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
                }
                catch
                {
                    return "2";
                }
            }
        }
        else
        {
            return "0";
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text;

        if (strID == "")
        {
            Add();
        }
        else
        {
            Update();
        }
    }

    protected void Add()
    {
        if (string.IsNullOrEmpty(TB_Name.Text.Trim()) || TB_Name.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCBNWKCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        if (IsBMBidTemplateFileName(TB_Name.Text.Trim(), string.Empty))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        string strAttach = UploadAttach();
        BMBidTemplateFileBLL bMBidTemplateFileBLL = new BMBidTemplateFileBLL();
        BMBidTemplateFile bMBidTemplateFile = new BMBidTemplateFile();

        if (strAttach.Equals("0"))
        {
        }
        else if (strAttach.Equals("1"))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
            return;
        }
        else if (strAttach.Equals("2"))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            return;
        }
        else
        {
            bMBidTemplateFile.FilePath = strAttach;
        }

        bMBidTemplateFile.BidPlanID = int.Parse(strBidPlanID);
        bMBidTemplateFile.FileName = TB_Name.Text.Trim();
        bMBidTemplateFile.BidPlanName = GetBMBidPlanName(strBidPlanID.Trim());
        bMBidTemplateFile.EnterCode = strUserCode.Trim();
        bMBidTemplateFile.SupplierType = strSupplierType;

        try
        {
            bMBidTemplateFileBLL.AddBMBidTemplateFile(bMBidTemplateFile);
            LB_ID.Text = GetMaxBMBidTemplateFileID(bMBidTemplateFile).ToString();

            //BT_Update.Visible = true;
            //BT_Delete.Visible = true;
            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            LoadBMBidTemplateFileList(bMBidTemplateFile.BidPlanID.ToString().Trim(), strSupplierType);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
        }
    }

    /// <summary>
    /// 新增或更新时，招标文件名称是否存在，存在返回true；不存在返回false。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected bool IsBMBidTemplateFileName(string strName, string strID)
    {
        bool flag = true;
        string strHQL;
        if (string.IsNullOrEmpty(strID))
        {
            strHQL = "Select ID From T_BMBidTemplateFile Where FileName='" + strName + "' ";
        }
        else
            strHQL = "Select ID From T_BMBidTemplateFile Where FileName='" + strName + "' and ID<>'" + strID + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            flag = true;
        }
        else
        {
            flag = false;
        }
        return flag;
    }

    protected string GetBMBidPlanName(string strID)
    {
        string strHQL;
        IList lst;
        //绑定招标计划名称
        strHQL = "From BMBidPlan as bMBidPlan Where bMBidPlan.ID='" + strID + "' ";
        BMBidPlanBLL bMBidPlanBLL = new BMBidPlanBLL();
        lst = bMBidPlanBLL.GetAllBMBidPlans(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMBidPlan bMBidPlan = (BMBidPlan)lst[0];
            return bMBidPlan.Name.Trim();
        }
        else
            return "";
    }

    /// <summary>
    /// 新增时，获取表T_BMBidTemplateFile中最大编号。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected int GetMaxBMBidTemplateFileID(BMBidTemplateFile bmbf)
    {
        string strHQL = "Select ID From T_BMBidTemplateFile where FileName='" + bmbf.FileName.Trim() + "' and BidPlanID='" + bmbf.BidPlanID.ToString() + "' Order by ID Desc";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            return int.Parse(dt.Rows[0]["ID"].ToString());
        }
        else
        {
            return 0;
        }
    }

    protected void Update()
    {
        string strHQL;
        IList lst;

        if (string.IsNullOrEmpty(TB_Name.Text.Trim()) || TB_Name.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCBNWKCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        if (IsBMBidTemplateFileName(TB_Name.Text.Trim(), LB_ID.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }

        BMBidTemplateFileBLL bMBidTemplateFileBLL = new BMBidTemplateFileBLL();
        strHQL = "from BMBidTemplateFile as bMBidTemplateFile where bMBidTemplateFile.ID = '" + LB_ID.Text.Trim() + "' ";
        lst = bMBidTemplateFileBLL.GetAllBMBidTemplateFiles(strHQL);
        BMBidTemplateFile bMBidTemplateFile = (BMBidTemplateFile)lst[0];

        string strAttach = UploadAttach();
        if (strAttach.Equals("0"))
        {
        }
        else if (strAttach.Equals("1"))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
            return;
        }
        else if (strAttach.Equals("2"))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            return;
        }
        else
        {
            bMBidTemplateFile.FilePath = strAttach;
        }
        bMBidTemplateFile.FileName = TB_Name.Text.Trim();
        bMBidTemplateFile.BidPlanID = int.Parse(strBidPlanID);
        bMBidTemplateFile.BidPlanName = GetBMBidPlanName(strBidPlanID.Trim());
        bMBidTemplateFile.SupplierType = strSupplierType;

        try
        {
            bMBidTemplateFileBLL.UpdateBMBidTemplateFile(bMBidTemplateFile, bMBidTemplateFile.ID);

            //BT_Update.Visible = true;
            //BT_Delete.Visible = true;
            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            LoadBMBidTemplateFileList(bMBidTemplateFile.BidPlanID.ToString(), strSupplierType);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSB + "')", true);
        }
    }

    protected void Delete()
    {
        string strHQL;
        BMBidTemplateFileBLL bMBidTemplateFileBLL = new BMBidTemplateFileBLL();
        strHQL = "from BMBidTemplateFile as bMBidTemplateFile where bMBidTemplateFile.ID = '" + LB_ID.Text.Trim() + "' ";
        IList lst = bMBidTemplateFileBLL.GetAllBMBidTemplateFiles(strHQL);
        BMBidTemplateFile bMBidTemplateFile = (BMBidTemplateFile)lst[0];

        strHQL = "delete from T_BMBidTemplateFile where ID = '" + LB_ID.Text.Trim() + "' ";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            //BT_Update.Visible = false;
            //BT_Delete.Visible = false;

            LoadBMBidTemplateFileList(bMBidTemplateFile.BidPlanID.ToString(), strSupplierType);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSB + "')", true);
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMBidTemplateFileList(strBidPlanID.Trim(), strSupplierType);
    }

    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strID, strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;

                strHQL = " from BMBidTemplateFile as bMBidTemplateFile where bMBidTemplateFile.ID = '" + strID + "' ";

                BMBidTemplateFileBLL bMBidTemplateFileBLL = new BMBidTemplateFileBLL();
                lst = bMBidTemplateFileBLL.GetAllBMBidTemplateFiles(strHQL);
                BMBidTemplateFile bMBidTemplateFile = (BMBidTemplateFile)lst[0];

                LB_ID.Text = bMBidTemplateFile.ID.ToString();
                TB_Name.Text = bMBidTemplateFile.FileName.Trim();

                //if (bMBidTemplateFile.EnterCode.Trim() == strUserCode.Trim())
                //{
                //    BT_Update.Visible = true;
                //    BT_Delete.Visible = true;
                //    BT_Update.Enabled = true;
                //    BT_Delete.Enabled = true;
                //}
                //else
                //{
                //    BT_Update.Visible = false;
                //    BT_Delete.Visible = false;
                //}
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            }

            if (e.CommandName == "Delete")
            {
                Delete();

            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = lbl_sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}