<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDPressureHistoryList.aspx.cs" Inherits="TTGDPressureHistoryList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>试压包历史状态</title>
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShiYaBaoLiShiZhuangTai%>"></asp:Label>
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr style="font-weight: bold; font-size: 11pt">
                                                        <td align="left" class="formItemBgStyle">Testloop No.：<asp:DropDownList ID="DDL_Testlopp" runat="server" OnSelectedIndexChanged="DDL_Testlopp_SelectedIndexChanged"></asp:DropDownList><br />
                                                            Isome NO.：<asp:TextBox ID="TXT_Isom_no" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DataGrid ID="DG_PictureList" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="True"
                                                                Width="100%" OnItemCommand="DG_PictureList_ItemCommand">
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Isom_no") %>' CommandName="edit">
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Isom_no" HeaderText="Involved Isom No.">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 1300px;">
                                                    <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Jt.No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Size</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Fluid Code</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Type</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">S/F</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Welding Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle" colspan="2">Welder</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="3">Fit-Up/Visual<br />
                                                                Date/Rec.No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle" colspan="3">RT</td>
                                                            <td style="text-align: center" class="formItemBgStyle">PT</td>
                                                            <td style="text-align: center" class="formItemBgStyle">MT</td>
                                                            <td style="text-align: center" class="formItemBgStyle">PMI</td>
                                                            <td style="text-align: center" class="formItemBgStyle">AT</td>
                                                            <td style="text-align: center" class="formItemBgStyle">PWHT</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="2">Root</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="2">Cover</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Lot No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle" rowspan="2">Res.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Date</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center" class="formItemBgStyle">Sample No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                            <td style="text-align: center" class="formItemBgStyle">Rec No.</td>
                                                        </tr>
                                                        <asp:Repeater ID="rptList" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("JointNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("Size")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("FluidCode")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("Type")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("SF")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("WeldingDate")%>
                                                                    </td>
                                                                    <td rowspan="2">
                                                                        <%# Eval("Root")%>
                                                                    </td>
                                                                    <td rowspan="2">
                                                                        <%# Eval("Cover")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("Fit-UPDate")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("LotNo")%>
                                                                    </td>
                                                                    <td rowspan="2">
                                                                        <%# Eval("Res")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("RTTime")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PTTime")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("MTTime")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PMITime")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("AT")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PWHT")%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6">Testloop No.:<%# Eval("testloopNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("FitUpRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("SampleNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("RTRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PTRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("MTRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PMIRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("ATRecNo")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PWHTRecNo")%>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>
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
