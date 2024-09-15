using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Web;

// NOTE: If you change the class name "SessionService" here, you must also update the reference to "SessionService" in Web.config.
[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
[ServiceBehavior(IncludeExceptionDetailInFaults = true)]
public class SessionService
{
    public void DoWork()
    {
    }

    #region ISessionService Members

    [OperationContract]
    public object GetSessionValueForKey(string sessionKey)
    {
        return System.Web.HttpContext.Current.Session[sessionKey];
    }

    [OperationContract]
    public void SetSessionValueForKey(string sessionKey, object sessionValue)
    {
        System.Web.HttpContext.Current.Session[sessionKey] = sessionValue;
    }

    [OperationContract]
    public void UpdateWFDefition(string strTemName, string strWFXML)
    {
        string strHQL;

        strHQL = "Update T_WorkFlowTemplate Set WFDefinition = " + "'" + strWFXML + "'" + " Where TemName = " + "'" + strTemName + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);
        }
        catch
        {
        }
    }

    [OperationContract]
    public void SaveUserPhoto(string strUserCode, string strUserPhotoString)
    {
        if (strUserPhotoString != "")
        {
            var binaryData = Convert.FromBase64String(strUserPhotoString);

            string strDateTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            string strUserPhotoURL = "Doc\\" + "UserPhoto\\" + strUserCode + strDateTime + ".jpg";
            var imageFilePath = HttpContext.Current.Server.MapPath("Doc") + "\\UserPhoto\\" + strUserCode + strDateTime + ".jpg";

            if (File.Exists(imageFilePath))
            { File.Delete(imageFilePath); }
            var stream = new System.IO.FileStream(imageFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            stream.Write(binaryData, 0, binaryData.Length);
            stream.Close();

            string strHQL = "Update T_ProjectMember Set PhotoURL = " + "'" + strUserPhotoURL + "'" + " Where UserCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            //IM_MemberPhoto.ImageUrl = GetUserPhotoURL(strUserCode);
        }
    }

    [OperationContract]
    public void SaveWFChart(string strTemName, string strWFChartString)
    {
        if (strWFChartString != "")
        {
            var binaryData = Convert.FromBase64String(strWFChartString);

            string strDateTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            string strChartURL = "Doc\\" + "WorkFlowTemplate\\" + strTemName + strDateTime + ".jpg";
            var imageFilePath = HttpContext.Current.Server.MapPath("Doc") + "\\" + "WorkFlowTemplate\\" + strTemName + strDateTime + ".jpg";

            if (File.Exists(imageFilePath))
            { File.Delete(imageFilePath); }
            var stream = new System.IO.FileStream(imageFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            stream.Write(binaryData, 0, binaryData.Length);
            stream.Close();

            string strHQL = "Update T_WorkFlowTemplate Set ChartURL = " + "'" + strChartURL + "'" + " Where TemName = " + "'" + strTemName + "'";
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    [OperationContract]
    public string UpLoadFile(byte[] bytes, int len, string x, string y, string Width, string Height)
    {
        try
        {
            string fileid = System.Guid.NewGuid().ToString();
            string filename = fileid + ".png";
            string bigdir = HttpContext.Current.Server.MapPath("../") + "/Temporary/Images/";
            if (!System.IO.Directory.Exists(bigdir))
            {
                System.IO.Directory.CreateDirectory(bigdir);
            }

            MemoryStream ms = new MemoryStream(bytes);
            Image img = Image.FromStream(ms);

            Bitmap bitmap = new Bitmap(int.Parse(Width), int.Parse(Height), PixelFormat.Format32bppArgb);
            bitmap.MakeTransparent(Color.Black);

            Graphics graphics = Graphics.FromImage(bitmap);
            graphics.DrawImage(img, 0, 0, new Rectangle(int.Parse(x), int.Parse(y), int.Parse(Width), int.Parse(Height)), GraphicsUnit.Pixel);

            Image image = Image.FromHbitmap(bitmap.GetHbitmap());
            image.Save(bigdir + "/" + filename);

            return fileid;
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    [OperationContract]
    public void InsertLogonLog(string strSystemName)
    {
        string strUserHostAddress;

        strUserHostAddress = ShareClass.GetIPinArea(HttpContext.Current.Request.UserHostAddress.Trim());

        try
        {
            if (strSystemName == null)
            {
                //登录日志
                ShareClass.InsertUserLogonLog("WebSrv", "WEB服务", "WEB");
            }
            else
            {
                ShareClass.InsertUserLogonLog("SystemName", strSystemName, "WEB");
            }
        }
        catch
        {
            return;
        }
    }

    #endregion ISessionService Members
}