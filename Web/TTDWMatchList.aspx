<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDWMatchList.aspx.cs" Inherits="TTDWMatchList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>原料-技术部</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
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
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuanLiao%>"></asp:Label>
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
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr style="font-size: 12pt">
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px; font-size: 12px;" class="formItemBgStyle" valign="top">

                                                            <table class="formBgStyle" width="100%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_ID" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuanLiaoMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_MatchName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YuanLiaoLeiXing%>"></asp:Label>：</td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_MatchType" runat="server" DataTextField="MatchType" DataValueField="ID"></asp:DropDownList>
                                                                    </td>
                                                                    <td style="text-align: left; display:none;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YuanLiaoJiaGe%>"></asp:Label>：</td>
                                                                    <td style="text-align: left; display:none;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_MaterialPrice" runat="server" Text="0"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="4">
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />
                                                                        <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="btnCancel_Click" Visible="false" />
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                        <td class="formItemBgStyle" width="80%">
                                                            <font color="red">*<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,RGCGBTXLYLJGZYLMCZTWHS%>"></asp:Label></font>
                                                            <asp:Button ID="BT_MatchTypeAsc" runat="server" Text="<%$ Resources:lang,LeiXingShengXu%>" CssClass="inpu" OnClick="BT_MatchTypeAsc_Click" />
                                                            <asp:Button ID="BT_MatchTypeDesc" runat="server" Text="<%$ Resources:lang,LeiXingJiangXu%>" CssClass="inpu" OnClick="BT_MatchTypeDesc_Click" />
                                                            <asp:DataGrid ID="DG_Match" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="15" ShowHeader="True"
                                                                Width="100%" OnItemCommand="DG_Match_ItemCommand" OnPageIndexChanged="DG_Match_PageIndexChanged">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" ForeColor="Black" Text="<%$ Resources:lang,ShanChu%>"
                                                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="原料名称">
                                                                        <ItemTemplate>
                                                                            <font color='<%# decimal.Parse(Eval("MaterialPrice").ToString()) != 0 ? "Red" : "" %>'><%# DataBinder.Eval(Container.DataItem,"MatchName") %></font>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="MatchTypeName" HeaderText="原料类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MaterialPrice" Visible="false" HeaderText="原料价格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_MatchSql" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_ID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="BT_MatchTypeAsc" />
                <asp:PostBackTrigger ControlID="BT_MatchTypeDesc" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
