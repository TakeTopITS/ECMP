<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectCustomerView.aspx.cs"
    Inherits="TTProjectCustomerView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>

    <style type="text/css">
        .auto-style1 {
            /*border-bottom:dotted  1px #C6CFD4;
        height: 19px;
        line-height: 18px;*/
            background-color: #fff;
            background-repeat: no-repeat;
            padding-top: 10px;
            width: 20%;
        }
    </style>

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
                                            <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuZiLiao%>"></asp:Label>
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
                            <td style="padding: 5px 5px 5px 5px;" align="left">

                                <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                    Width="100%">
                                    <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="基本信息">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                                <tr>
                                                    <td class="formItemBgStyle" rowspan="2">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="30%"><strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_CustomerCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="CustomerName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 80%;">
                                                        <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" Width="100%">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <ItemTemplate>
                                                                <table cellpadding="4" cellspacing="0" class="bian" style="width: 100%;">
                                                                    <tr>
                                                                        <td style="width: 10%; text-align: right;">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeHuDaiMa%>"></asp:Label>： </td>
                                                                        <td align="left" style="width: 20%"><%# DataBinder.Eval(Container.DataItem,"CustomerCode") %></td>
                                                                        <td style="width: 10%; text-align: right;">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>： </td>
                                                                        <td align="left" colspan="3"><%# DataBinder.Eval(Container.DataItem,"CustomerName") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; text-align: right;">
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>： </td>
                                                                        <td colspan="5" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"CustomerEnglishName") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; text-align: right;">
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>： </td>
                                                                        <td align="left" style="width: 100px"><%# DataBinder.Eval(Container.DataItem,"Type") %></td>
                                                                        <td style="width: 100px; text-align: right;">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>： </td>
                                                                        <td align="left"><%# DataBinder.Eval(Container.DataItem, "ContactName")%></td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>： </td>
                                                                        <td style="width: 135px; text-align: left;"><%# DataBinder.Eval(Container.DataItem,"SalesPerson") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; text-align: right;">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>： </td>
                                                                        <td colspan="3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"InvoiceAddress") %></td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>： </td>
                                                                        <td align="left"><%# DataBinder.Eval(Container.DataItem,"Currency") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>： </td>
                                                                        <td colspan="3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"BankAccount") %></td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>： </td>
                                                                        <td align="left"><%# DataBinder.Eval(Container.DataItem,"Discount") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; text-align: right">
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>： </td>
                                                                        <td colspan="3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"Bank") %></td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XinYongDengJi%>"></asp:Label>： </td>
                                                                        <td align="left"><%# DataBinder.Eval(Container.DataItem,"CreditRate") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DianHua1%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"Tel1") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DianHua2%>"></asp:Label>： </td>
                                                                        <td class="style3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"Tel2") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"Fax") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; text-align: right">E_Mail： </td>
                                                                        <td colspan="3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"WebSite") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>： </td>
                                                                        <td class="style3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"ZP") %></td>
                                                                        <td style="height: 20px; text-align: right"></td>
                                                                        <td style="height: 20px; text-align: left"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"Country") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>： </td>
                                                                        <td class="style3" style="text-align: left"><%# DataBinder.Eval(Container.DataItem,"State") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"City") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiZhong%>"></asp:Label>： </td>
                                                                        <td colspan="5" style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"RegistrationAddressCN") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiYing%>"></asp:Label>： </td>
                                                                        <td colspan="5" style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"RegistrationAddressEN") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>： </td>
                                                                        <td colspan="3" style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"Comment") %></td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>： </td>
                                                                        <td style="height: 20px; text-align: left"><%# DataBinder.Eval(Container.DataItem,"CreateDate") %></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" class="formItemBgStyle">
                                                        <asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Enabled="False" Target="_blank">
                                                            ---&gt;<asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,XiangGuanLianXiRen %>"></asp:Label>
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc2:TabPanel>
                                    <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="客服记录">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>
                                        </HeaderTemplate>

                                        <ContentTemplate>
                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>：

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="40%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="100%"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None">

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleRecordList.aspx?ID={0}"
                                                                    DataTextField="Question" HeaderText="问题" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:TemplateColumn HeaderText="状态">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                    DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="RecorderCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                    DataTextField="RecorderCode" HeaderText="记录人" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTCustomerQuestionRelatedDoc.aspx?RelatedID={0}") %>'
                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>

                                        </ContentTemplate>
                                    </cc2:TabPanel>
                                </cc2:TabContainer>
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
