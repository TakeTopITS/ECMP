<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSupplierInfo.aspx.cs" Inherits="TTWZSupplierInfo" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {

        });
    </script>

    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 383px;
        }

        .auto-style4 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 159px;
        }

        .auto-style5 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 159px;
        }

        .auto-style6 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 332px;
        }

        .auto-style7 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 332px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                        <tr>
                            <td height="31" class="page_topbj" colspan="2">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShangShouQuan%>"></asp:Label>
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
                            <td align="left" style="padding-top: 5px; width: 60%">
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                    <tr>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DengLuDaiMa%>"></asp:Label>：
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:Label ID="LB_SupplierCode" runat="server"></asp:Label>
                                            <asp:HiddenField ID="HF_ID" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DengLuMiMa%>"></asp:Label>：
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TXT_SupplierPass" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TXT_SupplierName" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" style="width: 150px;" class="formItemBgStyle"></td>
                                        <td align="left" class="auto-style6">
                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                            &nbsp;
                                        <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" CssClass="inpu"
                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />

                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lbl_UserCodeList" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="招标方案列表">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GongYingShangLieBiao%>"></asp:Label>
                                        </HeaderTemplate>

                                        <ContentTemplate>
                                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="90%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label>

                                                        ：<asp:TextBox ID="TXT_SSupplierName" runat="server" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                <tr>
                                                    <td align="center" class="formItemBgStyle">
                                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuo %>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="14%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DengLuDaiMa %>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="14%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DengLuMiMa %>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="12%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                            OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                            GridLines="None" ShowHeader="False" AllowPaging="True" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="操作">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>

                                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                        HorizontalAlign="Center" />

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SupplierCode" HeaderText="用户代码">
                                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                        HorizontalAlign="Center" />

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SupplierPass" HeaderText="用户密码">
                                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                        HorizontalAlign="Center" />

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SupplierName" HeaderText="用户名">
                                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                        HorizontalAlign="Center" />

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <EditItemStyle BackColor="#2461BF" />

                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />

                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel2" runat="server">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,GongZuoLiuDingYi%>"></asp:Label>
                                        </HeaderTemplate>

                                        <ContentTemplate>
                                            <table width="98%" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td align="right" style="width: 100px; height: 27px">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,LiuChengMuBan %>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 650px; height: 27px">
                                                        <asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                            Width="228px">
                                                        </asp:DropDownList>
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                                            <asp:ListItem Value="供应商管理" />
                                                        </asp:DropDownList><asp:HyperLink
                                                            ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Target="_blank">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MuBanWeiHu %>"></asp:Label>
                                                        </asp:HyperLink><asp:Button
                                                            ID="BT_Reflash" runat="server" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,ShuaXin %>" CssClass="inpu" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 100px; height: 27px"></td>
                                                    <td align="left" style="width: 650px; height: 27px">
                                                        <span style="font-size: 10pt"></span>
                                                        <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin %>" /><asp:CheckBox
                                                            ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian %>" /><span style="font-size: 10pt">（<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi %>"></asp:Label>：)
                                                            </span>
                                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing %>" CssClass="inpu" />
                                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                                            BackgroundCssClass="modalBackground" DynamicServicePath="">
                                                        </cc1:ModalPopupExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="height: 22px; text-align: left;">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao %>"></asp:Label>：
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> &nbsp;
                                                                            </td>
                                                                            <td width="50%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong> &nbsp;
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong> &nbsp;
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> &nbsp;
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                                            ShowHeader="False" PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                                            GridLines="None">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="状态">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" alt="" /></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer>
                                <br />
                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;" Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
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
