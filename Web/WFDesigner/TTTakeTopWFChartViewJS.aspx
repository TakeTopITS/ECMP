<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopWFChartViewJS.aspx.cs" Inherits="WFDesigner_TTTakeTopWFChartViewJS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css"
        href="lib/jquery-ui-1.8.4.custom/css/smoothness/jquery-ui-1.8.4.custom.css"
        rel="stylesheet" />
    <script type="text/javascript"
        src="lib/jquery-ui-1.8.4.custom/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript"
        src="lib/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js"></script>

    <script type="text/javascript" src="lib/TakeTopFlowBase.js"></script>
    <script type="text/javascript" src="TakeTopFlowView.js"></script>
    <script type="text/javascript" src="TakeTopFlow.jpdtd.js"></script>
    <script type="text/javascript" src="TakeTopFlow.editors.js"></script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            text-align: left;
            font-family: Arial, sans-serif, Helvetica, Tahoma;
            font-size: 12px;
            line-height: 1.5;
            color: black;
            background-image: url(img/Backgroud.jpg);
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }



        .node {
            width: 70px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #fff;
        }

        .mover {
            border: 1px solid #ddd;
            background-color: #ddd;
        }

        .selected {
            background-color: #ddd;
        }

        .state {
        }

        #TakeTopFlow_props table {
        }

        #TakeTopFlow_props th {
            letter-spacing: 2px;
            text-align: left;
            padding: 6px;
            background: #ddd;
        }

        #TakeTopFlow_props td {
            background: #fff;
            padding: 6px;
        }

        #pointer {
            background-repeat: no-repeat;
            background-position: center;
        }

        #path {
            background-repeat: no-repeat;
            background-position: center;
        }

        #task {
            background-repeat: no-repeat;
            background-position: center;
        }

        #state {
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            LoadWFChart();
        });

        function printDiv(obj) {
            var newWindow = window.open("Print Window", "_blank");//打印窗口要换成页面的url
            var docStr = obj.innerHTML;
            newWindow.document.write(docStr);
            newWindow.document.close();
            newWindow.print();
            newWindow.close();
        }

        function autoHeight() {

            var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);

            document.body.clientHeight = parent.window.document.body.clientHeight - 45;
            document.body.clientWidth = "100%";

            var svgs = this.document.getElementsByTagName("svg");
            for (i = 0; i < svgs.length; i++) {

                svgs[i].style.width = "100%";
                svgs[i].style.height = "2148px";

            }
        }

    </script>
</head>
<body onload="autoHeight()" onresize="autoHeight()">
    <form id="form1" runat="server">
        <div id="TakeTopFlow_tools"
            style="position: absolute; top: 10; right: 10; background-color: #fff; width: 21px; cursor: default; padding: 3px;"
            class="ui-widget-content">
            <div class="node print" id="TakeTopFlow_print" onclick="printDiv(document.getElementById('TakeTopFlow'))" style="width: 21px; height: 21px;">
                <img src="img/print.png" alt="Print" width="21px" height="21px" />
            </div>
        </div>
        <%-- <div id="TakeTopFlow_props"
            style="position: absolute; top: 30; right: 50; background-color: #fff; width: 320px; padding: 3px;"
            class="ui-widget-content">
            <div id="TakeTopFlow_props_handle" class="ui-widget-header">属性</div>
            <table border="1" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>aaa</td>
                </tr>
                <tr>
                    <td>aaa</td>
                </tr>
            </table>
            <div>&nbsp;</div>
        </div>--%>

        <div id="TakeTopFlow" style="padding-top: 2px;">
        </div>

    </form>
</body>
</html>
