<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectPlanEarlyWarning.aspx.cs" Inherits="TTProjectPlanEarlyWarning" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1240px;
            width: expression (document.body.clientWidth <= 1240? "1240px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (
                top.location != self.location) { } else { CloseWebPage(); }
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="880" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuTuQiJiHua%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TuoQi%>"></asp:Label>
                                                        </td>
                                                        <td style="padding-top: 5px; width: 55px;">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_RelayDays" runat="server" MinAmount="1" Precision="0" Width="50px"
                                                                Amount="5">
                                                                 1
                                                            </NickLee:NumberBox>
                                                        </td>
                                                        <td style="padding-top: 5px; text-align: left;">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label>
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:DropDownList ID="DL_ActorType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ActorType_SelectedIndexChanged">
                                                                <asp:ListItem Value="PM" Text="<%$ Resources:lang,BenRenXiangMu%>" />
                                                                <asp:ListItem Value="LEADER" Text="<%$ Resources:lang,ChengYuanXiangMu%>" />
                                                                <asp:ListItem Value="SUPER" Text="<%$ Resources:lang,SuoYouXiangMu%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                       <%-- <td style="padding-top: 5px;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CengJi%>"></asp:Label>：
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:DropDownList ID="DL_PlanLevel" runat="server" AutoPostBack="true" Width="60px" OnSelectedIndexChanged="DL_PlanLevel_SelectedIndexChanged">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem Value="0" Text="<%$ Resources:lang,BuXian%>" />
                                                            </asp:DropDownList>
                                                        </td>--%>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoChuDaoExcel%>" OnClick="BT_ExportToExcel_Click" />
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Label ID="LB_Number" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
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
                                    <table cellpadding="0" cellspacing="0" width="100%">

                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="14%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TuoQi%>"></asp:Label>
                                                                            (<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label>)
                                                                        </strong>
                                                                    </td>


                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiaoZhunJinDu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BiaoZhunChengBen%>"></asp:Label></strong>
                                                                    </td>


                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>

                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                    ShowHeader="false"
                                                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectName" HeaderText="项目名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="PMCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                            DataTextField="PMName" HeaderText="姓名" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="PlanID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PlanDetail" HeaderText="计划内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="LeaderCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                            DataTextField="Leader" HeaderText="姓名" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="BeginTime" HeaderText="开始时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ExpireDay" HeaderText="拖期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="Percent_Done" HeaderText="进度">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DefaultSchedule" HeaderText="标准进度">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DefaultCost" HeaderText="标准成本">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <%-- <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                        </asp:TemplateColumn>--%>
                                                    </Columns>
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                               
                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_PlanID" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Plan" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                 <asp:Label ID="LB_Sql" runat="server" Visible ="false" ></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label22" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                </td>
                                                <td width="35%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuYaoGongZuo%>"></asp:Label></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,KaiShiGongZuoShiJian%>"></asp:Label></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JieShuGongZuoShiJian%>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>

                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                Width="100%" CellPadding="4" ShowHeader="false"
                                ForeColor="#333333" GridLines="None">
                                <Columns>
                                    <asp:BoundColumn DataField="PlanID" HeaderText="计划号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ID" HeaderText="序号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                        DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                    </asp:HyperLinkColumn>
                                    <asp:BoundColumn DataField="MainWork" HeaderText="主要工作">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="StartWorkDate" HeaderText="开始工作时间" DataFormatString="{0:yyyy/MM/dd}">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="EndWorkDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束工作时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                    </asp:BoundColumn>
                                </Columns>

                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>


                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
                </Triggers>
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
