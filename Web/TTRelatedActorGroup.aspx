<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRelatedActorGroup.aspx.cs"
    Inherits="TTRelatedActorGroup" %>

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

                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px;"
                                            valign="top" align="left" colspan="3">
                                            <table align="center" cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 98%;">
                                                <tr style="font-size: 12pt; padding-top: 5px">
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <br />
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QingShuRuJueSeZuMing%>"></asp:Label>
                                                        </span>：<asp:TextBox ID="TB_ActorGroup" runat="server" Font-Size="10pt" Width="250px"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="BT_CreateActorGroup" runat="server" CssClass="inpuLong" Font-Size="10pt" OnClick="BT_CreateActorGroup_Click" Text="<%$ Resources:lang,ChuangJianJueSeZu%>" />
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr style="font-weight: bold; font-size: 11pt">
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </td>
                                                </tr>
                                                <tr style="font-weight: bold; background-image: url('ImagesSkin/titleBG.jpg')">
                                                    <td align="center" class="formItemBgStyle">
                                                        <asp:Button ID="BT_DeleteActorGroup" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteActorGroup_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChuJueSeZu%>" />

                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>

                                                        <asp:Label ID="LB_SqlGM" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="98%">
                                                <table cellpadding="0" cellspacing="0" width="90%" class="bian">

                                                    <tr>
                                                        <td colspan="2" style="text-align: left; padding: 5px 5px 5px 5px;">
                                                            <asp:Label ID="LB_ActorGroup" runat="server" Font-Size="10pt"></asp:Label>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JueSeZuChengYuanLieBiao%>"></asp:Label>
                                                            ：<asp:Label ID="LB_RelatedID" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td align="right" style="padding: 5px 5px 0px 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" align="left">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                   
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_GroupID" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                                                </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="5" ShowHeader="false" Width="100%">
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
                                                    <tr>
                                                        <td style="height: 7px; text-align: right;"></td>
                                                    </tr>
                                                </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 550px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="width: 230px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px;" valign="top">
                                        <asp:Button ID="BT_AllRelatedMember" runat="server" CssClass="inpuLong" OnClick="BT_AllRelatedMember_Click" Text="<%$ Resources:lang,SuoYouXiangGuanChengYuan%>" />
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
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="160">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="5%"><strong>&nbsp;</strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Bold="True" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="false" Width="160">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                        </asp:DataGrid>
                                        <br />
                                    </td>
                                    <td style="padding-top: 5px" valign="top">
                                        <table width="98%">
                                            <tr>
                                                <td align="left">
                                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 800px;">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZuMing%>"></asp:Label>
                                                                ：
                                                            </td>
                                                            <td colspan="3" class="formItemBgStyle" style="width: 45%; text-align: left;">
                                                                <asp:Label ID="LB_ActorGroupName" runat="server" Width="244px"></asp:Label>
                                                                <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right; height: 6px;">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 25%; text-align: left; height: 6px;">
                                                                <asp:Label ID="LB_RelatedUserCode" runat="server" Width="55px"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right; height: 6px;">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 45%; height: 6px; text-align: left;">
                                                                <asp:Label ID="LB_RelatedUserName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>
                                                                ：
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 25%; text-align: left;">
                                                                <asp:TextBox ID="TB_Actor" runat="server" Width="90%"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" style="width: 45%; text-align: left;">
                                                                <asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                                                <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongZuoNeiRong%>"></asp:Label>
                                                                ：
                                                            </td>
                                                            <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                                <asp:TextBox ID="TB_WorkDetail" runat="server" Height="50px" TextMode="MultiLine" Width="85%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
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
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="请稍候，处理中......." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
