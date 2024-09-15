<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZNeedObjectTotal.aspx.cs" Inherits="TTWZNeedObjectTotal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>需方</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 
           

            //ControlStatusCloseChange();

        });



        function AlertNeedObjectPage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }


        function LoadNeedObjectList() {

            document.getElementById("BT_RelaceLoad").click();
        }


        function ControlStatusChange(objIsMark,objPurchaseEngineer,objUserCode) {

            
            $("#BT_NewBrowse").attr("class", "inpu");
            $("#BT_NewBrowse").removeAttr("disabled");

            if (objPurchaseEngineer == objUserCode) {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");
            } else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
            }

            if (objIsMark == "0" && objPurchaseEngineer == objUserCode) {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
            }
            else {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                            //删除
            }
        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewBrowse").attr("disabled", "disabled");
            $("#BT_NewBrowse").removeClass("inpu");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuFang%>"></asp:Label>
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
                                                            <%--<input type="button" class="inpuLong" value="新增需方" onclick="AlertNeedObjectPage('TTWZNeedObjectDetail.aspx?id=')" />--%>
                                                            <asp:Button ID="BT_NewAdd" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZengXuFang%>" OnClick="BT_NewAdd_Click" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuFangJiLuGong%>"></asp:Label><asp:Label ID="LB_RecordCount" runat="server" Text=""></asp:Label><asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：<asp:Button ID="BT_NewEdit" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BianJi%>" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewBrowse" runat="server" CssClass="inpu" Text="<%$ Resources:lang,LiuLan%>" OnClick="BT_NewBrowse_Click" />&nbsp;
                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <div style="width: 2600px;">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuFangBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>E-mail</strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>QQ</strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MaiShouRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server"  Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaiWuDianHua%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID")+"|"+Eval("IsMark")+"|"+Eval("PurchaseEngineer") %>' CommandName="click" CssClass="notTab">
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="notTab" Visible='<%# Eval("IsMark").ToString()=="0" ? true : false %>'>删除</asp:LinkButton>--%>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="NeedCode" HeaderText="需方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Fax").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ContactPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Mobile").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                E-mail
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Email").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                QQ
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("QQ").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Vendee" HeaderText="买受人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PersonDelegate" HeaderText="法人代表">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("OpeningBank").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("AccountNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("RateNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("UnitAddress").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ZipCode").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,CaiWuDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("AccountPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("InternetUrl").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
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
                <asp:HiddenField ID="HF_NewID" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
                <asp:HiddenField ID="HF_NewPurchaseEngineer" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
