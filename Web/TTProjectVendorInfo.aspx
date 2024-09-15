<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectVendorInfo.aspx.cs"
    Inherits="TTProjectVendorInfo" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShangZiLiao%>"></asp:Label>
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
                            <td align="right" style="padding: 5px 5px 5px 5px;">
                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">

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
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                   
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>EMail</strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    ShowHeader="false" Height="1px" OnItemCommand="DataGrid2_ItemCommand" PageSize="25"
                                    OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="100%" CellPadding="4"
                                    ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:ButtonColumn>
                                        <asp:TemplateColumn HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="VendorCode" HeaderText="代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:HyperLinkColumn DataNavigateUrlField="VendorCode" DataNavigateUrlFormatString="TTVendorInfoView.aspx?VendorCode={0}"
                                            DataTextField="VendorName" HeaderText="供应商名称" Target="_blank">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                        </asp:HyperLinkColumn>
                                        <asp:BoundColumn DataField="ContactName" HeaderText="联系人">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Tel1" HeaderText="电话">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="EmailAddress" HeaderText="EMail">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="RegistrationAddressCN" HeaderText="地址">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CreateDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="建立日期">
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

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label126" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                    </td>
                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_VendorCode" Width="99%" runat="server"></asp:TextBox>
                                        <asp:Label ID="LB_VendorCode" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_VendorName" runat="server" Width="99%" Style="margin-left: 0px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_VendorEnglishName" runat="server" Height="20px" Style="margin-left: 0px"
                                            Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Type" Width="50%" runat="server"></asp:TextBox>
                                        <asp:DropDownList ID="DL_IndustryType" runat="server" AutoPostBack="True"
                                            DataTextField="Type" DataValueField="Type"
                                            OnSelectedIndexChanged="DL_IndustryType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ContactName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SalePerson" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_InvoiceAddress" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">&nbsp;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Currency" runat="server">
                                            <asp:ListItem Value="人民币" Text="<%$ Resources:lang,RenMinBi%>" />
                                            <asp:ListItem Value="美元" Text="<%$ Resources:lang,MeiYuan%>" />
                                            <asp:ListItem Value="欧元" Text="<%$ Resources:lang,OuYuan%>" />
                                            <asp:ListItem Value="港币" Text="<%$ Resources:lang,GangBi%>" />
                                            <asp:ListItem Value="台币" Text="<%$ Resources:lang,TaiBi%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BankAccount" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Discount" runat="server" Width="80px">
                                        </NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Bank" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XinYongDengJi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_CreditRate" runat="server" Width="80px">0.00
                                        </NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DianHua1%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Tel1" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DianHua2%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Tel2" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Fax" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label19" runat="server"></asp:Label>EMail：
                                    </td>
                                    <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMailAddress" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WebSite" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ZP" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Country" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_State" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_City" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiangXiDiZhi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_AddressCN" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YingWenDiZhi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_AddressEN" Width="99%" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;" colspan="2" class="formItemBgStyle">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：
                                                    <asp:Label ID="LB_CreateDate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                    </td>
                                    <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Comment" runat="server" Height="60px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">&nbsp;</td>
                                    <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label><asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Enabled="false" Target="_blank">
                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XiangGuanLianXiRen%>"></asp:Label>
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
