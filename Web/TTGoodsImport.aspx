<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsImport.aspx.cs" Inherits="TTGoodsImport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = GoodsListDivID.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            GoodsListDivID.scrollTop = disPostion;
        }
    </script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function displayWaitingImg(img) {

            this.document.getElementById(img).style.display = 'block';
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SPQCSJDR%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px" valign="top" align="left">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="text-align: left;" colspan="2">
                                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="55%">
                                                            <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 100%;">
                                                                <tr>

                                                                    <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_Type" runat="server" CssClass="DDList" DataTextField="Type"
                                                                            DataValueField="Type" AutoPostBack="True" OnSelectedIndexChanged="DL_Type_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="lbl_CheckId" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                                                        <asp:TextBox ID="TB_GoodsCode" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="TB_GoodsName" runat="server" Width="65%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                        <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: right;" colspan="3" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Spec" runat="server" Height="70px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                        <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                        &nbsp;<asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong%>" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                        <asp:TextBox ID="TB_Brand" runat="server" Width="90%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" Amount="1" Width="80px" Precision="3">1.00</NickLee:NumberBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" Width="79px" Precision="3">0.000</NickLee:NumberBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CangKu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">

                                                                        <asp:TextBox ID="TB_WHName" runat="server" Width="150px"></asp:TextBox>
                                                                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseWH" Enabled="True" PopupControlID="Panel13" TargetControlID="TB_WHName" Y="15">
                                                                        </cc1:ModalPopupExtender>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_Manufacturer" runat="server" Width="65%"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">

                                                                        <asp:TextBox ID="DLC_BuyTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5"
                                                                            runat="server" TargetControlID="DLC_BuyTime">
                                                                        </ajaxToolkit:CalendarExtender>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BaoGuanRen%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                        <asp:Label ID="LB_OwnerCode" runat="server"></asp:Label>
                                                                        <asp:Label ID="LB_OwnerName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_Memo" runat="server" Height="65px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle"></td>
                                                                    <td class="formItemBgStyle" colspan="4">
                                                                        <table>
                                                                            <tr>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DaoRuXinXi%>"></asp:Label>： 
                                                                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                                         <ContentTemplate>
                                                                                             <div>
                                                                                                 <Upload:InputFile ID="FileUpload_Training" runat="server" Width="400px" />
                                                                                                 <br />
                                                                                                 <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClientClick="javascript:displayWaitingImg('img_processing');" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                                                 <img id="img_processing" src="Images/Processing.gif" alt="Loading,please wait..." style="display: none;" />
                                                                                                 <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/物料期初数据导入模板.xls"><asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,QCSJDRMB%>"></asp:Label></a>
                                                                                                 <div id="ProgressBar">
                                                                                                     <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                                                     </Upload:ProgressBar>
                                                                                                 </div>
                                                                                             </div>
                                                                                         </ContentTemplate>
                                                                                         <Triggers>
                                                                                             <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                                                         </Triggers>
                                                                                     </asp:UpdatePanel>
                                                                                    
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                                        </td>
                                                        <td align="center" style="padding: 0px 0px 0px 5px;">
                                                            <div id="GoodsListDivID" style="width: 100%; height: 800px; overflow: auto;">
                                                                <table width="130%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label134534" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="15%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,HanShui%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChangJia%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="1px" OnItemCommand="DataGrid4_ItemCommand" Width="130%" CellPadding="4"
                                                                    ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="物料代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode").ToString().Trim() %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsCode={0}"
                                                                            DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="IsTaxPrice" HeaderText="<%$ Resources:lang,HanShui%>">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
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
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />

                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <asp:Panel ID="Panel13" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>



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
