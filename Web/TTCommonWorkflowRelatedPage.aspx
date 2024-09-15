<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCommonWorkflowRelatedPage.aspx.cs" Inherits="TTCommonWorkflowRelatedPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

    <style type="text/css">
        style1 {
            color: red;
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
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" align="left" class="page_topbj">
                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="665" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="工作流关联页面设置"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <table>
                                                                <tr>
                                                                    <td>(
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlLangSwitcher" runat="server" AutoPostBack="true" DataTextField="Language" DataValueField="LangCode" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td style="padding-top: 3px;">
                                                                        <asp:Button ID="BT_CopyForHomeLanguage" runat="server" CssClass="inpuLong" OnClick="BT_CopyForHomeLanguage_Click" Text="<%$ Resources:lang,CopyFromHomeLanguage%>" />
                                                                    </td>
                                                                    <td>)
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
                            <tr>
                                <td align="center">
                                    <table width="100%">
                                        <tr>
                                            <td align="right" style="padding-right: 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="top" colspan="3">
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="" cellspacing="" width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="" cellspacing="" width="100%">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,MIngCheng%>"></asp:Label>
                                                                        (Home) </strong></td>
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="30%"><strong>
                                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,yemian%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" ><strong>
                                                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                    </strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false" Width="100%" OnItemCommand="DataGrid4_ItemCommand">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FormName" HeaderText="FormName">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="HomeName" HeaderText="HomeName">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PageName" HeaderText="页面">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"  />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label2" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label341" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                    </td>
                                    <td style="width: 20%;">
                                        <asp:TextBox ID="TB_FormName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>(Home)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_HomeFormName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label343" runat="server" Text="<%$ Resources:lang,YeMian%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_FormNamePageName" runat="server" Width="99%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_FormNameRelatedPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_FormNameRelatedPage_SelectedIndexChanged">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                            <asp:ListItem>TTExpenseApplyWF.aspx</asp:ListItem>
                                            <asp:ListItem>TTExpenseClaimWF.aspx</asp:ListItem>
                                            <asp:ListItem>TTMakeGoodsPurchase.aspx</asp:ListItem>
                                            <asp:ListItem>TTGoodsApplicationWFForOther.aspx</asp:ListItem>
                                            <asp:ListItem>TTMakeAssetPurchase.aspx</asp:ListItem>
                                            <asp:ListItem>TTAssetApplicationWF.aspx</asp:ListItem>
                                            <asp:ListItem>TTCarApplyForm.aspx</asp:ListItem>
                                            <asp:ListItem>TTLeaveApplyFormWF.aspx</asp:ListItem>
                                            <asp:ListItem>TTOvertimeApplyFormWF.aspx</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Label ID="Label342" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_FormNameSort" runat="server" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>
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
