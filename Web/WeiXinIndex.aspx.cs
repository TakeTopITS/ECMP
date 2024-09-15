using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class WeiXinIndex : System.Web.UI.Page
{
    ////与微信公众账号后台的Token设置保持一致，区分大小写。
    //private readonly string Token = "TakeTopMISToken";

    protected void Page_Load(object sender, EventArgs e)
    {
        string strToken;

        WeiXinStand weiXinStand = TakeTopCore.WXHelper.GetWeiXinStand();
        if (weiXinStand != null)
        {
            //strToken = weiXinStand.TokenValue.Trim();

            strToken = TakeTopCore.WXHelper.GetAccessToken();

            Auth(strToken);
        }
    }

    /// <summary>
    /// 处理微信服务器验证消息
    /// </summary>
    private void Auth(string strToken)
    {
        string signature = Request["signature"];
        string timestamp = Request["timestamp"];
        string nonce = Request["nonce"];
        string echostr = Request["echostr"];

        if (Request.HttpMethod == "GET")
        {
            //get method - 仅在微信后台填写URL验证时触发
            if (CheckSignature.Check(signature, timestamp, nonce, strToken))
            {
                WriteContent(echostr); //返回随机字符串则表示验证通过
            }
            else
            {
                WriteContent("failed:" + signature + "," + CheckSignature.GetSignature(timestamp, nonce, strToken) + "。" +
                            "如果你在浏览器中看到这句话，说明此地址可以被作为微信公众账号后台的Url，请注意保持Token一致。");
            }
            Response.End();
        }
    }

    private void WriteContent(string str)
    {
        Response.Output.Write(str);
    }
}
