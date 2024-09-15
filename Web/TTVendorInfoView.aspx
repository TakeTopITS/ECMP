<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTVendorInfoView.aspx.cs" Inherits="TTVendorInfoView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,GongYingShangZiLiao%>"></asp:Label>
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
                        <td style="padding: 5px 5px 5px 5px;">
                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="基本信息" TabIndex="0">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <asp:DataList ID="DataList2" runat="server" Height="1px" Width="100%" CellPadding="0"
                                            ForeColor="#333333">

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                            <ItemTemplate>

                                                <table cellpadding="4" cellspacing="0" style="width: 100%;" class="bianTable">

                                                    <tr>

                                                        <td style="width: 10%; text-align: right;">

                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>： </td>

                                                        <td style="width: 20%" align="left"><%#DataBinder .Eval (Container .DataItem ,"VendorCode") %> </td>

                                                        <td style="width: 10%; text-align: right;">

                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"VendorName") %></td>

                                                        <td style="width: 10%; text-align: right;">

                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"BelongDepartCode") %><%#DataBinder .Eval (Container .DataItem ,"BelongDepartName") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; text-align: right;">

                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>： </td>

                                                        <td colspan="5" style="text-align: left"><%#DataBinder .Eval (Container .DataItem ,"VendorEnglishName") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; text-align: right;">

                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>： </td>

                                                        <td style="width: 100px" align="left"><%#DataBinder .Eval (Container .DataItem ,"Type") %></td>

                                                        <td style="width: 100px; text-align: right;">

                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"ContactName") %></td>

                                                        <td style="text-align: right;">

                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>： </td>

                                                        <td style="width: 135px; text-align: left;"><%#DataBinder .Eval (Container .DataItem ,"SalesPerson") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; text-align: right;">

                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>： </td>

                                                        <td colspan="3" style="text-align: left"><%#DataBinder .Eval (Container .DataItem ,"InvoiceAddress") %></td>

                                                        <td style="text-align: right">

                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"Currency") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="text-align: right">

                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>： </td>

                                                        <td colspan="3" style="text-align: left"><%#DataBinder .Eval (Container .DataItem ,"BankAccount") %></td>

                                                        <td style="text-align: right">

                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"Discount") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; text-align: right">

                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>： </td>

                                                        <td colspan="3" style="text-align: left"><%#DataBinder .Eval (Container .DataItem ,"Bank") %></td>

                                                        <td style="text-align: right">

                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XinYongDengJi%>"></asp:Label>： </td>

                                                        <td align="left"><%#DataBinder .Eval (Container .DataItem ,"CreditRate") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DianHuaYi%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"Tel1") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DianHuaEr%>"></asp:Label>： </td>

                                                        <td style="text-align: left" class="style3"><%#DataBinder .Eval (Container .DataItem ,"Tel2") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"Fax") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; text-align: right">E_Mail： </td>

                                                        <td colspan="3" style="text-align: left"><%#DataBinder .Eval (Container .DataItem ,"EmailAddress") %></td>

                                                        <td></td>

                                                        <td></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"WebSite") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>： </td>

                                                        <td style="text-align: left" class="style3"><%#DataBinder .Eval (Container .DataItem ,"ZP") %></td>

                                                        <td style="height: 20px; text-align: right"></td>

                                                        <td style="height: 20px; text-align: left"></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"Country") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>： </td>

                                                        <td style="text-align: left" class="style3"><%#DataBinder .Eval (Container .DataItem ,"State") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"City") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"AreaAddress") %></td>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiZhong%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left" colspan="3"><%#DataBinder .Eval (Container .DataItem ,"RegistrationAddressCN") %></td>
                                                    </tr>

                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiYing%>"></asp:Label>： </td>

                                                        <td colspan="5" style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"RegistrationAddressEN") %></td>
                                                    </tr>
                                                      <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label67" runat="server" Text="设备名称"></asp:Label>： </td>

                                                        <td colspan="5" style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"DeviceName") %></td>
                                                    </tr>
                                                    <tr>

                                                        <td style="width: 100px; height: 20px; text-align: right">

                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>： </td>

                                                        <td colspan="2" style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"Comment") %></td>

                                                        <td style="height: 20px; text-align: right">

                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>： </td>

                                                        <td style="height: 20px; text-align: left"><%#DataBinder .Eval (Container .DataItem ,"CreateDate") %></td>

                                                        <td>

                                                            <a href='TTContactList.aspx?RelatedType=Vendor&RelatedID=<%#DataBinder.Eval(Container.DataItem, "VendorCode")%>'
                                                                target="DetailArea">

                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XiangGuanLianXiRen%>"></asp:Label></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataList>

                                        <asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Enabled="false" Visible="false" Target="_blank" Text="<%$ Resources:lang,XiangGuanLianXiRen%>"></asp:HyperLink>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="关联项目">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <br />

                                        <table width="99%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="5%" align="center"><strong>

                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong></td>

                                                            <td width="25%" align="center"><strong>

                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XiangMuMingChen %>"></asp:Label>
                                                            </strong></td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,KaiShiRiQi %>"></asp:Label>
                                                            </strong></td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JieShuRiQi %>"></asp:Label>
                                                            </strong></td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LiXiangRiQi %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                            </strong></td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WanChengChengDu %>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            GridLines="None" Width="99%">

                                            <Columns>

                                                <asp:BoundColumn DataField="ProjectID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="立项日期">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">

                                                    <ItemTemplate>

                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>

                                                <asp:TemplateColumn HeaderText="完成程度">

                                                    <ItemTemplate>

                                                        <asp:Label ID="LB_FinishPercent" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FinishPercent")%> '></asp:Label>%
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText=" 关联订单">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ShangPinCaiGouDingDan%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <br />

                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">

                                            <tr>

                                                <td width="7">

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                        <tr>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="25%"><strong>

                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="15%"><strong>

                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZongJingE%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="20%"><strong>

                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label></strong> </td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td align="right" width="6">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">

                                            <Columns>

                                                <asp:BoundColumn DataField="POID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTGoodsPurchaseOrderView.aspx?POID={0}"
                                                    DataTextField="GPOName" HeaderText="名称" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Amount" HeaderText="总金额">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="PurManName" HeaderText="采购员" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:HyperLinkColumn>

                                                <asp:TemplateColumn HeaderText="状态">

                                                    <ItemTemplate>

                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="关联合同">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <table align="center" cellpadding="0" cellspacing="0" width="98%">

                                            <tr>

                                                <td align="left">

                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
                                            </tr>

                                            <tr>

                                                <td>

                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                        <tr>

                                                            <td width="7">

                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                            <td>

                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                    <tr>

                                                                        <td width="7%" align="center"><strong>

                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="17%" align="center"><strong>

                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,HeTongMingChen%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="5%" align="center"><strong>

                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="5%" align="center"><strong>

                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="8%" align="center"><strong>

                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="7%" align="center"><strong>

                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="5%" align="center"><strong>

                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="10%" align="center"><strong>

                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label>
                                                                        </strong></td>

                                                                        <td width="10%" align="center"><strong>

                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label>
                                                                        </strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td width="6" align="right">

                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>

                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                        Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                        <Columns>

                                                            <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>

                                                            <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractView.aspx?ConstractCode={0}"
                                                                DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                            </asp:HyperLinkColumn>

                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>

                                                            <asp:TemplateColumn HeaderText="状态">

                                                                <ItemTemplate>

                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:TemplateColumn>

                                                            <asp:BoundColumn DataField="SignDate" HeaderText="签订日期" DataFormatString="{0:yyyy/MM/dd}">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Currency" HeaderText="币种">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>
                                                        </Columns>

                                                        <ItemStyle CssClass="itemStyle" />

                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                        <EditItemStyle BackColor="#2461BF" />

                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid><asp:Label ID="Label4" runat="server" Visible="False"></asp:Label><asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="9pt"
                                                        Visible="False" Width="57px"></asp:Label><asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="9pt"
                                                            Visible="False" Width="57px"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel5" runat="server" HeaderText=" 关联订单">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GuanLianDingDan%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <br />

                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">

                                            <tr>

                                                <td width="7">

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                        <tr>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="25%"><strong>

                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="15%"><strong>

                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ZongJingE%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="20%"><strong>

                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label>
                                                            </strong></td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td align="right" width="6">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">

                                            <Columns>

                                                <asp:BoundColumn DataField="POID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTAssetPurchaseOrderView.aspx?POID={0}"
                                                    DataTextField="POName" HeaderText="名称" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Amount" HeaderText="总金额">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="PurManName" HeaderText="采购员" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:HyperLinkColumn>

                                                <asp:TemplateColumn HeaderText="状态">

                                                    <ItemTemplate>

                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel6" runat="server" HeaderText="关联物料">

                                    <HeaderTemplate>

                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,GuanLianLiaoPin%>"></asp:Label>
                                    </HeaderTemplate>

                                    <ContentTemplate>

                                        <asp:Label ID="LB_GoodsOwner" runat="server" Font-Bold="True" Width="100%"></asp:Label>

                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">

                                            <tr>

                                                <td width="7">

                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>

                                                <td>

                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                        <tr>

                                                            <td align="center" width="8%"><strong>

                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>

                                                            <td align="center" width="20%"><strong>

                                                                <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                            <td align="center" width="15%"><strong>

                                                                <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>

                                                            <td align="center" width="13%"><strong>

                                                                <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>

                                                            <td align="center" width="8%"><strong>

                                                                <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>

                                                            <td align="center" width="10%"><strong>

                                                                <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td align="right" width="6">

                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">

                                            <Columns>

                                                <asp:BoundColumn DataField="ID" HeaderText="ID">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Price" HeaderText="单价">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                            </cc2:TabContainer>
                        </td>
                    </tr>
                </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
