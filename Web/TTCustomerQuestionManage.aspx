<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionManage.aspx.cs"
    Inherits="TTCustomerQuestionManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1300px;
            width: expression (document.body.clientWidth <= 1300? "1300px" : "auto" ));
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
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuFuWuGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td align="right" style="padding-top: 5px; padding-right: 8px;">
                                                <asp:Button ID="BT_AllQuestion" runat="server" CssClass="inpuLong" OnClick="BT_AllQuestion_Click"
                                                    Text="<%$ Resources:lang,SuoYouKeHuFuWuXuQiu%>" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table style="width: 100%; height: 1px">

                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table width="100%">
                                                                <tr>

                                                                    <td align="center" width="50%">
                                                                        <asp:Label ID="Label12342" runat="server" Text="<%$ Resources:lang,DaiChuLiDeFuWuXuQiu%>"></asp:Label>
                                                                    </td>
                                                                    <td width="50%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChongDianFuWuXuQiuHuoShangJi%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                </tr>
                                                                <tr>

                                                                    <td width="50%">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="5%"><strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="21%"><strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="14%"><strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="7%"><strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="6" ShowHeader="false" Width="100%">

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="21%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="ContactPerson" HeaderText="提出者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                    <td width="50%">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="5%"><strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="阶段"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="5%"><strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="赢率"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="12%"><strong>
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="3%">&nbsp;
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="6" ShowHeader="false" Width="100%">

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:HyperLinkColumn>

                                                                                <asp:BoundColumn DataField="Stage" HeaderText="阶段">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <%# Eval("Possibility").ToString() + "%" %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ContactPerson" HeaderText="提出者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WoChuLiZhongDeFuWuXuQiu%>"></asp:Label>
                                                            ： </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="16%"><strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label49" runat="server" Text="阶段"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label52" runat="server" Text="赢率"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="11%"><strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="6" ShowHeader="false" Width="100%">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="Stage" HeaderText="阶段">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("Possibility").ToString() + "%" %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="SummitTime" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" HeaderText="提交时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ContactPerson" HeaderText="提出者">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WoYiChuLiDeFuWuXuQiu%>"></asp:Label>
                                                            ： </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="16%"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label53" runat="server" Text="阶段"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label54" runat="server" Text="赢率"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="11%"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="6" ShowHeader="false" Width="100%">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="Stage" HeaderText="阶段">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("Possibility").ToString() + "%" %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="SummitTime" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" HeaderText="提交时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ContactPerson" HeaderText="提出者">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,WoJiLuDeFuWuXuQiu%>"></asp:Label>
                                                            ： </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="16%"><strong>
                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label55" runat="server" Text="阶段"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label56" runat="server" Text="赢率"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="11%"><strong>
                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="6" ShowHeader="false" Width="100%">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="Stage" HeaderText="阶段">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("Possibility").ToString() + "%" %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="SummitTime" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" HeaderText="提交时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ContactPerson" HeaderText="提问者">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>

                                                            <br />
                                                            <br />

                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <div class="renyList">
                                                                            <asp:Repeater ID="RP_ChartList" runat="server">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="LB_ChartName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartName") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="LB_ChartType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartType") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="LB_SqlCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SqlCode") %>' Visible="false"></asp:Label>
                                                                                    
                                                                                    <iframe src="TTTakeTopAnalystChartSet.aspx?FormType=<%# DataBinder.Eval(Container.DataItem,"FormType") %>&ChartType=<%# DataBinder.Eval(Container.DataItem,"ChartType") %>&ChartName=<%# DataBinder.Eval(Container.DataItem,"ChartName") %>" style="width: 300px; height: 295px; border: 1px solid white; text-align: center; overflow: hidden;"></iframe>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" style="vertical-align: bottom;">
                                                                        <asp:HyperLink ID="HL_SystemAnalystChartRelatedUserSet" runat="server" Text="<%$ Resources:lang,FenXiTuSheZhi%>"></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
