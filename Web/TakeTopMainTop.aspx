<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopMainTop.aspx.cs" Inherits="TakeTopMainTop" %>

<%@ OutputCache Duration="360" VaryByParam="*" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="topCss" href="css/bluelighttop.css" type="text/css" rel="stylesheet" />
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html {
            overflow-x: hidden;
            overflow-y: auto;
        }

        /*--------------------------------即时通提---------------------------*/
        .inpuIMOpen {
            background: url("ImagesSkin/TakeTopIMRunning.gif");
            margin: 0px;
            height: 20px;
            width: 20px;
            text-align: center;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            font-size: 12px;
            color: #29728D;
        }

        .inpuIMClose {
            background: url("ImagesSkin/TakeTopIMStop.png");
            margin: 0px;
            height: 20px;
            width: 20px;
            text-align: center;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            font-size: 12px;
            color: #29728D;
        }

        #divGuide {
            /*  margin-top: -6px;*/
            height: 39px;
        }

        #navlist {
            position: absolute;
            height: 31px;
            top: -10px;
        }

            #navlist li {
                float: left;
                display: inline;
                /*  margin: 2px 2px 2px 2px;*/
                padding-left: 10px;
            }

                #navlist li a:hover {
                    color: red;
                }

            #navlist a:link, #navlist a:visited {
                display: block;
                font: 14px/33px "微软雅黑", "黑体";
                color: #ffffff;
            }

            #navlist a.current:link, #nav a.current:visited {
                color: red;
                background: #017afb;
                padding: 3px;
            }

        .container {
            position: relative;
        }

        #div_username {
            /*  display: flex;*/
            align-items: center; /* 垂直居中 */
            color: white;
            font-size: 12px;
        }

        #div_updatepersoninfor img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* 让图标相对于其自身中心点定位 */
        }

    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>
    <script type="text/javascript">
        function opdg(id, htmlText) {

            var dg = new J.dialog({ id: id, title: 'TakeTopInformation', width: 250, height: 300, cancelBtn: false, html: htmlText, autoPos: false, fixed: false, left: 'right', top: 'bottom' });

            dg.ShowDialog();
        }

        function opim(id, chatterName, htmlText) {

            var dg = new J.dialog({ id: id, title: chatterName, width: 560, height: 570, btnBar: false, cancelBtn: false, page: htmlText, autoPos: { left: 'center', top: 'top' }, fixed: false, left: 'center', top: 'top', rang: true });

            dg.ShowDialog();
        }

        function opAdvert(id, url) {

            var dg = new J.dialog({ id: id, title: 'TakeTopIM', width: 250, height: 270, cancelBtn: false, page: url, link: true, autoPos: false, fixed: false, left: 'right', top: 'bottom' });

            dg.ShowDialog();
        }

        //关联所有子层
        function reloadPage(url) {

            /*  url = url.replace("?", "&");*/

            url = url.substring(url.indexOf("?") + 1, url.length);

            /*   alert(url);*/

            window.location.href = "TakeTopMainTop.aspx?" + url;
        }

        function ChangeMenu(way) {

            if (way == 1) {

                if (window.parent.document.getElementById("TakeTopLRMDI").cols === '45,*') {

                    window.parent.document.getElementById("TakeTopLRMDI").cols = '180,*';

                    window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "yes");

                    setExtendValue("YES");

                } else {

                    window.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';

                    window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "no");

                    setExtendValue("NO");

                }
            }

            if (way == 3) {

                window.parent.document.getElementById("TakeTopLRMDI").cols = '180,*';

                window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "yes");

                setExtendValue("YES");

            }

            if (way == 4) {

                window.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';
                setExtendValue("NO");

            }

        }

        //设置左边栏元素的值
        function setExtendValue(isFalse) {

            top.frames[0].frames[2].parent.frames["leftMiddleFrame"].setExtendValue(isFalse);

        }



    </script>
    <script type="text/javascript">
        var soundEmbed = null;
        function soundPlay(url) {
            if (soundEmbed)
                document.body.removeChild(soundEmbed);
            soundEmbed = document.createElement("embed");
            soundEmbed.setAttribute("src", "sound/" + url + ".mp3");
            soundEmbed.setAttribute("hidden", true);
            soundEmbed.setAttribute("autostart", true);
            document.body.appendChild(soundEmbed);
        }

        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        //弹出消息框
        function clickPopMsgWindow() {

            /* alert(this.document.getElementById("BT_PopMsg"));*/

            this.document.getElementById("BT_PopMsg").click();
        }


    </script>
