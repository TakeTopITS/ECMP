<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsPurchaseReport.aspx.cs"
    Inherits="TTGoodsPurchaseReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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


        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
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
                    <table cellpadding="0" cellspacing="0" width="1480px">
                        <tr>

                            <td style="width: 100%;" align="center">
                                <table style="width: 980px;">
                                    <tr>
                                        <td style="text-align: right;" width="6%">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：</td>
                                        <td align="left" width="25%">
                                            <asp:TextBox ID="TB_SupplierName" runat="server" Width="99%"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left;" colspan="3">
                                            <asp:DropDownList ID="DL_VendorList" runat="server" AutoPostBack="True" DataTextField="VendorName" DataValueField="VendorCode" OnSelectedIndexChanged="DL_VendorList_SelectedIndexChanged"></asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td width="6%" style="text-align: right;">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa%>"></asp:Label>：</td>
                                        <td align="left" width="25%">
                                            <asp:TextBox ID="TB_GoodsCode" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;" width="15%">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label>：</td>
                                        <td align="left" width="20%">
                                            <asp:TextBox ID="TB_GoodsName" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td width="5%" align="right">&nbsp;</td>

                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                        <td align="left" width="25%">
                                            <asp:TextBox ID="TB_ModelNumber" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;" width="15%">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：</td>
                                        <td align="left" colspan="2">
                                            <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td width="10%" style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td><a href="javascript:window.print()">&nbsp;</a></td>

                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                        <td align="left">
                                            <asp:TextBox ID="TB_Applicant" runat="server" Width="100px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;"></td>
                                        <td align="left">

                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            &nbsp;<asp:Button ID="BT_Export" runat="server" CssClass="inpu" OnClick="BT_Export_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                        </td>
                                        <td align="left">&nbsp;
                                                    <a href="#" onclick="preview1()">
                                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                    </a>
                                        </td>


                                    </tr>
                                </table>
                                <hr />
                                <!--startprint1-->
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinCaiGouBaoBiao%>"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: Left;" colspan="4">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                            &nbsp;
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                        </td>
                                        <td align="center">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                            <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td align="center" width="10%">
                                                                    <strong>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="8%">
                                                                    <strong>
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GongYingShang %>"></asp:Label>
                                                                    </strong>
                                                                </td>
                                                                <td align="center" width="6%">
                                                                    <strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="14%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                </td>

                                                                <td align="center" width="5%">
                                                                    <strong>
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                </td>



                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                ShowHeader="false" Height="1px"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="GPOName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="Supplier" HeaderText="供应商">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:HyperLinkColumn>



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
                                <!--endprint1-->

                            </td>
                        </tr>
                    </table>
                         </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_Export" />
                </Triggers>
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
