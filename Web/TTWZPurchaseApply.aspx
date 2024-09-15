<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseApply.aspx.cs" Inherits="TTWZPurchaseApply" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供应商报价</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 



        });


        function LoadProjectList() {
            //alert("调用成功");
            document.getElementById("BT_RelaceLoad").click();
        }

        function ClickToDetail(obj) {
            window.location.href = "TTWZPurchaseApplyDetail.aspx?PurchaseCode=" + obj;
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
                                                            <asp:Label ID="Label1" runat="server" Text="报价平台"></asp:Label>
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
                                <td style="padding: 0px 2px 2px 2px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr style="display: none;">
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseName" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:FileUpload ID="FUP_PurchaseDocument" runat="server" />
                                                            <asp:Button ID="BT_PurchaseFile" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_PurchaseFile_Click" /><br />
                                                            <asp:Literal ID="LT_PurchaseDocument" runat="server"></asp:Literal>
                                                            <asp:HiddenField ID="HF_PurchaseDocument" runat="server" />
                                                            <asp:HiddenField ID="HF_PurchaseDocumentURL" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaiGouBaoJiaWenJian%>"></asp:Label>：
                                                <asp:Repeater ID="RPT_PurchaseDocument" runat="server">
                                                    <HeaderTemplate>
                                                        <table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <a href='<%# Eval("DocumentUrl") %>' class="notTab" target="_blank"><%# Eval("DocumentName") %></a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouWenJianLieBiaoJiLu%>"></asp:Label>&nbsp;&nbsp;
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_RowCount" runat="server" Text="*"></asp:Label><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：&nbsp;&nbsp;
                                                <asp:Button ID="BT_NewTenderDocument" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianXiaZai%>" CssClass="inpuLong" OnClick="BT_NewTenderDocument_Click" Enabled="false" />&nbsp;
                                                <asp:Button ID="BT_NewThrowDocument" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianShangChuan%>" CssClass="inpuLong" OnClick="BT_NewThrowDocument_Click" Enabled="false" />&nbsp;
                                                <asp:Button ID="BT_NewThrowDocumentDel" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianShanChu%>" CssClass="inpuLong" OnClick="BT_NewThrowDocumentDel_Click" Enabled="false" />&nbsp;
                                                <asp:Button ID="BT_NewApplyDetail" runat="server" Text="<%$ Resources:lang,TianXieBaoJiaDan%>" CssClass="inpu" OnClick="BT_NewApplyDetail_Click" Enabled="false" />&nbsp;
                                                <asp:Button ID="BT_NewSubmit" runat="server" Text="<%$ Resources:lang,TiJiaoBaoJia%>" CssClass="inpu" OnClick="BT_NewSubmit_Click" Enabled="false" />&nbsp;
                                                <asp:Button ID="BT_NewSubmitReturn" runat="server" Text="<%$ Resources:lang,TiJiaoTuiHui%>" CssClass="inpu" OnClick="BT_NewSubmitReturn_Click" Enabled="false" />&nbsp;
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 2000px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhaoBiaoZhuGuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TouBiaoWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                      <%--  <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianEr%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianWu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianLiu%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
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
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="edit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="询价" ? true : false %>'>编辑</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="detail" CssClass="notTab">明细</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="kanFile" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="报价" ? true : false %>'>查看中标文件</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# (Eval("IsConfirm").ToString()=="0" && Eval("Progress").ToString()=="询价") ? true : false %>'>提交</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="cancel" CssClass="notTab" Visible='<%# (Eval("IsConfirm").ToString()=="1" && Eval("Progress").ToString()=="询价") ? true : false %>'>退回报价</asp:LinkButton>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseName").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseStartTime").ToString(), 100) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TenderCompetent" HeaderText="招标主管">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseMethod" HeaderText="采购方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"PurchaseDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("PurchaseDocument").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="RowNumber" HeaderText="明细条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseStartTime").ToString(), 10) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#  ShareClass.StringCutByRequire(Eval("PurchaseEndTime").ToString(), 10) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianYi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                        <%--    <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianEr%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL2") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument2").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianSan%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL3") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument3").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianSi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL4") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument4").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianWu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL5") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument5").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJianLiu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL6") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument6").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>--%>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
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
                                        <tr style="display:none;">
                                            <td>
                                                <asp:Button ID="BT_RelaceLoad" runat="server" CssClass="inpu" OnClick="BT_RelaceLoad_Click" Text="<%$ Resources:lang,ShuaXin%>" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_NewPurchaseCode" runat="server" />

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_PurchaseFile" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