</head>
<body class="sabd">
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="60000" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" />
                </Triggers>
                <ContentTemplate>
                    <div id="divBody" style="text-align: Left;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="35" font-size="Small" align="center" class="main_topbj" style="padding-right: 10px; padding-top: 8px;">
                                    <div id="divGuide">
                                        <table border="0" align="right" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="30%" align="left">
                                                    <table>
                                                        <tr>
                                                            <td id="TD_LeftBarExtend" width="70px" align="right" onclick="javascript: ChangeMenu(1);" style="padding-top: 2px; padding-right: 10px; font-size: small;">
                                                                <asp:ImageButton ID="IM_Extend" ImageUrl="ImagesSkin/extend.png" Width="23" Height="20" runat="server" />
                                                            </td>

                                                            <td style="width: 70%; color: white; text-align: left; font-size: small;">
                                                                <asp:Label ID="LB_SystemMsg" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right">
                                                    <table>
                                                        <tr>
                                                            <td width="20px" align="center" style="padding-top: 4px; padding-right: 10px;">
                                                                <asp:Button ID="BT_PopMsg" runat="server" CssClass="inpu" OnClick="BT_PopMsg_Click" Text="M" Width="23px" Height="20px" />
                                                            </td>
                                                            <td style="width: 10px;">
                                                            </td>
                                                            <td align="center" style="padding-top: 0px; padding-bottom: 0px;">
                                                                <a runat="server" class="titleSpan" href="javascript:top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTUpdateUserInfor.aspx', 'UserInformation', 800, 600, window.location);">
                                                                    <div class="container">
                                                                        <div id="div_username">
                                                                            <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                        </div>
                                                                        <div id="div_updatepersoninfor">
                                                                            <img src="ImagesSkin/UpdatePersonInfor.png" width="22" height="22">
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </td>
                                                            <td width="10px">&nbsp;</td>
                                                            <td width="20px" align="right">
                                                                <a runat="server" class="titleSpan" href="javascript:top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTAPPQRCodeForLocalSAAS.aspx', '', 800, 600,window.location);">
                                                                    <img src="ImagesSkin/App.png" width="22" height="22"></a>
                                                            </td>
                                                            <td align="right" style="display: none;">
                                                                <asp:Button ID="BT_OpenIMByPC" CssClass="inpuIMOpen" Visible="false" runat="server"
                                                                    OnClick="BT_OpenIMByPC_Click" />
                                                                <asp:Button ID="BT_CloseIMByPC" CssClass="inpuIMClose" Visible="false" runat="server"
                                                                    OnClick="BT_CloseIMByPC_Click" />
                                                                <asp:Button ID="BT_OpenIMByMobile" CssClass="inpuIMOpen" Visible="false" runat="server" />
                                                            </td>
                                                            <td width="10px">&nbsp;</td>
                                                            <td width="40px" align="center" style="padding-top: 0px; padding-bottom: 5px;">
                                                                <asp:ImageButton ID="IM_ExitSystem" ImageUrl="ImagesSkin/exit.png" Width="25" Height="23" OnClientClick="javascript:if (confirm(getExitMsgByLangCode())){top.location.href = 'Default.aspx';}" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <table style="width: 170px">

                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_CurrentUserCode" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:Label ID="lbl_FunInfoDialBoxNum" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">

                                        <asp:Label ID="LB_IsMobileDevice" runat="server"></asp:Label>

                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_SystemType" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <asp:Label ID="lbl_LogonNumber" runat="server" Visible="False" />
                                        <asp:Label ID="LB_CurrentUserType" runat="server" />
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:Label ID="lbl_sql" runat="server" Visible="False" />
                                        <asp:Label ID="LB_CssDirectory" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_ForbitModule" runat="server" />
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_MustInFrame" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_AutoSaveWFOperator" runat="server" />
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:Label ID="LB_SuperDepartString" runat="server"></asp:Label>
                                    </td>
                                </tr>

                            </table>
                            <asp:TextBox ID="TB_OldToBeHandledNumber" runat="server" Style="visibility: hidden"
                                Text="0"></asp:TextBox>
                            <asp:TextBox ID="TB_NewToBeHandledNumber" runat="server" Style="visibility: hidden"
                                Text="0"></asp:TextBox>
                        </asp:Panel>
                        <asp:Button ID="BT_Timer" runat="server" Style="display: none;" />
                        <asp:Label ID="LB_Timer" runat="server" Style="display: none;"></asp:Label>
                    </div>
                    <div id="sound_element">
                        <%--  <asp:Timer ID="Timer_SMS" runat="server" OnTick="Timer_SMS_Tick">
                        </asp:Timer>--%>
                    </div>
                    <div style="display: none;">
                        <asp:Label ID="LB_Copyright" runat="server"></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Version%>" Visible="false"></asp:Label>:<asp:Label ID="LB_VerType" runat="server" Visible="false"></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CurrentUser%>"></asp:Label>:<asp:Label
                            ID="LB_CurrentUserName" runat="server"></asp:Label>&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,SystemMessage%>"></asp:Label>：
                        <div id='blink' style="display: none;">
                            <a href="TTUnHandledCaseMain.aspx" target="_blank">+
                                <asp:Label ID="LB_UnHandledCase" runat="server" Target="_blank" Enabled="false"></asp:Label>
                            </a>
                        </div>
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Online%>"></asp:Label>：<asp:HyperLink ID="HL_ActiveUserCount"
                            Style="text-decoration: none;" runat="server" Target="rightTabFrame">0</asp:HyperLink>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </center>
    <%--  <script type="text/javascript" language="javascript">
        var intIntervalTime = document.getElementById("LB_Timer").innerHTML;
        setInterval("document.all('BT_Timer').click();", intIntervalTime);
    </script>--%>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
