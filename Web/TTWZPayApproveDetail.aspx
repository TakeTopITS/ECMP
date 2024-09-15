<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPayApproveDetail.aspx.cs" Inherits="TTWZPayApproveDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>付款审批</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FuKuanShenPi%>"></asp:Label>
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <table class="formBgStyle" width="40%">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FuKuanShenPiID%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_ID" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*</font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PiZhunEDu%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ConfirmMoney" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuKuanRiQi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PayTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" valign="top" colspan="4">
                                                            <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                            <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />&nbsp;
                                                            <asp:Button ID="BT_Total" runat="server" Text="<%$ Resources:lang,HuiZong%>" CssClass="inpu" OnClick="BT_Total_Click" Visible="false" />&nbsp;
                                                            <asp:Button ID="BT_Delete" runat="server" Text="<%$ Resources:lang,ShanChuQuanBu%>" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Visible="false" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 1400px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuFuKuanID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YingFuKuanID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="13%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FuKuanMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaEDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PiZhunEDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FuKuanRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PiZhunRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_PayApprove" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_PayApprove_ItemCommand" OnPageIndexChanged="DG_PayApprove_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="edit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>'>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:Button ID="Button4" runat="server" CssClass="inpu" Text="编辑" CommandName="edit" CommandArgument='<%# Eval("ID") %>' Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>' />--%>
                                                                    <asp:Button ID="Button1" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" CommandName="del" CommandArgument='<%# Eval("ID") %>' Visible="false" />
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="approve" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>'>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,PiZhun%>"></asp:Label></asp:LinkButton>&nbsp;
                                                                    <%--<asp:Button ID="Button2" runat="server" CssClass="inpu" Text="批准" CommandName="approve" CommandArgument='<%# Eval("ID") %>' Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>' />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="AdvanceCode" HeaderText="预付款ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PayID" HeaderText="应付款ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PayName" HeaderText="付款名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FuKuanMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PayName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="计划额度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MarkerName" HeaderText="编制人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ConfirmMoney" HeaderText="批准额度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PayTime" HeaderText="付款日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FuKuanRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PayTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ApproverName" HeaderText="批准人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                                <asp:Label ID="LB_PayApproveSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Reset" />
                <asp:PostBackTrigger ControlID="BT_Total" />
                <asp:PostBackTrigger ControlID="BT_Delete" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
