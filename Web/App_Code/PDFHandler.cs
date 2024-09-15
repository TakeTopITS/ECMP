
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

using System.Data;
using System.IO;
using System.Text;
using System.Web;

/// <summary>
/// AddWaterMarkToPDF 的摘要说明
/// </summary>
public static class PDFHandler
{
    //加水印

    public static void AddWatermark(string inputFile, string outputFile, string watermarkText)
    {
        using (var reader = new PdfReader(inputFile))
        using (var stamper = new PdfStamper(reader, new FileStream(outputFile, FileMode.Create)))
        {
            string FontPath = System.Web.Hosting.HostingEnvironment.MapPath("~/Font/");

            var font = BaseFont.CreateFont(FontPath + "simyou.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

            //var font = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD,BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            var graphicsState = new PdfGState { FillOpacity = 0.4f, StrokeOpacity = 0.4f };

            for (var i = 1; i <= reader.NumberOfPages; i++)
            {
                var pageRectangle = reader.GetPageSizeWithRotation(i);
                var pdfData = stamper.GetOverContent(i);

                pdfData.SaveState();
                pdfData.SetGState(graphicsState);
                pdfData.SetColorFill(BaseColor.GRAY);
                pdfData.SetFontAndSize(font, 60);

                var x = (pageRectangle.Left + pageRectangle.Right) / 2;
                var y = (pageRectangle.Top + pageRectangle.Bottom) / 2;

                pdfData.BeginText();
                pdfData.ShowTextAligned(Element.ALIGN_CENTER, watermarkText, x, y, 45);
                pdfData.EndText();

                pdfData.RestoreState();
            }
        }
    }


    public static void AddWaterMarkToPDF(string strInputFile, string strOutputFile, string strWatermarkText)
    {
        //var inputFile = "input.pdf";
        //var outputFile = "output.pdf";
        //var watermarkText = "Confidential";

        AddWatermark(strInputFile, strOutputFile, strWatermarkText);
    }


    //从数据库取数据生成PDF文件
    public static void GeneratePdfDocumentFromDB(string strHQL)
    {
        Document document = new Document();
        PdfWriter writer = PdfWriter.GetInstance(document, new FileStream("output.pdf", FileMode.Create));
        document.Open();

        Font font = FontFactory.GetFont(FontFactory.HELVETICA, 12, Font.NORMAL);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DB");

        foreach (DataRow row in ds.Tables[0].Rows)
        {
            foreach (DataColumn col in ds.Tables[0].Columns)
            {
                document.Add(new Paragraph(row[col.ColumnName].ToString(), font));
            }
        }
    }

    //从HTML生成PDF文件
    public static void ConvertHtmlToPdf(string htmlContent, string outputPath)
    {
        using (FileStream stream = new FileStream(outputPath, FileMode.Create))
        {
            Document pdfDoc = new Document(PageSize.A4);
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
            pdfDoc.Open();

            string strApplicationName = HttpContext.Current.Request.ApplicationPath;
            if (strApplicationName.Substring(strApplicationName.Length - 1, 1) != "/")
            {
                htmlContent = htmlContent.Replace("src=\"Doc/", "src=\"" + strApplicationName + "/Doc/");
            }
            else
            {
                htmlContent = htmlContent.Replace("src=\"Doc/", "src=\"" + strApplicationName + "Doc/");
            }
            htmlContent = htmlContent.Replace("src=\"/", "src=\"" + ShareClass.GetCurrentSiteRootPathNoSiteName());

            byte[] data = Encoding.UTF8.GetBytes(htmlContent);//字串转成byte[]  
            MemoryStream msInput = new MemoryStream(data);

            ////使用XMLWorkerHelper把Html parse到PDF档里  
            //XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, msInput, null, Encoding.UTF8, new UnicodeFontFactory());

            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, msInput, null, Encoding.UTF8);

            pdfDoc.Close();
        }
    }

    public class UnicodeFontFactory : FontFactoryImp
    {

        public override Font GetFont(string fontname, string encoding, bool embedded, float size, int style, BaseColor color, bool cached)
        {
            string FontPath = System.Web.Hosting.HostingEnvironment.MapPath("~/Font/");

            BaseFont bfYaHei = BaseFont.CreateFont(FontPath + "arial.ttf,1", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            return new Font(bfYaHei, size, style, color);
        }
    }
}
