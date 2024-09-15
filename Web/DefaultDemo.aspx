<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultDemo.aspx.cs" Inherits="DefaultDemo" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="Logo/css/login.css" />
    <style>
        html, body {
            width: 100%;
            height: 100%;
            overflow: scroll;
            overflow: hidden;
        }
        .loginleft {
            width: 50%;
            height: 100%;
            background: url(Logo/loginbg.jpg) no-repeat 0px 0px;
            float: left;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            background-size: cover; 
            background-position: bottom;
        }

        .loginright {
            width: 50%;
            height: 100%;
            background: #fff;
            float: left;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        .Nfo{height: 100%;}
        .lfbox{ padding-right: 80px; margin-top: -100px;}
        .lfbox p{ height: 60px;font: 36px/60px "microsoft yahei";color: #fff;display: flex;justify-content: flex-end;}
        .lflogo{background: url(Logo/logo.png) no-repeat 120px center;padding-left: 80px;}
        input#TB_CheckCode {width: 100px;height: 34px;padding: 0 15px;font: 14px/34px "microsoft yahei";color: #9CABC1;
            display: inline-block;background: #ffffff;border-radius: 5px;border: 1px solid #E1E7ED;}
        center {width: 100%;height: 100%;display: flex;}
        select#ddlLangSwitcher {float: left;width: 75px;border: 0;font: 12px/24px "Arial";color: #9CABC1;}
        em.emt {width: 60px;display: block;float: left;line-height: 34px;padding-right: 5px;text-align: left; font-size: 14px;}
            </style>



    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script language="javascript" type="text/javascript">

        function is_iPad() {
            var ua = navigator.userAgent.toLowerCase();
            if (ua.match(/iPad/i) == "ipad") {
                return true;
            } else {
                return false;
            }
        }

        function clickLoginButton() {

            this.document.getElementById("BT_Login").click();
        }

        function displayQRCode() {
            this.document.getElementById["logoImg"].src = "ImagesSkin/TakeTopXMB.jpg"
        }

        function openMDIFrom(strMDIPageName) {

            //alert(strMDIPageName);
            window.open(strMDIPageName, '_top');

        }

    </script>
</head>
<body>
    <div id="wrapper">
        <div class="wrapper">
            <form id="form1" runat="server" class="Nfo">
                <div class="loginWrap">


                    <!-- <div class="logo">
                    <img runat="server" id="logoImg" src="Logo/SystemLogo.png" style="margin-right: 45px;"
                        alt="" />
                    </div>-->
                    <div class="loginleft">
                        <div class="lfbox">
                            <!-- <p class="lflogo">泰鼎拓顶</p> -->
                            <p><asp:Label ID="LB_SystemName" runat="server"></asp:Label></p>
                    </div>
                </div>
                    <div class="loginright">
                    <div class="loginForm clearfix">
                        <!-- <h3>taketop login</h3> -->
                        <p>
                            <em class="emt"><asp:Label ID="LB_UserID" runat="server" Text="<%$ Resources:lang,UserAccount%>"></asp:Label>:</em>
                            <asp:TextBox ID="TB_UserCode" runat="server" class="text"></asp:TextBox>
                        </p>
                        <p>
                            <em class="emt"><asp:Label ID="LB_Password" runat="server" Text="<%$ Resources:lang,PWD%>"></asp:Label>:</em>
                              <asp:TextBox ID="TB_PasswordBackup" runat="server" class="text"  Enabled="false"></asp:TextBox>
                            <asp:TextBox ID="TB_Password" runat="server" class="text" TextMode="Password" Visible="false"></asp:TextBox>
                        </p>
                        <p>
                            <em class="emt"><asp:Label ID="LB_Verification" runat="server" Text="<%$ Resources:lang,Verification%>"></asp:Label>:</em>
                            <em><asp:TextBox ID="TB_CheckCode" runat="server" class="textcode" Width="75px"></asp:TextBox></em>
                            <em><a href="#" class="codea"><asp:Image ID="IM_CheckCode" src="TTCheckCode.aspx" runat="server" /></a></em>
                            <asp:ImageButton ID="IB_GetSMS" runat="server" ImageUrl="~/Images/SMS.jpg" Width="22px"
                                Height="22px" OnClick="IB_GetSMS_Click" Visible="False" />
                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." style="text-align: center; display: none;" />
                            <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged">
                            </asp:DropDownList>
                        </p>
                        <p>
                            <asp:Button ID="BT_Login" runat="server" CssClass="btn" Text="<%$ Resources:lang,Login%>"
                                OnClick="LB_Login_Click" OnClientClick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';" />
                        </p>
                        <center>
                            
                            <em runat="server" id="emSAAS" visible="false"><a onclick="popShow('popDetailWindow','true')">
                                <asp:Label runat="server" Text="<%$ Resources:lang,MianFeiZhuCe%>"></asp:Label></a>
                                &nbsp;&nbsp; <a onclick="popShow('popwindow','true')">
                                    <asp:Label runat="server" Text="<%$ Resources:lang,ZhaoHuiMiMa%>"></asp:Label></a>
                       <%--         &nbsp;&nbsp;
                            <asp:LinkButton ID="LB_WeChatQRCode" runat="server" Text="<%$ Resources:lang,WeiXinDeng%>"
                                OnClick="LB_WeChatQRCode_Click"></asp:LinkButton>--%>
                                &nbsp;&nbsp;<asp:HyperLink ID="HL_UserManual" NavigateUrl="UserManual/TakeTopGLBGuide.zip"
                                    Text="<%$ Resources:lang,YongHuShouCe%>" runat="server"></asp:HyperLink>
                            </em><em class="copy">
                                <asp:Label ID="LB_Copyright" runat="server" Text="<a href=TTVersionRegister.aspx>Copyright© TakeTop Software</a> 2006-2026 <a href=https://www.taketopits.com>http://www.taketopits.com</a>"></asp:Label>
                            </em>
                        </center>
                    </div>
                </div>
                </div>
                <div class="footer">
                    <asp:HyperLink ID="HL_UserID" runat="server" Target="_blank"></asp:HyperLink>
                    <br />
                    <asp:Label ID="LB_Slogon" runat="server"></asp:Label>
                </div>
            </form>
        </div>
    </div>
    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv" style="z-index: 9999; width: 450px; height: 630px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
            <asp:Label ID="Label27" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
        </div>
        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
            <iframe src="TTUserPWDFindSAAS.aspx" style="width: 430px; height: 530px; border: none;"></iframe>
        </div>
        <!--<div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
    </div>-->
        <span class="layui-layer-setwin"><a onclick="return popCloseNoPromt();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab"
            href="javascript:;"></a></span>
    </div>
    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
        style="z-index: 9999; width: 450px; height: 630px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
            <asp:Label ID="Label1" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
        </div>
        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
            <iframe src="TTUserRegisteredSAAS.aspx" style="width: 430px; height: 530px; border: none;"></iframe>
        </div>
        <!--<div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
    </div>-->
        <span class="layui-layer-setwin"><a onclick="return popCloseNoPromt();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab"
            href="javascript:;"></a></span>
    </div>
    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;">
    </div>
</body>
</html>
