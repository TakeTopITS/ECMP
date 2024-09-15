<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMAssessBidReportReview.aspx.cs" Inherits="TTBMAssessBidReportReview" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" colspan="2">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoShenPi%>"></asp:Label></td>
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
                                <td align="center" style="padding-top: 5px; width: 50%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="right" style="width: 150px" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_ID" runat="server" CssClass="shuru" Width="55px" Enabled="False"></asp:TextBox>
                                            </td>
                                            <td align="right" class="formItemBgStyle">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PingBiaoJiLuMingCheng%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:DropDownList ID="DL_AssessBidRecordID" runat="server" DataTextField="Name" DataValueField="ID" Enabled="False">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoRen%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <asp:TextBox ID="TB_AssessSpeaker" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                            </td>
                                            <td align="right" class="formItemBgStyle" style="height: 30px">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <asp:TextBox ID="DLC_AssessReportDate" runat="server" ReadOnly="false" CssClass="shuru" Enabled="False"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_AssessReportDate">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoNeiRong%>"></asp:Label>： </td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                <asp:TextBox ID="TB_AssessReportContent" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenPiRen%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="1" style="height: 30px">
                                                <asp:TextBox ID="TB_Reviewer" runat="server" CssClass="shuru"></asp:TextBox>
                                            </td>
                                            <td align="right" class="formItemBgStyle">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenPiRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:TextBox ID="DLC_ReviewDate" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ReviewDate">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenPiYiJian%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                <asp:TextBox ID="TB_ReviewResult" runat="server" Height="35px" TextMode="MultiLine" Width="90%" CssClass="shuru"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 150px;" class="formItemBgStyle">
                                                <asp:Label ID="lbl_AnnInvitationID" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                                    Text="审 核" Enabled="False" />
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
                                </td>
                                <td align="center" style="padding-top: 5px; width: 50%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BaoGaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PingBiaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="center" rowspan="2" style="text-align: center">
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShenPiRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox4" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoLieBiao%>"></asp:Label>：</td>
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
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,PingBiaoJiLuMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PingBiaoBaoGaoNeiRong%>"></asp:Label></strong></td>
                                                                    <td width="40%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenPiYiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="5" OnPageIndexChanged="DataGrid2_PageIndexChanged">

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
                                                        <asp:BoundColumn DataField="AssessBidRecordName" HeaderText="评标记录名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AssessReportContent" HeaderText="评标报告内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReviewResult" HeaderText="审批意见">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
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
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" style="padding-top: 5px; width: 100%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongYingShangTouBiaoLieBiao%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,TouBiaoRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,TouBiaoZhuangTai%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TongZhiNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid1_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged" OnItemDataBound="DataGrid1_ItemDataBound">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="操作">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_Bidding" CommandName="中标" runat="server" CssClass="inpu" Text='中标' />
                                                                <asp:Button ID="BT_NoBidding" CommandName="未中标" runat="server" CssClass="inpu" Text='未中标' />
                                                                <asp:HiddenField runat="server" ID="hfStatus" Value='<%#Eval("BidStatus")%>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="供应商">
                                                            <ItemTemplate>
                                                                <%# GetBMSupplierInfoName(Eval("SupplierCode").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BiddingDate" HeaderText="投标日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="中标状态">
                                                            <ItemTemplate>
                                                                <%# GetBMSupplierBidStatus(Eval("BidStatus").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" ForeColor="Blue" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="NoticeContent" HeaderText="通知内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
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
