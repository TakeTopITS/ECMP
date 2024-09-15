<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeBookManage.aspx.cs" Inherits="TTMakeBookManage" %>

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

        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 183px;
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                        <table id="AboveTable" cellpadding="0" width="1500px" cellspacing="0" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BiaoZhunYuTuShuChaXun%>"></asp:Label>
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
                                <td style="padding-left: 5px;">
                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left">
                                                <table width="70%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_BarCode" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_BookName" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_ReferenceNo" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="TB_BelongDepartCode" runat="server" Width="125px"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="TB_BelongDepartCode_ModalPopupExtender" runat="server"
                                                                Enabled="True" TargetControlID="TB_BelongDepartCode" PopupControlID="Panel1"
                                                                CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Label ID="LB_BelongDepartName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_QueryBook" runat="server" CssClass="inpu" OnClick="BT_QueryBook_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="ddl_BookClassificationId" DataTextField="ClassificationType" DataValueField="ID" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
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
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuZuoZhe%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_Author" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">&nbsp;</td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_BookExportExcel" runat="server" CssClass="inpu" OnClick="BT_BookExportExcel_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="font-size: 10pt">
                                            <td>
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                    width="100%">
                                                    <tr>
                                                        <td align="left" class="page_topbj">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShuJiXinXiLieBiao%>"></asp:Label>： </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuZuoZhe%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuBanShiShiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FenLeiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XianCunShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JieChuShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JieYueCiShu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiaGe%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                    OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" Width="100%" ShowHeader="false">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookType" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BarCode" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTMakeBookInfoDetail.aspx?Para=2&ID={0}"
                                                            DataTextField="BookName" HeaderText="名称" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="ReferenceNo" HeaderText="检索号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Author" HeaderText="著作者">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PublicationDate" HeaderText="出版/实施日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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
                                                        <asp:BoundColumn DataField="BookPublishersName" HeaderText="出版社">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookNum" HeaderText="现存数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookUseNum" HeaderText="借出数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UseNum" HeaderText="借阅次数">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Price" HeaderText="价格">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; width: 90%;">
                                                <table width="70%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JieYueZhe%>"></asp:Label>：
                                                        </td>
                                                        <td class="auto-style1" style="text-align: left">
                                                            <asp:TextBox ID="txt_Borrow" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianHaoHuoMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_BookInfo" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_QueryBorrow" runat="server" CssClass="inpu" OnClick="BT_QueryBorrow_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DuZheLeiXing%>"></asp:Label>：</td>
                                                        <td class="auto-style1" style="text-align: left">
                                                            <asp:DropDownList ID="ddl_ReaderTypeId" runat="server" DataTextField="TypeName" DataValueField="ID">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,PaiXuFangShi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="ddl_CertificateId" DataTextField="CertificateName" DataValueField="ID" runat="server" Visible="False">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                                                <asp:ListItem Value="0" Text="<%$ Resources:lang,ShuMing%>" />
                                                                <asp:ListItem Value="1" Text="<%$ Resources:lang,BiaoZhunHao%>" />
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lbl_sql2" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_BorrowExportExcel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoChu%>" OnClick="BT_BorrowExportExcel_Click" /></td>
                                                    </tr>
                                                </table>
                                                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" class="page_topbj" colspan="6">
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuJiJieYueLieBiao%>"></asp:Label>： </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <%-- <td align="center" width="4%"><strong>编号</strong></td>--%>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                <td align="center" width="9%"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JieYueShuLiang%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,DuZheBianMa%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DuZheMingCheng%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DuZheDanWei%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DuZheDianHua%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,DuZheShouJi%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DuZheLeiXing%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label></strong></td>
                                                                                <%--    <td align="center" width="5%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label></strong></td>--%>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label></strong></td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label></strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,JieYueRiQi%>"></asp:Label></strong></td>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuiHuanRiQi%>"></asp:Label></strong></td>
                                                                                <%--     <td align="center" width="1%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,FaKuanJinE%>"></asp:Label></strong></td>--%>
                                                                                <%-- <td align="center" width="5%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,DuZheLeiXing%>"></asp:Label></strong></td>--%>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieYueZhengJian%>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%" PageSize="5" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BarCode" HeaderText="书籍条码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookName" HeaderText="书籍名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookUseNum" HeaderText="借阅数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowCode" HeaderText="读者编码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowName" HeaderText="读者名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowUnit" HeaderText="读者单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowPhone" HeaderText="读者电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowMobile" HeaderText="读者手机">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReaderTypeName" HeaderText="读者类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReferenceNo" HeaderText="检索号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Version" HeaderText="版本" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookClassificationName" HeaderText="所属归类">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookPublishersName" HeaderText="出版社">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BorrowDate" HeaderText="借阅日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="RealBackDate" HeaderText="归还日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BookRent" HeaderText="罚款金额" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReaderTypeName" HeaderText="读者类型" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CertificateName" HeaderText="借阅证件">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_BookExportExcel" />
                    <asp:PostBackTrigger ControlID="BT_BorrowExportExcel" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                    <table>
                        <tr>
                            <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                    ShowLines="True" Width="220px">
                                    <RootNodeStyle CssClass="rootNode" />
                                    <NodeStyle CssClass="treeNode" />
                                    <LeafNodeStyle CssClass="leafNode" />
                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                </asp:TreeView>
                            </td>
                            <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
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
