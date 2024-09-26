<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowTemplateView.aspx.cs"
    Inherits="TTWorkFlowTemplateView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

           
        });

    </script>

</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TiaoJianSeZhi%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBottom" style="padding: 5px 5px 5px 5px;">
                                <table style="width: 100%">
                                    <tr>
                                        <td colspan="2" style="text-align: left">
                                            <asp:Label ID="LB_WorkFlow" runat="server" Font-Size="10pt"></asp:Label>
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuZhouLieBiao%>"></asp:Label>
                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_MakeUserCode" runat="server"
                                                Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZuiShaoRenShu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,TiaoJian%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShiFouZiShen%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BuMenXiangGuan%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YongXuJianZhiShenPi%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuXiangGuan%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZiXuanShenPiRen%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShenQingRenZiDongShenPi%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YishenpiZheZiDongShenPi%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiaYiBuBiXu%>"></asp:Label>
                                                                    </strong>
                                                                </td>

                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,XiaYiBu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ZhanZhengTiJingDuYuGu %>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                PageSize="20" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="StepName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="limitedOperator" HeaderText="最少人数">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="StepID" DataNavigateUrlFormatString="TTWorkFlowStepConditionView.aspx?StepID={0}"
                                                        Target="_blank" Text="条件">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="SelfReview" HeaderText="自审">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DepartRelated" HeaderText="部门相关">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PartTimeReview" HeaderText="允许兼职审批">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ProjectRelated" HeaderText="项目相关">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="OperatorSelect" HeaderText="自选审批者">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="AllowSelfPass" HeaderText="申请人自批">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="AllowPriorOperatorPass" HeaderText="已批者自批">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="NextStepMust" HeaderText="为下一步必须通过">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %> %
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_StepID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"StepID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                <ItemStyle CssClass="ite" />
                                            </asp:DataGrid>
                                            <asp:Label ID="LB_SqlWL" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_RelatedUserCode" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 20px; text-align: left">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>：<asp:Label ID="LB_SortNumber" runat="server"></asp:Label>&nbsp;
                                                    <asp:Label ID="LB_StepName" runat="server"></asp:Label>
                                            <asp:Label ID="LB_StepID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhubanZhe%>"></asp:Label>明细：
                                        </td>
                                        <td style="width: 200px; text-align: left">
                                            <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="25%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CanYuJueSeZhu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="25%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuo%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChenDanJueSe%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiFouBiXu%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi%>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTActorGroupMemberView.aspx?IdentifyString={0}"
                                                        DataTextField="ActorGroup" HeaderText="参与角色组" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="WorkDetail" HeaderText="工作">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Actor" HeaderText="承担角色">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Requisite" HeaderText="是否必需">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataGrid>
                                            <asp:Label ID="LB_DetailID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>

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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
