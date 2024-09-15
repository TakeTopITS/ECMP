<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAssetPurchaseReport.aspx.cs"
    Inherits="TTAssetPurchaseReport" %>

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

                    <table style="width: 980px;">
                        <tr>
                            <td width="12%" style="text-align: right;">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZiChanDaiMa%>"></asp:Label>：</td>
                            <td align="left" width="25%">
                                <asp:TextBox ID="TB_AssetCode" runat="server" Width="190px"></asp:TextBox>
                            </td>
                            <td style="text-align: right;" width="15%">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZiChanMingCheng%>"></asp:Label>：</td>
                            <td align="left" width="20%">
                                <asp:TextBox ID="TB_AssetName" runat="server" Width="190px"></asp:TextBox>
                            </td>
                            <td width="5%" align="right">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="text-align: right;" width="12%">
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
                            <td width="10%" style="text-align: right;">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                            </td>
                            <td>
                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td width="10%" style="text-align: right;">
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                            </td>
                            <td>
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
                            </td>
                            <td style="text-align: center;"><a href="#" onclick="preview1()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                            </a>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <!--startprint1-->
                    <table cellpadding="0" cellspacing="0" width="98%">
                        <tr>
                            <td>


                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZiChanCaiGouBaoBiao%>"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Left;" colspan="4">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                            &nbsp;
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>

                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        </td>

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
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GongYingShangDianHua%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong>
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
                                                ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowCustomPaging="True" AllowPaging="True" PageSize="25">
                                                <Columns>
                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="AssetCode" HeaderText="代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="AssetName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="Supplier" HeaderText="供应商">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SupplierPhone" HeaderText="供应商电话">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PurTime" HeaderText="购买时间" DataFormatString="{0:yyyy/MM/dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="RelatedType" HeaderText="来源">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="RelatedID" HeaderText="相关">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>
                                                </Columns>

                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Center;">
                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                            <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>
                    <!--endprint1-->
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
