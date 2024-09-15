using Aspose.Words;

using System;
using System.IO;
using System.Web;

/// <summary>
/// WordHandler 的摘要说明
/// </summary>
public static class MSWordHandler
{
    //把Word文档转为HTML文档
    public static void WordToHTML(string strWordFile, string strHTMLFile)
    {
        // 上传文件
        Aspose.Words.Document doc = new Aspose.Words.Document(strWordFile);

        // 转换为HTML
        doc.Save(strHTMLFile, SaveFormat.Html);
    }

    //把网页文件转Word文档,
    public static string HTMLToWord(string strDocID, string strHtml)
    {
        string strDocSavePath, strFileName, strFileURL, strChildDocSavePath;

        // 创建一个新的空白Word文档
        Aspose.Words.Document doc = new Aspose.Words.Document();

        // 将HTML字符串插入到文档中
        DocumentBuilder builder = new DocumentBuilder(doc);
        // 应用服务名称
        string strApplicationName = HttpContext.Current.Request.ApplicationPath;
        if (strApplicationName.Substring(strApplicationName.Length - 1, 1) != "/")
        {
            strHtml = strHtml.Replace("src=\"Doc/", "src=\"" + strApplicationName + "/Doc/");
        }
        else
        {
            strHtml = strHtml.Replace("src=\"Doc/", "src=\"" + strApplicationName + "Doc/");
        }
        strHtml = strHtml.Replace("src=\"/", "src=\"" + ShareClass.GetCurrentSiteRootPathNoSiteName());
        //LogClass.WriteLogFile(strHtml);
        builder.InsertHtml(strHtml);

        strChildDocSavePath = DateTime.Now.ToString("yyyyMM") + "\\" + HttpContext.Current.Session["UserCode"].ToString() + "\\Doc\\";

        strDocSavePath = HttpContext.Current.Server.MapPath("Doc") + "\\" + strChildDocSavePath; ;

        strFileName = "WordDoc" + Path.GetFileNameWithoutExtension(strDocID) + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".docx";

        // 保存Word文档
        doc.Save(strDocSavePath + strFileName);

        strFileURL = "Doc\\" + strChildDocSavePath + strFileName;

        return strFileURL;
    }

    //导入网页文件内容到字符串
    public static string ImportToStringFromFile(string filePath)
    {
        string fileContent = "", strContractFileURL;

        try
        {
            //string filePath = "path/to/your/file.txt";
            fileContent = File.ReadAllText(filePath);

            strContractFileURL = "Doc/" + DateTime.Now.ToString("yyyyMM") + "/" + HttpContext.Current.Session["UserCode"].ToString() + "/Doc/";

            fileContent = fileContent.Replace("src=\"", "src=\"" + ShareClass.GetCurrentSiteRootPath() + strContractFileURL);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

        return fileContent;
    }


}