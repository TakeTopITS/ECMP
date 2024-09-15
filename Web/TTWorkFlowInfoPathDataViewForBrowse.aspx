<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowInfoPathDataViewForBrowse.aspx.cs" Inherits="TTWorkFlowInfoPathDataViewForBrowse" %>

<%@ Register Assembly="TakeTopForm.JS" Namespace="TakeTopInfoPathSoft.JS" TagPrefix="cc1" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calendar-en.js"></script>
    <script type="text/javascript" src="js/calendar-setup.js"></script>

    <script src="js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        .DemoTable {
            font-size: 10pt;
            font-family: 'Verdana';
        }

        .ToolBar {
            position: fixed !important;
            bottom: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background-color: ButtonFace;
            width: 100%;
            height: 30px;
        }


        @media print {
            .noprint {
                display: none;
                color: green;
            }
        }
    </style>

    <script type="text/javascript">
        var preFrameW = '850,*';
        var FrameHide = 0;

        var decreaseTimer;
        var creaseTimer;

        var way;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").rows;

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").rows;

                if (preFrameW != '175,*') {

                    window.parent.document.getElementById("bodyFrame").rows = '175,*';

                    FrameHide = 1;
                    return;
                }
                else {

                    window.parent.document.getElementById("bodyFrame").rows = '*,175';

                    FrameHide = 1;
                    return;
                }
            } else {

                window.parent.document.getElementById("bodyFrame").rows = preFrameW;

                FrameHide = 0;
                return;
            }
        }


        var i = 850;
        var j = 150;

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 150) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 850) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }
        }
    </script>
    <script type="text/javascript">

        function previewAll() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprintAll-->";
            eprnstr = "<!--endprintAll-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 21);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }


        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

        function setValue(m_strValue) {
            if (m_strValue != null && m_strValue != undefined) {
                txtReturnValue.value = m_strValue;
            }
        }

        function preview2() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint2-->";
            eprnstr = "<!--endprint2-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

        function clickSaveButton() {
            document.getElementById("BT_SaveXMLFile").click();
        }

        // 收缩展开效果
        function hideDivByApp() {

            var system = {

                win: false,

                mac: false,

                xll: false

            };

            //检测平台

            var p = navigator.platform;

            //alert(p);

            system.win = p.indexOf("Win") == 0;

            system.mac = p.indexOf("Mac") == 0;

            system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);

            //跳转语句
            if (system.win || system.mac || system.xll) {//转向后台登陆页面

            } else {

                document.getElementById("IMG_LRArrow").style.display = "none";

            }
        }

        //设置日期选择框的宽度，使之不折叠
        function changeDateBoxWidth() {
            var cNodes = document.getElementsByClassName("xdDTText xdBehavior_FormattingNoBUI");

            for (var i = 0; i < cNodes.length; i++) {

                cNodes[i].style.width = "110px";
            }
        }

        //存贮表单内容
        function SaveDIYFormDate() {

            if (this.document.getElementById('BT_BackupSaveXMLFile') != undefined) {

                this.document.getElementById('BT_BackupSaveXMLFile').click();
            }

        }

    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            $("#DIV_Container").width($("#xdoc").find(".xdLayout:eq(0)").width() + 150);
            //this.document.getElementById("DIV_Container").style.width = this.document.getElementById("xdoc").style.width;

            if (top.location != self.location) { } else { CloseWebPage(); }

            //依流程模板步骤定义的此函数设置表单各种属性
            try {
                setWorkflowForm();
            }
            catch (error) {
                errrorMsg = error;
            }
        });

        //显示或隐藏其它流程相关文档
        function changeProjectDocDataGridVisible() {
            if (document.getElementById('TR_OtherDoc').style.display == 'block') {
                document.getElementById('TR_OtherDoc').style.display = "none";
            }
            else {
                document.getElementById('TR_OtherDoc').style.display = 'block';
            }
        }

    </script>

</head>

<%--<body onload="TakeTopInfoPath_Init();hideDivByApp();">--%>
<body onload="TakeTopInfoPath_Init();hideDivByApp();" onclick="aHandlerForWorkflowDIYFormDataPopWindow(arguments[0])">
    <object id="factory" viewastext style="display: none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="smsx.cab#Version=6,3,434,26">
    </object>
    <form id="form1" runat="server">
        <a id="aPrintForm" runat="server" href="#" onclick="preview1()">
            <img src="ImagesSkin/print.gif" alt="打印" border="0" />Form
        </a>
        <cc1:JSInfoPathRefer ID="JSInfoPathRefer1" runat="server" />

<%--        <div id="DIV_Container" style="padding: 2px 0px 0px 0px; overflow: auto;">--%>
            <!--startprintAll-->
            <!--startprint1-->
            <table class="DemoTable">
                <tr>
                    <td style="text-align: left;">
                        <asp:DataGrid ID="DataGrid1" runat="server" Height="19px" Visible="False" Width="682px">
                            <PagerStyle CssClass="Page" HorizontalAlign="Left" />
                            <ItemStyle />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <div>
                            <asp:Label ID="xdoc" runat="server" EnableViewState="False" Text=""></asp:Label>
                        </div>
                        <!--endprint1-->
                    </td>
                </tr>
            </table>
            <!--endprintAll-->
      <%--  </div>--%>

        <asp:Literal ID="LIT_AttachUserJSCode" runat="server"></asp:Literal>
        <asp:Literal ID="LIT_AttachUserWFStepJSCode" runat="server"></asp:Literal>
        <asp:Label ID="LB_PublishUrl" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="LB_Uri" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="LB_XSNFile" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="LB_UnVisibleFieldXMLFile" runat="server" Visible="false"></asp:Label>
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'diywfui.css';</script>
</html>

