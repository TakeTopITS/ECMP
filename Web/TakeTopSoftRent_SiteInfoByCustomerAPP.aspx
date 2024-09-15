<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_SiteInfoByCustomerAPP.aspx.cs" Inherits="TakeTopSoftRent_SiteInfoByCustomerAPP" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

<!DOCTYPE html>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 3200px;
            width: expression (document.body.clientWidth <= 3200? "3200px" : "auto" ));
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
                                            <td style ="" height="31" class="page_topbj">
                                                <table width="99%">
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="30" align="right">
                                                                            <img src="ImagesSkin/return.png" alt="" />
                                                                        </td>
                                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                                            <asp:Label ID="Label1" runat ="server" Text="<%$ Resources:lang,Back%>" />
                                                                        </td>

                                                                        <td class="titleziAPP" style="width: 100px; text-align: center; padding-top: 5px;">
                                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" width="100%" style="padding-right: 5px; padding-left: 13px;">
                                                            <table>
                                                                <tr>
                                                                    <td>手机号：</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_RentUserPhoneNumber" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>产品：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Product" runat="server">
                                                                            <asp:ListItem Value="">-Select-</asp:ListItem>
                                                                            <asp:ListItem Value="研发项目管理平台">研发项目管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="政务项目管理平台">政务项目管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="系统集成项目管理平台">系统集成项目管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="软件实施项目管理平台">软件实施项目管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="项目型ERP平台">项目型ERP平台</asp:ListItem>
                                                                            <asp:ListItem Value="工程项目管理平台">工程项目管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="协同OA平台">协同OA平台</asp:ListItem>
                                                                            <asp:ListItem Value="客户关系管理平台">客户关系管理平台</asp:ListItem>
                                                                            <asp:ListItem Value="综合平台">综合平台</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>版本：
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_VersionType" runat="server">
                                                                            <asp:ListItem Value="">-Select-</asp:ListItem>
                                                                            <asp:ListItem Value="标准版">标准版</asp:ListItem>
                                                                            <asp:ListItem Value="企业版">企业版</asp:ListItem>
                                                                            <asp:ListItem Value="集团版">集团版</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Find" CssClass="inpu" runat="server" Text="查询" OnClick="BT_Find_Click" />
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                    <td>
                                                                        <asp:Button ID="BT_MoreThanCapacity" CssClass="inpuLong" runat="server" Text="大于购买容量站点" OnClick="BT_MoreThanCapacity_Click"  />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                         <td align="left" width="100%">
                                                            <table cellpadding="3" cellspacing="0" style="width: 100%">
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
                                                                                            <td width="2%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="2%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="2%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="2%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                             <td width="2%" align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="1%" align="center">
                                                                                                <strong>&nbsp;</strong>
                                                                                            </td>
                                                                                            <td width="4%" align="left">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:Button ID="BT_GetAllCapacity" runat="server" CssClass ="inpu" Text="现有容量" OnClick="BT_GetAllCapacity_Click"></asp:Button>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Button ID="BT_SortCapacity" runat="server" CssClass ="inpu" Width ="54px" Text="排序" OnClick="BT_SortCapacity_Click"></asp:Button>                                                                                         
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="center" width="2%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label2" runat="server" Text="序号"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="2%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label4" runat="server" Text="用户名"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label5" runat="server" Text="手机号"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" class="auto-style1">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label7" runat="server" Text="公司"></asp:Label></strong>
                                                                                            </td>
                                                                                           
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="应用名"></asp:Label></strong>
                                                                                            </td>
                                                                                             <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label8" runat="server" Text="应用URL"></asp:Label></strong>
                                                                                            </td>
                                                                                             
                                                                                           <%-- <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label3" runat="server" Text="应用站点"></asp:Label></strong>
                                                                                            </td>--%>
                                                                                             <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="产品名"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="版本"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label3" runat="server" Text="IsOEM"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="2%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label6" runat="server" Text="用户数"></asp:Label></strong>
                                                                                            </td>
                                                                                          
                                                                                              <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="站点目录"></asp:Label></strong>
                                                                                            </td>
                                                                                                <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="站点虚拟路径"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="2%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="状态"></asp:Label></strong>
                                                                                            </td>
                                                                                               <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label25" runat="server" ></asp:Label></strong>
                                                                                            </td>
                                                                                          
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label13" runat="server" Text="主站URL"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="2%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label14" runat="server" Text="端口"></asp:Label></strong>
                                                                                            </td>
                                                                                          
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="站点模板目录"></asp:Label></strong>
                                                                                            </td>
                                                                                          
                                                                                            <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="数据库恢复文件路径"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="数据库安装目录"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="登录帐号"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="登录密码"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="4%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="EMail"></asp:Label></strong>
                                                                                            </td>
                                                                                          <%--  <td align="center" width="3%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="创建人"></asp:Label></strong>
                                                                                            </td>--%>
                                                                                            <td align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label10" runat="server" Text="创建时间"></asp:Label></strong>
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
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="BuildSite" Text="建站">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="UpdateSite" Text="升级">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="SendSiteBackupDoc" Text="发送备份">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="DeleteSite">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_DeleteSite" CommandName="DeleteSite" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="删站"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:TemplateColumn>
                                                                                 <asp:ButtonColumn ButtonType="LinkButton" CommandName="RecoverSite" Text="恢复">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="Capacity">
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                             <tr>
                                                                                                <td>
                                                                                                    现 
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="TB_CurrentCapacity" Width ="50px" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"CurrentCapacity") %>' ></asp:TextBox>
                                                                                                </td>
                                                                                                <td>
                                                                                                    G
                                                                                                </td>
                                                                                                <td>
                                                                                                   <asp:Button ID="BT_GetFoldSize" CssClass ="inpu" CommandName="GetFoldSize" runat="server" Text="容量" Width="40px"></asp:Button>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                     购
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="TB_BuyCapacity" Width ="50px" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"BuyCapacity") %>' ></asp:TextBox>
                                                                                                </td>
                                                                                                <td>
                                                                                                    G
                                                                                                </td>
                                                                                                <td>
                                                                                                   <asp:Button ID="BT_SaveCapacity" CssClass ="inpu" CommandName="SaveCapacity" runat="server" Text="保存" Width ="40px"></asp:Button>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:TemplateColumn>
                                                                          
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" Width="2%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentUserName" HeaderText="用户名">
                                                                                    <ItemStyle CssClass="itemBorder" Width="2%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentUserPhoneNumber" HeaderText="电话">
                                                                                    <ItemStyle CssClass="itemBorder" Width="3%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentUserCompanyName" HeaderText="公司">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteAppSystemName" HeaderText="应用名">
                                                                                    <ItemStyle CssClass="itemBorder" Width="4%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <a href='<%#DataBinder .Eval (Container .DataItem ,"SiteAppURL") %>' target="_blank"><%#DataBinder .Eval (Container .DataItem ,"SiteAppURL") %>  </a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="6%" />
                                                                                </asp:TemplateColumn>
                                                                             
                                                                              <%-- <asp:BoundColumn DataField="SiteAppName" HeaderText="站点名">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:BoundColumn>--%>
                                                                                 <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <a href='<%#DataBinder .Eval (Container .DataItem ,"SiteAppURL") %>' target="_blank"><%#DataBinder .Eval (Container .DataItem ,"RentProductName") %>  </a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                </asp:TemplateColumn>
                                                                                  <asp:BoundColumn DataField="RentProductVersion" HeaderText="版本">
                                                                                    <ItemStyle CssClass="itemBorder" Width="3%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="IsOEM" HeaderText="IsOEM">
                                                                                    <ItemStyle CssClass="itemBorder" Width="3%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentUserNumber" HeaderText="用户数">
                                                                                    <ItemStyle CssClass="itemBorder" Width="2%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                               <asp:BoundColumn DataField="SiteDirectory" HeaderText="站点目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                 <asp:TemplateColumn HeaderText="SiteVirtualDirectoryPhysicalPath">
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                             <tr>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="TB_SiteVirtualDirectoryPhysicalPath" TextMode ="MultiLine" Width ="99%" Height="40px" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"SiteVirtualDirectoryPhysicalPath") %>' ></asp:TextBox>
                                                                                                </td>
                                                                                              </tr>
                                                                                              <tr>
                                                                                                <td>
                                                                                                   <asp:Button ID="BT_UpdateVirtualDirectoryPhysicalPath" CssClass ="inpu" CommandName="UpdateVirtualDirectoryPhysicalPath" OnClientClick="window.scrollTo(0, 0);" runat="server" Text="保存" Width="40px"></asp:Button>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="SiteStatus" HeaderText="状态">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:BoundColumn>
                                                                                 <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <a href='TTCustomerQuestionHandleDetail.aspx?ID=<%#DataBinder .Eval (Container .DataItem ,"CustomerQuestionID") %> '><%#DataBinder .Eval (Container .DataItem ,"ServerType") %>服务</a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:TemplateColumn>
                                                                              
                                                                                <asp:BoundColumn DataField="SiteURL" HeaderText="主站URL">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="4%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteBindingInfo" HeaderText="端口">
                                                                                    <ItemStyle CssClass="itemBorder" Width="2%" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                              
                                                                                <asp:BoundColumn DataField="SiteTemplateDirectory" HeaderText="站点模板目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                
                                                                                <asp:BoundColumn DataField="SiteDBRestoreFile" HeaderText="数据库恢复文件路径">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBSetupDirectory" HeaderText="数据库安装目录">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBLoginUserID" HeaderText="数据库登录帐号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="SiteDBUserLoginPassword" HeaderText="登录密码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RentUserEmail" HeaderText="EMail">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%"  />
                                                                                </asp:BoundColumn>
                                                                               <%-- <asp:BoundColumn DataField="SiteCreatorName" HeaderText="创建人">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                </asp:BoundColumn>--%>
                                                                                <asp:BoundColumn DataField="SiteCreateTime" HeaderText="创建时间">
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
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_ErrorMsg" runat="server"></asp:Label>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowSite" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 94%; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <div id="DIV_SiteMsg">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="IMB_Process" ImageUrl="Images/Processing.gif" runat="server"></asp:Image>
                                        </td>
                                        <td style="color: red;">
                                            <asp:Label ID="LB_SiteMsg" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <iframe id="IFrame_Site" style="width: 99%; height: 99%; border: none;" runat="server"></iframe>

                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="location.reload();return popClose();">
                                <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="location.reload();return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

<%--                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>--%>

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
