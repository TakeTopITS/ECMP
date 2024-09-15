<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeProjectBudget.aspx.cs"
    Inherits="TTMakeProjectBudget" %>

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
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj" style="border-right: solid 1px #D8D8D8;">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZiJinYuSuanBianZhi%>"></asp:Label>
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
                            <td align="left" style="padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="right" style="padding-bottom: 5px;">
                                            <table width="100%">
                                                <tr>
                                                    <td align="right" style=" padding-right:10px;">
                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        &nbsp;&nbsp;
                                                        <asp:Button ID="BT_CopyFromParentProject" runat="server" CssClass="inpuLong" OnClick="BT_CopyFromParentProject_Click" OnClientClick="window.scrollTo(0, 0);" Text="<%$ Resources:lang,ChongFuXiangMuFuZhi%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Left; padding: 5px 5px 5px 5px;">

                                            <asp:Label ID="LB_ProjectBudget" runat="server" Text="<%$ Resources:lang,XiangMuDingYiYiShuan%>"></asp:Label>：
                                                        <asp:Label ID="LB_ProBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                            &nbsp;&nbsp;
                                                        <asp:Label ID="LB_TotalAccountBudget" runat="server" Text="<%$ Resources:lang,YuLieYuShuanZongE%>"></asp:Label>：
                                                        <asp:Label ID="LB_TotalACBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                            &nbsp;&nbsp;
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FaShengFeiYongZongE%>"></asp:Label>：<asp:Label ID="LB_ProExpense" runat="server" Font-Bold="False"
                                                            Text="0"></asp:Label>
                                            &nbsp;&nbsp;
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,QueRenFeiYongZongE%>"></asp:Label>：<asp:Label ID="LB_ConfirmProExpense" runat="server" Font-Bold="False"
                                                            Text="0"></asp:Label>
                                        </td>
                                    </tr>
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
                                                             <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="100px" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="25%">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="10%" align="center">
                                                                    <strong>&nbsp;</strong>
                                                                </td>

                                                                <td width="10%" align="center">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%" OnItemCommand="DataGrid1_ItemCommand"
                                                ShowHeader="false" CellPadding="4" GridLines="None">
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
                                                    <asp:BoundColumn DataField="ID" HeaderText="">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LB_FinishPercent" runat="server" Height="15px" Font-Size="XX-Small"
                                                                BackColor="YellowGreen" Text='<%#DataBinder .Eval (Container .DataItem ,"Amount") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="LB_DefaultPercent" runat="server" Height="15px" Font-Size="XX-Small"
                                                                BackColor="Yellow"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_Select" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ShiYongMingXi%>" CommandName="Select" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTProjectBudgetChangeLog.aspx?BudgetID={0}"
                                                        Text="变更记录" HeaderText="日志" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" width="10%"/>
                                                    </asp:HyperLinkColumn>
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
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 330px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 15%; text-align: right; height: 19px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label>
                                        :
                                    </td>
                                    <td style="width: 35%; text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Account" runat="server" Width="45%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Account" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountName" Height="25px" OnSelectedIndexChanged="DL_Account_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 15%; text-align: right; height: 19px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label>
                                        :
                                    </td>
                                    <td style="height: 25px;" align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Width="85px">0.00</NickLee:NumberBox></td>
                                                <td>
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                <td>
                                                    <asp:Label ID="LB_CurrencyType" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_TBStartTime" runat="server" Text="<%$ Resources:lang,shengxiaoshijian%>" />: </td>
                                    <td style="width: 35%; height: 35px; text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_CreateTime" ReadOnly="false" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_CreateTime"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>:
                                    </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Description" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="width: 15%; height: 1px; text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

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

                    <div class="layui-layer layui-layer-iframe" id="popParentPJBudgetWindow" name="noConfirm"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <div style="width: 100%; text-align: right;">
                                <asp:Button ID="BT_CopyFromParentItem" CssClass="inpu" runat="server" Text="<%$ Resources:lang,FuZhi%>"  OnClick="BT_CopyFromParentItem_Click" />
                            </div>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="8%" align="center">
                                                    <asp:CheckBox ID="CB_SelectAll" runat="server" Text="全选" AutoPostBack="true" OnCheckedChanged="CB_SelectAll_CheckedChanged" />
                                                </td>

                                                <td width="5%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                </td>
                                                <td width="100px" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="25%">
                                                    <strong>
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label></strong>
                                                </td>

                                                <%--<td align="center" width="10%">
                                                    <strong>&nbsp;</strong>
                                                </td>

                                                <td align="center">&nbsp;</td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Width="100%"
                                ShowHeader="false" CellPadding="4" GridLines="None">
                                <Columns>
                                    <asp:TemplateColumn HeaderText="选择">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CB_Select" Checked="false" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="ID" HeaderText="">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Account" HeaderText="科目">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="金额">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TB_Amount" runat="server" Width="95%" Text='<%# Eval("Amount").ToString() %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label ID="LB_FinishPercent" runat="server" Height="15px" Font-Size="XX-Small"
                                                BackColor="YellowGreen" Text='<%#DataBinder .Eval (Container .DataItem ,"Amount") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="LB_DefaultPercent" runat="server" Height="15px" Font-Size="XX-Small"
                                                BackColor="Yellow"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="Description" HeaderText="描述">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                    </asp:BoundColumn>
                                    <%-- <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Button ID="BT_Select" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ShiYongMingXi%>" CommandName="Select" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateColumn>--%>
                                    <%--   <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTProjectBudgetChangeLog.aspx?BudgetID={0}"
                                        Text="变更记录" HeaderText="日志" Target="_blank">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                    </asp:HyperLinkColumn>--%>
                                </Columns>

                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
