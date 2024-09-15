<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractGoodsReceiptRecord.aspx.cs" Inherits="TTConstractGoodsReceiptRecord" %>


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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongShouHuoJiLu%>"></asp:Label>
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
                                                        <td>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="11" class="tdTopLine">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>

                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="23%"><strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="7%"><strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YiShouHuo%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="7%"><strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WeiShouHuo%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="7%"><strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TiQian%>"></asp:Label></strong> </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                            ShowHeader="False"
                                                                            Width="100%">

                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ReceiptedNumber" HeaderText="已收货">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UNReceiptedNumber" HeaderText="未收货 ">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PreDay" HeaderText="提前">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractID" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px;" align="left">
                                                            <table width="90%">
                                                                <tr>
                                                                    <td align="right" style="padding-right: 5px;">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>

                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="23%"><strong>
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>

                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                            ShowHeader="False"
                                                                            Width="100%">

                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>


                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YingShouZongShu%>"></asp:Label>：<asp:Label ID="LB_ReceivablesNumber" runat="server"></asp:Label>&#160;<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiShouZongShu%>"></asp:Label>：<asp:Label
                                                                            ID="LB_ReceiverNubmer" runat="server"></asp:Label>
                                                                        &#160;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DaiShouZongShu%>"></asp:Label>：<asp:Label ID="LB_UNReceiverNumber" runat="server"></asp:Label>
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
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="98%">
                                <tr>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left; width: 100px;">
                                        <asp:TextBox ID="TB_ReceiptGoodsCode" runat="server" Height="20px" Enabled="false" Width="95%"></asp:TextBox></td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_ReceiptGoodsName" runat="server" Height="20px" Enabled="false" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="LB_ReceiptGoodsType" runat="server"></asp:Label>
                                        <td class="formItemBgStyle" style="text-align: right">
                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                            <asp:TextBox ID="TB_ReceiptGoodsModelNumber" runat="server" Enabled="false" Height="20px" Width="99%"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>： </td>
                                    <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceiptGoodsSpec" runat="server" Height="20px" Enabled="false" Width="100%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceiptGoodsNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="53px">0.00</NickLee:NumberBox></td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceiptGoodsPrice" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="85px">0.00</NickLee:NumberBox></td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="LB_ReceiptGoodsUnit" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShouHuoShiJian%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="DLC_ReceiptGoodsTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_ReceiptGoodsTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                        <asp:TextBox ID="TB_ReceiptAddress" runat="server" Height="20px" Width="70%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_WareHouse" runat="server" DataTextField="WHName" DataValueField="WHName"
                                            Height="25px" Width="108px" AutoPostBack="True" OnSelectedIndexChanged="DL_WareHouse_SelectedIndexChanged">
                                        </asp:DropDownList>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
