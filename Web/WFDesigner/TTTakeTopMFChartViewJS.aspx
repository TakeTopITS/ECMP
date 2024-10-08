<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopMFChartViewJS.aspx.cs" Inherits="WFDesigner_TTTakeTopMFChartViewJS" %>

<%@ OutputCache Duration="2678400" VaryByParam="*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" href="lib/jquery-ui-1.8.4.custom/css/smoothness/jquery-ui-1.8.4.custom.css"
        rel="stylesheet" />

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

        .context-menu {
            display: none;
            position: absolute;
            background-color: white;
            border: 1px solid gray;
            padding: 5px;
            z-index: 9999;
        }

            .context-menu a {
                display: block;
                padding: 5px;
                text-decoration: none;
                color: black;
            }

                .context-menu a:hover {
                    background-color: #f5f5f5;
                }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%-- <script type="text/javascript" src="lib/jquery-ui-1.8.4.custom/js/jquery-1.4.2.min.js"></script>--%>
    <script type="text/javascript" src="lib/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js"></script>
    <script type="text/javascript" src="lib/TakeTopFlowBase.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlowView.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlow.jpdtd.js"></script>
    <script type="text/javascript" src="TakeTopModuleFlow.editors.js"></script>

    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            LoadWFChart();

        });

        ///*    --------------- 生成右键菜单--------------*/
        //$(document).ready(

        //    function () {
        //        const svgContainer = $('svg');
        //        const contextMenu = $('#contextMenu');

        //        // Listen for right-click events on the SVG container
        //        svgContainer.on('contextmenu', function (event) {
        //            // Prevent the default context menu from showing
        //            event.preventDefault();

        //            // Get the fill property of the clicked element
        //            const targetElement = findElementByFill(event, '#90ee90');
        //            const fillProperty = targetElement ? targetElement.getAttribute('fill') : null;

        //            // If the element with the specified fill value is found, proceed
        //            if (fillProperty) {

        //                // Send an AJAX request to the server-side handler
        //                $.ajax({
        //                    url: '../Handler/GetPageModuleDataForGanttChartRightMemu.ashx?LangCode=zh-CN',
        //                    type: 'GET',
        //                    data: { fill: fillProperty }, // Pass the fill property as a parameter
        //                    success: function (response) {
        //                        // Clear any existing menu items
        //                        contextMenu.empty();

        //                        // Populate the context menu with data from the server response
        //                        populateContextMenu(response);

        //                        // Position and show the context menu
        //                        const mouseX = event.clientX;
        //                        const mouseY = event.clientY;
        //                        contextMenu.css({
        //                            top: mouseY,
        //                            left: mouseX,
        //                            display: 'block'
        //                        });
        //                    },
        //                    error: function (error) {
        //                        console.error('Error fetching data:', error);
        //                    }
        //                });
        //            } else {
        //                console.log('No element with the specified fill was found.');
        //            }
        //        });

        //        // Function to populate the context menu
        //        function populateContextMenu(responseJson) {

        //            /* alert(data);*/

        //            if (responseJson) {

        //                var obj = JSON.parse(responseJson);

        //                for (var i = 0; i < obj.length; i++) {

        //                    var item = obj[i];

        //                    /*   alert(item.homemodulename);*/


        //                    var label = item.modulelabel + 'label';

        //                    const menuItem = $('<a>').text(item.homemodulename).attr('href', item.pagename).appendTo(contextMenu);

        //                    menuItem.on('click', function (event) {
        //                        // Optionally prevent default behavior (opening the link in the same tab)
        //                        // event.preventDefault();
        //                        // Open the link in a new tab or window
        //                        window.open(item.pagename, '_blank');
        //                    });

        //                }
        //            }
        //        }

        //        // Function to find the element by its fill property
        //        function findElementByFill(event, fillValue) {

        //            const targetElement = event.target;

        //            if (targetElement && targetElement.tagName.toLowerCase() === 'rect' && targetElement.getAttribute('fill') === fillValue) {

        //                return targetElement;
        //            }

        //            return null;
        //        }

        //        // Hide the context menu when clicking outside of it
        //        $(document).on('click', function (event) {
        //            if (!$(event.target).closest('#contextMenu').length) {
        //                contextMenu.hide();
        //            }
        //        });
        //    });



        function autoHeight() {

            var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);

            //document.body.clientHeight = parent.window.document.body.clientHeight - 45;
            //document.body.clientWidth = "100%";

            var svgs = this.document.getElementsByTagName("svg");
            for (i = 0; i < svgs.length; i++) {

                /*  svgs[i].style.width = "80%";*/
                /* svgs[i].style.height = "2148px";*/

            }
        }

        function printDiv(obj) {
            var newWindow = window.open("Print Window", "_blank"); //打印窗口要换成页面的url
            var docStr = obj.innerHTML;
            newWindow.document.write(docStr);
            newWindow.document.close();
            newWindow.print();
            newWindow.close();
        }
    </script>
</head>
<body onload="autoHeight()" onresize="autoHeight()">
    <form id="form1" runat="server">

        <div id="TakeTopFlow_tools"
            style="position: absolute; top: 10; right: 10; background-color: #fff; width: 21px; cursor: default; padding: 3px; display: none;"
            class="ui-widget-content">
            <div class="node print" id="TakeTopFlow_print" onclick="printDiv(document.getElementById('TakeTopFlow'))" style="width: 21px; height: 21px;">
                <img src="img/print.png" alt="Print" width="21px" height="21px" />
            </div>
        </div>
        <div id="TakeTopFlow" style="padding-top: 5px; text-align: center;">
        </div>

        <%------右键菜单------%>
        <div id="contextMenu" class="context-menu">
            <!-- Context menu items will be dynamically added here -->
        </div>

    </form>
</body>
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
