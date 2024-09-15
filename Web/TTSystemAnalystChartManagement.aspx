<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemAnalystChartManagement.aspx.cs" Inherits="TTSystemAnalystChartManagement" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FengXiTuXinSheJi%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;">

                                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                                        <tr>
                                            <td align="center" style="padding-top: 5px; width: 350px;">

                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="40%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,TuXingMingCheng%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid3_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="False">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ChartName" HeaderText="图形名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ChartType" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>

                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                </asp:DataGrid>
                                            </td>
                                            <td align="center" style="padding: 5px 5px 5px 5px;">
                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                    <tr>

                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,TuXingMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" align="left" class="formItemBgStyle">
                                                            <asp:Label ID="LB_ChartID" runat="server"></asp:Label>
                                                            <asp:TextBox ID="TB_ChartName" runat="server" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #000000">
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_ChartType" Width="100px" runat="server">
                                                                <asp:ListItem Value="Pie" Text="<%$ Resources:lang,BingTu%>" />
                                                                <asp:ListItem Value="Doughnut" Text="<%$ Resources:lang,QuanTu%>" />
                                                                <asp:ListItem Value="Bar" Text="<%$ Resources:lang,HengXiangZhuZhuangTu%>"  />
                                                                <asp:ListItem Value="Column" Text="<%$ Resources:lang,ZongXiangZhuZhuangTu%>" />
                                                                <asp:ListItem Value="Line" Text="线图" />
                                                                <asp:ListItem Value="Funnel" Text="<%$ Resources:lang,LouDouTu%>" />
                                                                <asp:ListItem Value="Gauge" Text="仪表盘" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" style="width: 150px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,QiYong%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_IsStartup" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #000000">

                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LianJieHuaMianWWW%>"></asp:Label>：</td>

                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_LinkAddress" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                                        </td>
                                                    </tr>

                                                    <tr style="color: #000000">
                                                        <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,SQLYuJuSelectYuJu%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_SQLCode" runat="server" CssClass="shuru" Height="150px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                            <br />
                                                            <asp:Button ID="BT_TestCode" runat="server" CssClass="inpu" OnClick="BT_TestCode_Click" Text="<%$ Resources:lang,DaiMaYanZheng%>" />
                                                            (<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XTFXTYGZ%>"></asp:Label>
                                                            <br />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="width: 150px;"></td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Button ID="BT_AddChart" runat="server" CssClass="inpu" OnClick="BT_AddChart_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;&nbsp;<asp:Button ID="BT_UpdateChart" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateChart_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;&nbsp;<asp:Button ID="BT_DeleteChart" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteChart_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_Departstring" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" align="center" class="formItemBgStyle">

                                                            <table width="98%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td valign="top" align="center" style="padding: 10px 1px 1px 1px; border: 0px solid rgba(193, 189, 189, 0.39)">
                                                                        <div class="renyList" style="width: 100%; height: 310px; overflow: auto; text-align: left; padding-left: 40px;">
                                                                            <asp:Repeater ID="RP_ChartList" runat="server">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="LB_ChartName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartName") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="LB_ChartType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartType") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="LB_SqlCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SqlCode") %>' Visible="false"></asp:Label>
                                                                                    
                                                                                    <iframe src="TTTakeTopAnalystChartSet.aspx?FormType=Management&ChartType=<%# DataBinder.Eval(Container.DataItem,"ChartType") %>&ChartName=<%# DataBinder.Eval(Container.DataItem,"ChartName") %>" style="width: 300px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>

                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />

                                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
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
