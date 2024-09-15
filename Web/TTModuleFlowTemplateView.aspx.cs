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

using System.Text;
using System.IO;
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTModuleFlowTemplateView : System.Web.UI.Page
{
    string strUserCode, strMakeUserCode, strIdentifyString, strTemName, strDesignType;

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }


    protected void BT_SaveWFDefinition_Click(object sender, EventArgs e)
    {
        if (Session["SuperWFAdmin"].ToString() == "YES" | strUserCode == strMakeUserCode)
        {
            SaveWFTemplateDefinationXML(strIdentifyString, "0");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert(保存失败，你不是此流程模板的创建者，不能保存些流程图片！')", true);
        }
    }

    protected void SaveWFTemplateDefinationXML(string strIdentifyString, string strMark)
    {
        string strHQL;

        string strXML = TB_WFXML.Text.Trim();
        string strWFChartString = TB_WFChartString.Text.Trim();

        try
        {
            if (strXML != "")
            {
                strHQL = "update T_WorkFlowTemplate Set WFDefinition = " + "'" + strXML + "'" + " Where IdentifyString = " + "'" + strIdentifyString + "'";
                ShareClass.RunSqlCommand(strHQL);
            }

            SaveWFChart(strWFChartString);

            if (strMark == "0")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWBCSBJC + "')", true);
        }
    }

    protected void SaveWFChart(string strWFChartString)
    {
        if (strWFChartString != "")
        {
            var binaryData = Convert.FromBase64String(strWFChartString);

            string strDateTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            string strChartURL = "Doc\\" + "WorkFlowTemplate\\" + strTemName + strDateTime + ".jpg";
            var imageFilePath = Server.MapPath("Doc") + "\\" + "WorkFlowTemplate\\" + strTemName + strDateTime + ".jpg";


            if (File.Exists(imageFilePath))
            { File.Delete(imageFilePath); }
            var stream = new System.IO.FileStream(imageFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            stream.Write(binaryData, 0, binaryData.Length);
            stream.Close();

            string strHQL = "Update T_WorkFlowTemplate Set ChartURL = " + "'" + strChartURL + "'" + " Where TemName = " + "'" + strTemName + "'";
            ShareClass.RunSqlCommand(strHQL);
        }
    }

}
