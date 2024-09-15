<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_BaseDataSet.aspx.cs" Inherits="TakeTopSoftRent_BaseDataSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register
    TagPrefix="customEditors"
    Namespace="AjaxControlToolkit.HTMLEditor.Samples" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
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
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="软件租用建站参数"></asp:Label>
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
                                            <td>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" width="100%">
                                                            <table cellpadding="3" cellspacing="0" style="width: 100%">
                                                                <tr>
                                                                    <td align="right" width="100%" style="padding-right: 5px;">
                                                                        <table>
                                                                            <tr>
                                                                                <td>站点：
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_HomeSiteURL" runat="server" AutoPostBack="true" DataTextField="SiteURL" DataValueField="SiteURL" OnSelectedIndexChanged="DL_HomeSiteURL_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                </td>

                                                                                <td>
                                                                                    <asp:Button ID="BT_CanUse" CssClass="inpu" runat="server" Text="设为在用" OnClick="BT_CanUse_Click" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_Delete" CssClass="inpu" runat="server" Text="删除" OnClick="BT_Delete_Click" />
                                                                                </td>
                                                                                <td>把站点</td>
                                                                                <td>
                                                                                    <asp:Label ID="LB_FromHomeSiteURL" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td>的数据复制到</td>
                                                                                <td>
                                                                                    <asp:TextBox ID="TB_HomeSiteURL" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_Copy" CssClass="inpu" runat="server" Text="复制" OnClick="BT_Copy_Click" />
                                                                                </td>
                                                                                <td width="200px"></td>
                                                                                <td align="right">
                                                                                    <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                                </td>
                                                                                <td>设置是否自动建站：
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_IsAutoBuildSite" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DL_IsAutoBuildSite_SelectedIndexChanged">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" width="100%">

                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                </td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>


                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="产品"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="版本"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label5" runat="server" Text="类型"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label7" runat="server" Text="建站应用"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label13" runat="server" Text="主站URL"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label6" runat="server" Text="在用"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label14" runat="server" Text="主站端口"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="站点目录"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="站点模板目录"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="站点虚拟路径"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="数据库恢复文件路径"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="数据库安装目录"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="7%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="数据库登录帐号"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label4" runat="server" Text="是否自动建站"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                                            ShowHeader="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                            Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentProductName" HeaderText="产品">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentProductVersion" HeaderText="版本">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentProductType" HeaderText="产品类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteCreatorAppName" HeaderText="建站应用">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteURL" HeaderText="主站URL">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="IsCanUse" HeaderText="在用">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteBindingInfo" HeaderText="主站端口">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDirectory" HeaderText="站点目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteTemplateDirectory" HeaderText="站点模板目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteVirtualDirectoryPhysicalPath" HeaderText="站点虚拟路径">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBRestoreFile" HeaderText="数据库恢复文件路径">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBSetupDirectory" HeaderText="数据库安装目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBLoginUserID" HeaderText="数据库登录帐号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="IsAutoBuildSite" HeaderText="是否自动建站">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <ItemStyle CssClass="itemStyle" />
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
                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <div class="layui-layer layui-layer-iframe" id="popwindow"
                            style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                            <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                                <asp:Label ID="Label322" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                            </div>
                            <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left; padding: 0px 5px 0px 5px;">

                                <table style="width: 100%">

                                    <tr>
                                        <td align="left" width="100%">
                                            <table style="width: 98%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td style="width: 10%; text-align: right" class="formItemBgStyle">

                                                        <asp:Label ID="Label3" runat="server" Text="建站应用"></asp:Label>
                                                        ：
                                                    </td>
                                                    <td style="width: 15%; text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteCreatorAppName" runat="server" Width="99%"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label23" runat="server" Text="产品"></asp:Label>：
                                                    </td>
                                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_RentProductName" runat="server">
                                                            <asp:ListItem>项目管理平台</asp:ListItem>
                                                            <asp:ListItem>研发项目管理平台</asp:ListItem>
                                                            <asp:ListItem>政务项目管理平台</asp:ListItem>
                                                            <asp:ListItem>工程项目管理平台</asp:ListItem>
                                                            <asp:ListItem>系统集成项目管理平台</asp:ListItem>
                                                            <asp:ListItem>软件实施项目管理平台</asp:ListItem>
                                                            <asp:ListItem>项目型ERP平台</asp:ListItem>
                                                            <asp:ListItem>综合平台</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>协同OA平台</asp:ListItem>
                                                            <asp:ListItem>客户关系管理平台</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>项目宝</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>演示测试平台</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: right; width: 10%;" class="formItemBgStyle">
                                                        <asp:Label ID="Label24" runat="server" Text="版本"></asp:Label>:
                                                    </td>
                                                    <td style="text-align: left; width: 10%;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_ProductVerType" runat="server">
                                                            <asp:ListItem>标准版</asp:ListItem>
                                                            <asp:ListItem>企业版</asp:ListItem>
                                                            <asp:ListItem>集团版</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: right; width: 10%;" class="formItemBgStyle">
                                                        <asp:Label ID="Label8" runat="server" Text="类型"></asp:Label>:
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_RentProductType" runat="server">
                                                            <asp:ListItem>GEPMP</asp:ListItem>
                                                            <asp:ListItem>RDPMP</asp:ListItem>
                                                            <asp:ListItem>GAPMP</asp:ListItem>
                                                            <asp:ListItem>EDPMP</asp:ListItem>
                                                            <asp:ListItem>SIMP</asp:ListItem>
                                                            <asp:ListItem>SOMP</asp:ListItem>
                                                            <asp:ListItem>ERP</asp:ListItem>
                                                            <asp:ListItem>ECMP</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>CRM</asp:ListItem>
                                                            <asp:ListItem>OA</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>SAAS</asp:ListItem>
                                                            <asp:ListItem>LOCALSAAS</asp:ListItem>
                                                            <asp:ListItem>------</asp:ListItem>
                                                            <asp:ListItem>DEMO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label25" runat="server" Text="主站URL"></asp:Label>：
                                                    </td>
                                                    <td style="width: 15%; text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteURL" runat="server" Width="99%"></asp:TextBox>
                                                    </td>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label26" runat="server" Text="主站端口"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteBindingInfo" runat="server" Width="99%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">

                                                        <asp:Label ID="Label27" runat="server" Text="站点目录"></asp:Label>：
                                                    </td>

                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">

                                                        <asp:TextBox ID="TB_SiteDirectory" runat="server" Width="99%"></asp:TextBox>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">

                                                        <asp:Label ID="Label28" runat="server" Text="站点模板目录"></asp:Label>：
                                                    </td>

                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">

                                                        <asp:TextBox ID="TB_SiteTemplateDirectory" runat="server" Width="99%"></asp:TextBox>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label29" runat="server" Text="站点虚拟路径"></asp:Label>：
                                                    </td>

                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteVirtualDirectoryPhysicalPath" runat="server" Width="99%"></asp:TextBox>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label30" runat="server" Text="数据库恢复文件路径"></asp:Label>：</td>

                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteDBRestoreFile" runat="server" Width="99%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label31" runat="server" Text="数据库安装目录"></asp:Label>：
                                                    </td>

                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteDBSetupDirectory" runat="server" Width="99%"></asp:TextBox>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label61" runat="server" Text="数据库登录帐号"></asp:Label>：</td>

                                                    <td colspan="5" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteDBLoginUserID" runat="server" Width="99%"></asp:TextBox>
                                                    </td>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label9" runat="server" Text="自动建站"></asp:Label>：</td>

                                                    <td style="text-align: left" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_AutoBuildSite" runat="server">
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            <asp:ListItem Value="YES">YES</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                                <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                            </div>
                            <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                        </div>

                        <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
