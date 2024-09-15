<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionManage_YOUP.aspx.cs" Inherits="TTCustomerQuestionManage_YOUP" %>

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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi"><asp:Label runat="server" Text="<%$ Resources:lang,KeHuFuWuGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td align="right" style="padding-top: 1px; padding-bottom: 1px; padding-right: 8px;">
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
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaiChuLiDeFuWuXuQiu%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouLiZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                PageSize="6" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OperatorName" HeaderText="客户等级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail_YOUP.aspx?ID={0}"
                                                                        DataTextField="Question" HeaderText="基本资料" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="SummitTime" HeaderText="首次咨询" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" HeaderText="客户来源">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UserPosition" HeaderText="行业类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="受理人">
                                                                        <ItemTemplate>
                                                                            <%# Eval("OperatorCode").ToString().Trim()==""?"":ShareClass.GetUserName(Eval("OperatorCode").ToString().Trim()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" alt="" class="noBorder"/></asp:HyperLink>
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
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WoChuLiZhongDeFuWuXuQiu%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShouLiZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="6" Width="100%"
                                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OperatorName" HeaderText="客户等级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail_YOUP.aspx?ID={0}"
                                                                        DataTextField="Question" HeaderText="基本资料" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="SummitTime" HeaderText="首次咨询" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" HeaderText="客户来源">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UserPosition" HeaderText="行业类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="受理人">
                                                                        <ItemTemplate>
                                                                            <%# Eval("OperatorCode").ToString().Trim()==""?"":ShareClass.GetUserName(Eval("OperatorCode").ToString().Trim()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" alt="" class="noBorder"/></asp:HyperLink>
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
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,WoYiChuLiDeFuWuXuQiu%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShouLiZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                PageSize="6" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OperatorName" HeaderText="客户等级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail_YOUP.aspx?ID={0}"
                                                                        DataTextField="Question" HeaderText="基本资料" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="SummitTime" HeaderText="首次咨询" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" HeaderText="客户来源">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UserPosition" HeaderText="行业类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="受理人">
                                                                        <ItemTemplate>
                                                                            <%# Eval("OperatorCode").ToString().Trim()==""?"":ShareClass.GetUserName(Eval("OperatorCode").ToString().Trim()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" alt="" class="noBorder"/></asp:HyperLink>
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
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,WoJiLuDeFuWuXuQiu%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShouLiZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="6" Width="100%"
                                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OperatorName" HeaderText="客户等级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail_YOUP.aspx?ID={0}"
                                                                        DataTextField="Question" HeaderText="基本资料" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="SummitTime" HeaderText="首次咨询" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" HeaderText="客户来源">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UserPosition" HeaderText="行业类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="受理人">
                                                                        <ItemTemplate>
                                                                            <%# Eval("OperatorCode").ToString().Trim()==""?"":ShareClass.GetUserName(Eval("OperatorCode").ToString().Trim()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" alt="" class="noBorder"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
