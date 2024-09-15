<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowInfoPathDataView.aspx.cs"
    Inherits="_TTWorkFlowInfoPathDataView" Debug="true" ValidateRequest="false" %>

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

    <!--pageoffic.js一定要引用-->
 <%--   <script type="text/javascript" src="js/pageoffice.js"></script>--%>



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

        .Save {
            border-style: none;
            background-image: url('Images/Save.gif');
            height: 22px;
            width: 22px;
            text-align: center;
            margin: -2px 0;
            font-size: 12px;
            color: #000000;
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
        <cc1:jsinfopathrefer id="JSInfoPathRefer1" runat="server" />

        <div id="DIV_Container" style="padding: 2px 5px 2px 5px; border: 1px solid white; overflow: auto;">

            <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                Width="100%">
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderTemplate>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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
                                        <td width="20%" align="center">
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
                                        <td width="7%" align="center">
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
                    <table cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td class="tdLeft" style="width: 7%; text-align: center;">
                                <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                            </td>
                            <td class="tdLeft" style="width: 20%; text-align: left; padding-left: 5px">
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
                            <td class="tdRight" style="width: 7%; text-align: center">
                                <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                <asp:Label ID="Label13" runat="server" Text="合同内容"></asp:Label>
                            </td>
                            <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px">
                                <table>
                                    <tr>
                                        <td>
                                            <a id="aDownload" href='<%#DataBinder .Eval (Container .DataItem,"MainContent") %>' target="_blank">
                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                            </a>

                                        </td>
                                        <td style="padding-left: 20px;">
                                            <div id="divEdit" onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=<%# ShareClass.URLEncode(Eval("MainContent").ToString()) %>','fullscreen=yes;');">
                                                <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YiChangMiaoShu%>"></asp:Label>
                            </td>
                            <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px">
                                <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdRight" colspan="11" style="text-align: left; padding-left: 50px;">

                                <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Constract&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>&IdentifyString= <%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Constract", Eval("ConstractID").ToString())) %>'>
                                    <asp:Label ID="Label249" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;

                                <a href='TTConstractRelatedDocView.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>'
                                    target="_blank">
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongWenDang%>"></asp:Label>&nbsp;&nbsp;</a>

                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle CssClass="itemStyle" />
            </asp:DataList>

            <asp:DataList ID="DataList2" runat="server" Height="1px" CellPadding="0" Width="100%"
                ForeColor="#333333">
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderTemplate>
                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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
                    <table width="98%" cellspacing="0" cellpadding="2">
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

                        <tr>
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
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle CssClass="itemStyle" />
            </asp:DataList>

            <asp:DataList ID="DataList3" runat="server" Height="1px" CellPadding="0" Width="100%"
                ForeColor="#333333">
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderTemplate>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
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

        </div>


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
            <tr>
                <td align="left" style="padding-left: 20px;">
                    <br />
                    <a id="aPrintDoc" name="aPrintDoc" href="#" onclick="preview2()">
                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />Comment
                    </a>
                    <!--startprint2-->
                    <%--  <table width="700px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                        <tr>
                            <td width="7">
                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="10%" align="center">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                            </strong>
                                        </td>

                                        <td width="30%" align="center">
                                            <strong>
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>
                                            </strong>
                                        </td>
                                        <td width="15%" align="center">
                                            <strong>
                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,QuanXian %>"></asp:Label>
                                            </strong>
                                        </td>
                              
                                        <td width="10%" align="center">
                                            <strong>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label>
                                            </strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="6" align="right">
                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                            </td>
                        </tr>
                    </table>--%>
                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="None" ForeColor="#333333" Height="1px" ShowHeader="False">
                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                        <Columns>
                            <%--   <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                            </asp:BoundColumn>--%>

                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <%#this.DataGrid2.CurrentPageIndex * this.DataGrid2.PageSize + Container.ItemIndex +1%>
                                </ItemTemplate>
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                            </asp:TemplateColumn>

                            <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                DataTextField="DocName" Target="downFrame" HeaderText="文件名">
                                <ItemStyle HorizontalAlign="Left" CssClass="itemBorder"></ItemStyle>
                            </asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="Visible" HeaderText="权限">
                                <ItemStyle HorizontalAlign="center" CssClass="itemBorder"></ItemStyle>
                            </asp:BoundColumn>
                            <%--   <asp:TemplateColumn>
                                <ItemTemplate>
                                    <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                        <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                            </asp:TemplateColumn>--%>
                            <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                <ItemStyle HorizontalAlign="center" CssClass="itemBorder"></ItemStyle>
                            </asp:BoundColumn>
                        </Columns>
                        <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                        <ItemStyle CssClass="itemStyle"></ItemStyle>
                        <PagerStyle HorizontalAlign="Center"></PagerStyle>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                    </asp:DataGrid>

                    <hr />

                    <a onclick="javascript:changeProjectDocDataGridVisible();">--Other Doc（<asp:Label ID="LB_ProjectDocNumber" runat="server"></asp:Label>）--</a>
                    <table width="100%">
                        <tr id="TR_OtherDoc" style="display: none;">
                            <td align="left">
                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    GridLines="None" ForeColor="#333333" Height="1px" Width="700px" ShowHeader="False">
                                    <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                    <Columns>
                                        <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="10%" />
                                        </asp:BoundColumn>

                                        <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                            DataTextField="DocName" Target="downFrame" HeaderText="文件名">
                                            <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="itemBorder"></ItemStyle>
                                        </asp:HyperLinkColumn>



                                        <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                            <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="itemBorder"></ItemStyle>
                                        </asp:BoundColumn>
                                    </Columns>
                                    <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                    <ItemStyle CssClass="itemStyle"></ItemStyle>
                                    <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <br />
                                <br />

                                <strong>---<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenPiJiLu%>"></asp:Label>---<asp:HyperLink ID="HL_ParentWorkflowApproveRecord" runat="server" Text="<%$ Resources:lang,GuanlianHuLiuCheng%>"></asp:HyperLink>
                                </strong>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:DataList ID="DataList29" runat="server" CellPadding="4" ForeColor="#333333" Width="800px">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle CssClass="itemStyle" />
                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table style="width: 100%; table-layout: fixed;">
                                            <tr>
                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none; width: 300px;">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>: <%# DataBinder.Eval(Container.DataItem,"SortNumber") %>&nbsp;<%# DataBinder.Eval(Container.DataItem,"StepName") %></td>
                                                <td align="left" style="width: 35%; color: Blue; font-style: italic; text-decoration: none;">
                                                    <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>' target="_blank" style="text-decoration: none;"><%# DataBinder.Eval(Container.DataItem,"OperatorName") %></a>&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem,"CheckingTime") %></td>
                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">

                                                    <a href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuanlianHuLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a></td>
                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">
                                                    <a on href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetChildWorklowIDByStepID(Eval("WLID").ToString(),Eval("StepID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanLianZiLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                    <%# DataBinder.Eval(Container.DataItem,"Operation") %>: <%# DataBinder.Eval(Container.DataItem,"OperatorCommand") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                    <a href='<%# "TTWorkFlowInfoPathDataViewForBrowse.aspx?XSNFile=" +strXSNFile + "&WLID=" +strWLID + "&StepID=" + DataBinder.Eval(Container.DataItem,"StepID") +"&ID=" + DataBinder.Eval(Container.DataItem,"ID")  %>'>表单数据</a>

                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="itemStyle" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <!--endprint2-->
                </td>
            </tr>
        </table>
        <!--endprintAll-->
        <%--   </div>--%>

        <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%;">
            <center>
                <table style="width: 600px;">
                    <tr>
                        <td align="right" style="width: 125px; padding-top: 5px;">
                            <asp:Button ID="BT_SaveXMLFile" Visible="false" runat="server" CssClass="Save"
                                OnClick=" BT_SaveXMLFile_Click" />
                        </td>
                        <td align="center" style="width: 100px; padding-top: 5px;">
                            <a id="aPrintAll" runat="server" href="#" onclick="previewAll()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />All
                            </a>
                        </td>
                        <td align="left" style="width: 100px; padding-top: 5px;">
                            <a id="aPrintForm" runat="server" href="#" onclick="preview1()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />Form
                            </a>
                            <input id="txtReturnValue" type="text" style="display: none;" />
                        </td>
                        <td align="right" style="display: none;">
                            <div style="overflow: hidden; width: 1px; height: 1px;">
                                <asp:Button ID="BT_BackupSaveXMLFile" runat="server" Visible="false"
                                    OnClick="BT_BackupSaveXMLFile_Click" />

                                <asp:Label ID="LB_WLID" runat="server"></asp:Label>
                                <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18" Height="24" border="0" alt="隐藏右边栏" runat="server" /></a>
                                            <asp:Label ID="Label48" runat="server" Style="display: none;"></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>:
                             <asp:Label ID="LB_WorkflowStatus" runat="server"></asp:Label>
                            </div>
                        </td>

                    </tr>
                </table>
                <br />
            </center>
        </div>

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

