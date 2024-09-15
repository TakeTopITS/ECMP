<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBookBaseData.aspx.cs" Inherits="TTBookBaseData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            color: #CC0000;
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TuShuJiChuShuJu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 98%;">
                                        <tr>
                                            <td style="height: 19px; text-align: left;" colspan="3">
                                                <b>------&gt;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuYiDai%>"></asp:Label><span class="style1">*</span><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XKNBCXNZZNXZBNSCHXG%>"></asp:Label></b>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 19px;" align="center">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DuZheLeiXingSheDing%>"></asp:Label>：</strong>
                                            </td>
                                            <td style="height: 19px;" align="center">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChuBanSheSheDing%>"></asp:Label>：</strong>
                                            </td>
                                            <td style="height: 19px;" align="center">
                                                <strong>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TuShuFenLeiSheDing%>"></asp:Label>：</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 33%; height: 218px;" valign="top">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="40%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieYueTianShu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YueDuShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="类型">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_TypeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TypeName").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="BorrowDays" HeaderText="借阅天数">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BorrowNum" HeaderText="借阅数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                            <td style="width: 33%; height: 218px;" valign="top">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ISBNBianMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ChuBanSheMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="50%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuBanSheDi%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="ISBN编码">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_ISBNNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ISBNNo").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="PublishersName" HeaderText="出版社名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PublishersAddress" HeaderText="出版社地">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="50%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                            <td style="width: 33%; height: 218px" valign="top">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TuShuFenLei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="79%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FenLeiNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="顺序" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" Width="1%" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="图书分类">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_ClassificationName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ClassificationType").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" Width="20%" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="分类内容">
                                                            <ItemStyle CssClass="itemBorder" Width="79%" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>：<asp:DropDownList ID="ddl_TypeName" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                </asp:DropDownList>
                                            </td>
                                            <td align="center">
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ISBNBianMa%>"></asp:Label>：<asp:TextBox ID="TB_ISBNNo" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td align="center">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JieYueTianShu%>"></asp:Label>：<asp:TextBox ID="TB_BorrowDays" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuBanSheMing%>"></asp:Label>：<asp:TextBox ID="TB_PublishersName" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TuShuFenLei%>"></asp:Label>：<asp:TextBox ID="TB_ClassificationType" runat="server" Width="121px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YueDuShuLiang%>"></asp:Label>：<asp:TextBox ID="TB_BorrowNum" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChuBanSheDi%>"></asp:Label>：<asp:TextBox ID="TB_PublishersAddress" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 20px;" align="center">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FenLeiNeiRong%>"></asp:Label>：<asp:TextBox ID="TB_Remark" runat="server" Width="121px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 236px" align="center">
                                                <asp:Button CssClass="inpu" ID="BT_NewBookReaderType" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_NewBookReaderType_Click" />&nbsp;
                                        <asp:Button CssClass="inpu" ID="BT_DeleteBookReaderType" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_DeleteBookReaderType_Click" />
                                                <asp:Label ID="LB_TypeID" runat="server" Visible="False"></asp:Label>
                                                <asp:TextBox ID="TB_TypeName" runat="server" Visible="False" Width="16px"></asp:TextBox>
                                            </td>
                                            <td align="center">
                                                <asp:Button CssClass="inpu" ID="BT_BookPublishersNew" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_BookPublishersNew_Click" />&nbsp;
                                        <asp:Button CssClass="inpu" ID="BT_BookPublishersDelete" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_BookPublishersDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                <asp:Label ID="lbl_BookPublishersId" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td align="center">
                                                <asp:Button CssClass="inpu" ID="BT_BookClassificationNew" runat="server" OnClick="BT_BookClassificationNew_Click"
                                                    Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button CssClass="inpu" ID="BT_BookClassificationDelete" runat="server" OnClick="BT_BookClassificationDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                            Text="<%$ Resources:lang,BaoCun%>" />
                                                <asp:Label ID="lbl_BookClassificationId" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 15px; background-color: buttonface"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 7px; text-align: center;" align="center">
                                                <strong>
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JieYueZhengJianSheDing%>"></asp:Label>：</strong></td>
                                            <td style="height: 7px; text-align: center;" align="center">
                                                <strong>
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiaoZhunFenLeiSheZhi%>"></asp:Label>：</strong></td>
                                            <td style="height: 7px;">
                                                <strong></strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 33%; height: 218px" valign="top">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="75%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhengJianMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhengJianShunXu%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid5_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="证件名称">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_CertificateName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"CertificateName").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="75%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="SortNo" HeaderText="证件顺序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                            <td style="width: 33%; height: 218px" valign="top">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BiaoZhunFenLei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,FenLeiDaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="64%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FenLeiNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="顺序" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" Width="1%" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="标准分类">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_ClassificationName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ClassificationType").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" Width="20%" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ClassificationCode" HeaderText="分类代码">
                                                            <ItemStyle CssClass="itemBorder" Width="15%" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="分类内容">
                                                            <ItemStyle CssClass="itemBorder" Width="64%" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid></td>
                                            <td style="width: 33%; height: 218px" valign="top"></td>
                                        </tr>
                                        <tr>
                                            <td align="center">&nbsp;</td>
                                            <td align="center">
                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BiaoZhunFenLei%>"></asp:Label>：<asp:TextBox ID="TB_ClassificationType1" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhengJianMingCheng%>"></asp:Label>：<asp:TextBox ID="TB_CertificateName" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td align="center">
                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FenLeiDaiMa%>"></asp:Label>：<asp:TextBox ID="TB_ClassificationCode" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 9px;" align="center">
                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhengJianShunXu%>"></asp:Label>：<asp:TextBox ID="TB_SortNoC" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 9px;" align="center">
                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,FenLeiNeiRong%>"></asp:Label>：<asp:TextBox ID="TB_Remark1" runat="server" Width="101px"></asp:TextBox>
                                            </td>
                                            <td style="height: 9px;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 14px;" align="center">
                                                <asp:Button CssClass="inpu" ID="BT_BookCertificateNew" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_BookCertificateNew_Click" />&nbsp;
                                        <asp:Button CssClass="inpu" ID="BT_BookCertificateDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_BookCertificateDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                <asp:Label ID="lbl_BookCertificateId" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td style="height: 14px;" align="center">
                                                <asp:Button ID="BT_BookClassificationNew1" runat="server" CssClass="inpu" OnClick="BT_BookClassificationNew1_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                &nbsp;&nbsp;
                                            <asp:Button ID="BT_BookClassificationDelete1" runat="server" CssClass="inpu" OnClick="BT_BookClassificationDelete1_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                <asp:Label ID="lbl_BookClassificationId1" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td style="height: 14px;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 12px; background-color: buttonface"></td>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
