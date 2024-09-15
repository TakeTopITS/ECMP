<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZUnitList.aspx.cs" Inherits="TTWZUnitList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计量单位</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label>
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
                                                    <tr>
                                                        <td align="left" style="width: 100%; padding: 5px 5px 5px 5px;" class="formItemBgStyle">

                                                            <table class="formBgStyle" width="80%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ID" runat="server" ></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_UnitName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                                        &nbsp;
                                                                        <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" Visible="false" />
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" Visible="true" />&nbsp;
                                                                        <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="btnCancel_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="4">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JLDWJLG%>"></asp:Label><asp:Label ID="LB_RecordCount" runat="server" Text=""></asp:Label>条&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td class="formItemBgStyle">
                                                            <div style="width:60%;">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="30%" align="center">
                                                                                        <strong><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="30%" align="center">
                                                                                        <strong><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="40%" align="left">
                                                                                        <strong><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab">
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="notTab">
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>
                                                                                <%--<asp:Button ID="BT_ID" runat="server" ForeColor="Black" Text="编辑" CommandName='edit'
                                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpu" />--%>
                                                                                <%--<asp:Button ID="Button1" runat="server" ForeColor="Black" Text="删除" CommandName='del'
                                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpu" />--%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                </asp:DataGrid>
                                                                <asp:Label ID="LB_SQL" runat="server" Text="" Visible="false"></asp:Label>
                                                            </div>
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
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
