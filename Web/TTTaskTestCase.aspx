<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTaskTestCase.aspx.cs" Inherits="TTTaskTestCase" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>
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
                            <td valign="top" style="padding: 10px 5px 10px 5px;">
                                <table style="width: 98%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6" style="width: 100%; height: 5px; text-align: right">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="5%" align="center">
                                                                    <strong></strong>
                                                                </td>

                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RenWuHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YongLiMing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="35%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangXiShuoMing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TongGuoTiaoJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="25"
                                                ShowHeader="false" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:ButtonColumn>

                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CaseName" HeaderText="用例名">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Description" HeaderText="详细说明">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Requisite" HeaderText="通过条件">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataGrid>
                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label22" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td colspan="6" style="width: 98%; height: 5px;" align="left">
                                        <table class="formBgStyle" style="width: 80%;" cellpadding="3" cellspacing="0">
                                            <tr style="display:none;">
                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_CaseID" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; height: 16px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YongLiMing%>"></asp:Label>：
                                                </td>
                                                <td style="height: 16px; text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_CaseName" runat="server"></asp:Label>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; height: 16px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangXiShuoMing%>"></asp:Label>：
                                                </td>
                                                <td style="height: 16px; text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_Description" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; height: 10px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TongGuoTiaoJian%>"></asp:Label>：
                                                </td>
                                                <td style="height: 10px; text-align: left" class="formItemBgStyle">

                                                    <asp:Label ID="LB_Requisite" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">状态：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="Status" DataValueField="Status"
                                                        Width="83px">
                                                        <asp:ListItem Value="计划" Text="<%$ Resources:lang,JiHua%>" />
                                                        <asp:ListItem Value="测试中" Text="<%$ Resources:lang,CeShiZhong%>" />
                                                        <asp:ListItem Value="失败" Text="<%$ Resources:lang,ShiBai%>" />
                                                        <asp:ListItem Value="成功" Text="<%$ Resources:lang,ChengGong%>" />
                                                    </asp:DropDownList>

                                                    &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:HyperLink ID="HL_TaskRelatedDoc" runat="server" Enabled="False" NavigateUrl="TTProTaskRelatedDoc.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CeShiJieGuo%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">

                                                    <CKEditor:CKEditorControl ID="HE_OperatorCommand" runat="server" Toolbar="TextColor|BGColor|Bold|FontSize|Image" Height="150px" Width="90%" Visible="false" />
                                                    <CKEditor:CKEditorControl runat="server" ID="HT_OperatorCommand" Toolbar="TextColor|BGColor|Bold|FontSize|Image" Width="90%" Height="150px" Visible="false" />
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td style="width: 100px; height: 4px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TaskID" runat="server" Visible="False" Width="45px"></asp:Label>
                                                </td>
                                                <td style="height: 4px; text-align: left" class="formItemBgStyle"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width: 100%; padding: 10px 0px 10px 0px; text-align: left">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>：<asp:Label ID="LB_TestCase" runat="server"></asp:Label><asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DeCeShiJiLu%>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width: 100%; height: 5px; text-align: left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="12%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YongLiHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiangXiShuoMing%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CeShiZhe%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CeShiShiJian%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="20"
                                            ShowHeader="false" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TestCaseID" HeaderText="用例号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Command" HeaderText="详细说明">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="TesterName" HeaderText="测试者">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TestTime" HeaderText="测试时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_Update" runat="server" class="layui-layer-btn notTab" OnClick="BT_Update_Click"
                                Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
