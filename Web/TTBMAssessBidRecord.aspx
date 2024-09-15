<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMAssessBidRecord.aspx.cs" Inherits="TTBMAssessBidRecord" %>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PingBiaoJiLu%>"></asp:Label>
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
                                <td align="center" style="padding-top: 5px;">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="900px">
                                        <tr>
                                            <td align="right" style="width: 150px" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_ID" runat="server" CssClass="shuru" Width="55px" Enabled="False"></asp:TextBox>
                                            </td>
                                            <td align="right" class="formItemBgStyle">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" style="width: 150px; height: 30px" class="formItemBgStyle">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KaiBiaoJiLu%>"></asp:Label>：</td>
                                            <td align="left" style="height: 30px" class="formItemBgStyle">
                                                <asp:DropDownList ID="DL_OpenBidRecordID" runat="server" DataTextField="Name" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DL_OpenBidRecordID_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right" class="formItemBgStyle" style="height: 30px">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <asp:DropDownList ID="DL_BidWay" runat="server">
                                                    <asp:ListItem Value="邀请招标" Text="<%$ Resources:lang,YaoQingZhaoBiao%>" />
                                                    <asp:ListItem Value="公开招标" Text="<%$ Resources:lang,GongKaiZhaoBiao%>" />
                                                    <asp:ListItem Value="议标" Text="<%$ Resources:lang,YiBiao%>" />
                                                    <asp:ListItem Value="其他" Text="<%$ Resources:lang,QiTa%>" />
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuSuanJia%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <NickLee:NumberBox ID="NB_BudgetPrice" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" CssClass="shuru">0.00</NickLee:NumberBox></td>
                                            <td align="right" class="formItemBgStyle" style="height: 30px">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiaoDiJia%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <NickLee:NumberBox ID="NB_ReservePrice" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" CssClass="shuru">0.00</NickLee:NumberBox></td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,PingBiaoRen%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <asp:TextBox ID="TB_AssessBidder" runat="server" CssClass="shuru"></asp:TextBox>
                                            </td>
                                            <td align="right" class="formItemBgStyle" style="height: 30px">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PingBiaoRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px">
                                                <asp:TextBox ID="DLC_AssessBidDate" runat="server" ReadOnly="false" CssClass="shuru"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_AssessBidDate">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,PingBiaoYaoSu%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                <asp:TextBox ID="TB_AssessBidFactors" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,PingBiaonNeiRong%>"></asp:Label>： </td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                <asp:TextBox ID="TB_AssessBidContent" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
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
                                            <td align="left" class="formItemBgStyle">&nbsp;</td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,PingBiaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KaiBiaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,PingBiaoRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox4" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>
                                            </td>
                                            <td>
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="1000px">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,PingBiaoJiLuLieBiao%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiBiaoJiLuMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YuSuanJia%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BiaoDiJia%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,PingBiaoRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PingBiaoRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,PingBiaoYaoSu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="19%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,PingBiaonNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="OpenBidRecordName" HeaderText="开标记录名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BudgetPrice" HeaderText="预算价">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReservePrice" HeaderText="标底价">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AssessBidder" HeaderText="评标人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AssessBidDate" HeaderText="评标日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AssessBidFactors" HeaderText="评标要素">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AssessBidContent" HeaderText="评标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
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
