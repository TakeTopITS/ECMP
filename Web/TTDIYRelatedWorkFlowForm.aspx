<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDIYRelatedWorkFlowForm.aspx.cs" Inherits="TTDIYRelatedWorkFlowForm" %>

<%@ Register Assembly="TakeTopForm.JS" Namespace="TakeTopInfoPathSoft.JS" TagPrefix="cc1" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calendar-en.js"></script>
    <script type="text/javascript" src="js/calendar-setup.js"></script>

    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>

    <style type="text/css">
        .DemoTable {
            font-size: 10pt;
            font-family: 'Verdana';
        }

        /*  modal popup */
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup {
            background-color: #EFF3FB;
            border-width: 3px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
            width: 250px;
        }


        /*-----------------------------短按钮----------------------------*/
        .inpu {
            border-style: none;
            background-image: url('ImagesSkin/butbj.jpg');
            width: 71px;
            text-align: center;
            font-size: 12px;
            font-family: "microsoft yahei";
            margin: -2px 0;
            cursor: pointer;
            height: 25px;
            border-radius: 2px;
            color: #ffffff;
            background: #2e8ded; /*皮肤*/
        }

            .inpu:disabled {
                background: url('ImagesSkin/butbj.jpg');
                color: #cccccc;
                cursor: default;
            }

            .inpu[disabled] {
                background: url('ImagesSkin/butbj.jpg');
                color: #cccccc;
                cursor: default;
                height: 25px;
            }

            .inpu:disabled:hover {
                background: url('ImagesSkin/butbj.jpg');
                color: #cccccc;
            }

            .inpu[disabled]:hover {
                background: url('ImagesSkin/butbj.jpg');
                color: #cccccc;
            }


        table {
            border-collapse: separate;
            text-indent: initial;
            border-spacing: 2px;
        }

        .tdLeft {
            padding: 5px 5px 5px 5px;
            border-top: dotted 1px #D8D8D8;
            border-bottom: dotted 0px #D8D8D8;
            border-left: dotted 1px #D8D8D8;
            border-right: dotted 1px #D8D8D8;
        }

        .tdRight {
            padding 5px 5px 5px 5px:;
            border-top: dotted 1px #D8D8D8;
            border-bottom: dotted 0px #D8D8D8;
            border-left: dotted 1px #D8D8D8;
            border-right: dotted 1px #D8D8D8;
        }


        #DIV_Container {
            min-width: 1000px;
            width: expression (document.body.clientWidth <= 1000? "1000px" : "auto" ));
        }

            #DIV_Container table {
                border-collapse: separate;
                text-indent: initial;
                border-spacing: 2px;
                font-size: 10px;
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
    </style>

    <script type="text/javascript">
        function preview() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint-->";
            eprnstr = "<!--endprint-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
        }

        function setValue(m_strValue) {
            if (m_strValue != null && m_strValue != undefined) {
                txtReturnValue.value = m_strValue;
            }
        }

        function UpdateWorkflowPlanType() {

            var varWFID;
            var varIsMainPlan = "NO";

            varWFID = this.document.getElementById("LB_WLID").innerHTML;

            if (this.document.getElementById("CB_IsPlanMainWorkflow").checked) {
                varIsMainPlan = "YES";
            }
            else {
                varIsMainPlan = "NO";
            }

            $.ajax({
                type: "post",
                url: "Handler/UpdateWorkflowPlanType.ashx",
                data: { "IsMainPlan": varIsMainPlan, "WFID": varWFID },             //参数要对应       
                success: function (result) {
                    //alert(result);
                }
            });
        }
    </script>

    <script type="text/javascript">

        var isIE = (document.all) ? true : false;

        var $ = function (id) {
            return "string" == typeof id ? document.getElementById(id) : id;
        };

        var Class = {
            create: function () {
                return function () { this.initialize.apply(this, arguments); }
            }
        }

        var Extend = function (destination, source) {
            for (var property in source) {
                destination[property] = source[property];
            }
        }

        var Bind = function (object, fun) {
            return function () {
                return fun.apply(object, arguments);
            }
        }

        var BindAsEventListener = function (object, fun) {
            return function (event) {
                return fun.call(object, (event || window.event));
            }
        }

        function addEventHandler(oTarget, sEventType, fnHandler) {
            if (oTarget.addEventListener) {
                oTarget.addEventListener(sEventType, fnHandler, false);
            } else if (oTarget.attachEvent) {
                oTarget.attachEvent("on" + sEventType, fnHandler);
            } else {
                oTarget["on" + sEventType] = fnHandler;
            }
        };

        function removeEventHandler(oTarget, sEventType, fnHandler) {
            if (oTarget.removeEventListener) {
                oTarget.removeEventListener(sEventType, fnHandler, false);
            } else if (oTarget.detachEvent) {
                oTarget.detachEvent("on" + sEventType, fnHandler);
            } else {
                oTarget["on" + sEventType] = null;
            }
        };

        //拖放程序
        var SimpleDrag = Class.create();
        SimpleDrag.prototype = {
            //拖放对象,触发对象
            initialize: function (drag) {
                this.Drag = $(drag);
                this._x = this._y = 0;
                this._fM = BindAsEventListener(this, this.Move);
                this._fS = Bind(this, this.Stop);
                this.Drag.style.position = "absolute";
                addEventHandler(this.Drag, "mousedown", BindAsEventListener(this, this.Start));
            },
            //准备拖动
            Start: function (oEvent) {
                this._x = oEvent.clientX - this.Drag.offsetLeft;
                this._y = oEvent.clientY - this.Drag.offsetTop;
                addEventHandler(document, "mousemove", this._fM);
                addEventHandler(document, "mouseup", this._fS);
            },
            //拖动
            Move: function (oEvent) {
                this.Drag.style.left = oEvent.clientX - this._x + "px";
                this.Drag.style.top = oEvent.clientY - this._y + "px";
            },
            //停止拖动
            Stop: function () {
                removeEventHandler(document, "mousemove", this._fM);
                removeEventHandler(document, "mouseup", this._fS);
            }
        };

        jQuery.noConflict();
        jQuery(function () {

            jQuery("table:eq(0)").width(jQuery(document).width());

            jQuery("#btnNotWorkFlow").click(function () {
                jQuery("#tbName tr:gt(1)").remove();
                var strTemName = jQuery("#LLB_WorkFlowTemplate").val();
                if (strTemName != null && strTemName != "") {
                    jQuery.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Handler/GetNotToFormListHandler.ashx",
                        data: "strTemName=" + escape(strTemName),
                        success: function (json) {

                            var tbody = "";
                            jQuery.each(json, function (i, n) {
                                var trs = "";
                                trs += "<tr><td><label onclick='ClickCreateXMLToForm(" + n.TriggerID + ");' style=\"cursor:pointer\">" + n.Name + "</label></td></tr>";
                                tbody += trs;
                            });

                            if (tbody != null && tbody != "") {
                                jQuery("#idDrag").show();
                                jQuery("#tbName").append(tbody);
                                jQuery("#tbName tr:gt(1):odd").attr("class", "trodd");
                                jQuery("#tbName tr:gt(1):even").attr("class", "treven");
                            } else {
                                jQuery("#idDrag").hide();
                                alert("暂没有未处理的记录！");
                            }
                        },
                        error: function () {
                            alert("加载失败");
                        }
                    });
                } else {
                    alert("请先选择工作流模板！");
                }
            });
        });

        function ClickClosed() {
            jQuery("#idDrag").hide();
        }

        //产生XML，附加到表单
        function ClickCreateXMLToForm(objID) {
            document.getElementById("HF_TriggerID").value = objID;
            document.getElementById("BT_AppendXML").click();
        }

        //设置日期选择框的宽度，使之不折叠
        function changeDateBoxWidth() {
            var cNodes = document.getElementsByClassName("xdDTText xdBehavior_FormattingNoBUI");

            for (var i = 0; i < cNodes.length; i++) {

                cNodes[i].style.width = "110px";
            }
        }

        //逐步放大元素大小
        function toIncreaseSize(objID, largestSize) {

            document.getElementById(objID).style.width = largestSize + "px";
        }

        //一步还原元素大小
        function toRestoreOriginalSize(objID, oldSize) {

            document.getElementById(objID).style.width = oldSize + "px";
        }


    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

          <%--  var MustInFrame = '<%=Session["MustInFrame"].ToString() %>'.trim();
            if (MustInFrame == 'YES') {--%>
            if (top.location != self.location) { } else { CloseWebPage(); }
            //}

        });

        //隐藏或显示工作流标题栏
        function hideOrDisplayWFMain() {

            if (document.getElementById('td_WFMain').style.display == 'none') {
                document.getElementById('td_WFMain').style.display = 'block';
            }
            else {
                document.getElementById('td_WFMain').style.display = 'none';
            }
        }

        //隐藏工作流标题栏
        function hideWFMain() {

            /* document.getElementById('td_WFMain').style.display = 'none';*/
        }



    </script>

    <style type="text/css">
        .trodd {
            background: #fafafa;
        }

        .treven {
            background: #f4f4f4;
        }
    </style>

