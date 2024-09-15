<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountFinancialSet.aspx.cs" Inherits="TTAccountFinancialSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>财务帐套设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiWuZhangTaoSheZhi%>"></asp:Label>
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
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; width:90%;">
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_ZhangTaoBianMa" runat="server" Text="<%$ Resources:lang,ZhangTaoBianMa%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                            <asp:TextBox ID="TB_FinancialCode" runat="server" CssClass="shuru" ReadOnly="false" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_ZhangTaoMingCheng" runat="server" Text="<%$ Resources:lang,ZhangTaoMingCheng%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_FinancialName" runat="server" CssClass="shuru" Width="120px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_HangYe" runat="server" Text="<%$ Resources:lang,HangYe%>"></asp:Label>： </td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                            <asp:TextBox ID="TB_Industry" runat="server" CssClass="shuru" ReadOnly="false" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_BuMen" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="lbl_DepartCode" runat="server"></asp:Label>
                                                            <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QingCongYouBianXuanQu%>"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_BenWeiBi" runat="server" Text="<%$ Resources:lang,BenWeiBi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_ZhuangTai4" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                <asp:ListItem Value="OPEN" Text="<%$ Resources:lang,QiYong%>"/>
                                                                <asp:ListItem Value="CLOSE" Text="<%$ Resources:lang,GuanBi%>"/>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_KaiShiRiQi" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="DLC_StartTime" runat="server" CssClass="shuru" ReadOnly="false" Width="120px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_StartTime">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_JieShuRiQi" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="DLC_EndTime" runat="server" Width="120px" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EndTime">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">&nbsp;</td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left; vertical-align: middle;">
                                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                                            <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />&nbsp;
                                                            <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                                            <asp:TextBox ID="TB_ID" runat="server" CssClass="shuru" ReadOnly="false" Visible="False" Width="40px"></asp:TextBox>
                                                            <asp:Label ID="lbl_OldFinancialCode" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="padding: 5px 5px 0px 5px; width:10%" rowspan="2">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style="width: 220px;" valign="top">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Width="170px">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 5px;">
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="99%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                        <tr>
                                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                                <asp:Label ID="LB_ZhangTaoXinXi" runat="server" Text="<%$ Resources:lang,ZhangTaoXinXi%>"></asp:Label>：</td>
                                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                                <asp:TextBox ID="txt_FinancialInfo" runat="server" CssClass="shuru"></asp:TextBox>
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                                <asp:Label ID="LB_ZhuangTai" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                                <asp:DropDownList ID="ddlStatus" runat="server">
                                                                                                    <asp:ListItem Value="" Text="<%$ Resources:lang,QingXuanZhe%>"/>
                                                                                                    <asp:ListItem Value="OPEN" Text="<%$ Resources:lang,QiYong%>"/>
                                                                                                    <asp:ListItem Value="CLOSE" Text="<%$ Resources:lang,GuanBi%>"/>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="font-size: 10pt">
                                                                                <td>
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                        width="100%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_BianHao" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_ZhangTaoBianMa1" runat="server" Text="<%$ Resources:lang,ZhangTaoBianMa%>"></asp:Label></strong></td>
                                                                                                        <td width="11%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_ZhangTaoMingCheng1" runat="server" Text="<%$ Resources:lang,ZhangTaoMingCheng%>"></asp:Label></strong></td>
                                                                                                        <td width="11%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_HangYe1" runat="server" Text="<%$ Resources:lang,HangYe%>"></asp:Label></strong></td>
                                                                                                        <td width="12%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_BuMen1" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_BenWeiBi1" runat="server" Text="<%$ Resources:lang,BenWeiBi%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_ZhuangTai1" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_KaiShiRiQi1" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_JieShuRiQi1" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                                        OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_Financial" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                                </ItemTemplate>
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="FinancialCode" HeaderText="帐套编码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="FinancialName" HeaderText="帐套名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="11%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Industry" HeaderText="行业">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="11%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="本位币">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                      <%--      <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>--%>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# Eval("Status").ToString()=="OPEN"?"启用":"关闭" %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="StartTime" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EndTime" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        
                                                                                        <ItemStyle CssClass="itemStyle" />
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
