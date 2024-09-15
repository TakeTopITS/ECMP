<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectBudgetReport.aspx.cs"
    Inherits="TTProjectBudgetReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
            if (top.location != self.location) { } else {
                CloseWebPage();
            }
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
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="95%" height="108" align="center" style="font-size: 20pt;">
                                            <br />
                                            <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuYuSuan%>"></asp:Label>
                                        </td>
                                        <td align="center" valign="bottom">
                                            <a href="javascript:window.print()">
                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="95%" align="center">【
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiangMUYuSuan%>"></asp:Label>：
                                            <asp:Label ID="LB_ProjectBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShiZhuoYuSuan%>"></asp:Label>：
                                           <asp:Label ID="LB_RealBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShiJiFaShengFeiYongZongE%>"></asp:Label>：
                                            <asp:Label ID="LB_ProExpense" runat="server" Font-Bold="False"
                                                Text="0"></asp:Label>

                                            】
                                           <td align="center">&nbsp;
                                           </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
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
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="205px" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td  width="45%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center">
                                                                    <strong>&nbsp;</strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%"
                                                OnItemCommand="DataGrid1_ItemCommand" ShowHeader="false" CellPadding="4" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LB_FinishPercent" runat="server" Height="20px" Font-Size="Small"
                                                                BackColor="YellowGreen" Text='<%#DataBinder .Eval (Container .DataItem ,"Amount") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="LB_DefaultPercent" runat="server" Height="20px" Width="25px" Font-Size="Small"
                                                                BackColor="Yellow"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="205px" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ID" HeaderText="" Visible="false">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LBT_Select" CommandName="Select" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" ></asp:LinkButton>

                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="noConfirm"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label83" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                     
                            <table style="width: 100%;" cellpadding="0" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td align="right" style="font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                        <strong>&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ChengYuan%>"></asp:Label>：<asp:Label ID="LB_OperatorCode" runat="server" Text="<%$ Resources:lang,SuoYou%>"></asp:Label>
                                            &nbsp;<asp:Label ID="LB_OperatorName" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label>：
                                            <asp:Label ID="LB_Account" runat="server" Text="<%$ Resources:lang,SuoYou%>"></asp:Label>
                                            &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FeiYongMingXi%>"></asp:Label>：</strong> （<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：
                                        <asp:Label ID="LB_Amount" runat="server"></asp:Label>&nbsp
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,QueRenJinE%>"></asp:Label>：
                                        <asp:Label ID="LB_ConfirmAmount" runat="server"></asp:Label>）&nbsp;
                                    </td>
                                </tr>

                            </table>
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td width="220px" align="left" class="formItemBgStyle">
                                        <asp:Button ID="BT_AllMember" runat="server" Width="220px" OnClick="BT_AllMember_Click"
                                            Text="<%$ Resources:lang,SuoYouXiangMuFeiYong%>" />
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Width="100%">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderTemplate>
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                    width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="10%">
                                                                        <strong>
                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="20%">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZeRenRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="25%">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="4" cellspacing="0" style="width: 100%">
                                                    <tr>
                                                        <td class="tdLeft" style="width: 10%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                        </td>
                                                        <td class="tdLeft" style="width: 20%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"EffectDate","{0:yyyy/MM/dd}") %>
                                                        </td>
                                                        <td class="tdLeft" style="width: 15%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                        </td>
                                                        <td class="tdLeft" style="width: 25%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"Account") %>
                                                        </td>
                                                        <td class="tdRight" style="width: 15%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"Amount") %>
                                                        </td>
                                                        <td class="tdRight" style="width: 15%; text-align: center">
                                                            <%#DataBinder .Eval (Container .DataItem ,"ConfirmAmount") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdLeft" style="width: 10%; text-align: center;">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>
                                                        </td>
                                                        <td class="tdRight" colspan="5" style="width: 90%; text-align: left">
                                                            <span style="font-size: 9pt">
                                                                <%#DataBinder .Eval (Container .DataItem ,"Description") %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                           
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
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
