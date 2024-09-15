<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInforContractTitle.aspx.cs" Inherits="TTUserInforContractTitle" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }

        #topNav {
            /*background-color:#096;*/
            z-index: 999;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }

        #bottomNav {
            /*background-color:#096;*/
            z-index: -2;
            position: relative;
            top: 205px;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" style="padding: 0px 5px 5px 5px;">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongDaoQiTiXing%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="center" style="padding: 5px 5px 5px 5px;">

                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 5px;">

                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td align="right" style="width: 80px;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                        </td>
                                                        <td align="left" style="width: 120px;">
                                                            <asp:TextBox ID="TB_UserCode" runat="server" Width="120px"></asp:TextBox></td>
                                                        <td align="right" style="width: 80px;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                        </td>
                                                        <td style="width: 120px;">
                                                            <asp:TextBox ID="TB_UserName" runat="server" Width="120px"></asp:TextBox></td>
                                                        <td align="left" style="width: 80px;">
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu "
                                                                OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" /></td>
                                                        <td width="20%"></td>
                                                    </tr>
                                                </table>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 5px;">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center"><strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiHao%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td width="11%" align="center"><strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td width="11%" align="center"><strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YouJian%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>
                                                                    </strong></td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" Width="100%">

                                                    <Columns>
                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Age" HeaderText="年龄">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EMail" HeaderText="邮件">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="JoinDate" HeaderText="加入日期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>

                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
