using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTSendSMSByAliYun : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strAccessKeyId, strAccessKeySecret,strSignName, strPhoneNumber, strMessage;

        strAccessKeyId = Request.QueryString["AccessKeyID"];
        strAccessKeySecret = Request.QueryString["AccessKeySecret"];
        strSignName = Request.QueryString["SignName"];

        strPhoneNumber = Request.QueryString["PhoneNumber"];
        strMessage = Request.QueryString["Message"];

        try
        {
            MsgAliYunSMS.sendSmsToSingle(strAccessKeyId, strAccessKeySecret, strSignName, strPhoneNumber, strMessage);
        }
        catch
        {

        }
    }
}