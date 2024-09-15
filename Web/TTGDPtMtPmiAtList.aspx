<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDPtMtPmiAtList.aspx.cs" Inherits="TTGDPtMtPmiAtList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { 

            

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">PT,MT,PMI,AT
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
                                <td style="padding: 2px 2px 2px 2px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <cc1:tabcontainer id="TabContainer1" runat="server" activetabindex="0" width="100%">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Dye Penetrant Test">
                                                        <HeaderTemplate>
                                                            Dye Penetrant Test
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%" cellpadding="4" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        ISOME DWG NO.<asp:DropDownList ID="DDL_IsomeDwgNo" runat="server"></asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>Isome No.</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Joint</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Fluid</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Size</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Type</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Root</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Cover</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>PT Report</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>PT Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Grd</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>RT%</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BR</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>SW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AW</strong>
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
                                                                            Height="1px"  ShowHeader="False" PageSize="15"
                                                                             Width="100%" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="IsomeNo" HeaderText="Isome No.">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Joint" HeaderText="Joint">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Fluid" HeaderText="Fluid">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Size" HeaderText="Size">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="Type">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Root" HeaderText="Root">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Cover" HeaderText="Cover">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Date" HeaderText="Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PTReport" HeaderText="PT Report">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PTDate" HeaderText="PT Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Grd" HeaderText="Grd">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RT" HeaderText="RT%">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BW" HeaderText="BW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BR" HeaderText="BR">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SW" HeaderText="SW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AW" HeaderText="AW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Positive Material Identification">
                                                        <ContentTemplate>
                                                            <table width="98%" cellpadding="4" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        ISOME DWG NO.<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>Isome No.</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Joint</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Fluid</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Size</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Type</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Root</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Cover</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>PMI Report</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>PMI Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>RMI%</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BR</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>SW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AW</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            Height="1px"  ShowHeader="False" PageSize="15"
                                                                             Width="100%" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="IsomeNo" HeaderText="Isome No.">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Joint" HeaderText="Joint">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Fluid" HeaderText="Fluid">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Size" HeaderText="Size">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="Type">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Root" HeaderText="Root">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Cover" HeaderText="Cover">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Date" HeaderText="Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PMIReport" HeaderText="PMI Report">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PMIDate" HeaderText="PMI Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RMI" HeaderText="PMI%">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BW" HeaderText="BW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BR" HeaderText="BR">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SW" HeaderText="SW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AW" HeaderText="AW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Air Leak Test(Branch Pad)">
                                                        <ContentTemplate>
                                                            <table width="98%" cellpadding="4" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        ISOME DWG NO.<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>Isome No.</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Joint</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Fluid</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Size</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Type</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Root</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Cover</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AT Report</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AT Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Grd</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>RT%</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BR</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>SW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AW</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            Height="1px"  ShowHeader="False" PageSize="15"
                                                                             Width="100%" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="IsomeNo" HeaderText="Isome No.">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Joint" HeaderText="Joint">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Fluid" HeaderText="Fluid">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Size" HeaderText="Size">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="Type">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Root" HeaderText="Root">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Cover" HeaderText="Cover">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Date" HeaderText="Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ATReport" HeaderText="AT Report">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ATDate" HeaderText="AT Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Grd" HeaderText="Grd">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RT" HeaderText="RT%">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BW" HeaderText="BW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BR" HeaderText="BR">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SW" HeaderText="SW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AW" HeaderText="AW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Magnetic Particle Test">
                                                        <ContentTemplate>
                                                            <table width="98%" cellpadding="4" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        ISOME DWG NO.<asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>Isome No.</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Joint</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Fluid</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Size</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Type</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Root</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Cover</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>MT Report</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>MT Date</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>Grd</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>RT%</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>BR</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>SW</strong>
                                                                                            </td>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>AW</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            Height="1px"  ShowHeader="False" PageSize="15"
                                                                             Width="100%" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="IsomeNo" HeaderText="Isome No.">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Joint" HeaderText="Joint">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Fluid" HeaderText="Fluid">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Size" HeaderText="Size">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="Type">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Root" HeaderText="Root">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Cover" HeaderText="Cover">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Date" HeaderText="Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="MTReport" HeaderText="MT Report">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="MTDate" HeaderText="MT Date">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Grd" HeaderText="Grd">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RT" HeaderText="RT%">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BW" HeaderText="BW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BR" HeaderText="BR">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SW" HeaderText="SW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AW" HeaderText="AW">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                 </cc1:tabcontainer>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
