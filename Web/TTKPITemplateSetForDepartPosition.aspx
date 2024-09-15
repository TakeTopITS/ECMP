<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTKPITemplateSetForDepartPosition.aspx.cs"
    Inherits="TTKPITemplateSetForDepartPosition" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiChengKPIMuBanSheZhi%>"></asp:Label>
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
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="220px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                align="left" rowspan="2" valign="top">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                align="left">
                                                <table style="width: 100%; text-align: left;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="height: 26px;" class="formItemBgStyle">
                                                            <b>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：<asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>：<asp:Label ID="LB_Position" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KPILieBiao%>"></asp:Label>：</b>

                                                            （<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,quanzhong%>"></asp:Label>：<b><asp:Label ID="LB_Weight" runat="server" Text="0"></asp:Label></b>）

                                                        </td>
                                                        <td align="right" style="width: 30%; padding-bottom: 5px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                              <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>

                                                                                <td width="20%" align="center">
                                                                                    <strong>KPI</strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QuanZhong%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="24%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DingYi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label></strong>
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
                                                                OnItemCommand="DataGrid2_ItemCommand"
                                                                AllowCustomPaging="false" ShowHeader="False"
                                                                Width="100%">
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
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="KPI" HeaderText="KPI">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Weight" HeaderText="权重">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Definition" HeaderText="定义">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="24%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Formula" HeaderText="公式">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Source" HeaderText="来源">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </td>
                                            <td valign="top" style="width: 220px; border-left: solid 1px #D8D8D8; text-align: left;">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                                <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>

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
                            <asp:Label ID="Label23" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                cellspacing="0">
                                <tr>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:Label ID="LB_KPIID" runat="server"></asp:Label>
                                        <asp:TextBox ID="TB_KPI" runat="server" Width="90%"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_KPIType" runat="server" DataTextField="Type" DataValueField="Type"
                                            Width="200px">
                                        </asp:DropDownList>
                                        *&nbsp;
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,QuanZhong%>"></asp:Label>：<nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="NB_Weight" runat="server" width="53px">0.00</nicklee:numberbox>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DingYi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Definition" runat="server" Height="50px" TextMode="MultiLine"
                                            Width="90%"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Formula" runat="server" Height="50px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,SQLDaiMa%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SqlCode" runat="server" Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                        <br />
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DanWeiFenZhi%>"></asp:Label>：</td>
                                                <td>
                                                    <nicklee:numberbox id="NB_UnitSqlPoint" runat="server" maxamount="0" minamount="-1000000000000" width="53px" amount="-1">-1.00</nicklee:numberbox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        （<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YGZKPIKSSJKPIJSSJBKPIZDM%>"></asp:Label><br />
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DaiMaShiLi%>"></asp:Label>：Select Count(*) * 5 From T_Project Where Status = &#39;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JieAn%>"></asp:Label>&#39; and PMCode = &#39;[TAKETOPKPIUSERCODE]&#39; and to_char(BeginDate,'yyyymmdd') &gt;= &#39;[TAKETOPKPISTARTTIME]&#39; and to_char(EndDate,'yyyymmdd') &lt;= &#39;[TAKETOPKPIENDTIME]&#39;
                                                                        <br />
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZWDBDWFZKYSJYQTSZQD%>"></asp:Label>）</td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Source" runat="server" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">&nbsp;<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="NB_SortNubmer" runat="server" precision="0" width="53px">0</nicklee:numberbox>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
