using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;


public partial class TTConstractMainContentEdit : System.Web.UI.Page
{
    string strUserCode, strLangCode;
    string strIsMobileDevice;
    string strConstractID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();

        strConstractID = Request.QueryString["ConstractID"];

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();


        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        //_FileBrowser.SetupCKEditor(TB_MainContent);
        _FileBrowser.SetupCKEditor(TB_ConstractMainContent);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                TB_ConstractMainContent.Visible = true;
            }
            else
            {
                TB_ConstractMainContent.Visible = true;
            }

            strHQL = "Select MainContent From T_Constract Where ConstractID = " + strConstractID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");
            if (ds.Tables[0].Rows.Count > 0)
            {
                TB_ConstractMainContent.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                TB_ConstractMainContent.Text = "";
            }
        }
    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        try
        {
            //保存合同内容
            SaveConstractContent(strConstractID);

            //保存合同内容文件URL
            SaveConstractURL(strConstractID, MSWordHandler.HTMLToWord(strConstractID, TB_ConstractMainContent.Text));

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strMainContent, strWatermark;
        string strDocSavePath, strOldConstractFileName, strNewConstractFileName;

        try
        {
            //保存合同内容
            SaveConstractContent(strConstractID);

            //保存合同内容文件URL
            SaveConstractURL(strConstractID, MSWordHandler.HTMLToWord(strConstractID, TB_ConstractMainContent.Text));
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

        strWatermark = TB_Watermark.Text.Trim();

        strMainContent = "<p>" + TB_ConstractMainContent.Text.Trim() + "</p>";

        strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";
        strOldConstractFileName = "OldContract" + Path.GetFileNameWithoutExtension(strConstractID) + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".pdf";

        strNewConstractFileName = "NewContract" + Path.GetFileNameWithoutExtension(strConstractID) + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".pdf";

        try
        {
            PDFHandler.ConvertHtmlToPdf(strMainContent, strDocSavePath + strOldConstractFileName);
            PDFHandler.AddWaterMarkToPDF(strDocSavePath + strOldConstractFileName, strDocSavePath + strNewConstractFileName, strWatermark);

            string strContractFileURL = "Doc/" + DateTime.Now.ToString("yyyyMM") + "/" + strUserCode + "/Doc/" + strNewConstractFileName;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShowByURL('" + strContractFileURL + "', 'Export',600, 500)", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void BT_Import_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWordFile, strHTMLFile, strDocSavePath, strConstractFileName;

        try
        {
            strHQL = "Select ConstractMainDocURL From T_Constract where ConstractID =" + strConstractID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");

            if (ds.Tables[0].Rows.Count > 0)
            {
                strWordFile = ds.Tables[0].Rows[0][0].ToString().Trim();

                if (strWordFile != "")
                {
                    strWordFile = Server.MapPath(ds.Tables[0].Rows[0][0].ToString().Trim());

                    strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";
                    strConstractFileName = "WordContract" + Path.GetFileNameWithoutExtension(strConstractID) + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".html";

                    strHTMLFile = strDocSavePath + strConstractFileName;

                    MSWordHandler.WordToHTML(strWordFile, strHTMLFile);

                    TB_ConstractMainContent.Text = MSWordHandler.ImportToStringFromFile(strHTMLFile);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRSBJC + "')", true);
                }
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRSBJC + "')", true);
        }
    }

    //保存合同内容
    protected void SaveConstractContent(string strConstractID)
    {
        string strHQL;

        string strMainContent;

        strMainContent = TB_ConstractMainContent.Text;

        strHQL = "From Constract as constract Where constract.ConstractID = " + strConstractID;
        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);

        Constract constract = (Constract)lst[0];

        constract.MainContent = strMainContent;

        constractBLL.UpdateConstract(constract, int.Parse(strConstractID));
    }

    //保存合同内容的文档链接
    public void SaveConstractURL(string strConstractID, string strConstractFileURL)
    {
        string strHQL;

        try
        {
            strHQL = "Update T_Constract Set ConstractMainDocURL = '" + strConstractFileURL + "' Where ConstractID = " + strConstractID;
            ShareClass.RunSqlCommand(strHQL);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }
}