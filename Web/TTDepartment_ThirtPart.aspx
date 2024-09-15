<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDepartment_ThirtPart.aspx.cs" Inherits="TTDepartment_ThirtPart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView1").style.height = document.documentElement.clientHeight + "px";
            document.getElementById("Div_TreeView2").style.height = document.documentElement.clientHeight + "px";
        }

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
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                                    <tr>
                                        <td height="31" class="page_topbj">
                                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="left">
                                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="29">
                                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DiSanFangBuMenSheZhi%>"></asp:Label>
                                                                </td>
                                                                <td width="5">
                                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
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
                                                    <td width="220" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;"
                                                        align="left" rowspan="2">
                                                        <div id="Div_TreeView1" style="overflow: auto; height: 800px;">
                                                            <asp:TreeView ID="TreeView1" runat="server"
                                                                NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True"
                                                                Width="220">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </div>
                                                    </td>
                                                    <td width="650px;" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8;"
                                                        align="center">
                                                        <table style="width: 94%; text-align: left;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZuZhiJiaGouWeiHu%>"></asp:Label>：
                                                        <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                                <td align="right" style="width: 30%; padding-right: 5px;" class="formItemBgStyle">
                                                                    <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_DepartCode" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_DepartName" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShangJiDaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_ParentCode" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Authority" runat="server" Enabled="false">
                                                                        <asp:ListItem Value="部分" Text="<%$ Resources:lang,BuFen%>" />
                                                                        <asp:ListItem Value="所有" Text="<%$ Resources:lang,SuoYou%>" />
                                                                    </asp:DropDownList>
                                                                    <span style="font-size: x-small; color: Red;">（<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XuanZeKeGengGaiQuanXian%>"></asp:Label>）</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                                                    <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,lianxiren%>"></asp:Label>
                                                                    ： </td>
                                                                <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                                                    <asp:TextBox ID="TB_ContactPerson" runat="server"></asp:TextBox>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                                                    <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,gongsiDiZhi%>"></asp:Label>
                                                                    ： </td>
                                                                <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                                                    <asp:TextBox ID="TB_CompanyAddress" runat="server" Width="99%"></asp:TextBox>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                                                    <asp:Label ID="LB_WorkAddress" runat="server" Text="<%$ Resources:lang,BanGongDiZhi%>"></asp:Label>
                                                                    ： </td>
                                                                <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                                                    <asp:TextBox ID="TB_WorkAddress" runat="server" Width="60%"></asp:TextBox>
                                                                    <asp:Label ID="LB_IsDefaultWorkAddress" runat="server" Text="<%$ Resources:lang,ShiFouQueSheng%>"></asp:Label>
                                                                    ： 
                                                            <asp:DropDownList ID="DL_IsDefaultWorkAddress" runat="server">
                                                                <asp:ListItem Text="<%$ Resources:lang,Fou%>" Value="NO" />
                                                                <asp:ListItem Text="<%$ Resources:lang,Shi%>" Value="YES" />
                                                            </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                                                    <asp:Label ID="LB_Longitude" runat="server" Text="<%$ Resources:lang,Longitude%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:TextBox ID="TB_Longitude" runat="server"></asp:TextBox>
                                                                            </td>
                                                                            <td>

                                                                                <a class="titleSpan" href="http://api.map.baidu.com/lbsapi/getpoint/index.html">
                                                                                    <img src="ImagesSkin/GPS.jpg" alt="取经纬度" width="20" height="20" style="border: 0px;">
                                                                                </a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                                                    <asp:Label ID="LB_Latitude" runat="server" Text="<%$ Resources:lang,Latitude%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                                                    <asp:TextBox ID="TB_Latitude" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="width: 30%; height: 26px;" class="formItemBgStyle"></td>
                                                                <td style="width: 70%; height: 26px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:Button ID="BT_Update" CssClass="inpu" runat="server" Enabled="False" OnClick="BT_Update_Click"
                                                                        Text="<%$ Resources:lang,BaoCun%>" />&nbsp;
                                                                    <asp:Button ID="BT_Delete" CssClass="inpu" runat="server" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        Text="<%$ Resources:lang,ShanChu%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZuZhiCengCiTiaoZheng%>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_DepartCode1" runat="server" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_DepartName1" runat="server" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShangJiDaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 70%; height: 26px; width: 200px; text-align: left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_ParentCode1" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 30%; height: 26px;" class="formItemBgStyle"></td>
                                                                <td style="height: 26px; text-align: left; width: 70%;" class="formItemBgStyle">
                                                                    <asp:Button ID="BT_Adjust" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Adjust_Click"
                                                                        Text="<%$ Resources:lang,TiaoZheng%>" />
                                                                    <asp:Label ID="LB_CreatorCode" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <table cellpadding="5" cellspacing="0" width="94%">

                                                            <tr>
                                                                <td align="left">
                                                                    <b>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GLQXYHZXYHKKDCBM%>"></asp:Label>：</b>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="可视用户" TabIndex="0">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KeShiYongHu%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ContentTemplate>
                                                                                <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td width="7">
                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuanLianBuMenDaiMa %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuanLianBuMenMingCheng %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShanChu %>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td width="6" align="right">
                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" GridLines="None">
                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                    <Columns>
                                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="DepartCode" HeaderText="关联部门代码">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="DepartName" HeaderText="关联部门名称">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:ButtonColumn>
                                                                                    </Columns>
                                                                                </asp:DataGrid>
                                                                                <br />
                                                                            </ContentTemplate>
                                                                        </cc1:TabPanel>

                                                                        <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="成员档案设置者" TabIndex="1">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ChengYuanDangAnSheZhiZhe%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ContentTemplate>
                                                                                <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td width="7">
                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="30%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="30%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShengXiaoShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td width="6" align="right">
                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                                    OnItemCommand="DataGrid5_ItemCommand" Width="100%" GridLines="None">
                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                    <Columns>
                                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="EffectDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生效时间">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:ButtonColumn>
                                                                                    </Columns>
                                                                                </asp:DataGrid>
                                                                            </ContentTemplate>
                                                                        </cc1:TabPanel>
                                                                    </cc1:TabContainer>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 180px; border-right: solid 1px #D8D8D8; vertical-align: top; padding-top: 5px;"
                                                        align="center">
                                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td colspan="2" align="Center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Bold="true" ForeColor="#333333" ShowHeader="false"
                                                            GridLines="None" OnItemCommand="DataGrid3_ItemCommand" Width="98%">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        </asp:DataGrid>
                                                    </td>
                                                    <td style="vertical-align: top;" rowspan="2" align="left">
                                                        <div id="Div_TreeView2" style="overflow: auto; height: 800px;">
                                                            <asp:TreeView ID="TreeView2" runat="server"
                                                                NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True"
                                                                Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label91" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%; text-align: left;" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DepartCodeNew" runat="server"></asp:TextBox>
                                        <span class="auto-style1">*</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DepartNameNew" runat="server"></asp:TextBox>


                                        <span class="auto-style1">*</span></td>
                                </tr>
                                <tr>
                                    <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ShangJiDaiMa%>"></asp:Label>：
                                    </td>
                                    <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ParentCodeNew" runat="server" Text="1"></asp:TextBox>
                                        <asp:Label ID="LB_ParentNameNew" runat="server"></asp:Label><span style="color: #ff0000">*<span>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1"
                                                runat="server" Enabled="True" TargetControlID="TB_ParentCodeNew" PopupControlID="Panel3"
                                                CancelControlID="IMB_CloseDepartment" BackgroundCssClass="modalBackground" Y="150">
                                            </cc1:ModalPopupExtender>
                                            <span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：
                                    </td>
                                    <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_AuthorityNew" runat="server">
                                            <asp:ListItem Value="所有" Text="<%$ Resources:lang,SuoYou%>" />
                                            <asp:ListItem Value="部分" Text="<%$ Resources:lang,BuFen%>" />
                                        </asp:DropDownList>
                                        <span style="font-size: x-small; color: Red;">（<asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,XuanZeKeGengGaiQuanXian%>"></asp:Label>）</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                        <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,lianxiren%>"></asp:Label>
                                        ： </td>
                                    <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_ContactPersonNew" runat="server"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                        <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,gongsiDiZhi%>"></asp:Label>
                                        ： </td>
                                    <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_CompanyAddressNew" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                        <asp:Label ID="Label87" runat="server" Text="办公地址"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_WorkAddressNew" runat="server" Width="400px"></asp:TextBox>
                                        <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,ShiFouQueSheng%>"></asp:Label>：
                                        <asp:DropDownList ID="DL_IsDefaultWorkAddressNew" runat="server">
                                            <asp:ListItem Text="<%$ Resources:lang,Fou%>" Value="NO" />
                                            <asp:ListItem Text="<%$ Resources:lang,Shi%>" Value="YES" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                        <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,Longitude%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_LongitudeNew" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 30%; height: 26px; text-align: right">
                                        <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,Latitude%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="width: 70%; height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_LatitudeNew" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="99%">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMB_CloseDepartment" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

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
