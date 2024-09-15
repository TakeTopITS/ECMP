<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppMakeCollaboration.aspx.cs" Inherits="TTAppMakeCollaboration" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>


</head>
<body>
    <script type="text/javascript" language="javascript">
        $(function () {


            var MustInFrame = '<%=Session["MustInFrame"].ToString() %>'.trim();
            if (MustInFrame == 'YES') {
                 /*  if (top.location != self.location) { } else { CloseWebPage(); }*/
            }


        });
    </script>


    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <%--<a href="TTAppCollaboration.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                            <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr style="display">
                                        <td align="Right" style="padding: 5px 5px 0px 5px;">
                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="padding: 5px 5px 5px 5px;">
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
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                </td>

                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                </td>
                                                                <td width="30%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XieZuo%>"></asp:Label></strong>
                                                                </td>
                                                                <%--   <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center"></td>--%>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="25"
                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                OnItemCommand="DataGrid4_ItemCommand" OnPageIndexChanged="DataGrid4_PageIndexChanged"
                                                Width="100%">
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
                                                    <asp:BoundColumn DataField="CoID" HeaderText="ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="CoID" DataNavigateUrlFormatString="TTCollaborationDetailMain.aspx?CoID={0}"
                                                        DataTextField="CollaborationName" HeaderText="协作" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                    </asp:HyperLinkColumn>
                                                    <%-- <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="CreatorName" HeaderText="创建者" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.CoID", "TTCollaborationRelatedDoc.aspx?RelatedID={0}") %>'
                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" 
                                                                    class="noBorder" /></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateColumn>--%>
                                                </Columns>

                                                <ItemStyle CssClass="itemStyle " />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label7" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 200%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8"
                                        align="center">
                                        <table width="95%" cellpadding="5" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td align="center" colspan="2" style="font-weight: bold; font-size: 15px; height: 22px;"
                                                    class="formItemBgStyle">
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XieZuoWoJianLiDeXieZuo%>"></asp:Label>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 20%;" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_CoID" runat="server" Visible="false"></asp:Label>
                                                    <asp:TextBox ID="TB_CollaborationName" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CanYuRenYuan%>"></asp:Label>
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' Visible="false" />
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Width="99%" Height="150px" Visible="false"></CKEditor:CKEditorControl>
                                                    <CKEditor:CKEditorControl ID="HTEditor1" runat="server" Width="99%" Height="150px" Visible="false" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                </td>
                                                <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_Status" runat="server" Text="<%$ Resources:lang,XinJian%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                </td>
                                                <td align="left" class="formItemBgStyle">&nbsp;
                                                    <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" Enabled="False" Visible="false" OnClick="BT_Close_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" Enabled="False" OnClick="BT_Active_Click" Visible="false" />
                                                    &nbsp;&nbsp;
                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" Visible="false" NavigateUrl="~/TTProjectRelatedDoc.aspx" Target="_blank">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" colspan="2" class="formItemBgStyle">
                                                    <asp:CheckBox ID="CB_MSM" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                    &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TongZhiXieZuoRenYuan%>"></asp:Label>
                                                    &nbsp;
                                                        <asp:TextBox ID="TB_Message" runat="server" Width="45%"></asp:TextBox>
                                                    <asp:Button ID="BT_Send" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Send_Click"
                                                        Text="<%$ Resources:lang,FaSong%>" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />

                                    </td>
                                    <td style="width: 170px; padding: 5px 5px 5px 5px; text-align: center; vertical-align: top; border-right: solid 1px #D8D8D8">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="50%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="50%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Left" ForeColor="White" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 190px; padding: 0px 5px 0px 5px" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" BorderColor="Transparent" NodeWrap="True"
                                            OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="190px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
