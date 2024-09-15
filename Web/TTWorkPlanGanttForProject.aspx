<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlanGanttForProject.aspx.cs" Inherits="TTWorkPlanGanttForProject" %>

<!DOCTYPE html>

<%
    String pid = (String)Request["pid"];
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title></title>

    <style type="text/css">
        #AboveDiv {
            z-index: 9999;
            min-width: 1600px;
            width: expression (document.body.clientWidth <= 1600? "1600px" : "auto" ));
            padding-top: 0;
            padding-left: 0;
            _position: absolute; /* for IE6 */
            _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }
    </style>


    <script type="text/javascript">
        var preFrameW = '950,*';
        var FrameHide = 0;

        var i = 950;
        var j = 50;

        var decreaseTimer;
        var creaseTimer;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").cols;

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").cols;

                if (preFrameW != '50,*') {

                    decreaseTimer = setInterval(decreaseLeftWidth, 1);
                    i = 950;
                    FrameHide = 0;
                    return;
                }
                else {

                    creaseTimer = setInterval(creaseLeftWidth, 1);
                    j = 50;
                    FrameHide = 0;

                }
            } else {

                creaseTimer = setInterval(creaseLeftWidth, 1);
                j = 50;

                FrameHide = 1;
                return;
            }
        }


        function decreaseLeftWidth() {

            i = i - 50;
            if (i >= 50) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }

        }

        function creaseLeftWidth() {

            j = j + 50;
            if (j <= 950) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }

            if (j == 950) {

                varPageName = parent.location.href;
                if (varPageName.indexOf("TTWorkPlanMain.aspx", 0) >= 0) {

                    varProjectID = getUrlParam("pid");
                    window.parent.frames["Left"].document.location = "TTWorkPlan.aspx?ProjectID=" + varProjectID;
                }

                return;
            }
        }
    </script>


    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--Ext and ux styles -->
    <link href="ext-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />

    <!--Scheduler styles-->
    <link href="ext-gantt/resources/css/sch-gantt-all.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        var varUserIsCanUpdatePlan = '<%=strUserIsCanUpdatePlan %>'.trim();
        var varSystemVerType = '<%=Session["SystemVersionType"].ToString() %>'.trim();
        var varProjectStatus = '<%=strProjectStatus %>'.trim();
        var varWeekendFirstDay, varWeekendSecondDay, varWeekendsAreWorkdays, varWeekendEndDay;
        var varLangCode = '<%=Session["LangCode"].ToString() %>'.trim();
        var varBusinessType = '<%=strBusinessType %>'.trim();


        varWeekendFirstDay =  '<%=Session["WeekendFirstDay"].ToString() %>'.trim();
        varWeekendSecondDay = '<%=Session["WeekendSecondDay"].ToString() %>'.trim();
        varWeekendsAreWorkdays = '<%=Session["WeekendsAreWorkdays"].ToString() %>'.trim();


        if (varWeekendsAreWorkdays == "true") {
            varWeekendsAreWorkdays = true;
        }
        else {
            varWeekendsAreWorkdays = false;
        }

        if (varWeekendSecondDay == 0) {
            varWeekendEndDay = 7;
        }
        else {
            varWeekendEndDay = varWeekendSecondDay;
        }

    </script>

    <!--Ext lib and UX components-->
    <script src="ext-min/ext-all-debug.js" type="text/javascript"></script>
    <script src="ext-gantt/gnt-all-debug.js" type="text/javascript" charset="gbk"></script>

    <script type='text/javascript'>
        //为了支持多个项目，pid为某个项目的项目编号
        var pid = 1;
        pid =<%=this.pid%>;

        //alert(CurrentUserCode);

        var g_start = new Date(<%=this.g_start%>);//这里一定要用数字类型
        var g_end = new Date(<%=this.g_end%>);

    </script>

    <!--调用不同的语言包 -->
    <script src="ext-min/locale/ext-lang-zh_CN.js" id="ExtLangID" type="text/javascript"></script>
    <script src="ext-gantt/gnt-lang-zh_CN.js" id="GntLangID" type="text/javascript"></script>
    <script type="text/javascript" src="ext-gantt/TakeTopGanttPanel.js"></script>

    <!--更换皮肤所需要的css文件 -->
    <link rel="stylesheet" href="css/project.css" type="text/css" />

    <!--应用程序的代码 -->
    <script type="text/javascript" src="ext-gantt/aspnet.js"></script>
    <script type="text/javascript" src="ext-gantt/advanced.js"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            ////关闭脱离框架的页面
            //if (top.location != self.location) { } else { CloseWebPage(); }

        });

        //选择语言
        function setLanguage() {
            var varLangCode = '<%=Session["LangCode"].ToString() %>'.trim();

            if (varLangCode == 'zh-CN') {
                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-min/locale/ext-lang-en.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-gantt/gnt-lang-EN.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "js/DemoGanttPanelForEnglish.js";
                oHead.appendChild(oScript);
            }

            if (varLangCode == 'en') {
                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-min/locale/ext-lang-en.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-gantt/gnt-lang-EN.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "js/DemoGanttPanelForEnglish.js";
                oHead.appendChild(oScript);
            }

            if (varLangCode == 'zh-tw') {
                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-min/locale/ext-lang-en.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "ext-gantt/gnt-lang-EN.js";
                oHead.appendChild(oScript);

                var oHead = document.getElementsByTagName('head').item(0);
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.src = "js/DemoGanttPanelForEnglish.js";
                oHead.appendChild(oScript);
            }
        }

        //取得链接传入参数的值
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);
            return null;
        }

        //改变计划图宽度
        function changeGanttChartProperty() {

            $(".x-tool-img.x-tool-collapse-left").click();


            try {
                $(".x-column-header-trigger").eq(3).click();
                $(".x-hmenu-sort-asc").click();
            }
            catch
            {
            }


            //document.getElementById($(".x-btn-icon-el.icon-prev").eq(0).closest("a").attr("id")).click()

            if (varBusinessType == "COMPARE") {

                //for (i = 0; i < 30; i++) {

                //    document.getElementById($(".x-btn-icon-el.icon-prev").eq(0).closest("a").attr("id")).click()
                //}

                document.getElementById($(".x-btn-icon-el.zoomfit").eq(0).closest("a").attr("id")).click()

                $(".x-toolbar.x-toolbar-docked-top").hide();

            }
        }

        //按日期排序
        function SortByDate() {

            $(".x-column-header-trigger").eq(3).click();;

        }

        Ext.onReady(function () {

            changeGanttChartProperty();

        });

    </script>

    <script src="js/jquery.PrintArea/jquery-1.10.2.js" type="text/JavaScript" language="javascript"></script>
    <script src="js/jquery.PrintArea/jquery-ui-1.10.4.custom.js"></script>
    <script src="js/jquery.PrintArea/jquery.PrintArea.js" type="text/JavaScript" language="javascript"></script>

</head>

<body>
    <div id="AboveDiv" align="left">
        <a href="javascript:ChangeMenu(0)"></a>
        <span style="font-size: x-small;">
            <asp:Label ID="LB_VersionID" runat="server" Text="<%$ Resources:lang,VersionID%>"></asp:Label>:

            <strong>
                <asp:Label ID="LB_VerID" runat="server"></asp:Label>(operable:<asp:Label ID="LB_UserIsCanUpdatePlan" runat="server" Text="True"></asp:Label>)
            </strong>

        </span>
        <div id="north" style="z-index: -2;">
        </div>
    </div>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
