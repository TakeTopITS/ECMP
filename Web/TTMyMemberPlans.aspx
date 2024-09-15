<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMyMemberPlans.aspx.cs"
    Inherits="TTMyMemberPlans" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }
    </style>
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanZhiJieChengYuanJiHua%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="padding-top: 5px; padding-right: 7px; text-align: right;">
                                                <asp:HyperLink ID="HL_MyBackPlan" runat="server" NavigateUrl="~/TTMyMemberPlansBackup.aspx" Text="<%$ Resources:lang,ChaKanBeiFenJiHua%>"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="left" width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top" width="165px" style="padding: 5px 5px 0px 5px; border-left: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="height: 2px; text-align: left">
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
                                                                                                    <asp:Label ID="Label13333" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                            ShowHeader="false" Width="100%" Height="1px" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None">

                                                                            <ItemStyle CssClass="itemBorder" />
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="部门成员：">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                            Style="text-align: center" />
                                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                            Style="text-align: center" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_PlanID" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border-right: solid 1px #D8D8D8; text-align: left">
                                                                        <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_DepartName" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;" valign="top"
                                                            width="220px">
                                                            <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                                ShowLines="True" Width="220">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                        <td style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;" valign="top">
                                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                                        Width="100%">
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <HeaderTemplate>
                                                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                                width="100%">
                                                                                                <tr>
                                                                                                    <td width="7">
                                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                <td align="center" width="5%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="6%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="20%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="9%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="9%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="12%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="10%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="8%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="8%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShangJiPingFen%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="6%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center" width="8%">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhiDingZhe%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td align="right" width="6">
                                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"PlanID") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 6%; padding-left: 5px; text-align: left;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"PlanType") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 20%; text-align: left;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"PlanName") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 9%; text-align: center;">
                                                                                                        <%#DataBinder.Eval(Container.DataItem, "StartTime", "{0:yyyy/MM/dd}")%>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 9%; text-align: center;">
                                                                                                        <%#DataBinder.Eval(Container.DataItem, "EndTime", "{0:yyyy/MM/dd}")%>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 12%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"SubmitTime") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"Progress") %>%
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"ScoringBySelf") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"ScoringByLeader") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 6%; text-align: center;">
                                                                                                        <%--   <%#DataBinder .Eval (Container .DataItem, "Status") %>--%>
                                                                                                        <%# ShareClass.GetStatusHomeNameByPlanStatus(Eval("Status").ToString()) %>
                                                                                                    </td>
                                                                                                    <td class="tdRight" style="width: 8%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem, "CreatorName") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="tdLeft" style="text-align: center; font-size: 10pt;">
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td class="tdRight" colspan="9" style="text-align: left;">

                                                                                                        <%#DataBinder .Eval (Container .DataItem,"PlanDetail") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                    </asp:DataList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTPlanRelatedDoc.aspx"
                                                                                        Target="_blank">
                                                                                        --&gt;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" valign="top">
                                                                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="90%">
                                                                                        <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="执行日志" TabIndex="0">

                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhiXingRiZhi%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                                                    Width="98%">

                                                                                                    <HeaderTemplate>

                                                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                                            width="100%">

                                                                                                            <tr>

                                                                                                                <td width="7">

                                                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                                </td>

                                                                                                                <td>

                                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                                                        <tr>

                                                                                                                            <td align="center" width="10%">

                                                                                                                                <strong>
                                                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                            </td>

                                                                                                                            <td align="center" width="60%">

                                                                                                                                <strong>
                                                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,RiZhiNeiRong%>"></asp:Label></strong>
                                                                                                                            </td>

                                                                                                                            <td align="center" width="10%">

                                                                                                                                <strong>
                                                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                                            </td>

                                                                                                                            <td align="center" width="20%">

                                                                                                                                <strong>
                                                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </td>

                                                                                                                <td align="right" width="6">

                                                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </HeaderTemplate>

                                                                                                    <ItemTemplate>

                                                                                                        <table cellpadding="4" cellspacing="0" width="100%">

                                                                                                            <tr>

                                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                    <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                                                                                </td>

                                                                                                                <td class="tdLeft" style="width: 60%; text-align: left;">

                                                                                                                    <%#DataBinder.Eval(Container.DataItem, "LogDetail")%>
                                                                                                                </td>

                                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                    <%#DataBinder.Eval(Container.DataItem, "Progress")%>%
                                                                                                                </td>

                                                                                                                <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                                                    <%#DataBinder.Eval(Container.DataItem, "WorkTime")%>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </ItemTemplate>

                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                </asp:DataList>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="关键目标" TabIndex="1">

                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuanJianMuBiao%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table style="width: 98%; text-align: left;">

                                                                                                    <tr>

                                                                                                        <td>

                                                                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                                                width="100%">

                                                                                                                <tr>

                                                                                                                    <td width="7">

                                                                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                                    </td>

                                                                                                                    <td>

                                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                                                            <tr>

                                                                                                                                <td align="center" width="10%">

                                                                                                                                    <strong>
                                                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                                </td>

                                                                                                                                <td align="center" width="70%">

                                                                                                                                    <strong>
                                                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label></strong>
                                                                                                                                </td>

                                                                                                                                <td align="center" width="20%">

                                                                                                                                    <strong>
                                                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>

                                                                                                                    <td align="right" width="6">

                                                                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>

                                                                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                                                ShowHeader="False" Width="100%">

                                                                                                                <Columns>

                                                                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">

                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                                                                                                    </asp:BoundColumn>

                                                                                                                    <asp:BoundColumn DataField="Target" HeaderText="目标">

                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%" />
                                                                                                                    </asp:BoundColumn>

                                                                                                                    <asp:TemplateColumn HeaderText="进度">

                                                                                                                        <ItemTemplate>

                                                                                                                            <asp:Label ID="LB_TargetProgress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Progress")%> '></asp:Label>

                                                                                                                            %
                                                                                                                        </ItemTemplate>

                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                </Columns>

                                                                                                                <EditItemStyle BackColor="#2461BF" />

                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                                                <ItemStyle CssClass="itemStyle" />

                                                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                            </asp:DataGrid>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="领导评核" TabIndex="2">

                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LingDaoPingHe%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table cellpadding="0" cellspacing="0" style="width: 98%;">

                                                                                                    <tr>

                                                                                                        <td>

                                                                                                            <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                                                                Width="100%">

                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                                                                                <HeaderTemplate>

                                                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                                                        width="100%">

                                                                                                                        <tr>

                                                                                                                            <td width="7">

                                                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                                            </td>

                                                                                                                            <td>

                                                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                                                                    <tr>

                                                                                                                                        <td align="center" width="10%">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td align="center" width="10%">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LingDao%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td align="center" width="50%">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,PingHeNeiRong%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td align="center" width="10%">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FenShu%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td align="center" width="20%">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </table>
                                                                                                                            </td>

                                                                                                                            <td align="right" width="6">

                                                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </HeaderTemplate>

                                                                                                                <ItemTemplate>

                                                                                                                    <table cellpadding="4" cellspacing="0" width="100%">

                                                                                                                        <tr>

                                                                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "LeaderName")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 50%; text-align: left;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "Review")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "Scoring")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "ReviewTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </ItemTemplate>

                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                                            </asp:DataList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="评论记录" TabIndex="0">

                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WoDeYiJian%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>
                                                                                                        <td align="center" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                                                            <asp:DataList ID="DataList4" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList4_ItemCommand"
                                                                                                                Height="1px" Width="100%">

                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                                                                                <HeaderTemplate>

                                                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                                                                                        <tr>

                                                                                                                            <td width="7">

                                                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                                            </td>

                                                                                                                            <td>

                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                                                                                    <tr>
                                                                                                                                        <td align="center" width="5%"><strong>&nbsp;</strong></td>
                                                                                                                                        <td align="center" width="5%"><strong>&nbsp;</strong></td>

                                                                                                                                        <td width="10%" align="center">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td width="50%" align="center">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShenHeYiJian%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td width="10%" align="center">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FenShu%>"></asp:Label></strong>
                                                                                                                                        </td>

                                                                                                                                        <td width="20%" align="center">

                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </table>
                                                                                                                            </td>

                                                                                                                            <td width="6" align="right">

                                                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </HeaderTemplate>

                                                                                                                <ItemTemplate>

                                                                                                                    <table cellpadding="4" cellspacing="0" width="100%">

                                                                                                                        <tr>

                                                                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                                                <asp:Button ID="BT_Update" runat="server" CommandName="Update" CssClass="inpuUpdate" />
                                                                                                                            </td>
                                                                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                                                <asp:Button ID="BT_Delete" runat="server" CommandName="Delete" CssClass="inpuDelete" OnClientClick="return confirm(getDeleteMsgByLangCode())" />

                                                                                                                            </td>
                                                                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                                                <asp:Label ID="LB_ID" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ID") %>'></asp:Label>
                                                                                                                            </td>
                                                                                                                            <td class="tdLeft" style="width: 50%; text-align: left;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "Review")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "Scoring")%>
                                                                                                                            </td>

                                                                                                                            <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                                                                <%#DataBinder.Eval(Container.DataItem, "ReviewTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </ItemTemplate>

                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />



                                                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                                            </asp:DataList>

                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>



                                                                                                <table cellpadding="5" cellspacing="0" border="0" width="100%">

                                                                                                    <tr>

                                                                                                        <td class="tdTopLine"></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                    </cc2:TabContainer>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" valign="top">
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" valign="top">
                                                                                    <table width="800px">
                                                                                        <tr>
                                                                                            <td align="center">
                                                                                                <b></b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center">

                                                                                                <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                                                <%--<asp:Chart ID="Chart1" Width="800px" runat="server">
                                                                                                    <Series>
                                                                                                        <asp:Series Name="Series1" ChartType="Column" Label="#VAL">
                                                                                                        </asp:Series>
                                                                                                    </Series>
                                                                                                    <ChartAreas>
                                                                                                        <asp:ChartArea Name="ChartArea1" AlignmentOrientation="Horizontal">
                                                                                                        </asp:ChartArea>
                                                                                                    </ChartAreas>
                                                                                                    <Titles>
                                                                                                        <asp:Title Name="标题" Alignment="TopCenter" IsDockedInsideChartArea="false" DockedToChartArea="ChartArea1">
                                                                                                        </asp:Title>
                                                                                                    </Titles>
                                                                                                </asp:Chart>--%>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
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



                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label39" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0"
                                class="formBgStyle">
                                <tr>

                                    <td style="width: 90px; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShenHeYiJian%>"></asp:Label>：
                                    </td>

                                    <td style="text-align: left;" class="formItemBgStyle">

                                        <CKEditor:CKEditorControl ID="HE_ReviewDetail" runat="server" Height="180px" Width="90%" Visible="false" />

                                        <CKEditor:CKEditorControl runat="server" ID="HT_ReviewDetail" Width="90%" Height="180px" Visible="False" />
                                    </td>
                                    </td>
                                </tr>

                                <tr>

                                    <td style="width: 90px; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,PingFen%>"></asp:Label>：
                                    </td>

                                    <td style="text-align: left;" class="formItemBgStyle">

                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Scoring" runat="server" Width="80px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>


                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
