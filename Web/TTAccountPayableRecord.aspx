<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountPayableRecord.aspx.cs" Inherits="TTAccountPayableRecord" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FuKuan%>"></asp:Label>
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
                                            <td style="padding-top: 5px">
                                                <table width="99%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" style="padding-right: 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px;" align="left">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                </td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>

                                                                                            <td align="center" width="6%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_BianHao" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="7%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_ShiFuJinE" runat="server" Text="<%$ Resources:lang,ShiFuJinE%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_ShiFuRiQi" runat="server" Text="<%$ Resources:lang,ShiFuRiQi%>"></asp:Label></strong>
                                                                                            </td>


                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_ShouKuanFangShi" runat="server" Text="<%$ Resources:lang,ShouKuanFangShi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_BiBie" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_YinHang" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="7%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_KaiPiaoJinE" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_ShouKuanRen" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_DengJi" runat="server" Text="<%$ Resources:lang,DengJi%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="15%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="LB_BeiZhu" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="true" AutoGenerateColumns="False" CellPadding="4" PageSize="7"
                                                                            ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                            ShowHeader="False" Width="100%">

                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OutOfPocketAccount" HeaderText="实收金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OutOfPocketTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="实收日期">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>


                                                                                <asp:BoundColumn DataField="ReAndPayType" HeaderText="收款方式">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Bank" HeaderText="银行">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Receiver" HeaderText="收款方">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                    DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="15%" />
                                                                                </asp:BoundColumn>

                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="padding-right: 80px;">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YingFuZongE%>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>&#160;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiFuZongE%>"></asp:Label>：<asp:Label
                                                                            ID="LB_OutOfPocketAmount" runat="server"></asp:Label>
                                                                        &#160;<asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DaiFuZongE%>"></asp:Label>：<asp:Label ID="LB_UNOutOfPocketAmount" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>

                                    <td class="formItemBgStyle" align="right" style="width: 8%;">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuKuanFangShi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" align="left" style="width: 15%;">

                                        <asp:DropDownList ID="DL_ReAndPayType" runat="server" DataTextField="Type" DataValueField="Type">
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" align="right" style="width: 8%;">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left" style="width: 15%;">
                                        <asp:DropDownList ID="DL_Currency" runat="server" DataTextField="Type" DataValueField="Type"
                                            Height="25px" Width="100px">
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" align="right" style="width: 8%;">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left">
                                        <NickLee:NumberBox ID="NB_ExchangeRate" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px" Amount="1">1.0001.000</NickLee:NumberBox>
                                        <asp:Label ID="LB_PayableRecordID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShiFuJinE%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_OutOfPocketAccount" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiFuRiQi%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" class="formItemBgStyle">

                                        <asp:TextBox ID="DLC_OutOfPocketTime" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                            runat="server" TargetControlID="DLC_OutOfPocketTime" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PayableInvoiceAccount" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label>：</td>
                                    <td colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Bank" runat="server" Width="50%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Bank" runat="server" DataTextField="BankName" DataValueField="BankName" OnSelectedIndexChanged="DL_Bank_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Receiver" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DengJiRenYuan%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PayableOperatorCode" runat="server" Enabled="False" Width="55px"></asp:TextBox>
                                        <asp:Label ID="LB_PayableOperatorName" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" colspan="5">
                                        <asp:TextBox ID="TB_ReceiveComment" runat="server"
                                            Width="80%"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>


                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>


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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
