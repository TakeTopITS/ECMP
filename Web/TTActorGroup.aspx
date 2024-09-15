<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTActorGroup.aspx.cs"
    Inherits="TTActorGroup" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>角色组设置</title>
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

            document.getElementById("Div_TreeView").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView.scrollTop = disPostion;
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
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanSuoYouXieZuo%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" style="padding-top: 5px;">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="3" style="text-align: left;">
                                                <br />
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,QingShuRuJueSeZuMing%>"></asp:Label>
                                                </span>：<asp:TextBox ID="TB_ActorGroup" runat="server" Width="250px"></asp:TextBox>
                                                &nbsp;<asp:Button ID="BT_CreateActorGroup" runat="server" CssClass="inpuLong" OnClick="BT_CreateActorGroup_Click" Text="<%$ Resources:lang,ChuangJianJueSeZu%>" />
                                                &nbsp; </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="text-align: left; padding-top: 5px;">
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <br />
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                            ： </td>
                                                        <td>
                                                            <asp:Label ID="LB_ActorGroupType" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>
                                                            ： </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_BelongDepartName" runat="server" Width="125px"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="TB_BelongDepartName_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TB_BelongDepartName" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>
                                                            ： </td>
                                                        <td>
                                                            <NickLee:NumberBox ID="NB_SortNumber" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="20px">00</NickLee:NumberBox>
                                                        </td>
                                                        <td align="center" width="60PX">
                                                            <asp:Button ID="BT_SaveActorGroup" runat="server" CssClass="inpu" Enabled="false" OnClick="BT_SaveActorGroup_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_BelongDepartCode" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_GroupType" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="left" colspan="3">
                                                <table cellpadding="0" cellspacing="0" width="90%" class="bian">

                                                    <tr>
                                                        <td colspan="2" style="text-align: left; padding: 5px 5px 5px 5px;">
                                                            <asp:Label ID="LB_ActorGroup" runat="server"></asp:Label>
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JueSeZuChengYuanLieBiao%>"></asp:Label>
                                                            ：

                                                        </td>
                                                        <td align="right" style="padding: 5px 5px 0px 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />

                                                        </td>
                                                    </tr>
                                                </table>

                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="90%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                       <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_GroupID" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                                    </td>

                                                                    <td align="center" width="10%"><strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="30%"><strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>
                                                                    </strong></td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="false" Width="90%">
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
                                                        <asp:BoundColumn DataField="GroupID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Actor" HeaderText="角色">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                        </asp:BoundColumn>

                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 550px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                                <tr>
                                    <td style="border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                        valign="top" align="left" colspan="3"></td>
                                </tr>
                                <tr>
                                    <td align="left" style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px" valign="top">
                                        <div id="Div_TreeView" style="overflow: auto; height: 800px;">
                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Width="220" Style="height: 183px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                        </div>
                                    </td>
                                     <td style="width: 165px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" valign="top">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td style="width: 165px;">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td width="7">
                                                                <asp:CheckBox ID="CB_SelectAllUser" runat="server" Checked="false" AutoPostBack="true" OnCheckedChanged="CB_SelectAllUser_CheckedChanged" />
                                                            </td>
                                                            <td width="7">
                                                                <asp:Button ID="BT_AddAllSelect" runat="server" Text="+" OnClick="BT_AddAllSelect_Click" />
                                                            </td>
                                                            <td width="7">
                                                                  <asp:Button ID="BT_DeleteAllSelect"   runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_DeleteAllSelect_Click" Text="X"></asp:Button>
                                                            </td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label34555" runat="server" Text="<%$ Resources:lang,BuMenChengYuan%>"></asp:Label>
                                                                        </strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="false" Width="165px">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="">
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:CheckBox ID="CB_SelectUser" runat="server" Checked="false" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />

                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                   
                                    </td>
                                    <td valign="top">
                                        <table align="center" style="width: 98%;">
                                            <tr>
                                                <td align="left">
                                                    <br />
                                                    <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 800px;">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZuMing%>"></asp:Label>
                                                                ： </td>
                                                            <td colspan ="3" class="formItemBgStyle" style="width: 45%; text-align: left;">
                                                                <asp:Label ID="LB_ActorGroupName" runat="server"></asp:Label> <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right; height: 6px;">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 25%; text-align: left; height: 6px;">
                                                                <asp:Label ID="LB_RelatedUserCode" runat="server"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right; height: 6px;">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 45%; height: 6px; text-align: left;">
                                                                <asp:Label ID="LB_RelatedUserName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 25%; text-align: left;">
                                                                <asp:TextBox ID="TB_Actor" runat="server" Width="95%"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 45%; text-align: left;">
                                                                <asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                                                <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongZuoNeiRong%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                                <asp:TextBox ID="TB_WorkDetail" runat="server" Height="50px" TextMode="MultiLine" Width="80%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>



                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
