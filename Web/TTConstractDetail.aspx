<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractDetail.aspx.cs" Inherits="TTConstractDetail" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>


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

    <!--pageoffic.js一定要引用-->
   <%-- <script type="text/javascript" src="pageoffice.js"></script>--%>

    <script type="text/javascript" language="javascript">
        $(function () {
            //if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll(ListBox) {
            disPostion = ListBox.scrollTop;
        }

        function RestoreScroll(EndRequestHandler) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function GoodsListDivIDEndRequestHandler(sender, args) {
            GoodsListDivID.scrollTop = disPostion;
        }

        function displayWaitingImg() {

            this.document.getElementById('img_processing').style.display = 'block';
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
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td height="31" class="page_topbj">
                                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" width="50%">
                                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongZhiXingQingKuang%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="left" style="padding-top: 5px;">

                                                            <asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>

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
                                                            <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                Width="100%">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="12%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongE%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table cellpadding="4" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center;" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                                                                            </td>
                                                                            <td style="width: 12%; text-align: left; padding-left: 5px" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ConstractName") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ConstractClass") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Amount") %>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Currency") %>
                                                                            </td>

                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Status") %>
                                                                            </td>
                                                                            <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PartA") %>
                                                                            </td>
                                                                            <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PartB") %>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem, "StartDate","{0:yyyy/MM/dd}") %>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="Label16" runat="server" Text="合同内容"></asp:Label>
                                                                            </td>
                                                                            <td colspan="12" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td style="padding-right: 20px;">
                                                                                            <div onclick="popShowByURL('TTConstractMainContentEdit.aspx?ConstractID=<%# ShareClass.URLEncode(Eval("ConstractID").ToString()) %>','ContractContent', 600, 500)">
                                                                                                 --><asp:Label ID="Label19011" Text="<%$ Resources:lang, BianJi%>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                       <%-- <td>
                                                                                            <div onclick="popShowByURL('<%# ShareClass.URLEncode(Eval("ConstractMainDocURL").ToString().Trim()) %>','Download', 600, 500)">
                                                                                                <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                                                                            </div>

                                                                                        </td>--%>
                                                                                       <%-- <td style="padding-left: 20px;">
                                                                                            <div id="divEdit" onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=<%# ShareClass.URLEncode(Eval("ConstractMainDocURL").ToString()) %>','fullscreen=yes;');">
                                                                                                <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>--%>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                            </td>
                                                                            <td colspan="12" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="11" class="tdTopLine"></td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractID" runat="server" Visible="False"></asp:Label>

                                                            <div style="display: none;">
                                                                <asp:Button ID="BT_RefreshContractInfor" Width="1px" runat="server" Text="<%$ Resources:lang,Refresh %>" CssClass="inpu" OnClick="BT_RefreshContractInfor_Click" />

                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px; text-align: right;">
                                                            <span style="font-size: 10pt">

                                                                <asp:Repeater ID="Repeater1" runat="server">
                                                                    <ItemTemplate>

                                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                            <b><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp; </b>
                                                                        </a>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px;" align="left">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                                Width="100%">
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText=" 收款进度">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShouKuanJiHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td align="left" width="60%">
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YingShouZongE %>"></asp:Label>：<asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>&#160;&#160;
                                                                                                 <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ShiShouZongE %>"></asp:Label>：<asp:Label
                                                                                                     ID="LB_ReceiverAmount" runat="server"></asp:Label>&#160;&#160;<asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DaiShouZongE %>"></asp:Label>：<asp:Label ID="LB_UNReceiverAmount" runat="server"></asp:Label></td>
                                                                                            <td align="left">
                                                                                                <asp:Button ID="BT_ConatractReciveRefresh" runat="server" Text="<%$ Resources:lang,Refresh %>" CssClass="inpu" OnClick="BT_ConatractReciveRefresh_Click" /></td>
                                                                                            <td align="right" style="padding-right: 5px;">
                                                                                                <asp:Button ID="BT_CreateReceivables" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateReceivables_Click" /></td>
                                                                                        </tr>
                                                                                    </table>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label355" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label356" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShiShouJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,WeiShouJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FuKuanFang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                        ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                                        ShowHeader="False" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTConstractReceivablesRecord.aspx?ReceivablesID=<%# Eval("ID").ToString() %>'>
                                                                                                        <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,ShouKuan%>"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Account" HeaderText="收费科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceivablesAccount" HeaderText="应收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceivablesTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应收日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiverAccount" HeaderText="实收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNReceiveAmount" HeaderText="未收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PreDays" HeaderText="提前">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate></ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="RelatedType" HeaderText="相关">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="RelatedID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="付款进度">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label267" runat="server" Text="<%$ Resources:lang,FuKuanJiHua %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td align="left" width="60%">
                                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,YingFuZongE %>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ShiFuZongE %>"></asp:Label>：<asp:Label
                                                                                                    ID="LB_PayAmount" runat="server"></asp:Label>&nbsp;&nbsp;
                                                                                                 <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,DaiFuZongE %>"></asp:Label>：<asp:Label ID="LB_UNPayAmount"
                                                                                                     runat="server"></asp:Label></td>
                                                                                            <td align="left">
                                                                                                <asp:Button ID="BT_ConstractPayRefresh" runat="server" Text="<%$ Resources:lang,Refresh %>" CssClass="inpu" OnClick="BT_ConstractPayRefresh_Click" /></td>
                                                                                            <td align="right" style="padding-right: 5px;">
                                                                                                <asp:Button ID="BT_CreatePayable" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreatePayable_Click" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label357" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label358" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="13%"><strong>
                                                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,FuKuanKeMu %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YingFuJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,YingFuRiQi %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,ShiFuJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,WeiFuJinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,ShouKuanFang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                                        OnItemCommand="DataGrid2_ItemCommand" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                        Height="1px" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTConstractPayableRecord.aspx?PayableID=<%# Eval("ID").ToString() %>'>
                                                                                                        <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,FuKuan%>"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <%--  <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTConstractPayableRecord.aspx?PayableID={0}"
                                                                                                Text="付款" HeaderText="付款记录" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:HyperLinkColumn>--%>
                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Account" HeaderText="付款科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableAccount" HeaderText="应付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应付日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="OutOfPocketAccount" HeaderText="实付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNPayAmount" HeaderText="未付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Receiver" HeaderText="收款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PreDays" HeaderText="提前">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate></ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="RelatedType" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="RelatedID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel14" runat="server" HeaderText="开票情况">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,KaiPiaoQingKuang%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_OpenInvoice" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_OpenInvoice_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label359" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label360" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ShuiPiaoLeiXing %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ShuiLv %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                        ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid12_ItemCommand"
                                                                                        ShowHeader="False" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiveOpen" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TaxType" HeaderText="税票">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceCode" HeaderText="发票号码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TaxRate" HeaderText="税率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="OpenDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开票日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 280px;">
                                                                                    <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,KaiPiaoZongE %>"></asp:Label>：<asp:Label ID="LB_TotalOpenInvoiceAmount" runat="server" /><asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,ShouPiaoZongE %>"></asp:Label>：<asp:Label ID="LB_TotalReceiveInvoiceAmount" runat="server" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel7" runat="server" HeaderText="工程量清单">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label176" runat="server" Text="<%$ Resources:lang,GongChunLiangQinDan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table align="center" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" style="padding-right: 5px;">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <asp:Label ID="Label334" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>:
                                                                                                 <asp:Label ID="LB_ConstractItemAmount" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Button ID="BT_CreateGoodsList" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateGoodsList_Click" />

                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>

                                                                                    <div id="GoodsListDivID" style="width: 100%; height: 600px; overflow: auto;">
                                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                            width="100%">
                                                                                            <tr>
                                                                                                <td width="7">
                                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                                <td>
                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                        <tr>
                                                                                                            <td width="4%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label361" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                            </td>
                                                                                                            <td width="4%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label362" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                            </td>

                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label323" runat="server" Text="一级目录"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label325" runat="server" Text="二级目录"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label328" runat="server" Text="三级目录"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label329" runat="server" Text="四级目录"></asp:Label></strong></td>
                                                                                                            <td align="center" width="8%"><strong>
                                                                                                                <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="8%"><strong>
                                                                                                                <asp:Label ID="Label178" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                            <td width="4%" align="center"><strong>
                                                                                                                <asp:Label ID="Label333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                                            <td width="4%" align="center"><strong>
                                                                                                                <asp:Label ID="Label270" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                            <td width="13%" align="center"><strong>
                                                                                                                <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                                            <td width="4%" align="center"><strong>
                                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="4%"><strong>
                                                                                                                <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="8%"><strong>
                                                                                                                <asp:Label ID="Label330" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label></strong></td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td align="right" width="6">
                                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        <asp:DataGrid ID="DataGrid11" runat="server" AutoGenerateColumns="False"
                                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid11_ItemCommand"
                                                                                            ShowHeader="False"
                                                                                            Width="100%">
                                                                                            <Columns>
                                                                                                <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:ButtonColumn>
                                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:TemplateColumn>
                                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="FirstDirectory" HeaderText="一级目录">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="SecondDirectory" HeaderText="二级目录">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="ThirdDirectory" HeaderText="三级目录">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="FourthDirectory" HeaderText="四级目录">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:TemplateColumn HeaderText="物料类型">
                                                                                                    <ItemTemplate>
                                                                                                        <%# ShareClass.GetItemType(Eval("GoodsCode").ToString()) %>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:TemplateColumn>
                                                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:BoundColumn DataField="Comment" HeaderText="备注 ">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                                </asp:BoundColumn>
                                                                                            </Columns>
                                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                            <ItemStyle CssClass="itemStyle" />
                                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        </asp:DataGrid>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                                                                    <ContentTemplate>
                                                                                                        <div>
                                                                                                            <Upload:InputFile ID="FileUpload_Training" runat="server" Width="200px" />
                                                                                                            &nbsp;<asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClientClick="javascript:displayWaitingImg();" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                                                            <img id="img_processing" src="Images/Processing.gif" alt="Loading,please wait..." style="display: none;" />

                                                                                                            <asp:Label ID="Label284" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/物料定义和项目或合同关联物料数据导入表.xls"><asp:Label ID="Label297" runat="server" Text="合同物料清单导入模板"></asp:Label></a><div id="ProgressBar">
                                                                                                                <Upload:ProgressBar ID="ProgressBar3" runat="server" Height="100px" Width="500px"></Upload:ProgressBar>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                                <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label></td>
                                                                                            <td align="center">
                                                                                                <asp:Button ID="BT_DeleteAllProjectItem" runat="server" CssClass="inpuLong" OnClick="BT_DeleteAllProjectItem_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="删除全部" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel8" runat="server" HeaderText="设备租赁">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,SheBeiZhuLing %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table align="center" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="LB_ReceiptConstractCode" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateDeliveryPlan" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDeliveryPlan_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label363" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label364" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,YiChuZhu %>"></asp:Label></strong></td>
                                                                                                        <td align="center"><strong>
                                                                                                            <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,MoChuZhu %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid7_ItemCommand"
                                                                                        ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsShipmentOrderFromOther.aspx?RelatedType=Constract&RelatedID={0}"
                                                                                                Text="<%$ Resources:lang,ChuZhu %>" HeaderText="发货记录" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="DeliveredNumber" HeaderText="已收货">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNDeliveredNumber" HeaderText="未收货 ">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="租赁收回">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,ZhuLingShouHui %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table align="center" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateReceivePlan" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateReceivePlan_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label365" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label366" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label268" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label269" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label149" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,YiShouHuo %>"></asp:Label></strong></td>
                                                                                                        <td align="center"><strong>
                                                                                                            <asp:Label ID="Label160" runat="server" Text="<%$ Resources:lang,WeiShouHuo %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid4_ItemCommand"
                                                                                        ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTMakeGoodsFromOther.aspx?RelatedType=Constract&RelatedID={0}"
                                                                                                Text="<%$ Resources:lang,ShouHui %>" HeaderText="收货记录" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiptedNumber" HeaderText="已收货">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNReceiptedNumber" HeaderText="未收货 ">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
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
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel19" runat="server" HeaderText="补充协议">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label227" runat="server" Text="<%$ Resources:lang,BuConXieYi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>

                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label335" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label336" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="40%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label337" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label338" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label339" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label340" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid19" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            Width="100%" AllowPaging="True"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>

                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                                                                            <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>

                                                                <cc2:TabPanel ID="TabPanel20" runat="server" HeaderText="合同依据">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label341" runat="server" Text="<%$ Resources:lang,HeTongYiJi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="90%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>

                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label343" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="40%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label344" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label346" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="16%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label347" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false" OnItemCommand="DataGrid20_ItemCommand"
                                                                                        Width="100%" AllowPaging="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="DocID" HeaderText="DocID" Visible="false">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <a href=""></a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                                DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                            </asp:HyperLinkColumn>


                                                                                            <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                    </asp:DataGrid>

                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                                        <ContentTemplate>
                                                                                            <div>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="TB_ContractBasisDocumentType" runat="server"></asp:TextBox>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:HyperLink ID="HL_ContractBasisDocumentURL" runat="server"></asp:HyperLink>
                                                                                                            <Upload:InputFile ID="AttachFile" runat="server" Width="300px" />
                                                                                                            <br />
                                                                                                            <div id="ProgressBar11">
                                                                                                                <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                                
                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                                </Upload:ProgressBar>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Button ID="BT_UPLoad_ContractBasisDocument" runat="server" CssClass="inpu" OnClick="BT_UPLoad_ContractBasisDocument_Click" Text="<%$ Resources:lang,ShangChuan%>" />

                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:PostBackTrigger ControlID="BT_UPLoad_ContractBasisDocument" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel21" runat="server" HeaderText="项目其他信息">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label348" runat="server" Text="<%$ Resources:lang,XiangMuQiTaXinXi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>

                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label349" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label350" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="40%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label351" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label352" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label353" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label354" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid21" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            Width="100%" AllowPaging="True"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <%--  <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>--%>
                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <%--    <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                                                                            <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                                </asp:TemplateColumn>--%>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>

                                                                <cc2:TabPanel ID="TabPanel13" runat="server" HeaderText="报关数据">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label214" runat="server" Text="<%$ Resources:lang,BaoGuanShuJu%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table style="width: 100%; text-align: left;">
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateEntryOrder" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateEntryOrder_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label367" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label368" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label216" runat="server" Text="<%$ Resources:lang,BaoGuanDanHao %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label217" runat="server" Text="<%$ Resources:lang,YuShenBaoHao %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label218" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label219" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label220" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label221" runat="server" Text="<%$ Resources:lang,HuiLv %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,GuanShui %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label223" runat="server" Text="<%$ Resources:lang,ZengZhiShui %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label224" runat="server" Text="<%$ Resources:lang,KouAn %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label225" runat="server" Text="<%$ Resources:lang,JinKouRiQi %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label226" runat="server" Text="<%$ Resources:lang,ShenBaoRiQi %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        OnItemCommand="DataGrid10_ItemCommand" ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryCode" HeaderText="单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PreEntryCode" HeaderText="预申报编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryTax" HeaderText="关税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="AddedValueTax" HeaderText="增值税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Customs" HeaderText="口岸">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ImportDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="进口日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReportDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="申报日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel15" runat="server" HeaderText="报关对内数据">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label238" runat="server" Text="<%$ Resources:lang,BaoGuanDuiNeiShuJu%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table style="width: 100%; text-align: left;">
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateEntryInner" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateEntryInner_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label369" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label370" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label239" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label241" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label242" runat="server" Text="<%$ Resources:lang,HuiLv %>"></asp:Label></strong></td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,GuanShui %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,ZengZhiShui %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid15" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        OnItemCommand="DataGrid15_ItemCommand" ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryTax" HeaderText="关税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="AddedValueTax" HeaderText="增值税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="业务人员">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label251" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table style="width: 100%; text-align: left;">
                                                                            <tr>
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateSales" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateSales_Click" /></td>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label371" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label372" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label252" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label253" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label254" runat="server" Text="<%$ Resources:lang,ZhiZe %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label255" runat="server" Text="<%$ Resources:lang,YongJin %>"></asp:Label></strong></td>
                                                                                                        <td width="20%" align="center"><strong>
                                                                                                            <asp:Label ID="Label256" runat="server" Text="<%$ Resources:lang,FaFangShiJian %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label257" runat="server" Text="<%$ Resources:lang,FaFangZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label258" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="SalesName" HeaderText="业务员">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Commission" HeaderText="佣金">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GiveTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate></ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>

                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                            </cc2:TabContainer>
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

                    <div class="layui-layer layui-layer-iframe" id="popReceivablesWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td class="formItemBgStyle" align="right" style="width: 10%;">
                                        <asp:Label ID="LB_ReceivablesID" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="Label309" runat="server" Text="<%$ Resources:lang,JiMi %>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" align="left" width="40%">
                                        <asp:DropDownList ID="DL_IsSecrecyReceiver" runat="server">
                                            <asp:ListItem Value="NO" />
                                            <asp:ListItem Value="YES" />
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DengJiRenYuan %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:Label ID="LB_ReceivablesOperatorCode" runat="server"></asp:Label><asp:Label ID="LB_ReceivablesOperatorName" runat="server"></asp:Label></td>

                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_ReceivablesBillCode" runat="server" Width="99%"></asp:TextBox></td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_ReceiveAccount" runat="server" Width="135px"></asp:TextBox><asp:DropDownList ID="DL_ReceiveAccount" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" Height="25px" OnSelectedIndexChanged="DL_ReceiveAccount_SelectedIndexChanged">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceivablesAccount" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="2">0.000</NickLee:NumberBox>
                                        <asp:Label ID="LB_ReceivablesAccountCurre" runat="server" Text="<%$ Resources:lang,Yuan %>"></asp:Label>

                                        <asp:Label ID="Label342" runat="server" Text="<%$ Resources:lang,ShuiLv %>"></asp:Label>
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceivaleTaxRate" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="2">0.000</NickLee:NumberBox>
                                        <asp:DropDownList ID="DL_ReceivaleTaxRate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ReceivaleTaxRate_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="0.13" Text="13%"></asp:ListItem>
                                            <asp:ListItem Value="0.09" Text="9%"></asp:ListItem>
                                            <asp:ListItem Value="0.06" Text="6%"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="DLC_ReceivablesTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                            runat="server" TargetControlID="DLC_ReceivablesTime" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                        <asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FuKuanFang %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_Payer" runat="server" Width="220px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Payer" runat="server" AutoPostBack="True" DataTextField="Payer" DataValueField="Payer" Height="25px" OnSelectedIndexChanged="DL_Payer_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LB_ReceivablesCurrency" runat="server"></asp:Label></td>
                                                <td style="width: 100px; text-align: right;">
                                                    <asp:Label ID="Label373" runat="server" Text="收支比例"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_ReceivablesIncomeRatio" runat="server">
                                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定预付款比例" Text="合同约定预付款比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定月进度支付比例" Text="合同约定月进度支付比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定竣工支付比例" Text="合同约定竣工支付比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定结算支付比例" Text="合同约定结算支付比例"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>




                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_ReceivablesPreDays" runat="server" MinAmount="1" OnBlur=""
                                            OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:DropDownList ID="DL_ReceivablesStatus" runat="server">
                                            <asp:ListItem Value="计划" />
                                            <asp:ListItem Value="完成" />
                                            <asp:ListItem Value="取消" />
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuanLian %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left" colspan="3">
                                        <asp:DropDownList ID="DL_ReceivablesRelatedType" runat="server" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem Value="Other" />
                                            <asp:ListItem Value="Project" />
                                            <asp:ListItem Value="GoodsSO" />
                                        </asp:DropDownList>&#160;ID:<NickLee:NumberBox ID="NB_ReceivablesRelatedID" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="50px">0</NickLee:NumberBox>&#160;<asp:DropDownList ID="DL_ReceiveRelatedProjectID" runat="server" DataTextField="ProjectID" Visible="False"
                                            DataValueField="ProjectID" OnSelectedIndexChanged="DL_ReceiveRelatedProjectID_SelectedIndexChanged" AutoPostBack="True" Width="80px">
                                        </asp:DropDownList><asp:DropDownList ID="DL_ReceiveRelatedGoodsSOID" runat="server" DataTextField="SOID" DataValueField="SOID" Visible="False"
                                            OnSelectedIndexChanged="DL_ReceiveRelatedGoodsSOID_SelectedIndexChanged" AutoPostBack="True" Width="80px">
                                        </asp:DropDownList>
                                        &#160;PlanID:<NickLee:NumberBox ID="NB_ReceivablesRelatedPlanID" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="50px">0</NickLee:NumberBox>
                                        <asp:Label ID="LB_ReceivablesPlanName" runat="server"></asp:Label>
                                        <asp:Button ID="BT_ReceivablesSelectPJPlan" runat="server" CssClass="inpu" OnClick="BT_ReceivablesSelectPJPlan_Click" Text="计划选择" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>： </td>
                                    <td colspan="3" class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_ReceiveComment" runat="server" Width="75%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_Receivables_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label272" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPayableWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title1">
                            <asp:Label ID="Label273111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td class="formItemBgStyle" align="right" style="width: 10%;">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiMi %>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" align="left" width="40%">
                                        <asp:DropDownList ID="DL_IsSecrecyPayable" runat="server">
                                            <asp:ListItem Value="NO" />
                                            <asp:ListItem Value="YES" />
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_PayableID" runat="server" Visible="false"></asp:Label>

                                    </td>
                                    <td align="right" style="width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,DengJiRenYuan %>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:Label ID="LB_PayableOperatorCode" runat="server"></asp:Label><asp:Label ID="LB_PayableOperatorName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_PayableBillCode" runat="server"></asp:TextBox></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,FuKuanKeMu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_PayAccount" runat="server" Width="135px"></asp:TextBox><asp:DropDownList ID="DL_PayAccount" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" Height="25px" OnSelectedIndexChanged="DL_Expense_SelectedIndexChanged">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,YingFuJinE %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PayableAccount" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="80px" Precision="2">0.000</NickLee:NumberBox>
                                        <asp:Label ID="Label161" runat="server" Text="<%$ Resources:lang,Yuan %>"></asp:Label>

                                        <asp:Label ID="Label345" runat="server" Text="<%$ Resources:lang,ShuiLv %>"></asp:Label>
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PayableTaxRate" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="2">0.000</NickLee:NumberBox>
                                        <asp:DropDownList ID="DL_PayableTaxRate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_PayableTaxRate_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="0.13" Text="13%"></asp:ListItem>
                                            <asp:ListItem Value="0.09" Text="9%"></asp:ListItem>
                                            <asp:ListItem Value="0.06" Text="6%"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,YingFuRiQi %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="DLC_PayableTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_PayableTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                        <asp:Label ID="lbl_AccountCode1" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShouKuanFang %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_Receiver" runat="server" Width="150px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Receiver" runat="server" AutoPostBack="True" DataTextField="Receiver" DataValueField="Receiver" Height="25px" OnSelectedIndexChanged="DL_Receiver_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left">

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LB_PayableCurrency" runat="server"></asp:Label></td>
                                                <td style="width: 100px; text-align: right;">
                                                    <asp:Label ID="Label375" runat="server" Text="收支比例"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_PayableIncomeRatio" runat="server">
                                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定预付款比例" Text="合同约定预付款比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定月进度支付比例" Text="合同约定月进度支付比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定竣工支付比例" Text="合同约定竣工支付比例"></asp:ListItem>
                                                        <asp:ListItem Value="合同约定结算支付比例" Text="合同约定结算支付比例"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <NickLee:NumberBox ID="NB_PayablePreDays" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:DropDownList ID="DL_PayableStatus" runat="server">
                                            <asp:ListItem Value="计划" />
                                            <asp:ListItem Value="完成" />
                                            <asp:ListItem Value="取消" />
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>：
                                    </td>
                                    <td colspan="3" class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_PayableComment" runat="server" Width="80%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,GuanLian %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" align="left" colspan="3">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DL_PayablesRelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_PayablesRelatedType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other" />
                                                        <asp:ListItem Value="Project" />
                                                        <asp:ListItem Value="GoodsPO" />
                                                        <asp:ListItem Value="AssetPO" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td>ID:
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_PayableRelatedID" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="50px">0</NickLee:NumberBox>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_PayableRelatedProjectID" runat="server" AutoPostBack="True" DataTextField="ProjectID" DataValueField="ProjectID" OnSelectedIndexChanged="DL_PayableRelatedProjectID_SelectedIndexChanged" Visible="False" Width="80px"></asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_PayableRelatedGoodsPurchaseID" runat="server" AutoPostBack="True" DataTextField="POID" DataValueField="POID" OnSelectedIndexChanged="DL_PayableRelatedGoodsPurchaseID_SelectedIndexChanged" Visible="False" Width="80px"></asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_PayableRelatedAssetPurchaseID" runat="server" AutoPostBack="True" DataTextField="POID" DataValueField="POID" OnSelectedIndexChanged="DL_PayableRelatedAssetPurchaseID_SelectedIndexChanged" Visible="False" Width="80px"></asp:DropDownList>

                                                </td>
                                                <td>PlanID:
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_PayableRelatedPlanID" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="50px">0</NickLee:NumberBox>
                                                    <asp:Label ID="LB_PayablePlanName" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_PayableSelectPJPlan" runat="server" CssClass="inpu" OnClick="BT_PayableSelectPJPlan_Click" Text="计划选择" />

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label311" runat="server" Text="预算科目"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" align="left" colspan="3">
                                        <table>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="LB_RelatedPJBudgetID" runat="server"></asp:Label>
                                                    <asp:Label ID="LB_RelatedPJBudgetAccountCode" runat="server"></asp:Label>
                                                    <asp:Label ID="LB_RelatedPJBudgetAccount" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_SelectPJBudget" runat="server" CssClass="inpu" Text="预算选择" OnClick="BT_SelectPJBudget_Click" />
                                                </td>

                                                <td align="left">
                                                    <asp:Label ID="Label322" runat="server" Text="合同签证"></asp:Label>：
                                                </td>
                                                <td colspan="5" align="left">
                                                    <asp:Repeater ID="RP_RelatedConstractPayableVisa" runat="server" OnItemCommand="RP_RelatedConstractPayableVisa_ItemCommand">
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Button ID="BT_VisaID" runat="server" Width="30px" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <a href='TTConstractPayableVisaView.aspx?VisaID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="_blank"><%# DataBinder.Eval(Container.DataItem,"VisaName") %> </a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_SelectPJConstractVisa" runat="server" CssClass="inpu" Text="关联签证" OnClick="BT_SelectPJConstractVisa_Click" />

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton2" runat="server" class="layui-layer-btn notTab" OnClick="BT_Payable_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label274" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popInvoiceWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title2">
                            <asp:Label ID="Label275" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td class="formItemBgStyle" align="right" style="width: 15%;">
                                        <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left" width="25%">
                                        <asp:DropDownList ID="DL_InvoiceReceiveOPen" runat="server">
                                            <asp:ListItem Value="OPEN" Text="<%$ Resources:lang,KaiPiao%>" />
                                            <asp:ListItem Value="RECEIVE" Text="<%$ Resources:lang,ShouPiao%>" />
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" align="right" style="width: 15%;">
                                        <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ShuiPiaoZhongLei%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:DropDownList ID="DL_TaxType" runat="server">
                                            <asp:ListItem Value="国税" Text="<%$ Resources:lang,GuoShui%>" />
                                            <asp:ListItem Value="地税" Text="<%$ Resources:lang,DiShui%>" />
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_InvoiceID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_InvoiceCode" runat="server" Width="99%"></asp:TextBox></td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_InvoiceAmount" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="2">0.000</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,ShuiLv%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_InvoiceTaxRate" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_OpenDate" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender8"
                                            runat="server" TargetControlID="DLC_OpenDate" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle"></td>
                                    <td class="formItemBgStyle" colspan="2"></td>
                                    <td class="formItemBgStyle">
                                        <asp:Label ID="LB_InvoiceSql" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer2" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton3" runat="server" class="layui-layer-btn notTab" OnClick="BT_Invoice_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label276" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popEntryOrderWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title3">
                            <asp:Label ID="Label277" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content3" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="70%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="text-align: Right;" width="15%" class="formItemBgStyle">
                                        <asp:Label ID="Label228" runat="server" Text="<%$ Resources:lang,KouAn %>"></asp:Label>：</td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Customs" runat="server" Width="220px"></asp:TextBox>
                                        <asp:Label ID="LB_EntryID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label229" runat="server" Text="<%$ Resources:lang,BaoGuanDanHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EntryCode" runat="server" Width="150px"></asp:TextBox></td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,YuLuRuBianHao %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_PreEntryCode" runat="server" Width="150px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label231" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_EntryName" runat="server" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,JinKouRiQi %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_EntryImportDate" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender9"
                                            runat="server" TargetControlID="DLC_EntryImportDate" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label233" runat="server" Text="<%$ Resources:lang,ShenBaoRiQi %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="DLC_EntryReportDate" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender10"
                                            runat="server" TargetControlID="DLC_EntryReportDate" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label234" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_EntryAmout" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                    </td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label235" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DL_EncryCurrency" runat="server" DataTextField="Type" DataValueField="Type"
                                                        Height="25px" Width="100px">
                                                    </asp:DropDownList></td>
                                                <td>
                                                    <asp:Label ID="Label266" runat="server" Text="<%$ Resources:lang,HuiLv %>"></asp:Label>：</td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_ExchangeRate" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="5" Width="80px" Amount="1">1.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label236" runat="server" Text="<%$ Resources:lang,GuanShui %>"></asp:Label>：<td class="formItemBgStyle">
                                            <NickLee:NumberBox ID="NB_EntryTax" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                        </td>
                                        <td style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label237" runat="server" Text="<%$ Resources:lang,ZengZhiShui %>"></asp:Label>： </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <NickLee:NumberBox ID="NB_AddedValueTax" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                        </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer3" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton4" runat="server" class="layui-layer-btn notTab" OnClick="BT_EntryOrder_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label278" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popEntryInnerWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title4">
                            <asp:Label ID="Label279" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content4" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr style="display: none;">
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label245" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" width="35%">
                                        <asp:Label ID="LB_EntryIDForInner" runat="server"></asp:Label></td>
                                    <td style="text-align: Right;" width="15%" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle" width="35%"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label246" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_EntryAmountForInner" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                    </td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label247" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DL_EntryCurrencyForInner" runat="server" DataTextField="Type" DataValueField="Type"
                                                        Height="25px" Width="100px">
                                                    </asp:DropDownList></td>
                                                <td>
                                                    <asp:Label ID="Label249" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label>：</td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_EntryExchangeRateForInner" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="5" Width="80px" Amount="1">1.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label248" runat="server" Text="<%$ Resources:lang,GuanShui%>"></asp:Label>：<td class="formItemBgStyle">
                                            <NickLee:NumberBox ID="NB_EntryTaxForInner" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                        </td>
                                        <td style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label250" runat="server" Text="<%$ Resources:lang,ZengZhiShui%>"></asp:Label>： </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <NickLee:NumberBox ID="NB_EntryAddedValueTaxForInner" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                        </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer4" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton5" runat="server" class="layui-layer-btn notTab" OnClick="BT_EntryInner_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label280" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popSalesWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title5">
                            <asp:Label ID="Label281" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content5" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="80%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr style="display: none;">
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label259" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" width="35%">
                                        <asp:Label ID="LB_SalesID" runat="server"></asp:Label></td>
                                    <td style="text-align: Right;" width="15%" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle" width="35%"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label260" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SalesName" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label261" runat="server" Text="<%$ Resources:lang,ZhiWei %>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SalesDuty" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label262" runat="server" Text="<%$ Resources:lang,YongJin %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Commission" runat="server" Width="80px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Precision="3">0.000</NickLee:NumberBox>
                                    </td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label264" runat="server" Text="<%$ Resources:lang,FaFangShiJian %>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_GiveTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5"
                                            runat="server" TargetControlID="DLC_GiveTime" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label263" runat="server" Text="<%$ Resources:lang,FaFangZhuangTai %>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_CommissionStatus" runat="server">
                                            <asp:ListItem Value="未发" />
                                            <asp:ListItem Value="已发" />
                                        </asp:DropDownList></td>
                                    <td style="text-align: Right;" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label265" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_SalesComment" runat="server" Width="80%"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer5" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton6" runat="server" class="layui-layer-btn notTab" OnClick="BT_Sales_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label282" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popGoodsListWindow"
                        style="z-index: 9999; width: 980px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title2223">
                            <asp:Label ID="Label19" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content100" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="70%">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                            <tr>
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,YiJiMuLu%>"></asp:Label>
                                                    ：</td>
                                                <td class="formItemBgStyle" colspan="2">
                                                    <asp:TextBox ID="TB_FirstDirectory" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,ErJiMuLu%>"></asp:Label>
                                                    ：</td>
                                                <td class="formItemBgStyle" colspan="2">
                                                    <asp:TextBox ID="TB_SecondDirectory" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="Label331" runat="server" Text="<%$ Resources:lang,SanJiMuLu%>"></asp:Label>
                                                    ：</td>
                                                <td class="formItemBgStyle" colspan="2">
                                                    <asp:TextBox ID="TB_ThirdDirectory" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="Label332" runat="server" Text="<%$ Resources:lang,SiJiMuLu1%>"></asp:Label>
                                                    ：</td>
                                                <td class="formItemBgStyle" colspan="2">
                                                    <asp:TextBox ID="TB_FourthDirectory" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="Label186" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>： 
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Height="20px" Width="95%"></asp:TextBox></td>
                                                <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                                    <asp:Label ID="Label187" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                                <td class="formItemBgStyle" style="text-align: right; width: 10%;">
                                                    <asp:Label ID="Label188" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type"
                                                        DataValueField="Type">
                                                    </asp:DropDownList>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>： </td>
                                                <td style="text-align: right;" colspan="5" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="70px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong %>" OnClick="BT_Clear_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                    <asp:TextBox ID="TB_Brand" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label191" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,ChengDanShiJian %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_SaleTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_SaleTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,SongHuoShiJian %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left" colspan="2">
                                                    <asp:TextBox ID="DLC_DeleveryTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender6" runat="server" TargetControlID="DLC_DeleveryTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle"></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="TB_SaleOrderNumber" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                    <NickLee:NumberBox ID="TB_PurchaseOrderNubmer" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0"
                                            Width="100%">
                                            <cc2:TabPanel ID="TabPanel9" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label518" runat="server" Text="<%$ Resources:lang,LPKCLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label198" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeShangPin %>"></asp:Label>：
                                                     <div id="Div4" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label200" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label201" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                             <td width="19%" align="center"><strong>
                                                                                 <asp:Label ID="Label202" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label203" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label204" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label205" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label207" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid13" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid13_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                     DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel10" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label519" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label208" runat="server" Text="<%$ Resources:lang,QingXuanQuShangPin%>"></asp:Label>：
                                                     <div id="Div5" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="15%" align="center"><strong>
                                                                                 <asp:Label ID="Label209" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong></td>
                                                                             <td width="20%" align="center"><strong>
                                                                                 <asp:Label ID="Label210" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label211" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong></td>
                                                                             <td width="35%" align="center"><strong>
                                                                                 <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong></td>
                                                                             <td width="20%" align="center"><strong>
                                                                                 <asp:Label ID="Label213" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid14" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid14_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}"
                                                                     DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="PurchasePrice" HeaderText="采购单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                        </cc2:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton7" runat="server" class="layui-layer-btn notTab" OnClick="BT_SaveGoods_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDeliveryPlanWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title5sdsd">
                            <asp:Label ID="Label96" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content5sds" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="60%">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                                    <asp:Label ID="LB_DeliveryPlanID" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                    ： 
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 20%;">
                                                    <asp:TextBox ID="TB_DeliveryGoodsCode" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                                <td class="formItemBgStyle" width="15%" style="text-align: right">
                                                    <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_DeliveryGoodsName" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_DeliveryGoodsType" runat="server" DataTextField="Type"
                                                        DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:TextBox ID="TB_DeliveryGoodsModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>： </td>
                                                <td style="text-align: right;" colspan="5" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_DeliveryGoodsSpec" runat="server" Height="70px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindDeliveryGoods" runat="server" CssClass="inpu" OnClick="BT_FindDeliveryGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    <asp:Button ID="BT_ClearDeliveryGoods" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong %>" OnClick="BT_ClearDeliveryGoods_Click" /></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>： </td>
                                                <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_DeliveryGoodsBrand" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DeliveryGoodsNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DeliveryGoodsPrice" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_DeliveryGoodsUnitName" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,SongHuoDiZhi %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                    <asp:TextBox ID="TB_DeliveryAddress" runat="server" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,FaHuoShiJian %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_DeliveryGoodsTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender7" runat="server" TargetControlID="DLC_DeliveryGoodsTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>：</td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DeliveryGoodsPreDay" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="53px" Precision="0">0</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>：</td>
                                                <td colspan="5" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_DeliveryStatus" runat="server">
                                                        <asp:ListItem Value="计划" />
                                                        <asp:ListItem Value="完成" />
                                                        <asp:ListItem Value="取消" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer4" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc2:TabPanel ID="TabPanel17" runat="server" HeaderText="<%$ Resources:lang,HeTongLiaoPingQingDan %>" TabIndex="11">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label296" runat="server" Text="<%$ Resources:lang,HeTongLiaoPingQingDan %>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div id="Div31" style="width: 100%; height: 400px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                            width="250%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label298" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label299" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label300" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td width="7%" align="center"><strong>
                                                                                <asp:Label ID="Label301" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label302" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label185" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label303" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label304" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label305" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label306" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label307" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label308" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid24" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid24_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="250%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Width="40px" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SaleOrderNumber" HeaderText="在单量（销售单）">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseOrderNumber" HeaderText="在订单 ">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel11" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label512" runat="server" Text="<%$ Resources:lang,LPKCLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeShangPin %>"></asp:Label>：
                                                     <div id="Div32" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                             <td width="19%" align="center"><strong>
                                                                                 <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid5_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                     DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel12" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,QingXuanQuShangPin%>"></asp:Label>：
                                                     <div id="Div6" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="15%" align="center"><strong>
                                                                                 <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong></td>
                                                                             <td width="20%" align="center"><strong>
                                                                                 <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                             <td width="15%" align="center"><strong>
                                                                                 <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                             <td width="30%" align="center"><strong>
                                                                                 <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid8_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}"
                                                                     DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="PurchasePrice" HeaderText="采购单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                        </cc2:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer23235" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton8" runat="server" class="layui-layer-btn notTab" OnClick="BT_DeliverGoodsPlan_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popReceivePlanWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title5sdssdd">
                            <asp:Label ID="Label175" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content5sdsfs" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table align="center" width="100%">
                                <tr>
                                    <td width="60%">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="LB_ReceiptPlanID" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="Label168" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                    ： 
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 100px;">
                                                    <asp:TextBox ID="TB_ReceiptGoodsCode" runat="server" Height="20px" Width="95%"></asp:TextBox></td>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label169" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                <td colspan="3" class="formItemBgStyle" style="width: 15%; text-align: left">
                                                    <asp:TextBox ID="TB_ReceiptGoodsName" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:DropDownList ID="DL_ReceiptGoodsType" runat="server" DataTextField="Type"
                                            DataValueField="Type">
                                        </asp:DropDownList>
                                        <td class="formItemBgStyle" style="text-align: right">
                                            <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：</td>
                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                            <asp:TextBox ID="TB_ReceiptGoodsModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label163" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>： </td>
                                    <td style="text-align: right;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceiptGoodsSpec" runat="server" Height="70px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                        <asp:Button ID="BT_FindReceiptGoods" runat="server" CssClass="inpu" OnClick="BT_FindReceiptGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                        <asp:Button ID="BT_ClearReceiptGoods" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong %>" OnClick="BT_ClearReceiptGoods_Click" /></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>： </td>
                                    <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceiptGoodsBrand" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label166" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceiptGoodsNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceiptGoodsPrice" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label170" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:DropDownList ID="DL_ReceiptGoodsUnitName" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                            Width="64px">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                        <asp:TextBox ID="TB_ReceiptAddress" runat="server" Width="60%"></asp:TextBox><asp:DropDownList ID="DL_WareHouse" runat="server" DataTextField="WHName" DataValueField="WHName"
                                            Height="25px" Width="108px" AutoPostBack="True" OnSelectedIndexChanged="DL_WareHouse_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label172" runat="server" Text="<%$ Resources:lang,ShouHuoShiJian %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="DLC_ReceiptGoodsTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_ReceiptGoodsTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label173" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>：</td>
                                    <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceiptGoodsPreDay" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="53px" Precision="0">0</NickLee:NumberBox>
                                    </td>

                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label174" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>：</td>
                                    <td colspan="5" class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_ReceiptStatus" runat="server">
                                            <asp:ListItem Value="计划" />
                                            <asp:ListItem Value="完成" />
                                            <asp:ListItem Value="取消" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            </td>
                                    <td>
                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer3" runat="server" ActiveTabIndex="0"
                                            Width="100%">
                                            <cc2:TabPanel ID="TabPanel16" runat="server" HeaderText="<%$ Resources:lang,HeTongLiaoPingQingDan %>" TabIndex="11">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label283" runat="server" Text="<%$ Resources:lang,HeTongLiaoPingQingDan %>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div id="Div1" style="width: 100%; height: 400px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="250%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label285" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label286" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label287" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td width="7%" align="center"><strong>
                                                                                <asp:Label ID="Label288" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label289" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label290" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label291" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label292" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label293" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label294" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label295" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid25" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid25_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="250%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Width="40px" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SaleOrderNumber" HeaderText="在单量（销售单）">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseOrderNumber" HeaderText="在订单 ">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel5" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label516" runat="server" Text="<%$ Resources:lang,LPKCLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeShangPin %>"></asp:Label>：
                                                     <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                             <td width="12%" align="center"><strong>
                                                                                 <asp:Label ID="Label143" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                             <td width="19%" align="center"><strong>
                                                                                 <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                             <td width="10%" align="center"><strong>
                                                                                 <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label147" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid9_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                     DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel6" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label515" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,QingXuanQuShangPin%>"></asp:Label>：
                                                     <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                         <table width="250%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                             <tr>
                                                                 <td width="7">
                                                                     <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                 <td>
                                                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                         <tr>
                                                                             <td width="15%" align="center"><strong>
                                                                                 <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong></td>
                                                                             <td width="20%" align="center"><strong>
                                                                                 <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                             <td width="15%" align="center"><strong>
                                                                                 <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong></td>
                                                                             <td width="30%" align="center"><strong>
                                                                                 <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong></td>
                                                                             <td align="center"><strong>
                                                                                 <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong></td>
                                                                         </tr>
                                                                     </table>
                                                                 </td>
                                                                 <td width="6" align="right">
                                                                     <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                             </tr>
                                                         </table>
                                                         <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                             Height="1px" Width="250%" OnItemCommand="DataGrid6_ItemCommand" CellPadding="4"
                                                             ForeColor="#333333" GridLines="None">
                                                             <Columns>
                                                                 <asp:TemplateColumn HeaderText="代码">
                                                                     <ItemTemplate>
                                                                         <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                     </ItemTemplate>
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                 </asp:TemplateColumn>
                                                                 <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}"
                                                                     DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                 </asp:HyperLinkColumn>
                                                                 <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                 </asp:BoundColumn>
                                                                 <asp:BoundColumn DataField="PurchasePrice" HeaderText="采购单价">
                                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                 </asp:BoundColumn>
                                                             </Columns>
                                                             <ItemStyle CssClass="itemStyle" />
                                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                             <EditItemStyle BackColor="#2461BF" />
                                                             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                             <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                         </asp:DataGrid>
                                                     </div>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                        </cc2:TabContainer>
                                    </td>
                            </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer2323asdf5" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton9" runat="server" class="layui-layer-btn notTab" OnClick="BT_ReceiveGoodsPlan_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label310" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popRelatedPJBudgetWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title5sdssdd">
                            <asp:Label ID="Label312" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content5sdsfs" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                                <tr>
                                    <td height="31">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="95%" height="108" align="center" style="font-size: 20pt;">
                                                    <br />
                                                    <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label314" runat="server" Text="<%$ Resources:lang,YuSuanShiYongBaoGao%>"></asp:Label>
                                                </td>
                                                <td align="center" valign="bottom">
                                                    <a href="javascript:window.print()">
                                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="95%" align="center">【
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiangMUYuSuan%>"></asp:Label>：
                                            <asp:Label ID="LB_ProjectBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                                    &nbsp;&nbsp;
                                            <asp:Label ID="Label315" runat="server" Text="<%$ Resources:lang,ShiZhuoYuSuan%>"></asp:Label>：
                                           <asp:Label ID="LB_RealBudget" runat="server" Font-Bold="False" Text="0"></asp:Label>
                                                    &nbsp;&nbsp;
                                            <asp:Label ID="Label316" runat="server" Text="<%$ Resources:lang,ShiJiFaShengFeiYongZongE%>"></asp:Label>：
                                            <asp:Label ID="LB_ProExpense" runat="server" Font-Bold="False"
                                                Text="0"></asp:Label>

                                                    】
                                           <td align="center">&nbsp;
                                           </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="15%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dgAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="15%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dgAmount" runat="server" Text="<%$ Resources:lang,Amount%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="205px" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label317" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="45%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dgDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td align="center">
                                                                            <strong>&nbsp;</strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid16" runat="server" AutoGenerateColumns="False" Width="100%"
                                                        OnItemCommand="DataGrid16_ItemCommand" ShowHeader="false" CellPadding="4" GridLines="None">
                                                        <Columns>
                                                            <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="LB_FinishPercent" runat="server" Height="20px" Font-Size="Small"
                                                                        BackColor="YellowGreen" Text='<%#DataBinder .Eval (Container .DataItem ,"Amount") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="LB_DefaultPercent" runat="server" Height="20px" Width="25px" Font-Size="Small"
                                                                        BackColor="Yellow"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="205px" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ID" HeaderText="" Visible="false">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LBT_Select" CommandName="Select" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;"></asp:LinkButton>

                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
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
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer23235" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton10" runat="server" class="layui-layer-btn notTab" OnClick="BT_DeliverGoodsPlan_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label313" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popConstractPayableVisaWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label10" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="5%"><strong></strong></td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="25%">
                                                    <strong>
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label318" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label319" runat="server" Text="签证人"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="20%">
                                                    <strong>
                                                        <asp:Label ID="Label320" runat="server" Text="签证说明"></asp:Label></strong>
                                                </td>

                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label321" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="5%"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid17" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid17_ItemCommand"
                                ShowHeader="false"
                                Width="100%">
                                <Columns>
                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="关联">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                    </asp:ButtonColumn>

                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="VisaName" HeaderText="名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="VisaAmount" HeaderText="总金额">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="VisaSignMan" HeaderText="签证人">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Comment" HeaderText="签证说明">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="状态">
                                        <ItemTemplate>
                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:TemplateColumn>

                                </Columns>
                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>
                        </div>
                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popPayableSelectPJPlanWindow" name="noConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label273" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">
                            <asp:TreeView ID="TreeView_PayablePJPlantTree" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView_PayablePJPlantTree_SelectedNodeChanged"
                                Width="100%" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                <RootNodeStyle CssClass="rootNode" />
                                <NodeStyle CssClass="treeNode" />
                                <LeafNodeStyle CssClass="leafNode" />
                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                            </asp:TreeView>
                        </div>
                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label326" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popReceivablesSelectPJPlanWindow" name="noConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label324" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">
                            <asp:TreeView ID="TreeView_ReceivablesPJPlantTree" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView_ReceivablesPJPlantTree_SelectedNodeChanged"
                                Width="100%" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                <RootNodeStyle CssClass="rootNode" />
                                <NodeStyle CssClass="treeNode" />
                                <LeafNodeStyle CssClass="leafNode" />
                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                            </asp:TreeView>
                        </div>
                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label327" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <%--  <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>--%>
                </ContentTemplate>
                <Triggers>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
