<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserAttendancePosition.aspx.cs" Inherits="TTUserAttendancePosition" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">

                                                <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>

                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29"></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanChengYuanWeiZhi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>


                                                <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>


                                                <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>


                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="left" width="100%">

                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="1200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="100px" align="center">
                                                                        <strong>&nbsp;</strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="150px" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_CreateTime" runat="server" Text="<%$ Resources:lang,Time%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="240px" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_UserPosition" runat="server" Text="<%$ Resources:lang,Position%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="100px" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="距离"></asp:Label>
                                                                        </strong>
                                                                        (<asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)
                                                                    </td>
                                                                    <td width="100px" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MacAddress%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="100px" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="DeviceID"></asp:Label></strong>
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
                                                    ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                    PageSize="30" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ShiftType" HeaderText="ShiftType">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                            DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="CreateTime" HeaderText="时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="150px" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="位置：">
                                                            <ItemTemplate>
                                                                <a href='TTUserPositionView.aspx?lng=<%# DataBinder.Eval(Container.DataItem,"Longitude").ToString().Trim() %>&lat=<%# DataBinder.Eval(Container.DataItem,"Latitude").ToString().Trim() %>'
                                                                    target="IFR_UserPositionMap">
                                                                    <%# DataBinder.Eval(Container.DataItem,"Address")%></a>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="240px" />
                                                        </asp:TemplateColumn>

                                                        <asp:BoundColumn DataField="Distance" HeaderText="Distance">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="MacAddress" HeaderText="MacAddress">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="DeviceID" HeaderText="DeviceID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
                                                        </asp:BoundColumn>

                                                    </Columns>
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                            <td style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;" valign="top">
                                                <%--<iframe id="IFR_UserPositionMap" name="IFR_UserPositionMap" src="TTUserPositionView.aspx" style="width: 100%; height: 800px;"></iframe>--%>
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
