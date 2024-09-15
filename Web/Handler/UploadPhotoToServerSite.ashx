<%@ WebHandler Language="C#" Class="UploadPhotoToServerSite" %>

using System;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.Script.Serialization;

public class UploadPhotoToServerSite : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        string json = "";
        if (Request.Form["FileData"] != null)
        {
            string fileData = Request.Form["FileData"];
            string fileName = Request.Form["FileName"];

            string strFileName1, strExtendName;

            strFileName1 = fileName;//获取上传文件的文件名,包括后缀
            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);
            //string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;
            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".jpg";
            string strDocSavePath = HttpContext.Current.Server.MapPath("../Doc") + "\\UserPhoto\\";
            // strDocSavePath = strDocSavePath.Replace("Handler\\", "");

            string filePath = strDocSavePath + strFileName3;//文件路径

            string strPhotoURL = "<p><img src=Doc/UserPhoto/" + strFileName3 + " width=200 height=200 /></p>";
            FileInfo fi = new FileInfo(filePath);

            if (fi.Exists)
            {
                json = "存在相同的图片文件";
                //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "');</script>");
            }
            else
            {
                int delLength = fileData.IndexOf(',') + 1;
                string str = fileData.Substring(delLength, fileData.Length - delLength);
                Base64StringToImage(str, filePath);
                json = strPhotoURL;
            }
        }
        else
        {
            json = "图片数据为空,请检查！";
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZZYSCDWJ + "');</script>");
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write(json);

    }

    //base64编码的文本 转为    图片    
    private void Base64StringToImage(string txt, string filePath)
    {
        byte[] arr = Convert.FromBase64String(txt);

        MemoryStream ms = new MemoryStream(arr);
        Bitmap bmp = new Bitmap(ms);
        bmp.Save(filePath, ImageFormat.Jpeg);
        bmp.Dispose();
    }

    /// <summary>  
    /// 根据图片exif调整方向  
    /// </summary>  
    /// <param name="sm"></param>  
    /// <returns></returns>  
    public static Bitmap RotateImage(Stream sm)
    {
        Image img = Image.FromStream(sm);
        PropertyItem[] exif = img.PropertyItems;
        byte orien = 0;
        PropertyItem item = null;
        for (int i = 0; i < exif.Length; i++)
        {
            item = exif[i];
            if (item.Id == 274)
            {
                break;
            }
            if (i == exif.Length - 1)
            {
                item = null;
            }
        }

        if (item != null)
        {
            orien = item.Value[0];
        }
        switch (orien)
        {
            case 2:
                img.RotateFlip(RotateFlipType.RotateNoneFlipX);//horizontal flip  
                break;
            case 3:
                img.RotateFlip(RotateFlipType.Rotate180FlipNone);//right-top  
                break;
            case 4:
                img.RotateFlip(RotateFlipType.RotateNoneFlipY);//vertical flip  
                break;
            case 5:
                img.RotateFlip(RotateFlipType.Rotate90FlipX);
                break;
            case 6:
                img.RotateFlip(RotateFlipType.Rotate90FlipNone);//right-top  
                break;
            case 7:
                img.RotateFlip(RotateFlipType.Rotate270FlipX);
                break;
            case 8:
                img.RotateFlip(RotateFlipType.Rotate270FlipNone);//left-bottom  
                break;
            default:
                break;
        }
        return (Bitmap)img;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}