<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProExpense.aspx.cs" Inherits="TTProExpense" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1300px;
            width: expression (document.body.clientWidth <= 1300? "1300px" : "auto" ));
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


    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = PlanTreeDivID.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            PlanTreeDivID.scrollTop = disPostion;
        }
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
                                                            <asp:Label ID="LB_tiExpenseDetail" runat="server" Text="<%$ Resources:lang,ExpenseDetail%>"></asp:Label>
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

                                <td class="page_topbj" height="31">

                                    <b>
                                        <asp:Label ID="LB_tiExpenseClaimForm" runat="server" Text="<%$ Resources:lang,ExpenseClaimForm%>"></asp:Label></b>
                                </td>
                                <td class="page_topbj" height="31"></td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-left: 15px;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LB_tbCurrentDayAmount" runat="server" Text="<%$ Resources:lang,CurrentDayAmount%>"></asp:Label>:<asp:Label
                                                    ID="LB_CurrentDayAmount" runat="server" Height="18px" Text="0"></asp:Label>
                                                <asp:Label ID="LB_tbExpenseSummary" runat="server" Text="<%$ Resources:lang,ExpenseSummary%>"></asp:Label>:
                                                <asp:Label ID="LB_Amount" runat="server" Font-Bold="False" Text="0"></asp:Label>

                                                <asp:Label ID="LB_tbConfirmExpenseSummary" runat="server" Text="<%$ Resources:lang,QueRenFeiYongHuiZong%>"></asp:Label>:
                                                <asp:Label ID="LB_ConfirmAmount" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                                <asp:Label ID="LB_ProjectBudget" runat="server" Text="<%$ Resources:lang,ProjectBudget%>"></asp:Label>:
                                                <asp:Label ID="LB_ProBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                            </td>
                                            <td width="30%" align="left">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                                <td align="left" style="padding-top: 3px;">
                                    <asp:Button ID="BT_Claim" runat="server" CssClass="inpuYello" Text="<%$ Resources:lang,QiBaoxiao%>" OnClick="BT_Claim_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 70%; text-align: left; padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8;">
                                    <div id="PlanTreeDivID" style="width: 100%; height: 800px; overflow: auto; vertical-align: top;">
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
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                            <td align="center" width="5%">
                                                                <strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="13%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="18%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgEffectTime" runat="server" Text="<%$ Resources:lang,EffectTime%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgConfirmAmount" runat="server" Text="<%$ Resources:lang,ConfirmAmount%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="9%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgUser" runat="server" Text="<%$ Resources:lang,User%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgProject" runat="server" Text="<%$ Resources:lang,Project%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgTask" runat="server" Text="<%$ Resources:lang,Task%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_dgAssign" runat="server" Text="<%$ Resources:lang,Assign%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center">
                                                                <asp:CheckBox ID="CB_AllClaimed" runat="server" AutoPostBack="true" OnCheckedChanged="CB_AllClaimed_CheckedChanged" />
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
                                            OnItemCommand="DataGrid1_ItemCommand"
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
                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EffectDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发生时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ConfirmAmount" HeaderText="确认金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="UserName" HeaderText="用户" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="ProjectID" HeaderText="项目">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TaskID" HeaderText="任务">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="RecordID" HeaderText="分派">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_IsClaimed" runat="server" AutoPostBack="true" />
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

                                        <asp:Label ID="LB_Sql22" runat="server" T></asp:Label>
                                    </div>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left" class="formItemBgStyle">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div>
                                                            <Upload:InputFile ID="FileUpload_Training" runat="server" Width="200px" />
                                                            &nbsp;<asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                            <br />
                                                            <asp:Label ID="Label70" runat="server"></asp:Label>
                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>
                                                            ：<a href="Template/项目费用导入模板.xls"><asp:Label ID="Label72" runat="server" Text="项目费用导入模板"></asp:Label>
                                                            </a>
                                                            <div id="ProgressBar">
                                                                <Upload:ProgressBar ID="ProgressBar3" runat="server" Height="100px" Width="500px">
                                                                </Upload:ProgressBar>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align: left; padding: 5px 5px 5px 5px;" valign="top" align="left">
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
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                                    </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="50%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ExpenseName%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Width="100%"
                                        OnItemCommand="DataGrid3_ItemCommand"
                                        ShowHeader="false" CellPadding="4" GridLines="None">
                                        <Columns>
                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:ButtonColumn>
                                            <asp:TemplateColumn HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:ButtonColumn>
                                            <asp:BoundColumn DataField="ECID" HeaderText="ECID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ExpenseName" HeaderText="费用名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="50%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
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
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="是" OnClick="BT_ActiveYes_Click" /><asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="否" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label8" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label>
                                    </td>
                                    <td colspan ="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Account" runat="server" Width="150px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Account" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" OnSelectedIndexChanged="DL_Account_SelectedIndexChanged"
                                            Height="25px">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ExpenseID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>:
                                    </td>
                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Description" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbEffectTime" runat="server" Text="<%$ Resources:lang,EffectTime%>"></asp:Label>:
                                    </td>
                                    <td style="width: 15%; text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_EffectDate" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EffectDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label>:
                                    </td>
                                    <td style="width: 55%;" class="formItemBgStyle" align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Width="85px">0.00</NickLee:NumberBox></td>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                <td>
                                                    <asp:Label ID="LB_CurrencyType" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popClaimWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label4" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 700px;" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td align="right" style="width: 100px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbExpenseName" runat="server" Text="<%$ Resources:lang,ExpenseName%>"></asp:Label>
                                    </td>
                                    <td align="left" style="width: 550px" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ExpenseName" runat="server" Width="529px"></asp:TextBox>
                                        <asp:Label ID="LB_ECID" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="width: 100px; height: 9px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbClaimAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label>
                                    </td>
                                    <td align="left" style="width: 550px; height: 9px" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ClaimAmount" runat="server" Width="69px" Enabled="False">0.00</NickLee:NumberBox>
                                        <asp:Label ID="LB_ExpenseCurrencyType" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100px; height: 30px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbPurpose" runat="server" Text="<%$ Resources:lang,Purpose%>"></asp:Label>
                                    </td>
                                    <td align="left" style="width: 550px; height: 30px" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Purpose" runat="server" Height="69px" TextMode="MultiLine" Width="501px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100px; height: 6px" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label>
                                    </td>
                                    <td align="left" style="width: 550px; height: 6px" class="formItemBgStyle">
                                        <asp:Label ID="LB_Status" runat="server" Text="<%$ Resources:lang,xinJian%>"></asp:Label>
                                        <asp:Label ID="LB_RelatedType" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_RelatedID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table runat="server" id="TableClaimDetail" width="700" style="padding-top: 10px;">
                                <tr>
                                    <td colspan="2" align="left">

                                        <asp:Label ID="LB_tabExpenseDetail" runat="server" Text="<%$ Resources:lang,ExpenseDetail%>"></asp:Label>
                                        <table width="100%">
                                            <tr>
                                                <td style="height: 6px; text-align: left;">

                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                        <tr>

                                                            <td width="7">

                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                            <td>

                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                    <tr>

                                                                        <td width="8%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimID" runat="server" Text="<%$ Resources:lang,ID %>"></asp:Label></strong></td>

                                                                        <td width="8%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimExpenseID" runat="server" Text="<%$ Resources:lang,ExpenseID %>"></asp:Label></strong></td>

                                                                        <td width="10%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimAccount" runat="server" Text="<%$ Resources:lang,Account %>"></asp:Label></strong></td>

                                                                        <td width="20%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimDescription" runat="server" Text="<%$ Resources:lang, Description %>"></asp:Label></strong></td>

                                                                        <td width="8%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimExpenseAmount" runat="server" Text="<%$ Resources:lang,Amount %>"></asp:Label></strong></td>

                                                                        <td width="15%" align="center"><strong>

                                                                            <asp:Label ID="LB_tbClaimEffectTime" runat="server" Text="<%$ Resources:lang,EffectTime %>"></asp:Label></strong></td>

                                                                        <td width="8%" align="center"><strong></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td width="6" align="right">

                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>

                                                    <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px"
                                                        OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                        Width="100%">

                                                        <Columns>

                                                            <asp:BoundColumn DataField="ID" HeaderText="序号">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="RelatedExpenseID" HeaderText="费用ID">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Account" HeaderText="科目">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Description" HeaderText="描述">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="RegisterDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发生时间">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>

                                                            <asp:TemplateColumn>

                                                                <ItemTemplate>

                                                                    <asp:Button ID="BT_DeleteClaimDetail" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Delete%>" />
                                                                </ItemTemplate>

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>

                                                        <EditItemStyle BackColor="#2461BF" />

                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                        <ItemStyle CssClass="itemStyle" />

                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid></td>
                                            </tr>

                                            <tr>

                                                <td style="height: 6px; text-align: left;">

                                                    <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc; text-align: center;">
                            <asp:LinkButton ID="LinkButton2" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewClaim_Click" Text="<%$ Resources:lang,BaoCun %>"></asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewClaimAndSummitReview_Click" Text="<%$ Resources:lang,BaoCunBinTiJiaoShenPi %>"></asp:LinkButton>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label103" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <asp:Label ID="LB_tabWorkflowDefinition" runat="server" Text="<%$ Resources:lang,WorkflowDefinition%>"></asp:Label>
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>

                                    <td align="right" style="width: 80px;" class="formItemBgStyle">

                                        <asp:Label ID="LB_tbWFType" runat="server" Text="<%$ Resources:lang,Type %>"></asp:Label>: </td>

                                    <td class="formItemBgStyle">

                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="费用报销" Text="<%$ Resources:lang,FeiYongBaoXiao%>" />
                                        </asp:DropDownList><asp:Label ID="tbWFTemplate" runat="server" Text="<%$ Resources:lang,WFTemplate %>"></asp:Label>:<asp:DropDownList
                                            ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                            Width="160px">
                                        </asp:DropDownList><asp:Label ID="LB_tbKeyWord" runat="server" Text="<%$ Resources:lang,KeyWord %>"></asp:Label>:

                                        <asp:TextBox ID="TB_KeyWord" runat="server" Width="80px"></asp:TextBox><asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,Refresh %>" OnClick="BT_Refrash_Click"
                                            CssClass="inpu" />
                                    </td>
                                </tr>

                                <tr>

                                    <td align="right" style="width: 80px;" class="formItemBgStyle"></td>

                                    <td align="left" class="formItemBgStyle"><span style="font-size: 10pt">（

                                        <asp:Label ID="LB_tbProgressFeedback" runat="server" Text="<%$ Resources:lang,ProgressFeedback %>"></asp:Label>:

                                        <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,SendSMS %>" /><asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail %>" />) </span>

                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,SubmitToApprove %>"
                                            CssClass="inpuLong" /><cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                                DynamicServicePath="">
                                            </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                            </table>

                            <table width="100%">

                                <tr>

                                    <td align="center" style="height: 22px; text-align: left;"><strong>

                                        <asp:Label ID="LB_tbWorkflowList" runat="server" Text="<%$ Resources:lang,WorkflowList %>"></asp:Label>:</strong> </td>
                                </tr>

                                <tr>

                                    <td align="center" style="width: 100%; height: 22px; text-align: left;">

                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="LB_dgWFID" runat="server" Text="<%$ Resources:lang,ID %>"></asp:Label></strong></td>

                                                            <td width="55%" align="center"><strong>

                                                                <asp:Label ID="LB_dgWorkflow" runat="server" Text="<%$ Resources:lang,Workflow %>"></asp:Label></strong></td>

                                                            <td width="20%" align="center"><strong>

                                                                <asp:Label ID="LB_dgApplyTime" runat="server" Text="<%$ Resources:lang,ApplyTime %>"></asp:Label></strong></td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="LB_dgWFStatus" runat="server" Text="<%$ Resources:lang,Status %>"></asp:Label></strong></td>

                                                            <td width="5%" align="center"><strong></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                            ShowHeader="False" PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None">

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <EditItemStyle BackColor="#2461BF" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" BackColor="#EFF3FB" />

                                            <Columns>

                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>

                                                <asp:TemplateColumn>

                                                    <ItemTemplate>

                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                            Target="_blank"><img src ="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
