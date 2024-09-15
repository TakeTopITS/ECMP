<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWLTStepCondition.aspx.cs"
    Inherits="TTWLTStepConditon" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

    <style type="text/css">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TiaoJianSeZhi%>"></asp:Label>
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
                            <td valign="top" style="padding: 5px 5px 5px 5px;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="right" style="padding: 5px 0px 5px 5px;">
                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                        </td>
                                    </tr>
                                </table>

                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                 <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                    </td>
                                                  
                                                    <td width="5%" align="center"><strong></strong></td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                        </strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                        </strong>
                                                    </td>
                                                    <td width="50%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,TiaoJianMiaoShu%>"></asp:Label>
                                                        </strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiaYiBu%>"></asp:Label>
                                                        </strong>
                                                    </td>
                                                  
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                    OnItemCommand="DataGrid1_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                    GridLines="None">
                                    <Columns>

                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:ButtonColumn>
                                        <asp:TemplateColumn HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateColumn>
                                        <asp:ButtonColumn CommandName="Detail" Text="<%$ Resources:lang,BiaoDaShi%>">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:ButtonColumn>

                                        <asp:BoundColumn DataField="ConID" HeaderText="ID">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign ="Center" Width="5%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="StepID" HeaderText="步序">
                                            <ItemStyle CssClass="itemBorder" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ConDetail" HeaderText="条件描述">
                                            <ItemStyle CssClass="itemBorder" Width="50%" HorizontalAlign="Left" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                            <ItemStyle CssClass="itemBorder" Width="10%" />
                                        </asp:BoundColumn>

                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                    <ItemStyle CssClass="itemStyle" />
                                </asp:DataGrid>
                                <asp:Label ID="LB_StepID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_MakeUserCode" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table class="formBgStyle" style="width: 90%; text-align: left;" cellpadding="3" cellspacing="0">

                                <tr>
                                    <td style="width: 10%; height: 24px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                    </td>
                                    <td style="height: 24px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_ConID" runat="server"></asp:Label>
                                    </td>
                                    <td style="font-size: 10pt; width: 20%; height: 24px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiaYiBu%>"></asp:Label>
                                    </td>
                                    <td style="width: 70%; height: 24px;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_NextStepID" runat="server" Precision="0" Width="43px">0</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr style="font-size: 12pt">
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TiaoJianMiaoShu%>"></asp:Label>
                                        </span>
                                    </td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ConDetail" runat="server" Height="51px" TextMode="MultiLine"
                                            Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: right" class="formItemBgStyle"></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LBT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popExpressWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label191" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table width="100%">

                                <tr>
                                    <td colspan="4" align="right" style="padding-right: 5px;">
                                        <asp:Button ID="BT_CreateExpress" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateExpress_Click" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="4" style="height: 17px;" align="left">
                                        <strong>
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,TiaoJian%>"></asp:Label>
                                            <asp:Label ID="LB_ConIDExpression" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TiaoJianBiaoDaShi%>"></asp:Label>
                                        </strong>
                                        (<asp:HyperLink ID="HL_XMLFile" runat="server" Target="_blank">---&gt;<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChaKanShuJuWenJian%>"></asp:Label></asp:HyperLink>
                                        )</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 24px; text-align: right">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center"><strong></strong></td>
                                                            <td width="5%" align="center"><strong></strong></td>
                                                            <td width="10%" align="center">
                                                                <strong>&nbsp;</strong>
                                                            </td>
                                                            <td width="60%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BiaoDaShi%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ShowHeader="false"
                                            ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                            Width="100%">
                                            <Columns>

                                                <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:ButtonColumn>
                                                <asp:TemplateColumn HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateColumn>

                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Expression" HeaderText="表达式">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="60%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="LogicalOperator" HeaderText="逻辑">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer2" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popExpressDetailWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label13" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">
                            <table width="90%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 10%; height: 24px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>： 
                                    </td>
                                    <td style="height: 24px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                    </td>
                                    <td style="font-size: 10pt; width: 20%; height: 24px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BiaoDaShi%>"></asp:Label>： 
                                    </td>
                                    <td style="width: 70%; height: 24px; text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Expression" runat="server" Width="500px"></asp:TextBox>
                                        ( NONE  &nbsp;<asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BiaoShiWuTiaoJian%>"></asp:Label>
                                        )<asp:DropDownList ID="DL_LogicalExpression" runat="server">
                                            <asp:ListItem Value="AND">AND</asp:ListItem>

                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LBT_NewExpress" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewExpress_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <asp:LinkButton ID="LBT_CloseExpressDetailWindow" OnClick="LBT_CloseExpressDetailWindow_Click" OnClientClick="return popClose();" runat="server" CssClass="layui-layer-btn notTab" Text="<%$ Resources:lang,GuanBi%>">
                            </asp:LinkButton>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
