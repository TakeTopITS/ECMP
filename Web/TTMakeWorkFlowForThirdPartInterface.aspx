<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeWorkFlowForThirdPartInterface.aspx.cs" Inherits="TTMakeWorkFlowForThirdPartInterface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
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
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuDiSanFangJiCheng%>"></asp:Label>
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
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top" width="170px" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td align="center">
                                                            <strong>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongZuoLiuLeiXing%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                        OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" AllowPaging="True" ShowHeader="false"
                                        PageSize="20" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" />

                                        <ItemStyle CssClass="itemStyle" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="工作流类型:">
                                                <ItemTemplate>
                                                    <asp:Button ID="BT_WLType" runat="server" CssClass="inpuLong" Style="text-align: center"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                    <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <table style="width: 98%">
                                        <tr>
                                            <td>
                                                <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 10%; height: 20px; text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_WLID" runat="server" Font-Size="10pt"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_WLType" Width="90%" runat="server" Font-Size="10pt"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 40%; height: 20px; text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_CreatorCode" runat="server" Width="63px"></asp:Label>
                                                                        <asp:Label ID="LB_CreatorName" runat="server" Width="126px"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 10%; height: 25px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="5" style="height: 25px; text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_WLName" runat="server" Font-Size="10pt" Width="80%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 20%; height: 24px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="5" style="font-weight: bold; height: 24px; text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_WLDescription" runat="server" Font-Size="10pt" Height="43px"
                                                                            TextMode="MultiLine" Width="80%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 20%; text-align: right; height: 27px;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MuBanMingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="2" style="text-align: left; height: 27px;" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_TemName" runat="server" Width="90%" DataTextField="TemName"
                                                                            DataValueField="TemName">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td colspan="3" style="font-size: 10pt; text-align: left; height: 27px;" class="formItemBgStyle">
                                                                        <strong>
                                                                            <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                                Target="_blank">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                            </asp:HyperLink></strong>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 10%" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_Status" runat="server" Font-Bold="False" Font-Size="10pt" Font-Underline="False"
                                                                            ForeColor="#FF0033"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                                        <span style="background-color: #f0fff0">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：</span>
                                                                    </td>
                                                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_CreateTime" runat="server" Font-Size="10pt" Width="90%"></asp:Label>&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 10%; text-align: right; height: 45px;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuJuWenJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="5" style="height: 45px" align="left" class="formItemBgStyle">
                                                                        <asp:FileUpload ID="FUP_File" runat="server" Width="250px" EnableTheming="True" />
                                                                        <asp:Button ID="BT_BrowseData" runat="server" Height="20px" OnClick="BT_ReviewData_Click"
                                                                            Text="<%$ Resources:lang,ChaKanShuJu%>" CssClass="inpu" /><br />
                                                                        <asp:Label ID="LB_XMLFile" runat="server" Width="545px"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 21%; text-align: right; height: 25px;" class="formItemBgStyle"></td>
                                                                    <td colspan="5" align="left" class="formItemBgStyle">
                                                                        <asp:Button ID="BT_New" runat="server" Text="<%$ Resources:lang,XinJian%>" OnClick="BT_New_Click" CssClass="inpu" />&nbsp;
                                                                    <asp:Button ID="BT_Update" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" Enabled="False"
                                                                        CssClass="inpu" />&nbsp;
                                                                    <asp:Button ID="BT_Delete" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_Delete_Click" Enabled="False" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        CssClass="inpu" />
                                                                        &nbsp;&nbsp;
                                                                    <asp:HyperLink ID="HL_WLRelatedDoc" runat="server" NavigateUrl="TTReqRelatedDoc.aspx"
                                                                        Target="_blank" Enabled="False">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongZuoLiuLieBiao%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="30%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MuBan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            OnPageIndexChanged="DataGrid2_PageIndexChanged" OnItemCommand="DataGrid2_ItemCommand"
                                                                            Width="100%" AllowPaging="True" PageSize="5" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_WLID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"WLID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="WLName" HeaderText="工作流名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="TemName" DataNavigateUrlFormatString="TTWLTemplate.aspx?TemName={0}"
                                                                                    DataTextField="TemName" HeaderText="模板" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" align="center">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" style="padding-left: 10px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <asp:Label ID="LB_CheckData" runat="server" Text="<%$ Resources:lang,YaoShenHeDeShuJu%>" Visible="true"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 0px 2px 2px 2px;">
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" Width="840" Height="1px" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>
                                                                        <br />
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
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