</head>
<%--<body onload="TakeTopInfoPath_Init();" oncontextmenu="return false">--%>
<body onload="TakeTopInfoPath_Init();changeDateBoxWidth();" onmousemove="changeDateBoxWidth();" onclick="aHandlerForWorkflowDIYFormDataPopWindow(arguments[0])">


    <script type="text/javascript">
        function autoClickActiveButton() {

            var aHref = document.getElementById("HL_WFChartView").href;
            if (aHref == "") {

                alert("请先选择工作流模板或工作流(Please select workflow template or workflow)!")
                return;
            }

            var autoActive = '<%= Session["AutoActiveWorkflow"].ToString() %>'.trim();

            if (autoActive == 'YES') {

                if (document.getElementById("BT_ActiveYes").disabled != "true")

                    document.getElementById("BT_ActiveYes").click();
            }
            else {

                document.getElementById("BT_ActiveYes").click();

                /* document.getElementById('bgLayer').style.display = 'block';*/

            }
        }

    </script>


    <center>
        <object id="factory" viewastext style="display: none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
            codebase="smsx.cab#Version=6,3,434,26">
        </object>
        <form id="form1" runat="server">
            <div style="z-index: -2;">
                <cc1:jsinfopathrefer id="JSInfoPathRefer1" runat="server" />
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td height="31" class="page_topbj" style="text-align: left;">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="LB_RunByWF" runat="server" Text="<%$ Resources:lang,RunByWF%>"></asp:Label>
                                    </td>
                                    <td ">[<asp:HyperLink ID="HL_AttachWFTemplate" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>" onclick ="HideAndDisplayCurrentlayerCloseButton('none')" Target="_self" Style="color: green;"> </asp:HyperLink>]
                                    </td>
                                    <td height="31" class="page_topbj" style="padding-left: 20px;">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_WLType" DataTextField="HomeName"
                                                        DataValueField="Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：

                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_WorkFlowTemplate" DataTextField="TemName" DataValueField="TemName" runat="server" OnSelectedIndexChanged="DL_WorkFlowTemplate_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="padding-left: 20px;">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_WorkFlow" DataTextField="WLName" DataValueField="WLID" runat="server" OnSelectedIndexChanged="DL_WorkFlow_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <td style="text-align: right; display: none;">
                                        <span style="cursor: pointer;">
                                            <img src="Images/NotWorkflow.png" id="btnNotWorkFlow" /></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td valign="top" style="padding: 5px 5px 30px 5px;" onmouseover="hideWFMain()">
                                        <!--startprint-->
                                        <table width="100%" class="DemoTable">
                                            <tr>
                                                <td>
                                                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" Width="100%" Font-Size="XX-Small">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderTemplate>
                                                            <table width="99%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="18%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongE%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="11%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="11%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="9%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="4" cellspacing="0" width="99%">
                                                                <tr>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 18%; text-align: left; padding-left: 5px">
                                                                        <%#DataBinder .Eval (Container .DataItem,"ConstractName") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem,"Amount") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem,"Status") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 11%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem,"PartA") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 11%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem,"PartB") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 8%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem, "StartDate","{0:yyyy/MM/dd}") %>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 8%; text-align: center">
                                                                        <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                    </td>
                                                                    <td class="tdLeft" style="width: 8%; text-align: center">
                                                                        <%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>
                                                                    </td>
                                                                    <td class="tdRight" style="width: 9%; text-align: center">
                                                                        <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HeTongNeiRong%>"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px">

                                                                        <div style="height: 200px; overflow-y: auto;">
                                                                            <%#DataBinder .Eval (Container .DataItem,"MainContent") %>
                                                                        </div>

                                                                        <%-- <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <a id="aDownload" href='<%#DataBinder.Eval(Container.DataItem, "MainContent") %>' target="_blank">
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                                                                    </a>

                                                                                </td>
                                                                                <td style="padding-left: 20px;">
                                                                                    <div id="divEdit" onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=<%# ShareClass.URLEncode(Eval("MainContent").ToString()) %>','fullscreen=yes;');">
                                                                                        <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>--%>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px">
                                                                        <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                                                                    </td>
                                                                </tr>
                                                                <%--  <tr>
                                                            <td class="tdLeft" colspan="11" style="text-align: left;">
                                                                    <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Constract&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>&IdentifyString= <%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Constract", Eval("ConstractID").ToString())) %>'>
                                                                        <asp:Label ID="Label249" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                                                    </a>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                                                   <a href='TTConstractRelatedDocView.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>'
                                                                       target="_blank">
                                                                       <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongWenDang%>"></asp:Label>&nbsp;&nbsp;</a>
                                                            </td>
                                                        </tr>--%>
                                                            </table>
                                                            <br />
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                        <ItemStyle CssClass="itemStyle" />
                                                    </asp:DataList>

                                                    <asp:DataList ID="DataList2" runat="server" Height="1px" CellPadding="0" Width="100%" ForeColor="#333333">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderTemplate>
                                                            <table width="99%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="18%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlCreator" runat="server" Text="<%$ Resources:lang,Creator%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlExpenseBudget" runat="server" Text="<%$ Resources:lang,ExpenseBudget%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlManhourBudget" runat="server" Text="<%$ Resources:lang,ManhourBudget%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlManpowerBudget" runat="server" Text="<%$ Resources:lang,ManpowerBudget%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dlStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table width="99%" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td style="width: 6%; text-align: center;" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                                    </td>
                                                                    <td style="width: 18%; text-align: left" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                                    </td>
                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                                    </td>
                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                                    </td>
                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                                    </td>
                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                                    </td>
                                                                    <td style="width: 12%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                                    </td>
                                                                    <td style="width: 12%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                    </td>
                                                                    <td style="width: 12%; text-align: center" class="tdLeft">
                                                                        <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                                    </td>
                                                                    <td style="width: 8%; text-align: center" class="tdRight">
                                                                        <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 6%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                        <asp:Label ID="dlDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>
                                                                    </td>
                                                                    <td colspan="9" style="text-align: left" class="tdRight">
                                                                        <span style="font-size: 9pt">
                                                                            <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                                    </td>
                                                                </tr>

                                                                <%--  <tr>
                                                            <td colspan="10" style="text-align: left; padding-left: 20px;" class="tdRight">
                                                                <a href='TTDocumentTreeView.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="_blank">
                                                                    <asp:Label ID="LB_dlRelatedDoc" runat="server" Text="<%$ Resources:lang,RelatedDoc%>"></asp:Label>
                                                                </a>
                                                                &nbsp;&nbsp;<a href='TTWorkPlanViewMain.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label></a>&nbsp;&nbsp;<a href='TTProjectSummaryAnalystChart.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                        target="DetailArea"><asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XiangMuShiTu%>"></asp:Label></a>
                                                                &nbsp;&nbsp;<a href='TTProRelatedUserSummary.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label246" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label></a>
                                                                &nbsp;&nbsp;<a href='TTProjectBudgetReport.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuYuSuan%>"></asp:Label></a>
                                                                &nbsp;&nbsp;
                                                                <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>&IdentifyString= <%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Project", Eval("ProjectID").ToString())) %>' target="DetailArea">
                                                                    <asp:Label ID="Label248" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                                                </a>
                                                            </td>
                                                        </tr>--%>
                                                            </table>
                                                            <br />
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                    </asp:DataList>

                                                    <asp:DataList ID="DataList3" runat="server" Height="1px" CellPadding="0" Width="100%" ForeColor="#333333">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderTemplate>
                                                            <table width="99%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="25%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>


                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>

                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                    </td>
                                                                    <td width="25%" align="left">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"Name") %>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"LeaderCode") %>'>
                                                                            <%#DataBinder .Eval (Container .DataItem ,"Leader") %>
                                                                        </a>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"start_date") %>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"end_date") %>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"Budget") %>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"Expense") %>
                                                                    </td>

                                                                    <td width="5%" align="left">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"percent_done") %>%
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                    </asp:DataList>

                                                    <asp:DataList ID="DataList4" runat="server" Height="1px" CellPadding="0" Width="100%" ForeColor="#333333">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <ItemTemplate>
                                                            <table style="width: 100%;" cellpadding="0" cellspacing="0" s>
                                                                <tr>
                                                                    <td valign="middle" style="width: 50%; border-right: solid 1px #D8D8D8; padding: 2px 2px 2px 2px;">
                                                                        <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 2px; background-color: white;"
                                                                            align="center">
                                                                            <tr>
                                                                                <td style="text-align: left; width: 15%;">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBianHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderCode") %>
                                                         
                                                                                </td>
                                                                                <td style="text-align: left; width: 10%;">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：</td>
                                                                                <td align="left" style="width: 30%;">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"ProjectName") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：</td>
                                                                                <td align="left" colspan="2">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"CompactCode") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBianDaiLi%>"></asp:Label>：</td>
                                                                                <td align="left" colspan="3">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingAgent") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                                <td align="left">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingAgentPhone") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label7" runat="server" Text="招标人"></asp:Label>：</td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"UserCode") %>
                                                                                </td>
                                                                                <td style="text-align: left; width: 15%;">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"UserCodePhone") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="display: none;">

                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XiaoShou%>"></asp:Label>：</td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"SalesCode") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                                <td align="left">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"SalesCodePhone") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label9" runat="server" Text="项目经理"></asp:Label>：</td>
                                                                                <td align="right" colspan="2">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td style="text-align: right; width: 30%;">

                                                                                                <%# DataBinder.Eval(Container.DataItem,"PMCode") %>
                                                                                            </td>
                                                                                            <td style="text-align: right; width: 50%;">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"PMName") %>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label10" runat="server" Text="技术负责人"></asp:Label>：</td>
                                                                                <td colspan="2" style="text-align: left;">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <%# DataBinder.Eval(Container.DataItem,"TechnicalDirectorCode") %>
                                                                                            </td>
                                                                                            <td>
                                                                                                <%# DataBinder.Eval(Container.DataItem,"TechnicalDirectorName") %>

                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label46" runat="server" Text="项目经办人"></asp:Label>：</td>
                                                                                <td align="right" colspan="2">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td style="text-align: right; width: 30%;">

                                                                                                <%# DataBinder.Eval(Container.DataItem,"PrincipalCode") %>
                                                                                            </td>
                                                                                            <td style="text-align: right; width: 50%;">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"PrincipalName") %>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label49" runat="server" Text="内外属性"></asp:Label>：</td>
                                                                                <td align="left" colspan="2">


                                                                                    <%# DataBinder.Eval(Container.DataItem,"InternalandExternal") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiaoShuGouMaiRiQi%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderBuyTime") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderBuyDay") %>
                                                                                </td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"IsTender") %>

                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label47" runat="server" Text="投标报价"></asp:Label>：</td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingPrice") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label48" runat="server" Text="控制价"></asp:Label>：</td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"ControlPrice") %>
                                                       
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BaoZhengJin%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"Margin") %>
                                                        
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BaoZhengJinZhiFuRiQi%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"MarginTime") %>
                                                       
                                                                                </td>
                                                                                <td align="left" colspan="3">
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：

                                                                                    <%# DataBinder.Eval(Container.DataItem,"MarginDay") %>

                                                                                    <%# DataBinder.Eval(Container.DataItem,"IsMargin") %>

                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiRiQi%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"ReceiveMarginTime") %>
                                                    
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiShu%>"></asp:Label>：</td>
                                                                                <td align="left">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"ReceiveMargin") %>
                                                                                </td>

                                                                                <td align="left" colspan="3">
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：

                                                                                   <%# DataBinder.Eval(Container.DataItem,"ReceiveMarginDay") %>

                                                                                    <%# DataBinder.Eval(Container.DataItem,"IsReceiveMargin") %>

                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiBiaoRiQi%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"BidOpeningDate") %>
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"BidOpeningDay") %>
                                                                                </td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"IsBidOpening") %>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZBFJNRQ%>"></asp:Label>：</td>
                                                                                <td align="left">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"WinningFeeDate") %>
                                                       
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                                <td align="left">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"WinningFeeDay") %>
                                                       
                                                      
                                                                                </td>
                                                                                <td align="left" colspan="3">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"IsWinningFee") %>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label28" runat="server" Text="项目所属专业"></asp:Label>：</td>
                                                                                <td colspan="6" align="left" class="formItemBgStyle">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderContent") %>
                                                       
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</td>
                                                                                <td align="left" class="formItemBgStyle" colspan="6">

                                                                                    <%# DataBinder.Eval(Container.DataItem,"Remarks") %>
                                                                                </td>
                                                                            </tr>



                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="xdoc" runat="server" EnableViewState="False" Text="<%$ Resources:lang,ShowFormWillBeApproved%>"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <!--endprint-->
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>


                <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%; text-align: left; padding-top: 10px; padding-bottom: 20px; background-color: aliceblue;">
                    <table>
                        <tr>
                            <td class="tdLeft" align="right" width="50px">
                                <asp:Label ID="LB_tbWFName" runat="server" Text="<%$ Resources:lang,Name%>"></asp:Label>：</td>
                            <td colspan="2" class="tdRight" align="left" style="width: 300px;">
                                <asp:TextBox Width="99%" ID="TB_WorkFlowName" runat="server"></asp:TextBox>
                            </td>
                            <td class="tdLeft" align="right" width="50px">
                                <asp:Label ID="LB_tbDescription" runat="server" Text="<%$ Resources:lang,shuoming%>"></asp:Label>：</td>
                            <td colspan="2" class="tdRight" align="left" style="width: 320px;">
                                <asp:TextBox ID="TB_WLDescription" runat="server"
                                    Width="99%"></asp:TextBox>
                            </td>
                            <td class="tdRight" style="text-align: left; padding-left: 10px;">
                                <asp:Label ID="LB_SubmitCheck" runat="server" Text="<%$ Resources:lang,TJZGZLQCL%>" CssClass="submitButtonLong" onclick="autoClickActiveButton();"></asp:Label>
                            </td>
                            <td class="tdRight" align="left" style="padding-left: 20px; display: none;">
                                <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" Font-Size="10pt" Text="<%$ Resources:lang,XiangGuanWenDang%>" Target="top.frames[0].frames[2].parent.frames['rightTabFrame']"></asp:HyperLink>
                            </td>
                            <td class="tdRight" align="left" style="padding-left: 10px; display: none;">
                                <asp:Button ID="BT_ExportFormToExcel" runat="server" Text="<%$ Resources:lang,DaoChuDaoExcel%>" CssClass="inpu" Enabled="False" Style="height: 26px" OnClick="BT_ExportFormToExcel_Click" />
                                <asp:HyperLink ID="HL_ExportFileURL" runat="server" Style="height: 26px" Target="_blank"></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>

                <asp:Label ID="LB_XSNFile" runat="server" Visible="false"></asp:Label>
                <asp:Literal ID="LIT_AttachUserJSCode" runat="server"></asp:Literal>
                <asp:Literal ID="LIT_AttachUserWFStepJSCode" runat="server"></asp:Literal>
                <input id="txtReturnValue" type="text" style="display: none;" />
                <asp:Label ID="LB_OldWFXMLFile" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_PublishUrl" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_Uri" runat="server" Visible="false"></asp:Label>
            </div>
            <div id="bgLayer" style="z-index: 9998; position: absolute; filter: alpha(style=0,opacity=100); width: 520px; display: none; background: #cccccc; height: 100px; left: 30%; top: 40%">
                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Width="520px" Height="100px">
                    <table>
                        <tr>
                            <td style="width: 520px; padding: 5px 5px 5px 20px;" valign="top" align="left">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 520px; padding: 5px 25px 5px 5px;" valign="top" align="center">
                                <asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                    ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div id="idDrag" style="background: #C4E3FD; width: 150px; display: none; position: absolute; top: 100px; right: 50px;">
                <table id="tbName" width="100%">
                    <tr>
                        <td align="right">
                            <input type="button" value="X" onclick="ClickClosed();" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,WCLCXMC%>"></asp:Label></td>
                    </tr>
                </table>
                <asp:HiddenField ID="HF_TriggerID" runat="server"></asp:HiddenField>
                <asp:Button ID="BT_AppendXML" runat="server" Text="" Style="display: none" OnClick="BT_AppendXML_Click"></asp:Button>
                <script>
                    new SimpleDrag("idDrag");
                </script>
            </div>

            <table width="100%" cellpadding="0" cellspacing="0" style="display: none;">
                <tr>
                    <td class="tdLeft" colspan="3" style="padding: 1px 1px 1px 1px; border-bottom: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                        <table style="width: 530px;" cellpadding="3" cellspacing="0">
                            <tr>
                                <td class="tdLeft" align="right" width="50px">&nbsp;</td>
                                <td class="tdLeft" width="110" style="display: none;">
                                    <asp:Label ID="LB_WLID" runat="server" Font-Size="11pt"></asp:Label>

                                </td>
                                <td class="tdRight" align="center" width="210">
                                    <asp:HyperLink ID="HL_WFChartView" runat="server" Text="<%$ Resources:lang,LiuChengTu %>" Target="top.frames[0].frames[2].parent.frames['rightTabFrame']">  </asp:HyperLink>

                                </td>
                            </tr>

                            <tr style="display: none;">
                                <td colspan="3" class="tdRight" style="text-align: center; width: 370px;">
                                    <asp:Button ID="BT_Download" runat="server" OnClick="BT_Download_Click" Text="<%$ Resources:lang,XiaZai%>"
                                        Enabled="False" Style="height: 26px" />
                                    <asp:Button ID="BT_SaveXMLFile" runat="server" Enabled="False" OnClick="BT_SaveXMLFile_Click"
                                        Text="<%$ Resources:lang,BaoCunGongZuoLiuGengGai%>" Width="100px" Style="height: 26px" />
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td class="tdLeft" align="right" width="50px">XML:
                                </td>
                                <td colspan="2" class="tdRight" align="left" style="width: 320px;">
                                    <input id="XMLFile" runat="server" name="XMLFile" type="file" style="width: 200px;" />
                                    <asp:Button ID="BT_Upload" runat="server" OnClick="BT_Upload_Click" Text="<%$ Resources:lang,ShangZai%>" Enabled="False" />
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td colspan="3" class="tdRight" style="text-align: center; width: 370px;">

                                    <asp:HyperLink ID="HL_WFXSNFile" runat="server"
                                        Target="_blank" Font-Names="宋体">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XGGZLBGMBXZ%>"></asp:Label>
                                    </asp:HyperLink>
                                    &nbsp;<asp:Button ID="BT_BackupSaveXMLFile" runat="server" OnClick="BT_BackupSaveXMLFile_Click"
                                        Style="display: none;" />
                                    <asp:HyperLink ID="HL_OldWFXMLFile" runat="server"
                                        Target="_blank" Font-Names="宋体" Text="<%$ Resources:lang,ShuJuWenJian%>"></asp:HyperLink>
                                    <input id="btPrintPreview" type="button" class="inpuPrint" name="print" onclick="preview()" /></td>
                            </tr>
                            <tr style="display: none;">
                                <td class="tdLeft" align="right" width="50px">&nbsp;</td>
                                <td colspan="2" class="tdRight" align="left" style="width: 320px;">

                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                        Target="_blank" Font-Names="宋体" Text="<%$ Resources:lang,TemplateMaintain%>"></asp:HyperLink>
                                    &nbsp;<asp:Label ID="LB_TemName" runat="server"></asp:Label>
                                    &nbsp;   &nbsp;

                                                                  <%--<asp:HyperLink ID="HL_WorkflowProgressView" runat="server" Target="_blank" Text="<%$ Resources:lang,ZhiXingJinDu%>" ></asp:HyperLink>--%>

                                    <asp:HyperLink ID="HL_RedirectToMyWFDetail" runat="server" Target="_blank" Text="<%$ Resources:lang,ZhiXingJinDu%>" Visible="false"></asp:HyperLink>

                                </td>
                                <td colspan="3" class="tdRight">
                                    <asp:Label ID="LB_tbFeedback" runat="server" Text="<%$ Resources:lang,ProgressFeedback%>"></asp:Label>:</span><asp:CheckBox
                                        ID="CB_SMS" runat="server" Text="<%$ Resources:lang,SendSMS%>" Checked="true" /><asp:CheckBox
                                            ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail%>" Checked="true" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </form>
    </center>
    <noscript>
        <iframe src="*"></iframe>
    </noscript>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'diywfui.css';</script>
</html>
