using com.sun.corba.se.impl.protocol;

using System;
using System.Drawing;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ZXing;
using ZXing.Common;
using ZXing.QrCode;
using ZXing.QrCode.Internal;

public partial class TTAPPQRCodeForLocalSAAS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strAPPURL;

        strAPPURL = ShareClass.GetCurrentSiteRootPath() + "DefaultAPP.html".Replace(":443", "").Replace(":80", "");

        string strImageURL = ShareClass.GetQRCodeURLByZXingNet(strAPPURL, 300, 300);

        IMG_APPQRCode.ImageUrl = strImageURL;
        IMG_APPQRCode.AlternateText = strImageURL;

        LB_APPURL.Text = strAPPURL;

        if (strAPPURL.IndexOf("taketopits") < 0)
        {
            const bool V = false;
            TD_SAAS.Visible = V;
        }
    }
}