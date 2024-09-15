<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDLineWeldList.aspx.cs" Inherits="TTGDLineWeldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管线和焊口列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/javascript">

        //编辑工程项目
        function AlertAddEditPage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }

        function LoadProjectList() {
            //alert("调用成功");
            document.getElementById("BT_RelaceLoad").click();
        }
   
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GuanXianHeHanKouLieBiao%>"></asp:Label>
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
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:DropDownList ID="DDL_GDProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_GDProject_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />&nbsp;
                                                <input type="button" class="inpuLong" value="新增管线和焊口" onclick="AlertAddEditPage('TTGDLineWeldEdit.aspx?id=');" />
                                                <%--<input type="button" class="inpuLong" value="新增管线和焊口" onclick="window.location.href = 'TTGDLineWeldEdit.aspx'" />--%>
                                                <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" style="display:none;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 2000px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanDaoDengJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GuanXianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CiXu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GuanXianDengJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JieZhiDaiHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanXianTuHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanDaoGuiGe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BanCi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FaBuRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShiYaBaoYi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,SheJiYaLiMpa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,SheJiWenDu%>"></asp:Label></strong>
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
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                    <%--<a href='TTGDLineWeldEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>'>编辑</a>--%>
                                                                    <a href='TTGDIsomJointList.aspx?Isom_no=<%# DataBinder.Eval(Container.DataItem,"Isom_no") %>'>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JieTou%>"></asp:Label></a>
                                                                    <asp:LinkButton ID="LB_Del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="notTab">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:Button ID="Button1" CssClass="inpu" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" Text="删除" />--%>
                                                                    
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PipelineLevel" HeaderText="管道等级">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="AreaName" HeaderText="区域">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="LineNumber" HeaderText="管线号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OrderNumber" HeaderText="次序">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="LineLevel" HeaderText="管线等级">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MediumCode" HeaderText="介质代号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Isom_no" HeaderText="单线图号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PipelineRule" HeaderText="管道规格">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Edition" HeaderText="版次">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PublicTime" HeaderText="发布日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FaBuRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PublicTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PressurePack1" HeaderText="试压包1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PressureMpa" HeaderText="设计压力Mpa">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DesignTemperature" HeaderText="设计温度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
