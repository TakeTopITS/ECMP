<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractManageAccount.aspx.cs" Inherits="TTConstractManageAccount" %>

<!DOCTYPE html>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <title></title>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
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
                                                        <asp:Label ID="Label1" runat="server" Text="合同台帐"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
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
                                <div style="float: left;  margin: 2px; padding: 5px; width: 100%;">
                                    <div style="margin: 5px;">
                                        <div style="float: left;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LB_Contractid" runat="server" Text="合同编号:"> </asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="TB_ConstractID" runat="server"></asp:TextBox>
                                                        </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="合同名称:"> </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_ConstractName" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="合同类型:"> </asp:Label>
                                                    </td>
                                                    <td>
                                                          <asp:DropDownList ID="DDL_Constractype" runat="server" DataTextField="type" DataValueField="type" Width="175px" AutoPostBack="true"></asp:DropDownList>
                                                    </td>
                                                    <td>
                                                         <asp:Button ID="BTN_Query" runat="server" Text="查询" OnClick="BTN_Query_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text="选择合同:"> </asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="TB_ConstractCode" runat="server"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                Enabled="True" TargetControlID="TB_ConstractCode" PopupControlID="Panel2"
                                                                CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                        </td>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Text="合同状态:"> </asp:Label>
                                                    </td>
                                                    <td>
                                                          <asp:DropDownList ID="DDL_ConstractStatus" runat="server" DataTextField="status" DataValueField="status" Width="175px" AutoPostBack="true"></asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" Text="签署日期:"> </asp:Label>
                                                    </td>
                                                    <td>
                                                         <%-- <asp:TextBox ID="TB_signdate" runat="server" TextMode="Date" ></asp:TextBox>--%>
                                                        <asp:TextBox ID="DLC_signdate" runat="server" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onFocus="WdatePicker({lang:'auto'})"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                     
                                    </div>
                                  
                </div>
                <div style="float: left; margin: 2px; padding: 1px; width: 300px;">
                </div>
                <div style="clear: both; padding: 2px;">
                    <hr />
                </div>

                <div>
                    <asp:GridView ID="gvContractData" runat="server" AutoGenerateColumns="False" EmptyDataText="暂时没有查询到相关信息" AllowPaging="True" PageSize="15" CellPadding="2">
                        <Columns>
                            <asp:BoundField DataField="constractid" HeaderText="序号" />
                            <asp:BoundField DataField="status" HeaderText="合同状态" />
                            <asp:BoundField DataField="constractclass" HeaderText="合同大类" />
                            <asp:BoundField DataField="type" HeaderText="合同类型" />
                            <asp:BoundField DataField="constractcode" HeaderText="公司合同编号" />
                            <asp:BoundField DataField="partyconstractcode" HeaderText="缔约方合同编号" />
                            <asp:BoundField DataField="constractname" HeaderText="合同名称" />
                            <asp:BoundField DataField="ProjectBasis" HeaderText="合同立项依据" />
                            <asp:BoundField DataField="Amount" HeaderText="合同金额" />
                            <asp:BoundField DataField="taxrate" HeaderText="税率" />
                            <asp:BoundField DataField="aftertaxtotalamount" HeaderText="合同不含税金额" />
                            <asp:BoundField DataField="provisionalamount" HeaderText="暂列金" />
                            <asp:BoundField DataField="part1" HeaderText="缔约方" />
                            <asp:BoundField DataField="signdate" HeaderText="签署日期" />
                            <asp:BoundField DataField="signname" HeaderText="签署人" />
                            <asp:BoundField DataField="startdate" HeaderText="约定开工时间" />
                            <asp:BoundField DataField="enddate" HeaderText="约定竣工时间" />
                            <asp:BoundField DataField="astartdate" HeaderText="实际开工时间" />
                            <asp:BoundField DataField="aenddate" HeaderText="实际竣工时间" />
                            <asp:BoundField DataField="duration" HeaderText="约定工期" />
                            <asp:BoundField DataField="warranty" HeaderText="合同质保期" />
                            <asp:BoundField DataField="prepaypercent" HeaderText="合同约定预付款比例" />
                            <asp:BoundField DataField="monthpaypercent" HeaderText="合同约定月进度支付比例" />
                            <asp:BoundField DataField="finishpaypercent" HeaderText="合同约定竣工支付比例" />
                            <asp:BoundField DataField="settlepaypercent" HeaderText="合同约定结算支付比例" />
                            <asp:BoundField DataField="realprogress" HeaderText="实时形象进度（%）" />
                            <asp:BoundField DataField="realpvalue" HeaderText="实时产值（元）" />
                            <asp:BoundField DataField="sumrecieve" HeaderText="累计收款（元）" />
                            <asp:BoundField DataField="sumpayment" HeaderText="累计付款（元）" />
                            <asp:BoundField DataField="settleaccount" HeaderText="结算金额（元）" />
                            <asp:BoundField DataField="departname" HeaderText="主管部门" />
                            <asp:BoundField DataField="operator" HeaderText="经办人" />
                            <asp:BoundField DataField="pmname" HeaderText="项目经理" />
                            <asp:BoundField DataField="memo" HeaderText="备注" />
                        </Columns>
                    </asp:GridView>
                </div>

                </td>
                        </tr>
                    </table>

                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView4" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseTree" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
