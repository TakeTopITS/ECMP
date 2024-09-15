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

public partial class TTWZCompactListEdit : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            DataProjectBinder();
            DataSupplierBinder();

            if (!string.IsNullOrEmpty(Request.QueryString["CompactCode"]))
            {
                string strCompactCode = Request.QueryString["CompactCode"];
                DataCompactBinder(strCompactCode);
            }

            string strHQL;

            strHQL = "Select ProjectCode,ProjectName From T_WZProject Where PurchaseEngineer = " + "'" + strUserCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WZProject");
            DDL_Project.DataSource = ds;
            DDL_Project.DataBind();

            DDL_Project.BackColor = Color.CornflowerBlue;
            TXT_CompactName.BackColor = Color.CornflowerBlue;
            DDL_Supplier.BackColor = Color.CornflowerBlue;
            TXT_ControlMoney.BackColor = Color.CornflowerBlue;
        }
    }


    private void DataCompactBinder(string strCompactCode)
    {
        string strCompactSql = string.Format(@"select c.*,p.UserName as ControlMoneyName from T_WZCompact c
                            left join T_ProjectMember p on c.ControlMoney = p.UserCode 
                            where c.CompactCode = '{0}'", strCompactCode);
        DataTable dtCompact = ShareClass.GetDataSetFromSql(strCompactSql, "Compact").Tables[0];
        if (dtCompact != null && dtCompact.Rows.Count == 1)
        {
            DataRow drCompact = dtCompact.Rows[0];
            
            LB_CompactCode.Text = strCompactCode;
            //DDL_Project.SelectedValue = ShareClass.ObjectToString(drCompact["ProjectCode"]);
            DDL_Supplier.SelectedValue = ShareClass.ObjectToString(drCompact["SupplierCode"]);
            TXT_CompactName.Text = ShareClass.ObjectToString(drCompact["CompactName"]);
            HF_ControlMoney.Value = ShareClass.ObjectToString(drCompact["ControlMoney"]);
            TXT_ControlMoney.Text = ShareClass.ObjectToString(drCompact["ControlMoneyName"]);
            HF_DelegateAgent.Value = ShareClass.ObjectToString(drCompact["DelegateAgent"]);
            HF_Compacter.Value = ShareClass.ObjectToString(drCompact["Compacter"]);
            HF_StoreRoom.Value = ShareClass.ObjectToString(drCompact["StoreRoom"]);
            HF_Checker.Value = ShareClass.ObjectToString(drCompact["Checker"]);
            HF_Safekeep.Value = ShareClass.ObjectToString(drCompact["Safekeep"]);

            LT_CompactText.Text = "<a href='" + ShareClass.ObjectToString(drCompact["CompactTextURL"]) + "' class=\"notTab\" target=\"_blank\">" + ShareClass.ObjectToString(drCompact["CompactText"]) + "</a>";

            HF_CompactCode.Value = strCompactCode;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string strProjectCode = DDL_Project.SelectedValue;
            string strSupplierCode = DDL_Supplier.SelectedValue;
            string strCompactName = TXT_CompactName.Text.Trim();
            string strControlMoney = HF_ControlMoney.Value;                         //TXT_ControlMoney.Text.Trim();
            string strDelegateAgent = HF_DelegateAgent.Value;
            string strCompacter = HF_Compacter.Value;
            string strStoreRoom = HF_StoreRoom.Value;
            string strChecker = HF_Checker.Value;
            string strSafekeep = HF_Safekeep.Value;
            string strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

            if (string.IsNullOrEmpty(strProjectCode))
            {
                string strProgress = HF_Progress.Value;
                string strIsMark = HF_IsMark.Value;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('请选择工程项目！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                return;
            }
            if (string.IsNullOrEmpty(strSupplierCode))
            {
                string strProgress = HF_Progress.Value;
                string strIsMark = HF_IsMark.Value;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('请选择供应商！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                return;
            }
            if (string.IsNullOrEmpty(strCompactName))
            {
                string strProgress = HF_Progress.Value;
                string strIsMark = HF_IsMark.Value;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('合同名称不能为空，请补充！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                return;
            }
            if (string.IsNullOrEmpty(strControlMoney))
            {
                string strProgress = HF_Progress.Value;
                string strIsMark = HF_IsMark.Value;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('价格监审不能为空，请补充！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                return;
            }

            string strFileURL = HF_CompactTextURL.Value;
            string strFileName = HF_CompactText.Value;
           

            WZCompactBLL wZCompactBLL = new WZCompactBLL();
            string strCompactCode = HF_CompactCode.Value;
            if (!string.IsNullOrEmpty(strCompactCode))
            {
                //修改
                string strCompactHQL = "from WZCompact as wZCompact where CompactCode = '" + strCompactCode + "'";
                IList listCompact = wZCompactBLL.GetAllWZCompacts(strCompactHQL);
                if (listCompact != null && listCompact.Count > 0)
                {
                    WZCompact wZCompact = (WZCompact)listCompact[0];
                    wZCompact.ProjectCode = strProjectCode;
                    wZCompact.DelegateAgent = strDelegateAgent;
                    wZCompact.Compacter = strCompacter;
                    wZCompact.StoreRoom = strStoreRoom;
                    wZCompact.Checker = strChecker;
                    wZCompact.Safekeep = strSafekeep;
                    wZCompact.SupplierCode = strSupplierCode;
                    wZCompact.CompactName = strCompactName;
                    if (!string.IsNullOrEmpty(strFileName) && !string.IsNullOrEmpty(strFileURL))
                    {
                        wZCompact.CompactText = strFileName;
                        wZCompact.CompactTextURL = strFileURL;
                    }
                    wZCompact.ControlMoney = strControlMoney;

                    wZCompactBLL.UpdateWZCompact(wZCompact, strCompactCode);
                }
            }
            else
            {
                //增加
                WZCompact wZCompact = new WZCompact();
                //合同编号
                string strNewCompactCode = CreateNewCompactCode();

                wZCompact.CompactCode = strNewCompactCode;
                wZCompact.ProjectCode = strProjectCode;

                wZCompact.DelegateAgent = strDelegateAgent;
                wZCompact.Compacter = strCompacter;
                wZCompact.StoreRoom = strStoreRoom;
                wZCompact.Checker = strChecker;
                wZCompact.Safekeep = strSafekeep;

                wZCompact.SupplierCode = strSupplierCode;
                wZCompact.CompactName = strCompactName;
                if (!string.IsNullOrEmpty(strFileName) && !string.IsNullOrEmpty(strFileURL))
                {
                    wZCompact.CompactText = strFileName;
                    wZCompact.CompactTextURL = strFileURL;
                }
                wZCompact.PurchaseEngineer = strUserCode;
                wZCompact.MarkTime = DateTime.Now;
                wZCompact.SingTime = "";
                wZCompact.ControlMoney = strControlMoney;
                wZCompact.Progress = "录入";

                //时间暂时先赋值，不然会报错 TODO
                wZCompact.VerifyTime = "";
                wZCompact.ApproveTime = "";
                wZCompact.EffectTime = "";
                wZCompact.CancelTime = "";
                wZCompact.ReceiveTime = "";


                //根据“采购工程师”找出需方编号，法人代表
                string strNeedHQL = "from WZNeedObject as wZNeedObject where PurchaseEngineer = '" + strUserCode + "'";
                WZNeedObjectBLL wZNeedObjectBLL = new WZNeedObjectBLL();
                IList lstNeedObject = wZNeedObjectBLL.GetAllWZNeedObjects(strNeedHQL);
                if (lstNeedObject != null && lstNeedObject.Count > 0)
                {
                    WZNeedObject wZNeedObject = (WZNeedObject)lstNeedObject[0];

                    wZCompact.NeedCode = wZNeedObject.NeedCode;
                    wZCompact.JuridicalPerson = wZNeedObject.PersonDelegate;
                    wZCompact.RelatedConstractCode = "";

                    //添加合同
                    wZCompactBLL.AddWZCompact(wZCompact);

                    //将需方的使用标记改为-1
                    wZNeedObject.IsMark = -1;
                    wZNeedObjectBLL.UpdateWZNeedObject(wZNeedObject, wZNeedObject.ID);
                }
                else
                {
                    string strProgress = HF_Progress.Value;
                    string strIsMark = HF_IsMark.Value;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('未找到采购工程师对应的需方记录！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                    return;
                }
            }

            //重新加载列表
            //DataBinder();


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "LoadParentLit();", true);
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存成功！');ControlStatus();ControlStatusCloseChange();", true);
        }
        catch (Exception ex)
        { }
    }



    private void DataProjectBinder()
    {
        WZProjectBLL wZProjectBLL = new WZProjectBLL();
        string strProjectHQL = "from WZProject as wZProject order by MarkTime desc";
        IList listProject = wZProjectBLL.GetAllWZProjects(strProjectHQL);

        DDL_Project.DataSource = listProject;
        DDL_Project.DataBind();

        DDL_Project.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void DDL_Project_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProjectSelectedValue = DDL_Project.SelectedItem.Text;
        if (!string.IsNullOrEmpty(strProjectSelectedValue))
        {
            try
            {
                WZProjectBLL wZProjectBLL = new WZProjectBLL();
                string strProjectHQL = "from WZProject as wZProject where ProjectCode = '" + strProjectSelectedValue + "'";
                IList listProject = wZProjectBLL.GetAllWZProjects(strProjectHQL);
                if (listProject != null && listProject.Count > 0)
                {
                    WZProject wZProject = (WZProject)listProject[0];

                    HF_DelegateAgent.Value = wZProject.DelegateAgent;
                    HF_Compacter.Value = wZProject.Contracter;
                    HF_StoreRoom.Value = wZProject.StoreRoom;
                    HF_Safekeep.Value = wZProject.Safekeep;
                    HF_Checker.Value = wZProject.Checker;

                    string strProgress = HF_Progress.Value;
                    string strIsMark = HF_IsMark.Value;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                }
            }
            catch (Exception ex) { }
        }
    }


    private void DataSupplierBinder()
    {
        WZSupplierBLL wZSupplierBLL = new WZSupplierBLL();
        string strWZSupplierHQL = "from WZSupplier as wZSupplier";
        IList listWZSupplier = wZSupplierBLL.GetAllWZSuppliers(strWZSupplierHQL);

        DDL_Supplier.DataSource = listWZSupplier;
        DDL_Supplier.DataBind();

        DDL_Supplier.Items.Insert(0, new ListItem("--Select--", ""));
    }


    protected void BT_CompactText_Click(object sender, EventArgs e)
    {
        string strCompactCode = HF_CompactCode.Value;
        string strProgress = HF_Progress.Value;
        string strIsMark = HF_IsMark.Value;

        if (!string.IsNullOrEmpty(strCompactCode))
        {
            try
            {
                string strCompactText = FUP_CompactText.PostedFile.FileName;   //获取上传文件的文件名,包括后缀
                if (!string.IsNullOrEmpty(strCompactText))
                {
                    string strExtendName = System.IO.Path.GetExtension(strCompactText);//获取扩展名

                    DateTime dtUploadNow = DateTime.Now; //获取系统时间
                    string strFileName2 = System.IO.Path.GetFileName(strCompactText);
                    string strExtName = Path.GetExtension(strFileName2);

                    string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;

                    string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";


                    FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

                    if (fi.Exists)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('存在同名文件，上传失败，请改名后再上传！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');</script>");
                        return;
                    }

                    if (Directory.Exists(strDocSavePath) == false)
                    {
                        //如果不存在就创建file文件夹{
                        Directory.CreateDirectory(strDocSavePath);
                    }

                    FUP_CompactText.SaveAs(strDocSavePath + strFileName3);


                    string strUrl = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
                    LT_CompactText.Text = "<a href=\"" + strUrl + "\" class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    WZCompactBLL wZCompactBLL = new WZCompactBLL();
                    string strCompactHQL = "from WZCompact as wZCompact where CompactCode = '" + strCompactCode + "'";
                    IList listCompact = wZCompactBLL.GetAllWZCompacts(strCompactHQL);
                    if (listCompact != null && listCompact.Count > 0)
                    {
                        WZCompact wZCompact = (WZCompact)listCompact[0];
                        wZCompact.CompactText = Path.GetFileNameWithoutExtension(strFileName2);
                        wZCompact.CompactTextURL = strUrl;

                        wZCompactBLL.UpdateWZCompact(wZCompact, wZCompact.CompactCode);
                    }

                    //重新加载报价文件列表
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('上传合同文本成功！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('请选择要上传的文件！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                    return;
                }
            }
            catch (Exception ex) { }
        }
        else
        {
            try
            {
                string strCompactText = FUP_CompactText.PostedFile.FileName;   //获取上传文件的文件名,包括后缀
                if (!string.IsNullOrEmpty(strCompactText))
                {
                    string strExtendName = System.IO.Path.GetExtension(strCompactText);//获取扩展名

                    DateTime dtUploadNow = DateTime.Now; //获取系统时间
                    string strFileName2 = System.IO.Path.GetFileName(strCompactText);
                    string strExtName = Path.GetExtension(strFileName2);

                    string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;

                    string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";


                    FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

                    if (fi.Exists)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('存在同名文件，上传失败，请改名后再上传！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');</script>");
                    }

                    if (Directory.Exists(strDocSavePath) == false)
                    {
                        //如果不存在就创建file文件夹{
                        Directory.CreateDirectory(strDocSavePath);
                    }

                    FUP_CompactText.SaveAs(strDocSavePath + strFileName3);

                    LT_CompactText.Text = "<a href=\"" + "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3 + "\"  class=\"notTab\" target=\"_blank\">" + Path.GetFileNameWithoutExtension(strFileName2) + "</a>";

                    HF_CompactText.Value = Path.GetFileNameWithoutExtension(strFileName2);
                    HF_CompactTextURL.Value = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;

                    //重新加载报价文件列表
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('上传合同文本成功！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('请选择要上传的文件！');ControlStatusChange('" + strProgress + "','" + strIsMark + "');", true);
                    return;
                }
            }
            catch (Exception ex) { }
        }
    }


    /// <summary>
    ///  生成合同Code
    /// </summary>
    private string CreateNewCompactCode()
    {
        string strNewCompactCode = string.Empty;
        try
        {
            lock (this)
            {
                string strYear = DateTime.Now.Year.ToString();
                string strMonth = DateTime.Now.Month.ToString();
                if (strMonth.Length == 1)
                {
                    strMonth = "0" + strMonth;
                }

                bool isExist = true;
                string strCompactCodeHQL = "select count(1) as RowNumber from T_WZCompact where to_char( MarkTime, 'yyyy-mm-dd') like '%" + strYear + "-" + strMonth + "%'";
                DataTable dtCompactCode = ShareClass.GetDataSetFromSql(strCompactCodeHQL, "CompactCode").Tables[0];
                int intCompactCodeNumber = int.Parse(dtCompactCode.Rows[0]["RowNumber"].ToString());
                intCompactCodeNumber = intCompactCodeNumber + 1;
                do
                {
                    StringBuilder sbCompactCode = new StringBuilder();
                    for (int j = 4 - intCompactCodeNumber.ToString().Length; j > 0; j--)
                    {
                        sbCompactCode.Append("0");
                    }
                    strNewCompactCode = strYear + strMonth + sbCompactCode.ToString() + intCompactCodeNumber.ToString();

                    //验证新的合同编号是否存在
                    string strCheckNewCompactCodeHQL = "select count(1) as RowNumber from T_WZCompact where CompactCode = '" + strNewCompactCode + "'";
                    DataTable dtCheckNewCompactCode = ShareClass.GetDataSetFromSql(strCheckNewCompactCodeHQL, "CheckNewCompactCode").Tables[0];
                    int intCheckNewCompactCode = int.Parse(dtCheckNewCompactCode.Rows[0]["RowNumber"].ToString());
                    if (intCheckNewCompactCode == 0)
                    {
                        isExist = false;
                    }
                    else
                    {
                        intCompactCodeNumber++;
                    }
                } while (isExist);
            }
        }
        catch (Exception ex) { }
        return strNewCompactCode;
    }


}