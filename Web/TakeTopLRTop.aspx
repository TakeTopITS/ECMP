<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeFile="TakeTopLRTop.aspx.cs" Inherits="TakeTopLRTop" %>

<%@ OutputCache Duration="2678400" VaryByParam="*" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="topCss" href="css/bluelighttop.CSS" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" language="javascript">

        jQuery.noConflict();
        var preFrameW = '250,*';
        var LeftFrameHide = 0;

        var i = 0;
        var j = 0;

        var decreaseTimer;
        var creaseTimer;

        var userAgentInfo = navigator.userAgent;

        function ChangeMenu(way) {

            if (way == 1) {

                if (window.parent.document.getElementById("TakeTopLRMDI").cols === '45,*') {

                    window.parent.document.getElementById("TakeTopLRMDI").cols = '250,*';

                    window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "yes");

                } else {

                    window.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';

                    window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "no");

                }
            }

            if (way == 3) {

                window.parent.document.getElementById("TakeTopLRMDI").cols = '250,*';

                window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "yes");

            }

            if (way == 4) {

                window.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';

                window.parent.document.getElementById("leftMiddleFrameID").setAttribute("scrolling", "no");

            }

        }

        function doNothing() {

            ChangeMenu(1);

            window.event.returnValue = false;
            return false;
        }

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 45) {
                window.parent.document.getElementById("TakeTopLRMDI").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 250) {
                window.parent.document.getElementById("TakeTopLRMDI").cols = j.toString() + ",*";
            }
        }


    </script>
</head>
<body >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="1000" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>
            <ContentTemplate>
                <div style="z-index: -2;width:100%;" onclick="avascript:ChangeMenu(1);">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td id="topTD" style="display: block;" height="45" valign="bottom">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="45" valign="top" style="text-align: center;">
                                                <asp:Image ID="IM_Logo" src="Logo/logoLR.png" Height="45px" runat="server" />
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                  
                </div>
                <div style="position: absolute; top: 10px; left: 2%; color: red; font-size: larger;">
                    <asp:Label ID="LB_Message" runat="server"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 40%; top: 30%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';
    var oLink = document.getElementById('topCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelighttop.CSS';
</script>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
<%--***--%>
<%--***--%>
<%--***--%>
