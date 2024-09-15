<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTHeadLineEdit.aspx.cs" Inherits="TTHeadLineEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="245px" align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XinWenBianJi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td align="right" style="padding: 5px 5px 0px 5px;">
                                                <asp:Button ID="BT_Create" runat="server" CssClass="inpuYello" OnClick="BT_Create_Click" Text="<%$ Resources:lang,New%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                    </td>
                                                                    <td width="37%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Lb_DGProjectCode" runat="server" Text="<%$ Resources:lang,ZhuTi%>" /></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,leiXing%>" /></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FanWei%>" /></strong>
                                                                    </td>

                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TouTiao%>" /></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>" /></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FaBuShiJian%>" /></strong>
                                                                    </td>

                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGStatus" runat="server" Text="<%$ Resources:lang,Status%>" /></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                    OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                    AllowCustomPaging="false" AllowPaging="true" PageSize="25" ShowHeader="False"
                                                    Width="100%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='ÐÞ¸Ä' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm('ÄúÈ·¶¨ÒªÉ¾³ýÂð(Are you sure you want to delete it)£¿')" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='É¾³ý' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Title" HeaderText="Ö÷Ìâ">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="37%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="NewsType" HeaderText="·¶Î§">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Type" HeaderText="ÀàÐÍ">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="IsHead" HeaderText="Í·Ìõ">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="RelatedDepartName" HeaderText="¹éÊô²¿ÃÅ">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="PublishTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="·¢²¼Ê±¼ä">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>

                                                        <asp:TemplateColumn HeaderText="×´Ì¬">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
                            <asp:Label ID="Label10" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formBgStyle">
                                <tr>
                                    <td width="8%" align="right" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Title" runat="server" Width="97%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TB_DepartCode" runat="server" Width="80px"></asp:TextBox>
                                                    <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                        CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TB_DepartCode">
                                                    </cc1:ModalPopupExtender>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                </td>
                                                <td>&nbsp;&nbsp;
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_NewsType" runat="server" DataValueField="Type" DataTextField="HomeName">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>&nbsp;&nbsp;
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_Type" runat="server">
                                                        <asp:ListItem Value="内部" Text="<%$ Resources:lang,NeiBu%>" />
                                                        <asp:ListItem Value="外部" Text="<%$ Resources:lang,WaiBu%>" />
                                                    </asp:DropDownList>
                                                </td>

                                                <td style="padding-left: 30px;">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,TouTiao%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_IsHead" runat="server">
                                                        <asp:ListItem Value="NO" Text="<%$ Resources:lang,Fou%>" />
                                                        <asp:ListItem Value="YES" Text="<%$ Resources:lang,Shi%>" />
                                                    </asp:DropDownList>
                                                </td>

                                                <td align="right">&nbsp;&nbsp;
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                </td>

                                                <td align="left">
                                                    <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" Width="87px">
                                                    </asp:DropDownList>
                                                </td>

                                                <td style="display: none;">&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                </td>
                                                <td style="display: none;">
                                                    <asp:DropDownList ID="DL_Statu" runat="server" Enabled="false">
                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                        <asp:ListItem Value="发布" Text="<%$ Resources:lang,FaBu%>" />
                                                        <asp:ListItem Value="归档" Text="<%$ Resources:lang,GuiDang%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="formItemBgStyle"></td>
                                    <td align="right" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td colspan="13" align="right">

                                                    <table>
                                                        <tr>
                                                            <td style="padding-left: 30px;">
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CongWordDocDaoRu%>"></asp:Label>：
                                                            </td>
                                                            <td>
                                                                <div onclick="popShowByURLForFixedSize('TTHeadLineUploadDocForParentWindow.aspx','Upload Doc', 600, 500)">
                                                                    <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,ShangChuan%>"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td style="padding-left: 10px;">
                                                                <asp:HyperLink ID="HL_ContentDocURL" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:HyperLink>
                                                            </td>
                                                            <td style="display: none;">
                                                                <asp:TextBox ID="TB_ContentDocURL" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td  style="width: 100px; text-align: center;">
                                                                <asp:Button ID="BT_Import" Text="<%$ Resources:lang,DaoRu %>" CssClass="inpu" runat="server" OnClick="BT_Import_Click"
                                                                    OnClientClick="return confirm('提示，导入之后会覆盖原先的内容，确定要导入吗(Warning, importing will overwrite the original content. Are you sure you want to import)？')" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="CKE_MainContent" Width="98%" Height="550px" runat="server" Visible="False">
                                        </CKEditor:CKEditorControl>
                                        <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Width="98%" Height="550px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle"></td>
                                    <td align="left" style="height: 29px" class="formItemBgStyle"></td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <center>

                                <table>
                                    <tr>

                                        <td style="padding-top: 5px;">
                                            <asp:Button ID="BT_Publish" runat="server" OnClick="BT_Publish_Click" Text="<%$ Resources:lang,FaBu%>" CssClass="inpu" />
                                        </td>

                                        <td>
                                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                                        </td>


                                        <td style="padding-top: 5px;">
                                            <asp:Button ID="BT_Archive" runat="server" OnClick="BT_Archive_Click" Text="<%$ Resources:lang,GuiDang%>" CssClass="inpu" />
                                        </td>

                                    </tr>
                                </table>

                            </center>

                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
