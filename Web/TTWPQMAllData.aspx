<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWPQMAllData.aspx.cs" Inherits="TTWPQMAllData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>工艺基础数据</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYiJiChuShuJu%>"></asp:Label> </td>
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
                            <td align="center" style="padding-top: 5px;">
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="900px">
                                    <tr>
                                        <td align="right" style="width: 150px" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianMa%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Code" runat="server" CssClass="shuru" Width="120px"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                             <asp:DropDownList ID="DL_Type" runat="server">
                                                <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>"/>
                                                <asp:ListItem Value="适用类别" Text="<%$ Resources:lang,ShiYongLeiBie%>"/>
                                                <asp:ListItem Value="焊接方法" Text="<%$ Resources:lang,HanJieFangFa%>"/>
                                                <asp:ListItem Value="焊后热处理方法" Text="<%$ Resources:lang,HanHouReChuLiFangFa%>"/>
                                                <asp:ListItem Value="焊后热处理类别" Text="<%$ Resources:lang,HanHouReChuLiLeibie%>"/>
                                                <asp:ListItem Value="母材钢号" Text="<%$ Resources:lang,MuCaiGangHao%>"/>
                                                <asp:ListItem Value="母材规格" Text="<%$ Resources:lang,MuCaiGuiGe%>"/>
                                                <asp:ListItem Value="母材类别" Text="<%$ Resources:lang,MuCaiLeiBie%>"/>
                                                <asp:ListItem Value="焊材类别" Text="<%$ Resources:lang,HanCaiLeiBie%>"/>
                                                <asp:ListItem Value="焊丝型号" Text="<%$ Resources:lang,HanSiXingHao%>"/>
                                                <asp:ListItem Value="焊条型号" Text="<%$ Resources:lang,hanTiaoXingHao%>"/>
                                                <asp:ListItem Value="焊剂型号" Text="<%$ Resources:lang,hanJiXingHao%>"/>
                                                <asp:ListItem Value="焊丝牌号" Text="<%$ Resources:lang,HanSiPaiHao%>"/>
                                                <asp:ListItem Value="焊条牌号" Text="<%$ Resources:lang,HanTiaoPaiHao%>"/>
                                                <asp:ListItem Value="焊剂牌号" Text="<%$ Resources:lang,HanJiPaiHao%>"/>
                                                <asp:ListItem Value="焊丝规格" Text="<%$ Resources:lang,HanSiGuiGe%>"/>
                                                <asp:ListItem Value="焊条规格" Text="<%$ Resources:lang,HanTiaoGuiGe%>"/>
                                                <asp:ListItem Value="焊剂规格" Text="<%$ Resources:lang,HanJiGuiGe%>"/>
                                                <asp:ListItem Value="焊接方向" Text="<%$ Resources:lang,HanJieFangXiang%>"/>
                                                <asp:ListItem Value="冷却方法" Text="<%$ Resources:lang,LengQueFangFa%>"/>
                                                <asp:ListItem Value="类别组号" Text="<%$ Resources:lang,LeiBieZhuHao%>"/>
                                                <asp:ListItem Value="加热方式" Text="<%$ Resources:lang,JiaReFangShi%>"/>
                                                <asp:ListItem Value="焊材标准" Text="<%$ Resources:lang,HanCaiBiaoZhun%>"/>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShuJuMiaoShu%>"></asp:Label>  </td>
                                        <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                            <asp:TextBox ID="TB_Description" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 150px;" class="formItemBgStyle"></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                            &nbsp;
                                        <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            &nbsp;</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuJuXinXi%>"></asp:Label> <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="1000px">
                                    <tr>
                                        <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp; <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiChuShuJuLieBiao%>"></asp:Label>：</td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="formItemBgStyle">
                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> </strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label> </strong></td>
                                                                <td width="50%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShuJuMiaoShu%>"></asp:Label> </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="Code" HeaderText="编码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Description" HeaderText="数据描述">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
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
