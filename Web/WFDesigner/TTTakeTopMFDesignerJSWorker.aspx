<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopMFDesignerJSWorker.aspx.cs" Inherits="WFDesigner_TTTakeTopMFDesignerJSWorker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" href="lib/jquery-ui-1.8.4.custom/css/smoothness/jquery-ui-1.8.4.custom.css"
        rel="stylesheet" />
    <script type="text/javascript" src="lib/jquery-ui-1.8.4.custom/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="lib/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js"></script>
    <script type="text/javascript" src="lib/TakeTopFlowBase.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlow.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlow.jpdtd.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlow.editors.js"></script>
    <script type="text/javascript" src="../js/popwindow.js"></script>

    <style type="text/css">
        body {
            margin: 0;
            pading: 0;
            text-align: left;
            font-family: Arial, sans-serif, Helvetica, Tahoma;
            font-size: 12px;
            line-height: 1.5;
            color: black;
            background-image: url(img/bg.png);
        }


        .node {
            width: 100px;
            text-align: left;
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


        .modalPopup {
            background-color: #EFF3FB;
            border-width: 10px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
            z-index: 999;
            height: 45px;
            line-height: 45px;
            position: fixed;
            top: 0; /* 距离顶部0像素 */
            right: 0; /* 距离右侧0像素 */
            width: 100%; /* 宽度可以根据需要调整 */
            overflow: visible;
        }
    </style>

    <script type="text/javascript" src="../js/layer/layer/layer.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            LoadWFChart();

        });

        var layerIndex;
        var curTaskText; //当前步骤的属性文本框

        ////显示树形弹窗  item 按钮dom
        function showModuleTree(item) {

            curTaskText = $(item).prev();

            var offset = $(item).offset();
            document.getElementById("divModuleSelect").style.top = (offset.top - 90) + "px";
            document.getElementById("divModuleSelect").style.left = (offset.left + 90) + "px";

            document.getElementById("divModuleSelect").style.display = "block";
        }

        //树形选择页面选择节点后调用方法
        function selectNode(nodeName, pageName) {

            curTaskText.val(nodeName);

            ////将页面地址绑定在控件上的url属性
            curTaskText.data("url", pageName);
            curTaskText.change();

            document.getElementById("divModuleSelect").style.display = "none";
        }

        function printDiv(obj) {
            var newWindow = window.open("Print Window", "_blank"); //打印窗口要换成页面的url
            var docStr = obj.innerHTML;
            newWindow.document.write(docStr);
            newWindow.document.close();
            newWindow.print();
            newWindow.close();
        }

        function displayWaitingImg(img) {

            this.document.getElementById(img).style.display = 'block';
        }

        function autoHeight() {

            var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);
            this.document.getElementById("_WFDesignerFrame").style.height = (b_height) + "px";
        }

        function hideDivModuleSelect() {

            document.getElementById("divModuleSelect").style.display = "none";
        }

        function hideTakeTopProps() {

            document.getElementById("TakeTopFlow_props").style.display = "none";
        }

    </script>
</head>
<body onload="autoHeight()" onresize="autoHeight()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
        <div id="TakeTopFlow_tools" style="position: absolute; top: 0; left: 10px; background-color: #fff; width: 100px; cursor: default; padding: 3px;"
            class="ui-widget-content">

            <div id="TakeTopFlow_tools_handle" style="text-align: center;" class="ui-widget-header">
                工具集(Tools)
            </div>
            <div class="node" id="TakeTopFlow_save" onclick="javascript:displayWaitingImg('img_processing');">
                <img src="img/save.gif" alt="saving..." />&nbsp;&nbsp;保存(Save)
                 <img id="img_processing" src="img/Processing.gif" alt="Loading,please wait..." style="display: none;" />
            </div>
            <div>
                <hr />
            </div>
            <div class="node selectable" id="pointer">
                <img src="img/select16.gif" />&nbsp;&nbsp;选择(Select)
            </div>
            <div class="node selectable" id="path" onclick="hideTakeTopProps()">
                <img src="img/16/flow_sequence.png" />&nbsp;&nbsp;连线(Line)
            </div>
            <div>
                <hr />
            </div>
            <div class="node state" id="start" type="start">
                <img src="img/16/start_event_empty.png" />&nbsp;&nbsp;开始(Start)
            </div>

            <div class="node state" id="task" type="task">
                <img src="img/16/task_empty.png" />&nbsp;&nbsp;步骤(Step)
            </div>
            <div class="node state" id="state" type="state">
                <img src="img/16/task_empty.png" />&nbsp;&nbsp;状态(Status)
            </div>
            <div class="node state" id="fork" type="fork">
                <img src="img/16/gateway_parallel.png" />&nbsp;&nbsp;分支(Branch)
            </div>
            <div class="node state" id="join" type="join">
                <img src="img/16/gateway_parallel.png" />&nbsp;&nbsp;合并(Merge)
            </div>
            <div class="node state" id="end" type="end">
                <img src="img/16/end_event_terminate.png" />&nbsp;&nbsp;结束(End)
            </div>
            <div class="node state" id="end-cancel" type="end-cancel">
                <img src="img/16/end_event_cancel.png" />&nbsp;&nbsp;取消(Cancel)
            </div>
            <div class="node state" id="end-error" type="end-error">
                <img src="img/16/end_event_error.png" />&nbsp;&nbsp;错误(Error)
            </div>
            <div>
                <hr />
            </div>
            <div class="node print" id="TakeTopFlow_print" onclick="printDiv(document.getElementById('TakeTopFlow'))">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;打印(Print)
            </div>
        </div>
        <div id="TakeTopFlow_props" style="position: absolute; top: 30; left: 30; background-color: #fff; width: 320px; padding: 3px;"
            class="ui-widget-content">
            <div id="TakeTopFlow_props_handle" class="ui-widget-header" style="left: 500;">
                属性(Property)
            </div>
            <table border="1" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>aaa
                    </td>
                </tr>
                <tr>
                    <td>aaa
                    </td>
                </tr>
            </table>
            <div>
                &nbsp;
            </div>
        </div>
        <div id="TakeTopFlow" style="padding-top: 5px;">
        </div>

        <div id="divModuleSelect" class="modalPopup" style="width: 250px; height: 520px; display: none;">

            <iframe id="iFrameModuleSelect" src="../TTModuleTreeSelectPage.aspx" style="width: 245px; height: 510px; overflow: hidden;"></iframe>


        </div>

    </form>
</body>
</html>
