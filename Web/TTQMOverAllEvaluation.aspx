<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTQMOverAllEvaluation.aspx.cs" Inherits="TTQMOverAllEvaluation" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 321px;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 321px;
        }

        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 100px;
        }

        .auto-style4 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 100px;
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouYeWuPingJia%>"></asp:Label>
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
                                        
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuHeTong%>"></asp:Label>：
                                        </td>
                                        <td colspan ="3" align="left" class="formItemBgStyle">
                                            <asp:Label ID="LB_Code" runat="server"></asp:Label>
                                            <asp:DropDownList ID="DL_PurchasingContractCode" runat="server" CssClass="shuru" DataTextField="Name" DataValueField="Code">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="color: #000000">
                                        <td align="right" style="width: 150px; height: 30px" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChuangJianRen%>"></asp:Label>：
                                        </td>
                                        <td align="left" class="auto-style2">
                                            <asp:TextBox ID="TB_CreatePer" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style4">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                        <td align="left" class="formItemBgStyle" style="height: 30px">
                                            <asp:DropDownList ID="DL_Status" runat="server" CssClass="shuru">
                                                <asp:ListItem Value="合格" Text="<%$ Resources:lang,HeGe%>" />
                                                <asp:ListItem Value="不合格" Text="<%$ Resources:lang,BuHeGe%>" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="color: #000000;">
                                        <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZongTiPingJia%>"></asp:Label>：</td>
                                        <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">

                                            <asp:TextBox ID="TB_OverAllEvaluation" runat="server" CssClass="shuru" Height="35px" TextMode="MultiLine" Width="90%"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 150px;" class="formItemBgStyle"></td>
                                        <td align="left" class="auto-style1">
                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                            &nbsp;
                                        <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                        </td>
                                        <td align="left" class="auto-style3">&nbsp;</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PingJiaXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChuangJianRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" Width="90px" ReadOnly="false"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                            </cc1:CalendarExtender>
                                            至<asp:TextBox ID="TextBox4" runat="server" Width="90px" ReadOnly="false"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
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
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiGouYeWuPingJiaLieBiao%>"></asp:Label>： &nbsp; &nbsp;
                                        </td>
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
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuangJianRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ChuangJianRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="40%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZongTiPingJia%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" ShowHeader="false" OnPageIndexChanged="DataGrid2_PageIndexChanged" AllowPaging="true" PageSize="10">

                                                <ItemStyle CssClass="itemStyle" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_Code" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Code").ToString().Trim() %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="PurchasingContractName" HeaderText="合同名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CreatePer" HeaderText="创建人">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="OverAllEvaluation" HeaderText="总体评价">
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
