using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTBMSupplierBidRecordFile : System.Web.UI.Page
{
    private string strUserCode, strSupplierBidRecordID;
    private string strSupplierType;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strSupplierBidRecordID = Request.QueryString["SupplierBidRecordID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadBMSupplierBidRecordFileList(strSupplierBidRecordID);
        }
    }

    protected void LoadBMSupplierBidRecordFileList(string strSupplierBidRecordID)
    {
        string strHQL;

        strHQL = "Select * From T_BMSupplierBidRecordFile Where SupplierBidRecordID='" + strSupplierBidRecordID + "'";

        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
        {
            strHQL += " and FileName like '%" + TextBox1.Text.Trim() + "%' ";
        }

        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecordFile");

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
        //if (IsBMSupplierBidRecordFileName(TB_Name.Text.Trim(), string.Empty))
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
        //    TB_Name.Focus();
        //    return;
        //}
        string strAttach = UploadAttach();
        BMSupplierBidRecordFileBLL bMSupplierBidRecordFileBLL = new BMSupplierBidRecordFileBLL();
        BMSupplierBidRecordFile bMSupplierBidRecordFile = new BMSupplierBidRecordFile();

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
            bMSupplierBidRecordFile.FilePath = strAttach;
        }

        bMSupplierBidRecordFile.SupplierBidRecordID = int.Parse(strSupplierBidRecordID);
        bMSupplierBidRecordFile.FileName = TB_Name.Text.Trim();
        bMSupplierBidRecordFile.EnterCode = strUserCode.Trim();

        try
        {
            bMSupplierBidRecordFileBLL.AddBMSupplierBidRecordFile(bMSupplierBidRecordFile);
            LB_ID.Text = GetMaxBMSupplierBidRecordFileID(bMSupplierBidRecordFile).ToString();

            //BT_Update.Visible = true;
            //BT_Delete.Visible = true;
            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            LoadBMSupplierBidRecordFileList(bMSupplierBidRecordFile.SupplierBidRecordID.ToString().Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    /// <summary>
    /// 新增或更新时，招标文件名称是否存在，存在返回true；不存在返回false。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected bool IsBMSupplierBidRecordFileName(string strName, string strID)
    {
        bool flag = true;
        string strHQL;
        if (string.IsNullOrEmpty(strID))
        {
            strHQL = "Select ID From T_BMSupplierBidRecordFile Where FileName='" + strName + "' ";
        }
        else
            strHQL = "Select ID From T_BMSupplierBidRecordFile Where FileName='" + strName + "' and ID<>'" + strID + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecordFile").Tables[0];
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
    /// 新增时，获取表T_BMSupplierBidRecordFile中最大编号。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected int GetMaxBMSupplierBidRecordFileID(BMSupplierBidRecordFile bmbf)
    {
        string strHQL = "Select ID From T_BMSupplierBidRecordFile where FileName='" + bmbf.FileName.Trim() + "' Order by ID Desc";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecordFile").Tables[0];
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
        if (IsBMSupplierBidRecordFileName(TB_Name.Text.Trim(), LB_ID.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }

        BMSupplierBidRecordFileBLL bMSupplierBidRecordFileBLL = new BMSupplierBidRecordFileBLL();
        strHQL = "from BMSupplierBidRecordFile as bMSupplierBidRecordFile where bMSupplierBidRecordFile.ID = '" + LB_ID.Text.Trim() + "' ";
        lst = bMSupplierBidRecordFileBLL.GetAllBMSupplierBidRecordFiles(strHQL);
        BMSupplierBidRecordFile bMSupplierBidRecordFile = (BMSupplierBidRecordFile)lst[0];

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
            bMSupplierBidRecordFile.FilePath = strAttach;
        }
        bMSupplierBidRecordFile.FileName = TB_Name.Text.Trim();
        bMSupplierBidRecordFile.SupplierBidRecordID = int.Parse(strSupplierBidRecordID);

        try
        {
            bMSupplierBidRecordFileBLL.UpdateBMSupplierBidRecordFile(bMSupplierBidRecordFile, bMSupplierBidRecordFile.ID);

            //BT_Update.Visible = true;
            //BT_Delete.Visible = true;
            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            LoadBMSupplierBidRecordFileList(bMSupplierBidRecordFile.SupplierBidRecordID.ToString());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    protected void Delete()
    {
        string strHQL;
        BMSupplierBidRecordFileBLL bMSupplierBidRecordFileBLL = new BMSupplierBidRecordFileBLL();
        strHQL = "from BMSupplierBidRecordFile as bMSupplierBidRecordFile where bMSupplierBidRecordFile.ID = '" + LB_ID.Text.Trim() + "' ";
        IList lst = bMSupplierBidRecordFileBLL.GetAllBMSupplierBidRecordFiles(strHQL);
        BMSupplierBidRecordFile bMSupplierBidRecordFile = (BMSupplierBidRecordFile)lst[0];

        strHQL = "delete from T_BMSupplierBidRecordFile where ID = '" + LB_ID.Text.Trim() + "' ";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            //BT_Update.Visible = false;
            //BT_Delete.Visible = false;

            LoadBMSupplierBidRecordFileList(bMSupplierBidRecordFile.SupplierBidRecordID.ToString());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSB + "')", true);
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMSupplierBidRecordFileList(strSupplierBidRecordID);
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

                strHQL = " from BMSupplierBidRecordFile as bMSupplierBidRecordFile where bMSupplierBidRecordFile.ID = '" + strID + "' ";

                BMSupplierBidRecordFileBLL bMSupplierBidRecordFileBLL = new BMSupplierBidRecordFileBLL();
                lst = bMSupplierBidRecordFileBLL.GetAllBMSupplierBidRecordFiles(strHQL);
                BMSupplierBidRecordFile bMSupplierBidRecordFile = (BMSupplierBidRecordFile)lst[0];

                LB_ID.Text = bMSupplierBidRecordFile.ID.ToString();
                TB_Name.Text = bMSupplierBidRecordFile.FileName.Trim();

                //if (bMSupplierBidRecordFile.EnterCode.Trim() == strUserCode.Trim())
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

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecordFile");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}