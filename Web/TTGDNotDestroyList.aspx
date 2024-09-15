<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDNotDestroyList.aspx.cs" Inherits="TTGDNotDestroyList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无损检测报告列表</title>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WSJCBGLB%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:DropDownList ID="DDL_GDProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_GDProject_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanXianTuHao%>"></asp:Label>：<asp:DropDownList ID="DDL_Isom_no" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Isom_no_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <input type="button" class="inpuLong" value="新增无损检测报告" onclick="window.location.href = 'TTGDNotDestroyEdit.aspx'" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 1300px;">
                                                    <%--<table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="4%" align="center">
                                                                            <strong>焊工号</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>焊口状态</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>尺寸</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>类型</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>S/F</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>介质</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>打底焊工1</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>打底焊工2</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>打底日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>盖面焊工1</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>盖面焊工2</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>盖面日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>返工焊工</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>返工日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>试压包号</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>FRI1</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>FRI2</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>FRI3</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>FRI4</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>组装日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>组装</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>外观日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>外观</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>RT日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>RT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PT日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PWHT日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PWHT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PMI日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>PMI</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>MT日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>MT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>Orifice日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>Orifice</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>空气试压日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>空气试压</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>Tie-In日期</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>Tie-In</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>RT细节1</strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>RT细节2</strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    操作
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='TTGDNotDestroyEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>'>编辑</a>
                                                                    <asp:Button ID="Button1" CssClass="inpu" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" Text="删除" />
                                                                    
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="WeldCode" HeaderText="焊口号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WeldStatus" HeaderText="焊口状态">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Size" HeaderText="尺寸">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Mold" HeaderText="类型">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SF" HeaderText="S/F">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Medium" HeaderText="介质">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RanderWelder1" HeaderText="打底焊工1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RanderWelder2" HeaderText="打底焊工2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RanderTime" HeaderText="打底日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CoveringWelder1" HeaderText="盖面焊工1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CoveringWelder2" HeaderText="盖面焊工2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CoveringTime" HeaderText="盖面日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ReturnWelder" HeaderText="返工焊工">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ReturnTime" HeaderText="返工日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PressurePackNo" HeaderText="试压包号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FRI1" HeaderText="FRI1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FRI2" HeaderText="FRI2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FRI3" HeaderText="FRI3">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FRI4" HeaderText="FRI4">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PackageTime" HeaderText="组装日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Package" HeaderText="组装">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OutsideTime" HeaderText="外观日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Outside" HeaderText="外观">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RTTime" HeaderText="RT日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RT" HeaderText="RT">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PTTime" HeaderText="PT日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PT" HeaderText="PT">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PWHTTime" HeaderText="PWHT日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PWHT" HeaderText="PWHT">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PMITime" HeaderText="PMI日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PMI" HeaderText="PMI">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MTTime" HeaderText="MT日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MT" HeaderText="MT">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OrificeTime" HeaderText="Orifice日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Orifice" HeaderText="Orifice">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="AirPressTime" HeaderText="空气试压日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="AirPress" HeaderText="空气试压">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TieInTime" HeaderText="Tie-In日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TieIn" HeaderText="Tie-In">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RTDetail1" HeaderText="RT细节1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RTDetail2" HeaderText="RT细节2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>--%>

                                                    <asp:Repeater ID="RT_List" runat="server">
                                                        <ItemTemplate>
                                                           
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formBgStyle">
                                                                    <tr>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HanKouHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HanKouZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChiCun%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>S/F</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaDiHanGong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DaDiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GaiMianHanGong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GaiMianRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FanGongHanGong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FanGongRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiYaBaoHao%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "WeldCode")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "WeldStatus")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Size")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Mold")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "SF")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Medium")%>
                                                                        </td>
                                                                        <td width="8%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RanderWelder1")%>&nbsp;<%#DataBinder.Eval(Container.DataItem, "RanderWelder2")%></td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RanderTime")%>
                                                                        </td>
                                                                        <td width="8%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "CoveringWelder1")%>&nbsp;<%#DataBinder.Eval(Container.DataItem, "CoveringWelder2")%></td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "CoveringTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "ReturnWelder")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "ReturnTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PressurePackNo")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>FRI1-4</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZuZhuang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WaiGuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>RT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>PT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>PWHT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>PMI</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>MT</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>Orifice</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KongQiShiYa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>Tie-In</strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,RTXiJie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "FRI1")%>&nbsp;<%#DataBinder.Eval(Container.DataItem, "FRI2")%></td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PackageTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "OutsideTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RTTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PTTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PWHTTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PMITime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "MTTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "OrificeTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "AirPressTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "TieInTime")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RTDetail1")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <a href='TTGDNotDestroyEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>'>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "FRI3")%>&nbsp;<%#DataBinder.Eval(Container.DataItem, "FRI4")%></td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Package")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Outside")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RT")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PT")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PWHT")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "PMI")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "MT")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "Orifice")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "AirPress")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "TieIn")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <%#DataBinder.Eval(Container.DataItem, "RTDetail2")%>
                                                                        </td>
                                                                        <td width="4%" align="center" class="formItemBgStyle">
                                                                            <strong>&nbsp;</strong>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="13" class="formItemBgStyle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            
                                                        </ItemTemplate>
                                                    </asp:Repeater>
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
