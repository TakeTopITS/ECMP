<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlanView.aspx.cs" Inherits="TTWorkPlanView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目工作计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 950px;
            width: expression (document.body.clientWidth <= 950? "950px" : "auto" ));
        }

        .auto-style1 {
            width: 30px;
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

                    //window.parent.document.getElementById("bodyFrame").cols = '150,*';

                    decreaseTimer = setInterval(decreaseLeftWidth, 1);
                    i = 950;

                    FrameHide = 0;
                    return;
                }
                else {

                    //window.parent.document.getElementById("bodyFrame").cols = '950,*';

                    creaseTimer = setInterval(creaseLeftWidth, 1);
                    j = 50;
                    FrameHide = 0;
                    return;
                }
            } else {

                //window.parent.document.getElementById("bodyFrame").cols = preFrameW;

                creaseTimer = setInterval(creaseLeftWidth, 1);
                j = 50;

                FrameHide = 1;
                return;
            }
        }

        if (way != 2) {
            fcols = fcol.split(',');
            fcols[0] = parseInt(fcols[0]) + addwidth;
            window.parent.document.getElementById("bodyFrame").cols = fcols[0] + ',*';
        }


        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 50) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 950) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }
        }

    </script>



    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = PlanTreeDivID.scrollTop;
            autoheight();
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            autoheight();
        }

        function EndRequestHandler(sender, args) {
            PlanTreeDivID.scrollTop = disPostion;
            autoheight();
        }

    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            autoheight();

        });



        function autoheight() { //函数：获取尺寸
            //获取浏览器窗口高度
            var winHeight = 0;
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;

            if (document.documentElement && document.documentElement.clientHeight)
                winHeight = document.documentElement.clientHeight;

            document.getElementById("PlanTreeDivID").style.height = (winHeight - 80) + "px";
        }

        window.onresize = autoheight; //浏览器窗口发生变化时同时变化DIV高度

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="30px;" style="padding-left: 5px; padding-top: 5px;">
                                                        <a href="javascript:ChangeMenu(0)">
                                                            <img src="Images/LeftRightArrow.png" width="18" height="24" border="0" alt="隐藏右边栏">
                                                        </a>
                                                      </td>
                                                    <td align="left" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" style="padding-right: 60px;" class="titlezi">
                                            <asp:HyperLink ID="HL_WorkPlanListView" runat="server" Height="16px" NavigateUrl="TTWorkPlanListView.aspx"
                                                Target="_blank">
                                                ---&gt;<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LieBiaoShiLiuLan%>"></asp:Label>
                                            </asp:HyperLink>
                                            &nbsp;
                                            <asp:HyperLink ID="HL_ProPlanGanttNew" runat="server" Height="16px" NavigateUrl="TTWorkPlanGanttForProject.aspx"
                                                Target="_blank">
                                                ---&gt;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GanTeTu%>"></asp:Label>
                                            </asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td rowspan="4" width="300px" style="padding: 5px 5px 0px 5px; text-align: left; border-right: solid 1px #D8D8D8">
                                            <div id="PlanTreeDivID" style="width: 300px;  overflow: auto;">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Font-Bold="False" Style="width: 300px;">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </div>
                                            <hr />
                                            <span style="font-size: x-small; text-align: center;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HSTQJCCYHSZC%>"></asp:Label></span>
                                            <hr />
                                        </td>
                                        <td align="left" valign="top" style="padding-left: 10px">
                                            <table style="width: 100%; margin-top: 10px" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbPlanType" runat="server" Text="<%$ Resources:lang,Type%>" />:
                                                        </td>
                                                        <td style="width: 35%; text-align: left;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_PlanType" runat="server" CssClass="DDList" >
                                                                <asp:ListItem Value="计划" Text="<%$ Resources:lang,JiHua%>" />
                                                                <asp:ListItem Value="里程碑" Text="<%$ Resources:lang,LiChengBei%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>" />:
                                                        </td>
                                                        <td style="width: 35%; text-align: left;" class="formItemBgStyle">

                                                            <asp:Label ID="LB_MakeTime" runat="server" Font-Size="9pt" Width="220px"></asp:Label>
                                                            <NickLee:NumberBox ID="TB_PriorID" runat="server" Enabled="false" MaxAmount="1000000000000" MinAmount="0" Precision="0" Visible="false" Width="50px">
                                                                          0
                                                            </NickLee:NumberBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbPlanDetail" runat="server" Text="<%$ Resources:lang,PlanDetail%>" />
                                                        </td>
                                                        <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_PlanDetail" runat="server" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>" />
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_BeginDate">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>" />:
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndDate">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbBudget" runat="server" Text="<%$ Resources:lang,Budget%>" />:
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" ID="TB_PlanBudget" runat="server" Width="79px" MinAmount="0">
                                                                      0 0.00
                                                            </NickLee:NumberBox>
                                                        </td>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbBudget0" runat="server" Text="<%$ Resources:lang,ShunXuHao%>" />：
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <NickLee:NumberBox ID="NB_SortNumber" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="79px" Amount="1">
                                                                             0 0.00
                                                                    01</NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <NickLee:NumberBox ID="NB_Percent_Done" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px" Precision="0">
                                                                             0 0.00
                                                                    0</NickLee:NumberBox>
                                                            %
                                                        </td>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShiJianDanWei%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_DurationUnit" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhanXiangMuZhengTiJingDuYuGu%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                            <NickLee:NumberBox ID="NB_DefaultSchedule" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                                             0 0.00
                                                            </NickLee:NumberBox>
                                                            % </td>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhanXiangMuZhenTiChengBenYuGu%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                            <NickLee:NumberBox ID="NB_DefaultCost" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                                      0 0.00
                                                            </NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status%>" />:
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Status" runat="server" CssClass="DDList" DataTextField="HomeName"
                                                                DataValueField="Status" Width="89px" class="formItemBgStyle">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbLockStatus" runat="server" Text="<%$ Resources:lang,LockStatus%>" />:
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_LockStatus" runat="server" Enabled="False" AutoPostBack="true">
                                                                <asp:ListItem>No</asp:ListItem>
                                                                <asp:ListItem>Yes</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle"></td>
                                                        <td colspan="3" style="height: 25px; text-align: left;" class="formItemBgStyle">
                                                            <asp:HyperLink ID="HL_RelatedDoc" runat="server"  NavigateUrl="TTProPlanRelatedDocView.aspx"
                                                                Target="_blank" Visible ="false"  Text="<%$ Resources:lang,XiangGuanWenDang%>">
                                                            </asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_tbResource" runat="server" Text="<%$ Resources:lang,Resource%>" />:
                                                        </td>
                                                        <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Resource" runat="server" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table cellpadding="0" cellspacing="0" width="100%" style="display: none;">
                                                    <tr>
                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label>
                                                            <asp:Label ID="LB_PlanID" runat="server"></asp:Label>
                                                            <asp:Label ID="LB_PlanDetail" runat="server"></asp:Label>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CanYuRenYuan%>"></asp:Label>
                                                            <asp:Label ID="LB_BackupID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ParentID" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center; vertical-align: top;">
                                                            <table width="95%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="35%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuYaoGongZuo%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KaiShiGongZuoShiJian%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JieShuGongZuoShiJian%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>

                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                                            PageSize="8" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="MainWork" HeaderText="主要工作">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="StartWorkDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始工作时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="EndWorkDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束工作时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
