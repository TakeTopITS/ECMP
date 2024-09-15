<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRelatedDIYBusinessForm.aspx.cs" Inherits="TTRelatedDIYBusinessForm" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

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
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

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

        .ToolBar {
            position: fixed !important;
            top: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            border: expression(offsetParent.scroolBotom + 0);
            border: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background-color: ButtonFace;
            width: 100%;
            height: 30px;
            text-align: left;
        }


        @media print {
            .noprint {
                display: none;
                color: green;
            }
        }

        .trodd {
            background: #fafafa;
        }

        .treven {
            background: #f4f4f4;
        }
    </style>


    <script type="text/javascript">

        var bdhtml;
        function preview1() {

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


            //如果不是单独窗口，那么把返回功能不可视
            if (top.location !== self.location) {

                document.getElementById("Table_Back").style.display = 'none';
            }
            else {

                CloseWebPage();
            }


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

        function changeDivXDocWidth() {

            alert(document.getElementById("DIV_XDoc").width);


            document.getElementById("DIV_XDoc").width = document.documentElement.scrollWidth + 2000;
        }


    </script>

</head>
<%--<body onload="TakeTopInfoPath_Init();" oncontextmenu="return false">--%>
<body onload="TakeTopInfoPath_Init();changeDateBoxWidth();" onmousemove="changeDateBoxWidth();">

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

            <div id="DIV_XDoc" style="z-index: -2; width: 2100px; overflow: auto;">

                <cc1:jsinfopathrefer id="JSInfoPathRefer1" runat="server" />

                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td valign="top">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="padding: 45px 5px 5px 5px; overflow: auto;">

                                        <!--startprint-->
                                        <table width="100%" class="DemoTable">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="xdoc" runat="server" Text="<%$ Resources:lang,YSHDBDZZLXS%>"></asp:Label>
                                                </td>
                                            </tr>

                                        </table>
                                        <!--endprint-->
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" cellpadding="0" cellspacing="0" style="display: none;">
                                <tr>
                                    <td class="tdLeft" colspan="2" style="padding: 1px 1px 1px 1px; border-bottom: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                                        <table style="width: 370px;" cellpadding="3" cellspacing="0">
                                            <tr>
                                                <td class="tdLeft" align="right" width="50px"></td>
                                                <td class="tdLeft" width="110">
                                                    <asp:Label ID="LB_WLID" runat="server" Font-Size="10pt"></asp:Label>
                                                </td>
                                                <td class="tdRight" align="center" width="210">
                                                    <asp:HyperLink ID="HL_WFChartView" runat="server" Text="<%$ Resources:lang,LiuChengTu %>" Target="_blank"></asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdLeft" align="right" width="50">
                                                    <span style="font-size: 10pt;">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>:</span>
                                                </td>
                                                <td colspan="2" class="tdRight" align="left" style="width: 320px;">
                                                    <asp:TextBox Width="99%" ID="TB_WorkFlowName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdLeft" align="right" width="50">
                                                    <span style="font-size: 10pt;">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>: </span>
                                                </td>
                                                <td colspan="2" class="tdRight" style="width: 320px;" align="left">
                                                    <asp:TextBox ID="TB_WLDescription" runat="server" Font-Size="10pt" Height="58px"
                                                        Width="99%" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdLeft" align="right" width="50"></td>
                                                <td colspan="2" class="tdRight" align="left">

                                                    <span style="font-size: 10pt;">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenPiJinDuFanKui%>"></asp:Label>：</span><asp:CheckBox
                                                            ID="CB_SMS" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,DuanXin%>" Checked="true" /><asp:CheckBox ID="CB_Mail"
                                                                runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian%>" Checked="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdLeft" align="right"></td>
                                                <td colspan="2" class="tdRight" align="left">
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="LB_SubmitCheck" runat="server" Text="<%$ Resources:lang,TJZGZLQCL%>" CssClass="submitButton" onclick="autoClickActiveButton();"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="tdLeft" align="center" colspan="3">

                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" Font-Size="10pt" Text="<%$ Resources:lang,XiangGuanWenDang%>" Target="_blank"></asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="tdLeft" align="right">XML:
                                                </td>
                                                <td colspan="2" class="tdRight" align="left">
                                                    <input id="XMLFile" runat="server" name="XMLFile" type="file" style="width: 220px;" />
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td colspan="3" class="tdRight" style="text-align: center; padding: 2px 0px 2px 5px; border-bottom: solid 1px  #D8D8D8; width: 370px;">
                                                    <asp:HyperLink ID="HL_WFXSNFile" runat="server"
                                                        Target="_blank" Font-Names="宋体" Font-Size="10pt">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XGGZLBGMBXZ%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;<input id="btPrintPreview" type="button" class="inpuPrint" name="print" onclick="preview()" />

                                                    <asp:HyperLink ID="HL_OldWFXMLFile" runat="server"
                                                        Target="_blank" Font-Names="宋体" Font-Size="10pt" Text="<%$ Resources:lang,ShuJuWenJian%>"></asp:HyperLink>
                                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                        Target="_blank" Font-Names="宋体" Font-Size="10pt">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    <asp:HyperLink ID="HL_RedirectToMyWFDetail" runat="server" Target="_blank" Text="<%$ Resources:lang,ZhiXingJinDu%>" Visible="false"></asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="LB_TemName" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_XSNFile" runat="server" Visible="false"></asp:Label>
                <asp:Literal ID="LIT_AttachUserJSCode" runat="server"></asp:Literal>
                <asp:Literal ID="LIT_AttachUserWFStepJSCode" runat="server"></asp:Literal>
                <asp:Label ID="LB_OldWFXMLFile" runat="server"></asp:Label>
                <asp:Label ID="LB_PublishUrl" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_Uri" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
            </div>

            <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%;">
                <table width="100%">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30px;">&nbsp;</td>
                                    <td align="center" style="padding-top: 5px;">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YeWuDan%>"></asp:Label>：
                                    </td>
                                    <td align="center" style="padding-top: 5px;">
                                        <asp:DropDownList ID="DL_WorkflowTemplate" runat="server" DataTextField="TemName" DataValueField="XSNFile" AutoPostBack="true" OnSelectedIndexChanged="DL_WorkflowTemplate_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" style="padding-top: 7px;padding-left:20px;">
                                        <asp:Button ID="BT_SaveXMLFile" runat="server" CssClass="inpuSave" OnClick="BT_SaveXMLFile_Click" />
                                        <asp:Label ID="LB_Msg" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td id="TD_Printer" runat="server" align="left" style="padding-left: 30px; padding-top: 5px;">
                                        <a id="aPrintForm" runat="server" href="#" onclick="preview1()">
                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                        </a>
                                    </td>
                                    <td align="center" style="padding-top: 7px;padding-left:20px;">
                                        <asp:Button ID="BT_DeleteWorkflowTemplate" runat="server" CssClass="inpuDelete" Text="X" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_DeleteWorkflowTemplate_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
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
                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WCLCXMC%>"></asp:Label></td>
                    </tr>
                </table>
                <asp:HiddenField ID="HF_TriggerID" runat="server"></asp:HiddenField>
                <script>
                    new SimpleDrag("idDrag");
                </script>
            </div>
            <div style="overflow: hidden; width: 1px; height: 1px;">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18" Height="24" border="0" alt="隐藏右边栏" runat="server" /></a>
                                <asp:Label ID="Label48" runat="server" Style="display: none;"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>:
                    <asp:Label ID="LB_WorkflowStatus" runat="server"></asp:Label>
                <input id="txtReturnValue" type="text" style="display: none;" />
            </div>

        </form>
    </center>
</body>
