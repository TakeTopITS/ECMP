<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultWeiXinSAASBackup.aspx.cs" Inherits="DefaultWeiXinSAASBackup" %>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body {
            margin-top: 60px;
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }


        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }

        input#TB_UserCode {
            border: none;
            border-bottom: 2px #249bf9 solid;
            line-height: 2em;
        }

        input#TB_Password {
            border: none;
            border-bottom: 2px #249bf9 solid;
            line-height: 2em;
        }
    </style>


    <style type="text/css">
        /*--------------------------------短按钮---------------------------*/
        .inpuLogon {
            /*background-image: url(ImagesSkin/Logon.jpg);*/
            margin: 0px;
            height: 30px;
            width: 100%;
            text-align: center;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            /*font-size: 12px;*/
            color: #29728D;
            background: #cbe5fe;
            border-radius: 5px;
        }

        .inpuRegister {
            background-image: url(ImagesSkin/Register.jpg);
            margin: 0px;
            height: 22px;
            width: 53px;
            text-align: center;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            /*font-size: 12px;*/
            color: #29728D;
        }

        a:link {
            /*font-size: 12px;*/
            text-decoration: none;
            color: #000000;
        }

        a:visited {
            background: url(ImagesSkin/MouseVisited.gif);
        }

        a:hover, button:hover, input[type="submit"]:hover {
            /*background: url(ImagesSkin/MouseHover.gif);*/
            background: #fe3c69;
            color: #FCF8F8;
        }

        a:active, button:active, input[type="submit"]:active {
            /*background: url(ImagesSkin/MouseActive.gif);*/
        }

        #info {
            height: 0px;
            width: 0px;
            top: 50%;
            left: 37%;
            position: absolute;
            background-image: url(login.png);
            background-repeat: no-repeat;
        }
    </style>

    <%--  <script type="text/javascript">
        window.onload = function () {
            if (document.documentElement.scrollHeight <= document.documentElement.clientHeight) {
                bodyTag = document.getElementsByTagName('body')[0];
                bodyTag.style.height = document.documentElement.clientWidth / screen.width * screen.height + 'px';
            }
            setTimeout(function () {
                window.scrollTo(0, 1)
            }, 0);
        };

    </script>--%>

    <script type="text/javascript" src="js/TakeTopCookie.js"> </script>
    <script type="text/javascript">
        window.onload = function () {


            //自动填充帐号和密码
            var userName = getCookie("loginUserName");
            var password = getCookie("loginPassword");

            if (userName != null) {
                document.getElementById("TB_UserCode").value = userName;
                document.getElementById("TB_Password").value = password;
            }

            if (document.documentElement.scrollHeight <= document.documentElement.clientHeight) {
                bodyTag = document.getElementsByTagName('body')[0];
                bodyTag.style.height = document.documentElement.clientWidth / screen.width * screen.height + 'px';
            }
            setTimeout(function () {
                window.scrollTo(0, 1);
            }, 0);


        };

        function RemmberUserNameAndPassord() {

            document.getElementById('IMG_Waiting').style.display = 'block';

            var userName = document.getElementById("TB_UserCode").value;
            var password = document.getElementById("TB_Password").value;

            setCookie("loginUserName", userName, 1000);
            setCookie("loginPassword", password, 1000);
        }

    </script>

</head>
<body bgcolor="#FFFFFF">
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="padding-left: 0px;">
                                    <img alt="" src="Logo/APPLoginLogo.png" width="100%" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="TB_UserCode" runat="server" Text="请输入你的登录帐号(UserCode)" onFocus="javascript:this.value='';document.getElementById('LB_ErrorMsg').style.display = 'none';" ForeColor="#cdcccc" class="dengl" Width="103%"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">&nbsp;</td>
                                <td style="text-align: left;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">&nbsp;</td>
                                <td style="text-align: left;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="TB_Password" runat="server" Text="******" TextMode="Password" onFocus="javascript:this.value='';document.getElementById('LB_ErrorMsg').style.display = 'none';" ForeColor="#cdcccc" class="dengl" Width="103%"></asp:TextBox>
                                    <asp:Label ID="LB_ErrorMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>

                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td style="text-align: right;">
                                    <asp:Label ID="LB_Verification" runat="server" Text="<%$ Resources:lang,Verification%>"></asp:Label>:
                                </td>
                                <td style="text-align: left;">
                                    <asp:TextBox ID="TB_CheckCode" runat="server" Style="width: 50px;" Height="18px"></asp:TextBox>
                                    <asp:Image ID="IM_CheckCode" src="TTCheckCode.aspx" runat="server"
                                        Style="width: 55px; height: 23px;" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">&nbsp;</td>
                                <td style="text-align: left;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">&nbsp;</td>
                                <td style="text-align: left;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <img id="IMG_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." style="text-align: center; display: none;" />
                                    <asp:Button ID="BT_Login" runat="server" CssClass="inpuLogon" Text="<%$ Resources:lang,Login%>" OnClientClick="RemmberUserNameAndPassord()"
                                        OnClick="LB_Login_Click" />

                                    <asp:ImageButton ID="IB_GetSMS" runat="server" ImageUrl="~/Images/SMS.jpg" Width="22px"
                                        Height="22px" OnClick="IB_GetSMS_Click" Visible="False" />
                                    <br />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" height="14"></td>
                            </tr>
                        </table>

                        <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <table width="100%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="LB_Copyright" runat="server" Text="Copyright© TakeTop Software 2006-2026 "></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">[
                                                  <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged" Style="height: 22px;">
                                                  </asp:DropDownList>
                                                ]
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td align="center">
                                                <br />
                                                <asp:HyperLink ID="HL_UserRegister" NavigateUrl="TTUserRegisteredSAAS.aspx" Text="<%$ Resources:lang,MianFeiZhuCe%>" runat="server"></asp:HyperLink>

                                                &nbsp;&nbsp;

                                                <asp:HyperLink ID="HL_FindPWD" NavigateUrl="TTUserPWDFindSAAS.aspx" Text="<%$ Resources:lang,ZhaoHuiMiMa%>" runat="server"></asp:HyperLink>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td align="center">
                                    <asp:Label ID="LB_WeChatOpenID" runat="server" Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 45%; top: 40%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <%--  <img src="Images/Processing.gif" alt="Loading,please wait..." />--%>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
</html>

