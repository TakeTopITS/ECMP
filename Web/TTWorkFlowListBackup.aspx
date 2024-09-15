<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowListBackup.aspx.cs" Inherits="TTWorkFlowListBackup" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #AboveDiv {
            min-width: 850px;
            width: expression (document.body.clientWidth <= 850? "850px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

    </script>


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

</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" style="background-color: ButtonFace;">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 50%;" align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="center">
                                            <table>
                                                <tr>
                                                    <td style="width: 60px; text-align: center; color: #394f66; padding-top: 5px;">
                                                        <asp:HyperLink ID="HL_WLRelatedDoc" runat="server" Target="_blank"><img src="ImagesSkin/UploadDoc.png" width= "24" height ="24" class="noBorder" />
                                                        </asp:HyperLink>
                                                    </td>
                                                    <td style="width: 60px; text-align: center; color: #394f66;">
                                                        <asp:HyperLink ID="HL_WFChartView" runat="server" Target="_blank">
                                                            <img src="ImagesSkin/WorkFlow.png" width= "24" height ="24" class="noBorder" />
                                                        </asp:HyperLink>
                                                    </td>
                                                    <td style="width: 150px; text-align: center;">
                                                        <a href="javascript:ChangeMenu(0)">
                                                            <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18px" Height="24px" border="0" alt="隐藏右边栏" runat="server" /></a>
                                                        <asp:Label ID="Label37" runat="server" Style="display: none;"></asp:Label>
                                                    </td>
                                                    <td style="width: 60px; text-align: center; color: #394f66;">
                                                        <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpenseView.aspx" Target="_blank">
                                                         <img src="ImagesSkin/ExpenseMgt.png" width= "24" height ="24" class="noBorder" />
                                                        </asp:HyperLink>
                                                    </td>
                                                    <td style="text-align: left; color: #394f66;">
                                                        <asp:HyperLink ID="HL_ApproveRecord" runat="server" NavigateUrl="TTWorkflowApproveRecord.aspx" Target="_blank">
                                                            <img src="ImagesSkin/ApproveRecord.png" width= "24" height ="24" class="noBorder" />
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table width="75%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="padding: 5px 5px 5px 5px;" align="center">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="30%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BuZhouMingChen%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShiJianFengZhong%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiBeiRenShu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuoShiJian%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                Width="98%" OnItemCommand="DataGrid2_ItemCommand" CellPadding="4" ShowHeader="false"
                                                ForeColor="#333333" GridLines="None">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="StepName" HeaderText="步骤名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(分钟)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="LimitedOperator" HeaderText="必备人数">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ActiveTime" HeaderText="激活时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_StepID" runat="server" OnClientClick="javascript: window.parent.document.getElementById('bodyFrame').rows = '175,*';" Text='<%# DataBinder.Eval(Container.DataItem,"StepID") %>'
                                                                CssClass="inpu" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>

                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow"
                    style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label63" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="text-align: left; padding: 5px 5px 5px 20px;">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>
                                    <asp:Label ID="LB_StepName" runat="server"></asp:Label>
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenHeRenLieBiao%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;" align="center">
                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,PiHeRen%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="12%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShiJianFengZhong%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiXu%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DongZuo%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZuiHouShenHeDeShiJian%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                        ShowHeader="false" Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                        <ItemStyle CssClass="itemStyle" />
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                DataTextField="OperatorName" HeaderText="批核人" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="WorkDetail" HeaderText="要审核的工作">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="FinishedTime" HeaderText="时间(分钟)">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="CheckingTime" HeaderText="最后审核时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; padding: 5px 5px 5px 20px;">
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>
                                    <asp:Label ID="LB_StepName1" runat="server"></asp:Label>
                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShenHeRenShenHeNeiRongLieBiao%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <asp:DataList ID="DataList1" runat="server" Width="98%" CellPadding="0" CellSpacing="0"
                                        ForeColor="#333333">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table class="bian" width="100%" cellpadding="4" cellspacing="0" style="overflow: auto; border-collapse: collapse; margin: 0px auto;">
                                                <tr>
                                                    <td style="width: 15%; text-align: right">
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: right;">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CaoZuoRen%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            target="_blank">
                                                            <%# DataBinder.Eval(Container.DataItem,"UserName") %></a>
                                                    </td>
                                                    <td style="width: 10%; text-align: right">
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"AssignTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: right;">
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DongZuo%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                    </td>
                                                    <td style="width: 15%; text-align: right;">
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"ReceiverCode") %>'
                                                            target="_blank">
                                                            <%# DataBinder.Eval(Container.DataItem,"ReceiverName") %></a>
                                                    </td>
                                                    <td style="width: 10%; text-align: right;">
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"ApproveTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 15%; text-align: right">
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YiJian%>"></asp:Label>
                                                    </td>
                                                    <td colspan="5" rowspan="3" style="width: 85%; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Content") %>
                                                    </td>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding-left: 20px;">
                                    <div style="width: 100%; overflow-x: auto; display: none;">
                                        <table>
                                            <tr>
                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <ItemTemplate>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td align="center" style="padding: 5px 5px 5px 5px;">
                                                                        <asp:ImageButton ID="IBT_WFStep" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SortNumber") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" style="padding: 5px 5px 5px 5px;">

                                                                        <%# DataBinder.Eval(Container.DataItem,"SortNumber") %> . <%# DataBinder.Eval(Container.DataItem,"StepName").ToString().Trim() %>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top" style="padding: 10px 10px 10px 10px;">
                                    <br />
                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZiGongZuoLiuLieBiao%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="padding: 10px 10px 10px 10px;">
                                    <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="35%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GongZuo%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,FaQiRen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,FaQiShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                        ShowHeader="false" Height="1px"
                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMainBackup.aspx?WLID={0}"
                                                DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <%--  <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>--%>

                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?RelatedType=WorkFlow&WLID={0}") %>'
                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateColumn>
                                        </Columns>

                                        <ItemStyle CssClass="itemStyle" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>

                                </td>
                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
