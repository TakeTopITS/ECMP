<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsProductionOrderKeepAcccount.aspx.cs" Inherits="TTGoodsProductionOrderKeepAcccount" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }*/
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZuoYeFeeYongJiZhang%>"></asp:Label>
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
                                <td align="right" style="padding: 5px 5px 0px 5px;"></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                        width="100%">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center" width="5%"><strong></strong></td>
                                                        <td align="center" width="5%"><strong></strong></td>
                                                        <td align="center" width="5%">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="15%">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="20%">
                                                            <strong>
                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,GongXu%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" width="20%">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="20%">
                                                            <strong>
                                                                <asp:Label ID="Label13243" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" width="6">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid5_ItemCommand"
                                        OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="25" ShowHeader="false"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="明细">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                <ItemTemplate>
                                                    <a href='TTGoodsProductionOrderView.aspx?PDID=<%# DataBinder.Eval(Container.DataItem,"PDID") %>' target="_blank">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>

                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="<%$ Resources:lang,jiZhang%>">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:ButtonColumn>
                                            <asp:BoundColumn DataField="PDID" HeaderText="PDID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="PDName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="RouteName" HeaderText="工艺">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ProductionDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生产时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BelongDepartName" HeaderText="部门">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label1111111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="600px">
                                <tr>
                                    <td style="text-align: right; height: 19px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_PDID" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_tbAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label>
                                        :
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Account" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" Height="25px" OnSelectedIndexChanged="DL_Account_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode" runat="server"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhiFuFangShi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PaymentMethod" runat="server" Width="100px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_PaymentMethod" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_PaymentMethod_SelectedIndexChanged">
                                            <asp:ListItem Value="">---Select=-- </asp:ListItem>
                                            <asp:ListItem Value="支票" Text="<%$ Resources:lang,ZhiPiao%>" />
                                            <asp:ListItem Value="转账" Text="<%$ Resources:lang,ZhuanZhang%>" />
                                        </asp:DropDownList>
                                    </td>

                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:Button ID="BT_KeepAccount" runat="server" CssClass="inpu" Text="<%$ Resources:lang,jiZhang%>" OnClick="BT_KeepAccount_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label111223412" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
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
