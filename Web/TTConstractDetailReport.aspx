<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractDetailReport.aspx.cs" Inherits="TTConstractDetailReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #topNav {
            /*background-color:#096;*/
            z-index: 999;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }

        #bottomNav {
            /*background-color:#096;*/
            z-index: -2;
            position: relative;
            top: 250px;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

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
                        <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 1000px;">
                            <tr>
                                <td colspan="5" align="center" style="height: 80px; font-size: xx-large;" class="formItemBgStyle">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongLiRunBaoBiao%>"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="TB_ConstractCode" runat="server" Width="139px"></asp:TextBox>
                                </td>
                                <td class="formItemBgStyle" align="right">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：</td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="TB_ConstractName" runat="server" Width="50%"></asp:TextBox>
                                </td>
                                <td class="formItemBgStyle" align="right">&nbsp;</td>


                            </tr>
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenBaoKaiShiShiJian%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                    </ajaxToolkit:CalendarExtender>

                                </td>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenBaoJieShuShiJian%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">

                                    <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                    </ajaxToolkit:CalendarExtender>

                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />&nbsp;
                                    <a href="javascript:window.print()">
                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table width="1400px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HTJEKPZJE%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DHJEWB%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuoWaiJinHuoChengBen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GuoNeiJinHuoChengBen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JinKouGuanShui%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JinKouZengZhiShui%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,QiTaFeiYongZongE%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="4%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YinHangShouXuFei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="4%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,QiTaFuFei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YingJiaoZengZhiShui%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YingJiaoDiShui%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YinHuaShui%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FangHongFei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,HeTongLiRun%>"></asp:Label></strong>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                        <table width="1400px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        Height="1px" Width="1400px" ShowHeader="false"
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="序号">
                                                <ItemTemplate>
                                                   <%# Container.ItemIndex %>
                                                </ItemTemplate>
                                                <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" />
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateColumn>

                                            <asp:BoundColumn DataField="单位" HeaderText="单位">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="合同号" HeaderText="合同号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="开票金额" HeaderText="合同金额(开发票总金额)">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="订货金额" HeaderText="订货金额(外币)">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>


                                            <asp:BoundColumn DataField="国外进货成本" HeaderText="国外进货成本">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="国内进货成本" HeaderText="国内进货成本">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="进口关税" HeaderText="进口关税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="进口增值税" HeaderText="进口增值税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="其他费用总额" HeaderText="其他费用总额">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="银行手续费" HeaderText="银行手续费">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="其他付费" HeaderText="其他付费">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="应交增值税" HeaderText="应交增值税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                             <asp:BoundColumn DataField="应交地税" HeaderText="应交地税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                             <asp:BoundColumn DataField="印花税" HeaderText="印花税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                             <asp:BoundColumn DataField="防洪费" HeaderText="防洪费">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="合同利润" HeaderText="合同利润">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                        </table>

                        <table width="1400px" cellpadding="0" cellspacing="0" style="display:none;">
                            <tr>
                                <td style="width: 1000px; text-align: left;">
                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouRuZongE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                    &nbsp; <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GuanShuiZongE%>"></asp:Label>：<asp:Label ID="LB_TotalEntryTaxAmount" runat="server"></asp:Label>

                                    &nbsp; <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZengZhiShuiZongE%>"></asp:Label>：<asp:Label ID="LB_TotalAddedTaxAmount" runat="server"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server"
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server"
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
