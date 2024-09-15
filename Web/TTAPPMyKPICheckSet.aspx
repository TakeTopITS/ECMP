<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPMyKPICheckSet.aspx.cs" Inherits="TTAPPMyKPICheckSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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

    <%-- <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>--%>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Back%>"></asp:Label>
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
                                            <td valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                align="left">
                                                <table style="width: 100%; text-align: left;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 26px;">
                                                            <b>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：<asp:Label ID="LB_KPICheckID" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="LB_KPICheckName" runat="server"></asp:Label>
                                                                &nbsp;KPI： </b>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="formBgStyle" style="width: 100%; text-align: left;" cellpadding="3"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td width="90px" align="left" class="formItemBgStyle">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZiPingZongFen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <b>
                                                                <asp:Label ID="LB_TotalSelfPoint" runat="server"></asp:Label>
                                                            </b>
                                                        </td>
                                                        <td width="100px" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LingDaoPingZongFen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <b>
                                                                <asp:Label ID="LB_TotalLeaderPoint" runat="server"></asp:Label>
                                                            </b>
                                                        </td>
                                                        <td width="115px" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DiSanFangPingZongFen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <b>
                                                                <asp:Label ID="LB_TotalThirdPartPoint" runat="server"></asp:Label>
                                                            </b>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle" width="100px">
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,XiTongZongPingFen%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" align="left"><b>
                                                            <asp:Label ID="LB_TotalSqlPoint" runat="server"></asp:Label>
                                                        </b></td>
                                                        <td align="right" class="formItemBgStyle" width="100px">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,RenShiPingZongFen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <b>
                                                                <asp:Label ID="LB_TotalHRPoint" runat="server"></asp:Label>
                                                            </b>
                                                        </td>
                                                        <td width="100px" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZongFen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <b>
                                                                <asp:Label ID="LB_TotalPoint" runat="server"></asp:Label>
                                                            </b>
                                                        </td>
                                                        <td width="100px" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                        </td>
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                                    </tr>
                                                </table>
                                                <br />
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
                                                                                <td width="3%" align="center">
                                                                                    <strong>&nbsp;
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>KPI</strong>
                                                                                </td>
                                                                                <td width="14%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DingYi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,QuanZhong%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LingDaoPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiTongPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,RenShiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZongPingFen%>"></asp:Label></strong>
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
                                                                AllowCustomPaging="false" AllowPaging="true" PageSize="10" ShowHeader="False"
                                                                Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:ButtonColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <%--  <asp:TemplateColumn>
                                                                        <ItemStyle HorizontalAlign="Center" Width="7%" CssClass="itemBorder" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>--%>
                                                                    <asp:BoundColumn DataField="KPI" HeaderText="KPI">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Definition" HeaderText="定义">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Target" HeaderText="目标">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Formula" HeaderText="公式">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Weight" HeaderText="权重">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SelfPoint" HeaderText="自评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LeaderPoint" HeaderText="领导评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ThirdPartPoint" HeaderText="第三方评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SqlPoint" HeaderText="系统评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="HRPoint" HeaderText="人事评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Point" HeaderText="总评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />

                                                <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>

                                                <%-- <asp:Chart ID="Chart1" runat="server" Width="800px" Visible="false">
                                                    <Series>
                                                        <asp:Series ChartType="Column" Label="#VAL" Name="Series1">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                    <Titles>
                                                        <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="false"
                                                            Name="标题">
                                                        </asp:Title>
                                                    </Titles>
                                                </asp:Chart>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        </td> </tr> </table>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label172" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table class="formBgStyle" style="width: 100%; text-align: left;" cellpadding="3"
                                cellspacing="0">
                                <tr>
                                    <td colspan="2" align="left" class="formItemBgStyle">


                                        <asp:Label ID="LB_KPIID" runat="server" Visible="false"></asp:Label>

                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label>：
                                         <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SelfPoint" runat="server" Width="53px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td align="left" class="formItemBgStyle" rowspan="2">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>：
                                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="16px"
                                            Width="100%">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZiPing%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="tdLeft" style="color: Blue; font-style: italic;">
                                                            <%#DataBinder.Eval(Container.DataItem, "SelfComment")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>
                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="16px"
                                            Width="100%">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DiSanFangPing%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="tdLeft" style="color: Blue; font-style: italic;">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label>：
                                                            *******
                                                            <br />
                                                            <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>
                                        <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="16px"
                                            Width="100%">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LingDaoPing%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="tdLeft" style="color: Blue; font-style: italic;">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "LeaderName")%><br />
                                                            <%#DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>
                                        <asp:DataList ID="DataList4" runat="server" CellPadding="0" ForeColor="#333333" Height="16px"
                                            Width="100%">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,RenShiPing%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="tdLeft" style="color: Blue; font-style: italic;">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "HRName")%><br />
                                                            <%#DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>
                                    </td>

                                    <tr>
                                        <td colspan="2" align="left" valign="top" class="formItemBgStyle">
                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YiJian%>"></asp:Label>：<br />
                                            <CKEditor:CKEditorControl ID="HE_SelfSummary" runat="server" Toolbar="" Height="150px" Width="98%" Visible="false" />
                                            <CKEditor:CKEditorControl runat="server" ID="HT_SelfSummary" Toolbar="" Width="98%" Height="150px" Visible="False" />
                                        </td>
                                    </tr>
                            </table>

                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label173" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
