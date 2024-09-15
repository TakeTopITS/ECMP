<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPMembersWorkPlan.aspx.cs" Inherits="TTAPPMembersWorkPlan" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            //

        });
    </script>
</head>
<body>

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
                                        <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" style="padding: 1px 1px 1px 1px;">
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
                                                                    <%--  <td align="center" width="5%">
                                                                            <strong>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                    <td align="center" width="70%">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%--  <td align="center" width="10%">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                        </td>--%>

                                                                    <%-- <td align="center" width="10%">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td align="center" width="10%">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%-- <td align="center" width="8%">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td align="center" width="8%">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangJiPingFen%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                    <%-- <td align="center" width="8%">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td align="center" width="10%">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiDingZhe%>"></asp:Label></strong>
                                                                        </td>--%>
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
                                                        <%--<td class="tdLeft" style="width: 5%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem ,"PlanID") %>
                                                            </td>--%>

                                                        <td class="tdLeft" style="width: 70%; text-align: left;">
                                                            <%#DataBinder .Eval (Container .DataItem,"PlanName") %>
                                                        </td>
                                                        <%--  <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem,"PlanType") %>
                                                            </td>--%>
                                                        <%--   <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                <%#DataBinder.Eval(Container.DataItem, "StartTime", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                <%#DataBinder.Eval(Container.DataItem, "EndTime", "{0:yyyy/MM/dd}")%>
                                                            </td>--%>
                                                        <td class="tdLeft" style="width: 15%; text-align: center;">
                                                            <%#DataBinder .Eval (Container .DataItem,"Progress") %>%
                                                        </td>
                                                        <%--<td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem,"ScoringBySelf") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem,"ScoringByLeader") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                            </td>
                                                            <td class="tdRight" style="width: 10%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem, "CreatorName") %>
                                                            </td>--%>
                                                    </tr>
                                                    <tr>
                                                        <%--<td class="tdLeft" style="text-align: center; font-size: 10pt;">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                            </td>--%>
                                                        <td class="tdRight" colspan="4" style="text-align: left;">

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
                                    <td valign="top">
                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="执行日志" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhiXingRiZhi%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                        Width="100%">
                                                        <HeaderTemplate>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <%--<td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>--%>
                                                                                <td align="center" width="60%"><strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,RiZhiNeiRong%>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="4" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <%--  <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                            <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                                        </td>--%>

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
                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuanJianMuBiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table style="width: 98%; text-align: left;">
                                                        <tr>
                                                            <td>
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <%-- <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>--%>
                                                                                    <td align="center" width="70%"><strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="6">
                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                    ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <%--    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                                                            </asp:BoundColumn>--%>
                                                                        <asp:BoundColumn DataField="Target" HeaderText="目标">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="进度">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="LB_TargetProgress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Progress")%> '></asp:Label>%
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="领导评核" TabIndex="2">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LingDaoPingHe%>"></asp:Label>
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
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <%--<td align="center" width="10%"><strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>--%>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LingDao%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="50%"><strong>
                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,PingHeNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FenShu%>"></asp:Label></strong></td>
                                                                                            <%-- <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong></td>--%>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <table cellpadding="4" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <%-- <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                                                    </td>--%>

                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                    <%#DataBinder.Eval(Container.DataItem, "LeaderName")%>
                                                                                </td>

                                                                                <td class="tdLeft" style="width: 50%; text-align: left;">

                                                                                    <%#DataBinder.Eval(Container.DataItem, "Review")%>
                                                                                </td>

                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                    <%#DataBinder.Eval(Container.DataItem, "Scoring")%>
                                                                                </td>

                                                                                <%--  <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                        <%#DataBinder.Eval(Container.DataItem, "ReviewTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                    </td>--%>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                </asp:DataList></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="评论记录" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WoDeYiJian%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0"
                                                        class="formBgStyle">

                                                        <tr>
                                                            <td style="width: 90px; text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShenHeYiJian %>"></asp:Label>： </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <CKEditor:CKEditorControl ID="HE_ReviewDetail" runat="server" Height="180px" Width="90%" Visible="False" /><CKEditor:CKEditorControl runat="server" ID="HT_ReviewDetail" Width="90%" Height="180px" Visible="False" />
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="width: 90px; text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,PingFen %>"></asp:Label>： </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Scoring" runat="server" Width="80px" OnBlur="" OnFocus=""
                                                                    OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox></td>
                                                        </tr>
                                                        <tr style="display: none;">
                                                            <td style="width: 90px; text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 90px; text-align: right;" class="formItemBgStyle"></td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:Button ID="BT_Add" CssClass="inpu" runat="server" Enabled="False" Text="<%$ Resources:lang,XinJian %>"
                                                                    OnClick="BT_Add_Click" /><asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click"
                                                                        Text="<%$ Resources:lang,BaoCun %>" /><asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                            Text="<%$ Resources:lang,ShanChu %>" /><br />
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <asp:DataList ID="DataList4" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList4_ItemCommand"
                                                        Height="1px" Width="100%">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderTemplate>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                <td width="60%" align="center"><strong>
                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShenHeYiJian%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FenShu%>"></asp:Label></strong></td>
                                                                                <%--<td width="20%" align="center"><strong>
                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong></td>--%>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="4" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                        <asp:Button ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> '
                                                                            CssClass="inpu" CommandName="Update" />
                                                                    </td>

                                                                    <td class="tdLeft" style="width: 60%; text-align: left;">

                                                                        <%#DataBinder.Eval(Container.DataItem, "Review")%>
                                                                    </td>

                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                        <%#DataBinder.Eval(Container.DataItem, "Scoring")%>
                                                                    </td>

                                                                    <%-- <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                                                    <%#DataBinder.Eval(Container.DataItem, "ReviewTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                                                </td>--%>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                    </asp:DataList><table cellpadding="5" cellspacing="0" border="0" width="100%">
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
                                    <td valign="top">
                                        <br />
                                        <asp:DropDownList ID="DL_MemberList" runat="server" AutoPostBack="true" Width="99%" DataTextField="UserName" DataValueField="UserCode" OnSelectedIndexChanged="DL_MemberList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <table width="100%">
                                            <tr>
                                                <td align="left">

                                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True" Width="220">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>

                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td align="center">

                                                    <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>

                                                   <%-- <asp:Chart ID="Chart1" Width="800px" runat="server">
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
                                                    <br />
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="LB_PlanID" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>

                                                    <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>

                                                    <asp:Label ID="LB_DepartName" runat="server" Visible="False"></asp:Label>

                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTPlanRelatedDoc.aspx">
                                                        --&gt;<asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>

                                        </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
