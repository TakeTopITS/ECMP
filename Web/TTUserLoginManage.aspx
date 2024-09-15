<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserLoginManage.aspx.cs" Inherits="TTUserLoginManage" %>

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
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }

        .auto-style1 {
            height: 6px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YongHuDengLuGuanLi%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;">
                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">

                                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="主界面页面控制">
                                            <ContentTemplate>
                                                <br>
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                    <tr>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="10%"><strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YangShi %>"></asp:Label></strong> </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuanLianYeMianPC %>"></asp:Label></strong> </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuanLianYeMianMobile %>"></asp:Label></strong> </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DiSanFangYePC %>"></asp:Label></strong> </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DiSanFangYeMobile %>"></asp:Label></strong> </td>
                                                                    <td align="center" width="10%"><strong>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PaiXu %>"></asp:Label>></strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid35" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid35_ItemCommand" PageSize="20" ShowHeader="False" Width="98%">

                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="样式">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_MDIStyle" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"MDIStyle").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="PageName" HeaderText="关联页面(PC)">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="MobilePageName" HeaderText="关联页面(Mobile)">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ThirdPartPageName" HeaderText="第三方页(PC)">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ThirdPartMobilePageName" HeaderText="第三方页(Mobile)">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                                <table cellpadding="0" cellspacing="0" width="60%">
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YangShi %>"></asp:Label>:<asp:TextBox ID="TB_MDIStyle" runat="server" Width="150px"></asp:TextBox><asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShunXu %>"></asp:Label>：<asp:TextBox ID="TB_MDIStyleSort" runat="server" Width="80px"></asp:TextBox>&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,NBGLYDN %>"></asp:Label>：<asp:TextBox ID="TB_MDIStypePageNamePC" runat="server" Width="201px"></asp:TextBox>
                                                            <asp:DropDownList ID="DL_MDIStylePagePC" runat="server" OnSelectedIndexChanged="DL_MDIStylePagePC_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem>TakeTopLRExMDI.html</asp:ListItem>
                                                                <asp:ListItem>TakeTopLRExMDISAAS.html</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,NBGLYYD %>"></asp:Label>：<asp:TextBox ID="TB_MDIStylePageNameMobile" runat="server" Width="201px"></asp:TextBox>
                                                            <asp:DropDownList ID="DL_MDIStylePageMobile" runat="server" OnSelectedIndexChanged="DL_MDIStylePageMobile_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem>TakeTopLRExMDI.html</asp:ListItem>
                                                                <asp:ListItem>TakeTopLRExMDISAAS.html</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DSFDLYDN %>"></asp:Label>：<asp:TextBox ID="TB_ThirdPartPageName" runat="server"></asp:TextBox>
                                                            <asp:DropDownList ID="DL_ThirdPartPageName" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="DL_ThirdPartPageName_SelectedIndexChanged">
                                                                <asp:ListItem>TakeTopCSMDI.html</asp:ListItem>
                                                                <asp:ListItem>TakeTopCSMDISAAS.html</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DSFDLYYD %>"></asp:Label>：<asp:TextBox ID="TB_ThirdPartMobilePageName" runat="server" Width="201px"></asp:TextBox>
                                                            <asp:DropDownList ID="DL_ThirdPartMobilePageName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ThirdPartMobilePageName_SelectedIndexChanged">
                                                                <asp:ListItem>TakeTopCSMDI.html</asp:ListItem>
                                                                <asp:ListItem>TakeTopCSMDISAAS.html</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-top: 10px;">
                                                            <asp:Button ID="BT_AddMDIStyle" runat="server" CssClass="inpu" OnClick="BT_AddMDIStyle_Click" Text="<%$ Resources:lang,XinZeng %>" />&#160;
                                                            <asp:Button ID="BT_UpdateMDIStyle" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_UpdateMDIStyle_Click" />&#160;
                                                            <asp:Button ID="BT_DeleteMDIStyle" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteMDIStyle_Click" Text="<%$ Resources:lang,ShanChu %>" />
                                                            &#160;&#160;&#160;&#160;&#160;&#160;
                                                            <asp:Button ID="BT_AppleAllUser" runat="server" CssClass="inpuLong" Enabled="False" Text="<%$ Resources:lang,YingYongDaoSuoYouYongHu %>" OnClick="BT_AppleAllUser_Click" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="登录用户控制" Visible="false">
                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="tdMain" align="center" valign="top" style="border-right: solid 1px #D8D8D8;">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td style="padding-left: 20px; font-weight: bold; height: 24px; text-align: center; color: #000000; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label>登录用户 </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 5px 5px 5px 5px;" align="left">
                                                                        <table width="100%" border="0" class="formBgStyle" cellpadding="2" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="10%" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" class="formItemBgStyle" width="10%">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,SuoYouChenYuan %>"></asp:Label>：</td>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_IsAllMember" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="DL_IsAllMember_SelectedIndexChanged">
                                                                                                    <asp:ListItem>NO</asp:ListItem>
                                                                                                    <asp:ListItem>YES</asp:ListItem>
                                                                                                </asp:DropDownList></td>
                                                                                            <td>&nbsp;<strong>OR</strong>&nbsp;</td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YongHuDaiMa %>"></asp:Label>：  </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TB_UserCode" runat="server" Enabled="False" Width="85px"></asp:TextBox><asp:Label ID="LB_UserName" runat="server"></asp:Label></td>
                                                                                            <td>IP：</td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TB_IP" runat="server" Width="200px"></asp:TextBox><br />
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuKongBiaoShiSuoYou %>"></asp:Label></td>

                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td align="right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,TiShiXiaoXi %>"></asp:Label>
                                                                                </td>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_Msg" runat="server" Height="96px" TextMode="MultiLine" Width="85%"
                                                                                        CssClass="shuru"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JingZhiDengLu %>"></asp:Label>
                                                                                </td>
                                                                                <td align="left" style="height: 24px" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_IsForbidLogin" runat="server">
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></td>
                                                                                <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                                                        <asp:ListItem Value="在用" />
                                                                                        <asp:ListItem Value="停用" />
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" class="formItemBgStyle">&nbsp;</td>
                                                                                <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZeng %>" CssClass="inpu" />&#160;&#160;&#160;
                                                                                    <asp:Button ID="BT_Update" runat="server" Enabled="False" OnClick="BT_Update_Click"
                                                                                        CssClass="inpu" Text="<%$ Resources:lang,BaoCun %>" />&#160;&#160;&#160;
                                                                                    <asp:Button ID="BT_Delete" runat="server" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                        CssClass="inpu" Text="<%$ Resources:lang,ShanChu %>" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" class="formItemBgStyle">
                                                                                    <table style="width: 98%;">
                                                                                        <tr>
                                                                                            <td style="text-align: left;" class="auto-style1">
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YongHuLieBiao %>"></asp:Label>： </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                    <tr>
                                                                                                        <td width="7">
                                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,SuoYouChenYuan %>"></asp:Label></strong> </td>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YongHu %>"></asp:Label></strong> </td>
                                                                                                                    <td width="15%" align="center"><strong>IP</strong> </td>
                                                                                                                    <td width="35%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiaoXi %>"></asp:Label></strong> </td>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JingZhiDengLu %>"></asp:Label></strong> </td>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                                                                                    OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="8" Width="100%" ShowHeader="False">

                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                                    <Columns>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="itemBorder" />
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:BoundColumn DataField="IsAllMember">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="UserName">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="IP">
                                                                                                            <ItemStyle HorizontalAlign="Center" Width="15%" CssClass="itemBorder" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="Message">
                                                                                                            <ItemStyle HorizontalAlign="Left" Width="35%" CssClass="itemBorder" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="IsForbidLogin">
                                                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="itemBorder" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                                                            <ItemTemplate>
                                                                                                                <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                </asp:DataGrid></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="180px" class="tdMain" align="center" valign="top">
                                                            <asp:Button ID="BT_AllLoginUser" runat="server" Text="<%$ Resources:lang,CKSYYHGL %>"
                                                                CssClass="inpuLong" OnClick="BT_AllLoginUser_Click" /><table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td align="center"><strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> &nbsp;&nbsp; &nbsp;&nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False"
                                                                Font-Bold="True">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                    CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Left" ForeColor="White" />
                                                            </asp:DataGrid></td>
                                                        <td width="220px" class="tdMain" align="left" valign="top">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
