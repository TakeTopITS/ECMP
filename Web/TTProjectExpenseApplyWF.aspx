<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectExpenseApplyWF.aspx.cs"
    Inherits="TTProjectExpenseApplyWF" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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
                                                        <asp:Label ID="LB_ApplyExpense" runat="server" Text="<%$ Resources:lang,ApplyExpense%>"></asp:Label>
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
                            <td colspan="2" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td align="right" style="padding-right: 5px;">
                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left;">
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
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                                    </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_tdTaskID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                                    </strong>
                                                                </td>

                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgApplyType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgRelatedID" runat="server" Text="<%$ Resources:lang,RelatedID%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgApplyName" runat="server" Text="<%$ Resources:lang,Name%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgApplyAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center" class="auto-style1"><strong>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label></strong> </td>
                                                                <td width="14%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgPurpose" runat="server" Text="<%$ Resources:lang,Purpose%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgPaybackTime" runat="server" Text="<%$ Resources:lang,PaybackTime%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgApproveStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                OnItemCommand="DataGrid2_ItemCommand" ShowHeader="false" Width="100%" CellPadding="4"
                                                ForeColor="#333333" GridLines="None">
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
                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:ButtonColumn>

                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="RelatedType" HeaderText="相关类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="RelatedID" HeaderText="相关ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ExpenseName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="元">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Purpose" HeaderText="用途">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PayBackTime" HeaderText="还款时间" DataFormatString="{0:yyyy/MM/dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                    </asp:TemplateColumn>
                                                </Columns>
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
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr style="display:none;">
                                    <td align="right" style="width: 20%" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAppenseID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>:
                                    </td>
                                    <td align="left" style="width: 80%" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 20%"  class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAppenseName" runat="server" Text="<%$ Resources:lang,ExpenseName%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ExpenseName" runat="server" Width="448px"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="height: 9px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAppenseAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label>:
                                    </td>
                                    <td align="left" style="height: 9px" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Width="69px">0.00</NickLee:NumberBox>

                                        &nbsp;&nbsp;
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                            <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"  Width="120px"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label>： </td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Account" runat="server" Width="202px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Account" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountName" OnSelectedIndexChanged="DL_Account_SelectedIndexChanged"
                                            Width="158px">
                                        </asp:DropDownList><asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbPayBackTime" runat="server" Text="<%$ Resources:lang,PayBackTime%>"></asp:Label>:
                                    </td>
                                    <td align="left" style="width: 200px" class="formItemBgStyle">

                                        <asp:TextBox ID="DLC_PayBackTime" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_PayBackTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 30px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbPurpose" runat="server" Text="<%$ Resources:lang,Purpose%>"></asp:Label>:
                                    </td>
                                    <td align="left" style="height: 30px" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Purpose" runat="server" Height="69px" TextMode="MultiLine" Width="428px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 6px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label>:
                                    </td>
                                    <td align="left" style="height: 6px" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_Status_SelectedIndexChanged">
                                            <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                            <asp:ListItem Value="通过" Text="<%$ Resources:lang,TongGuo%>" />
                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                            <asp:ListItem Value="已记账" Text="<%$ Resources:lang,YiJiZhang%>" />
                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label7" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td align="right" class="formItemBgStyle" style="height: 27px">
                                        <asp:Label ID="LB_tbWFTemplate" runat="server" Text="<%$ Resources:lang,WFTemplate%>"></asp:Label>
                                        : </td>
                                    <td align="left" class="formItemBgStyle" style="width: 650px; height: 27px">
                                        <asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName" >
                                        </asp:DropDownList>
                                        &nbsp; &nbsp;
                                        <asp:Label ID="LB_tbType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>
                                        :
                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Text="<%$ Resources:lang,FeiYongShengQing%>" Value="费用申请" />
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Target="_blank" Text="<%$ Resources:lang,TemplateMaintenance%>"></asp:HyperLink>
                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,Refresh%>" />
                                    </td>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 100px; height: 27px"></td>
                                        <td align="left" class="formItemBgStyle" style="width: 650px; height: 27px"><span style="font-size: 10pt">（ 
                                        <asp:Label ID="LB_tbRequestFeedback" runat="server" Text="<%$ Resources:lang,RequestFeedback%>"></asp:Label>
                                            :</span><asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,SendSMS%>" />
                                            <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail%>" />
                                            <span style="font-size: 10pt">)&nbsp; </span>
                                            <asp:Button ID="BT_SubmitApply" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,SubmitApplication%>" />
                                            <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" DynamicServicePath="" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_SubmitApply" Y="150">
                                            </cc1:ModalPopupExtender>
                                            <asp:Label ID="LB_RelatedType" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_RelatedID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                            </table>
                            <br />
                            <table style="width: 100%;" cellpadding="0" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td colspan="2" style="text-align: left;">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="LB_dgApprovedID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="55%"><strong>
                                                                <asp:Label ID="LB_dgWorkFlow" runat="server" Text="<%$ Resources:lang,WorkFlow%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="15%"><strong>
                                                                <asp:Label ID="LB_dgApplyTime" runat="server" Text="<%$ Resources:lang,ApplyTime%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="LB_dgStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="5%"><strong>&nbsp;</strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false" Width="100%">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}" DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

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
