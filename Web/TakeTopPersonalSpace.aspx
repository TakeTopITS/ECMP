<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeFile="TakeTopPersonalSpace.aspx.cs" Inherits="TakeTopPersonalSpace" %>

<%@ OutputCache Duration="2678400" VaryByParam="*" %>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>PersonalSpace</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*  #AboveDiv {
            min-width: 1180px;
            width: expression (document.body.clientWidth <= 1180? "1180px" : "auto" ));
            text-align: center;
        }*/

        @-moz-document url-prefix() {
            /*      #divGuide {
                margin-top: -11px;
            }*/
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
                #65533:;
                #65533:;
                #65533:;
                #65533:;
                #65533:;
                #65533:;
                #65533:;
                display: block;
                color: #ffffff;
                font-style: normal;
                font-variant: normal;
                font-weight: normal;
                font-size: 14px;
                line-height: 33px;
                font-family: &#930;
                #378:;
                #65533:;
            }

            #navlist a.current:link, #nav a.current:visited {
                color: red;
                background: #017afb;
                padding: 3px;
            }




        /*����*/
        #nav1 {
            width: 98%;
            height: 323px;
            background: #fff;
            border-radius: 8px;
            margin: 15px 0;
            box-shadow: 0px 0px 15px rgb(0 0 0 / 15%);
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        /*����*/
        #nav2 {
            width: 98%;
        }

        #navlist2 li {
            flex: 0 0 49.5%;
            margin: 0;
            list-style: none;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgb(0 0 0 / 15%);
            margin-bottom: 20px;
        }

        ul#navlist2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            padding: 0;
        }

        .cline {
            height: 6px;
            width: 100%;
            background: linear-gradient(90deg, #D53E54 0%, #057BF9 100%);
            border-radius: 8px 8px 0px 0px;
        }

        .SpaceLine {
            height: 20px;
            background-color: #EFF2F7;
        }

        .NflexBox {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            width: 100%;
            height: 95%;
            align-content: flex-start;
        }

        #UpdatePanel1 td {
            border: 0px !important;
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

        .TextColor {
            color: red;
            background: #017afb;
            padding: 3px;
        }
    </style>

    <script type="text/javascript" src="css/tab.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function ChangeMenu(way) {

            if (way == 1) {

                if (window.parent.parent.document.getElementById("TakeTopLRMDI").cols === '45,*') {

                    window.parent.parent.document.getElementById("TakeTopLRMDI").cols = '180,*';

                    window.parent.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "yes");

                    setExtendValue("YES");

                } else {

                    window.parent.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';

                    window.parent.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "no");

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



        //弹出消息框
        function clickPopMsgWindow() {

            top.frames[0].frames[2].parent.frames["rightTopFrame"].clickPopMsgWindow();
        }


        //设置屏幕状态
        var varScreenFull = false;
        function setScreenStatus() {

            if (varScreenFull == false) {

                fullScreen();

            }
            else {

                exitScreen();

            }
        }

        //全屏
        function fullScreen() {

            var el = top.document.documentElement;
            var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen;

            //typeof rfs != "undefined" && rfs
            if (rfs) {
                rfs.call(el);
            }
            else if (typeof window.ActiveXObject !== "undefined") {
                //for IE&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#693;&#65533;&#65533;&#65533;&#65533;&#291;&#65533;&#65533;&#65533;&#752;&#65533;&#65533;&frac14;&#65533;&#65533;&#821;&#65533;F11&#65533;&#65533;&#697;&#65533;&#65533;&#65533;&#65533;&#65533;&#555;&#65533;&#65533;
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript != null) {
                    wscript.SendKeys("{F11}");
                }
            }

            varScreenFull = true;

        }

        //退出全屏
        function exitScreen() {

            var el = document;
            var cfs = el.cancelFullScreen || el.webkitCancelFullScreen || el.mozCancelFullScreen || el.exitFullScreen;

            //typeof cfs != "undefined" && cfs
            if (cfs) {
                cfs.call(el);
            }
            else if (typeof window.ActiveXObject !== "undefined") {
                //for IE&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;fullScreen&#65533;&#65533;&#876;&#65533;&#65533;&#291;&#65533;&#11316;&#65533;&#65533;F11&#65533;&#65533;&#65533;&#755;&#65533;&#555;&#65533;&#65533;
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript != null) {
                    wscript.SendKeys("{F11}");
                }
            }

            varScreenFull = false;

        }

        function OnMouseDownEvent(obj) {

            jQuery(obj).parent().parent().find("a").removeClass("current");
            jQuery(obj).parents().find("span").removeClass("TextColor");
            jQuery(obj).addClass("current");
        }


    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div id="divGuide" class="nav">
                <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="1000" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" />
                    </Triggers>
                    <ContentTemplate>
                        <ul id="navlist">
                            <li style="padding-top: 7px;">
                                <asp:ImageButton ID="IM_Extend" ImageUrl="ImagesSkin/extend.png" Width="23" Height="20"
                                    OnClientClick="javascript: ChangeMenu(1);" runat="server" />
                            </li>
                            <asp:Repeater ID="RP_NewsTypeList" runat="server" OnItemCommand="RP_NewsTypeList_ItemCommand">
                                <ItemTemplate>
                                    <li>
                                        <asp:HyperLink ID="HL_NavBar" runat="server" onmousedown="OnMouseDownEvent(this)" Style="text-decoration: none;" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"PageName").ToString().Trim() + "?Type=" +  DataBinder.Eval(Container.DataItem,"Type").ToString().Trim() + "&HomeName=" +  DataBinder.Eval(Container.DataItem,"HomeName").ToString().Trim () +"&Flag=" + Session["SkinFlag"].ToString() %>'
                                            Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>' Target="IF_NewsList">
                                        </asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <table border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="20px" align="center" style="padding-top: 10px;">
                            <asp:Button ID="BT_PopMsg" runat="server" CssClass="inpu" OnClientClick="javascript:clickPopMsgWindow();"
                                Text="M" Width="23px" Height="20px" />
                        </td>
                        <td style="width: 20px;"></td>
                        <td align="center" style="padding-top: 7px; padding-bottom: 0px;">
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
                        <td style="width: 5px;"></td>
                        <td width="40px" align="center" style="padding-top: 7px; padding-bottom: 4px;">
                            <a runat="server" class="titleSpan" href="javascript:top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTSystemAnalystChartRelatedUserSet.aspx?FormType=PersonalSpacePage', 'AnalysisChartSelect', 800, 600, window.location);">
                                <img src="ImagesSkin/AnalystChart.png" width="22" height="22"></a>
                        </td>
                        <td width="40px" align="center" style="padding-top: 7px; padding-bottom: 5px;">
                            <a runat="server" class="titleSpan" href="javascript:top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTPersonalSpaceModuleSetForUser.aspx', 'ModuleSelect', 800, 600, window.location);">
                                <img src="ImagesSkin/ModuleSelect.png" width="22" height="22"></a>
                        </td>
                        <td width="40px" align="center" style="padding-top: 7px; padding-bottom: 5px;">
                            <a runat="server" class="titleSpan" href="javascript:top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTAPPQRCodeForLocalSAAS.aspx', '', 800, 600,window.location);">
                                <img src="ImagesSkin/App.png" width="22" height="22"></a>
                        </td>
                        <td width="40px" align="center" style="padding-top: 7px; padding-bottom: 5px;">
                            <asp:ImageButton ID="IM_ExitSystem" ImageUrl="ImagesSkin/exit.png" Width="25" Height="23"
                                OnClientClick="javascript:if (confirm(getExitMsgByLangCode())){top.location.href = 'Default.aspx';}"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="NflexBox">
                <div id="nav1">
                    <iframe id="IF_NewsList" name="IF_NewsList" src='TTPersonalSpaceNews.aspx?Flag=<%=Session["SkinFlag"].ToString()%>'
                        style="width: 100%; height: 100%; text-align: center;" frameborder="no" marginwidth="0"
                        marginheight="0" scrolling="auto"></iframe>
                </div>
                <div id="nav2">

                    <ul id="navlist2">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <li>
                                    <div class="cline"></div>
                                    <iframe id="IF_Module" name="IF_Module" src='<%# DataBinder.Eval(Container.DataItem, "ModulePage") + "&Flag=" + Session["SkinFlag"].ToString()  %>'
                                        style="width: 100%; height: 350px;" frameborder="no" marginwidth="0" marginheight="0"
                                        scrolling="auto"></iframe>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';

    var oLink = document.getElementById('mainCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';
</script>
</html>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
<%--***--%>
