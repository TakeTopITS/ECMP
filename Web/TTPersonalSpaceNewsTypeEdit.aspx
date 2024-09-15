<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceNewsTypeEdit.aspx.cs" Inherits="TTPersonalSpaceNewsTypeEdit" %>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XinWenLeiXing%>"></asp:Label>
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
                                <td align="left">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="3" style="background-color: buttonface"></td>
                                        </tr>

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
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                        (Home) </strong></td>
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="25%"><strong>
                                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YeMian%>"></asp:Label>
                                                                    </strong></td>

                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeShi%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center"><strong>
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
                                                        <asp:BoundColumn DataField="Type" HeaderText="Type">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="HomeName" HeaderText="Type">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PageName" HeaderText="页面">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="范围">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="DL_NewsScope" runat="server">
                                                                    <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>"></asp:ListItem>
                                                                    <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>"></asp:ListItem>
                                                                    <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="可用">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CB_Visible" runat="server" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn HeaderText="顺序">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TB_SortNumber" runat="server" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem,"SortNumber") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>

                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; padding-right: 100px; text-align: right;">
                                                <br />
                                                <asp:Button ID="BT_SaveSortNumber" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_SaveSortNumber_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label341" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                    </td>
                                    <td style="width: 20%;">
                                        <asp:TextBox ID="TB_NewsType" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>(Home)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_HomeNewsType" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="DL_NewsScope" runat="server">
                                            <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>"></asp:ListItem>
                                            <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>"></asp:ListItem>
                                            <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 10%;">
                                        <asp:Label ID="Label343" runat="server" Text="<%$ Resources:lang,YeMian%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_NewsTypePageName" runat="server" Width="99%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_NewsTypeRelatedPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_NewsTypeRelatedPage_SelectedIndexChanged">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                            <asp:ListItem>TTPersonalSpaceNews.aspx</asp:ListItem>
                                            <asp:ListItem>TTPersonalSpaceNewsList.aspx</asp:ListItem>
                                            <asp:ListItem>TTPersonalSpaceNoticeList.aspx</asp:ListItem>
                                            <asp:ListItem>TTPersonalSpaceAnalysisChart.aspx</asp:ListItem>
                                            <asp:ListItem>TTPersonalSpaceMyProjectPositionMap.aspx</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeShi%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DL_Visible" runat="server">
                                            <asp:ListItem Value="YES">YES</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="text-align: right;">
                                        <asp:Label ID="Label342" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_NewsTypeSort" runat="server" Width="50px" Text="0"></asp:TextBox>
                                    </td>

                                </tr>
                            </table>

                            <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>

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
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';

    var oLink = document.getElementById('mainCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';

    var oTabLink = document.getElementById('tabCss');
    oTabLink.href = 'css/' + cssDirectory + '/' + 'tab.css';

</script>
</html>
