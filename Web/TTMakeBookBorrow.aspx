<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeBookBorrow.aspx.cs" Inherits="TTMakeBookBorrow" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JieYueGuanLi%>"></asp:Label>
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
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" colspan="2" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; width: 80%;">
                                                <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JieYueRen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="4" style="text-align: left">
                                                            <asp:TextBox ID="TB_ApplicantCode" runat="server" Width="80px" AutoPostBack="True" OnTextChanged="TB_ApplicantCode_TextChanged"></asp:TextBox>
                                                            <asp:Label ID="LB_ApplicantName" runat="server"></asp:Label>

                                                            <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZhe %>" CssClass="inpu" OnClick="BT_Select_Click" />
                                                            <asp:Label ID="lbl_BorrowNum" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_ApplicantType" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Button ID="BT_Query1" runat="server" CssClass="inpu" OnClick="BT_Query1_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JieYueRenDanWei%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="lbl_ApplicantUnit" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JieYueRenBanGongDianHua%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="lbl_ApplicantOfficePh" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieYueRenShouJiHaoMa%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="lbl_ApplicantMobilePh" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieYueShiJian%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="DLC_BorrowDate" runat="server" ReadOnly="false"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_BorrowDate">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YuJiGuiHuanShiJian%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="DLC_BackDate" runat="server" ReadOnly="false"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_BackDate">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DuZheLeiXing%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="ddl_ReaderTypeId" runat="server" AutoPostBack="True" DataTextField="TypeName" DataValueField="ID" OnSelectedIndexChanged="ddl_ReaderTypeId_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">&nbsp;<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieYueZhengJianJiZhengJianHao%>"></asp:Label>借阅证件及证件号：</td>
                                                        <td class="formItemBgStyle" style="text-align: left" colspan="1">
                                                            <asp:DropDownList ID="ddl_CertificateId" runat="server" DataTextField="CertificateName" DataValueField="ID" >
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:TextBox ID="txt_CertificateNo" runat="server" Width="200px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                                            <asp:TextBox ID="TB_Remark" runat="server" Height="37px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" class="page_topbj" colspan="6">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuJiJieYueLieBiao%>"></asp:Label>x： </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label></strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label></strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label></strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label></strong></td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JieYueRiQi%>"></asp:Label></strong></td>
                                                                                <%--   <td align="center" width="8%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,GuiHuanRiQi%>"></asp:Label></strong></td>--%>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DuZheLeiXing%>"></asp:Label></strong></td>
                                                                                <%--  <td align="center" width="8%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,JieYueZhengJian%>"></asp:Label></strong></td>--%>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                <%-- <td align="center" width="2%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong></td>--%>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%" OnItemDataBound="DataGrid2_ItemDataBound">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="操作">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text="归还" />
                                                                            <asp:HiddenField runat="server" ID="hfStatus" Value='<%#Eval("Status")%>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BarCode" HeaderText="标准号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReferenceNo" HeaderText="检索号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookClassificationName" HeaderText="分类">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookUseNum" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookPublishersName" HeaderText="出版社">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowDate" HeaderText="借阅日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BackDate" HeaderText="归还日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReaderTypeName" HeaderText="读者类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CertificateName" HeaderText="借阅证件" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Remark" HeaderText="备注" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>
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
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="padding-left: 5px;" colspan="2">
                                                <table align="center" cellpadding="0" cellspacing="0" width="99%">
                                                    <tr>
                                                        <td align="left">
                                                            <table width="80%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BiaoHao%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="txt_BarCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="txt_BookName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="txt_ReferenceNo" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="ddl_BookClassificationId" DataTextField="Classification" DataValueField="ID" runat="server">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="ddl_BookPublishersId" DataTextField="PublishersName" DataValueField="ID" runat="server" Visible="False">
                                                                        </asp:DropDownList>
                                                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                                                            <asp:ListItem Value="0" Text="<%$ Resources:lang,QingXuanZe%>" />
                                                                            <asp:ListItem Value="1" Text="<%$ Resources:lang,TuShu%>" />
                                                                            <asp:ListItem Value="2" Text="<%$ Resources:lang,BiaoZhun%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuZuoZhe%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="txt_Author" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: center">
                                                                        <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="font-size: 10pt">
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FenLeiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,KeJieShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,JieYueShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="操作">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text="<%$ Resources:lang,JieYue%>" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BarCode" HeaderText="标准号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTMakeBookInfoDetail.aspx?Para=2&ID={0}"
                                                                        DataTextField="BookName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="ReferenceNo" HeaderText="检索号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookClassificationName" HeaderText="分类">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ClassificationCode" HeaderText="分类码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Location" HeaderText="存放位置" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookPublishersName" HeaderText="出版社">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookNum" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="借阅数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <ItemTemplate>
                                                                            <asp:TextBox runat="server" ID="txtBookUseNum" Width="80%" AutoCompleteType="Disabled" EnableViewState="false" onkeypress="if (event.keyCode < 47 || event.keyCode > 58) event.returnValue = false;" Text="1"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="PageNum" HeaderText="页数" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Version" HeaderText="版本">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <%--   <asp:HyperLinkColumn DataNavigateUrlField="BookImage" DataNavigateUrlFormatString="{0}" DataTextField="BookName" HeaderText="电子版" 
                                                                                                Target="_blank"><ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:HyperLinkColumn>--%>
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
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label42" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <div id="DivID" style="width: 100%; height: 480px; overflow: auto;">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left" style="width: 250px;" valign="top">
                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Width="250px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                        </td>
                                        <td style="border-right: solid 1px #D8D8D8;" valign="top" >

                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                width="170px">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="false"
                                                Width="170px">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="部门人员：">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserCode").ToString().Trim() %>' />
                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserName").ToString().Trim() %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid>

                                        </td>
                                    </tr>
                                </table>

                            </div>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
