<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPQRCodeForLocalSAAS.aspx.cs" Inherits="TTAPPQRCodeForLocalSAAS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center" style="padding-top: 40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="<%$ Resources:lang,APPURLMiaoShu%>"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="<%$ Resources:lang,APPURLShouChang%>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding-top: 10px;">
                        <asp:Image ID="IMG_APPQRCode" runat="server" />

                        <br />

                        <asp:Label ID="LB_APPURL" runat="server" Font-Size="X-Large"></asp:Label>
                        <br />
                        <br />

                    </td>
                </tr>
                <tr id="TD_SAAS" runat="server">
                    <td align="center" style="padding-top: 10px;">

                        <p style="font-size: larger; font-weight: 400;"><b>泰顶拓鼎软件SAAS版本微信端APP使用方法 </b></p>

                        <br />
                        1、	如果你是在泰顶拓鼎网站上租用的泰顶拓鼎软件，那么可以用你的微信扫描下面的二维码关注：泰顶拓鼎  微信公众号
                         <br />
                        <br />
                        <img src="ImagesSkin/TakeTopWXGZHQRCode.png" style="width: 150px; height: 150px;" />
                        <br />
                        <br />
                        2、	点击公众号上的：管理平台，打开你的APP登录界面
                        <br />
                        <br />

                        3、	在登录界面第一行输入你的站点URL，第二行输入你的登录帐号，第三行输入密码，如下图：
                        <br />
                        <br />
                        <img src="ImagesSkin/TakeTopXMBURL.png" />
                        <br />
                        <img src="ImagesSkin/TakeTopAPPLoginWXGZHForSAAS.jpg" />
                        <br />


                        注：上面信息会保存在缓存里，第二次登录时会自动填充，不用重复输入！
                        <br />
                        <br />

                        4、	点击  登录 按钮，系统会自动登录你的APP，并且以后在平台推送给你的信息都会显示在这个公众号里！
                        <br />
                        <br />
                        <img src="ImagesSkin/TakeTopWXGZHForSAAS.jpg" />
                        <br />

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
