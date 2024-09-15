<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTEarlyWarningOrderSet.aspx.cs" Inherits="TTEarlyWarningOrderSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }

        .auto-style1 {
            border-style: none;
            background-image: url('ImagesSkin/butbj.jpg');
            width: 71px;
            text-align: center;
            margin-left: 0px;
            margin-right: 0px;
            font-size: 12px;
            color: #000000;
            font-family: "microsoft yahei";
            cursor: pointer;
            height: 21px;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 2px;
        }
    </style>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

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
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="400px" align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuJingMingLingSheZhi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <%-- <td align ="left">
                                                <table>
                                                    <tr>
                                                        <td>(
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>： </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlLangSwitcher" runat="server" AutoPostBack="true" DataTextField="Language" DataValueField="LangCode" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged" Style="height: 22px;">
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:Button ID="BT_CopyForHomeLanguage" runat="server" CssClass="inpuLong" OnClick="BT_CopyForHomeLanguage_Click" Text="<%$ Resources:lang,CopyFromHomeLanguage%>" />
                                                        </td>
                                                        <td>)
                                                        </td>
                                                    </tr>
                                                </table>
                                                </td> --%>
                                            <td align="center" style="padding-top: 5px;">
                                                <asp:Button ID="BT_AllStartup" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,TuiSongQuanBuZhuDong%>" OnClick="BT_AllStartup_Click" />
                                            </td>

                                            <td width="250px">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-top: 5px;">
                                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                                        <tr>
                                            <td align="center" style="padding-top: 5px; width: 350px;">

                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="50%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,TiShiGongNeng%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label></strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="HomeName" HeaderText="提示功能">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BoxType" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="20%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </td>
                                            <td align="center" style="padding: 5px 5px 5px 5px;">
                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YuJingGongNeng%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_InforName" runat="server" Width="99%" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #000000">
                                                        <td align="right" style="height: 30px; width: 150px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                        <td align="left" style="height: 30px" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                <asp:ListItem Value="启用" Text="<%$ Resources:lang,QiYong%>" />
                                                                <asp:ListItem Value="禁用" Text="<%$ Resources:lang,JinYong%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle" style="height: 30px">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" style="height: 30px">
                                                            <asp:DropDownList ID="ddl_BoxType" runat="server">
                                                                <asp:ListItem Value="DIY" Text="<%$ Resources:lang,ZiDingYi%>" />
                                                                <asp:ListItem Value="SYS" Text="<%$ Resources:lang,XiTong%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #000000">
                                                        <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LianJieYeMianWWW%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="1" style="height: 30px">
                                                            <asp:TextBox ID="TB_LinkAddress" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LianJieYeMianAPP%>"></asp:Label>:</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_MobileLinkAddress" runat="server" CssClass="shuru" Width="95%"></asp:TextBox></td>
                                                    </tr>

                                                    <tr style="color: #000000">
                                                        <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,SQLYuJuSelectYuJu%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                            <asp:TextBox ID="TB_SQLCode" runat="server" CssClass="shuru" Height="150px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                            <br />
                                                            （<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YGZYGDMCYAQKLBNSYDeleteUpdateDropInsertAlterYuJu%>"></asp:Label>
                                                            ,<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,RSDYDSFSJNMKYYSQLDYWEBFWFS%>"></asp:Label><asp:HyperLink ID="HyperLink1" NavigateUrl="Template/CodeTemplate/SQL/SQLRunWebService.pdf" runat="server" Text="【-->SQL Run Webservice】"></asp:HyperLink>
                                                            <br />
                                                            <asp:Button ID="BT_TestCode" runat="server" CssClass="inpu" OnClick="BT_TestCode_Click" Text="<%$ Resources:lang,DaiMaYanZheng%>" />

                                                        </td>
                                                    </tr>
                                                    <tr style="color: #000000">
                                                        <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,QiangZhiTongZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="1" style="height: 30px">
                                                            <asp:DropDownList ID="DL_IsForceInfor" runat="server">
                                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,TongZhiLeiXing%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CB_Msg" runat="server" Text="<%$ Resources:lang,DuanXinTongZhi%>" />
                                                            <asp:CheckBox ID="CB_Email" runat="server" Text="<%$ Resources:lang,YouJianTongZhi%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="width: 150px;">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiYongYongHu%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_UserType" runat="server">
                                                                <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                                                <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                                                <asp:ListItem Value="ALL" Text="<%$ Resources:lang,SuoYou%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_SortNumber" runat="server" CssClass="shuru" Width="40px">0</asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="width: 150px;"></td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">&nbsp;</td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <asp:Label ID="LB_SuperDepartString" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_ID" runat="server" visual="false"></asp:Label>
                                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
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
