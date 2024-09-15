<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZStockList.aspx.cs" Inherits="TTWZStockList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>库别列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           

            ControlStatus();

        });


        function ControlStatus() {
            $("#TXT_Safekeep").attr("readonly", "readonly");
            $("#TXT_Checker").attr("readonly", "readonly");
        }

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KuBieLieBiao%>"></asp:Label>
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
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table class="formBgStyle" width="80%">
                                                                <tr>
                                                                    <td style="text-align: left; display: none;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left; display: none;" class="formItemBgStyle" colspan="5">
                                                                        <asp:TextBox ID="TXT_ID" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_StockCode" runat="server" ></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:HiddenField ID="HF_Safekeep" runat="server" />
                                                                        <asp:TextBox ID="TXT_Safekeep" runat="server"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="BT_Safekeep" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Safekeep', 'TXT_Safekeep')" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:HiddenField ID="HF_Checker" runat="server" />
                                                                        <asp:TextBox ID="TXT_Checker" runat="server"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="BT_Checker" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Checker', 'TXT_Checker')" />
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KuBieShuoMing%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                                        <asp:TextBox ID="TXT_StockDesc" runat="server" Width="660"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                                    </td>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="5">
                                                                        
                                                                        <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" Visible="false" />
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;
                                                                        
                                                                        <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:lang, QuXiao%>" CssClass="inpu" OnClick="btnCancel_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        
                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="6">
                                                                        <asp:Button ID="BT_RepeatMark" runat="server" Text="<%$ Resources:lang, ChongZuoShiYongBiaoJi%>" CssClass="inpuLong" OnClick="BT_RepeatMark_Click" />&nbsp;
                                                                        <asp:Button ID="BT_WriteRecord" runat="server" Text="<%$ Resources:lang, XieJiLu%>" CssClass="inpuLong" OnClick="BT_WriteRecord_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="6">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KuBieJiLuGong%>"></asp:Label><asp:Label ID="LB_RecordCount" runat="server" Text=""></asp:Label><asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Button ID="BT_Start" runat="server" Text="<%$ Resources:lang, ChuShiHua%>" CssClass="inpu" OnClick="BT_Start_Click" />&nbsp;<font color="red"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ChuangJianGuDingKuBie%>"></asp:Label></font>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="44%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KuBieShuoMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HeXiaoBiaoJi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab">
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="notTab" Visible='<%# Eval("IsMark").ToString()=="-1" ? false : true %>'>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>
                                                                            <%--<asp:Button runat="server" Text="编辑" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="inpu" />--%>
                                                                            <%--<asp:Button runat="server" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="inpu" Visible='<%# Eval("IsMark").ToString()=="-1" ? false : true %>' />--%>

                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="StockCode" HeaderText="库别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <%--<asp:BoundColumn DataField="StockDesc" HeaderText="库别说明">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="44%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="44%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KuBieShuoMing%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("StockDesc").ToString(), 40) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="SafekeepName" HeaderText="保管员">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="IsCancel" HeaderText="核销标记">
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
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
