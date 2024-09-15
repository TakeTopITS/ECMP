<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlanGanttForProjectStandardActivityCompareMain.aspx.cs" Inherits="TTWorkPlanGanttForProjectStandardActivityCompareMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">

        var ifameLoadTimer = null;
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            checkIframeLoad();

        });

        var varSystemVerType = '<%=Session["SystemVersionType"].ToString() %>'.trim();

        function checkIframeLoad() {
            if (ifameLoadTimer) {
                clearTimeout(ifameLoadTimer);
            }


            if ($("#IFrame_ActivityGanttPlan").contents().find(".x-grid-view").length > 0
                && $("#IFrame_StandardGanttPlan").contents().find(".x-grid-view").length > 0) {
                $("#IFrame_ActivityGanttPlan").contents().find(".x-grid-view").scroll(function () {

                    setScroll(1, $(this).scrollTop(), $(this).scrollLeft());
                });
                $("#IFrame_StandardGanttPlan").contents().find(".x-grid-view").scroll(function () {

                    setScroll(2, $(this).scrollTop(), $(this).scrollLeft());
                });
            }
            else {
                ifameLoadTimer = setTimeout("checkIframeLoad()", 250);
            }
        }

        function setScroll(type, scrollTop, scrollLeft) {
            if (type == 1) {
                $("#IFrame_StandardGanttPlan").contents().find(".x-grid-view").scrollTop(scrollTop);
                $("#IFrame_StandardGanttPlan").contents().find(".x-grid-view").scrollLeft(scrollLeft);
            }
            else {
                $("#IFrame_ActivityGanttPlan").contents().find(".x-grid-view").scrollTop(scrollTop);
                $("#IFrame_ActivityGanttPlan").contents().find(".x-grid-view").scrollLeft(scrollLeft);
            }

        }

        function autoheight() { //函数：获取尺寸
            //获取浏览器窗口高度
            var winHeight = 0;
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;

            if (document.documentElement && document.documentElement.clientHeight)
                winHeight = document.documentElement.clientHeight;

            document.getElementById("IFrame_StandardGanttPlan").style.height = (winHeight - 30) + "px";
            document.getElementById("IFrame_ActivityGanttPlan").style.height = (winHeight - 30) + "px";
        }

        window.onresize = autoheight; //浏览器窗口发生变化时同时变化DIV高度
    </script>

</head>
<body onload="autoheight()">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td style="width: 50%;">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XianZhuang%>"></asp:Label>
                    <br />
                    <iframe id="IFrame_ActivityGanttPlan" runat="server" style="width: 100%; overflow: auto;"></iframe>

                </td>
                <td style="width: 50%;">
                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiZhun%>"></asp:Label>
                    <br />
                    <iframe id="IFrame_StandardGanttPlan" runat="server" style="width: 100%; overflow: auto;"></iframe>

                </td>

            </tr>
        </table>

    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
