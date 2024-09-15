<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMSupBidByExp.aspx.cs" Inherits="TTBMSupBidByExp" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" colspan="2">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PingBiaoXiaoZuQueRen%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-top: 5px;">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YaoQingHanXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>

                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TouBiaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TouBiaoRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>

                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox4" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>

                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChengBaoShangTouBiaoXinXiLieBiao%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>&nbsp;&nbsp;</strong></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhongBiaoZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%--   <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChengBaoShang%>"></asp:Label></strong>
                                                                </td>--%>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="文件"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="发起流程">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <ItemTemplate>
                                                                <a href='TTBMBidPlanRelatedWorkflowList.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"BidPlanID") %>' target="_blank">评标
                                                                </a>
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="招标邀请函">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="中标状态">
                                                            <ItemTemplate>
                                                                <%# GetBMSupplierBidStatus(Eval("BidStatus").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" ForeColor="Blue" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <%--  <asp:TemplateColumn HeaderText="承包商">
                                                        <ItemTemplate>
                                                            <%# GetBMSupplierInfoCode(Eval("SupplierCode").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>--%>
                                                        <asp:TemplateColumn HeaderText="投标文件">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <a href='TTBMSupplierBidRecordFileView.aspx?SupplierBidID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="_blank">投标文件</a>
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
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
                            <asp:Label ID="Label112" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">
                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                <tr>
                                    <td align="right" style="width: 150px" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                        <asp:DropDownList ID="DL_AnnInvitationID" runat="server" DataTextField="Name" DataValueField="ID" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle" style="width: 150px">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:Label ID="lbl_AnnInvitationContent" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">中标状态：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_BidStatus" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">承包商代码：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="LB_SupplierCode" runat="server"></asp:Label>
                                        <asp:TextBox ID="TB_SupplierName" runat="server" CssClass="shuru" Enabled="False" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label>： </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                        <asp:TextBox ID="TB_BiddingContent" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                        <asp:Label ID="Label6" runat="server" Text="评标意见"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                        <asp:TextBox ID="TB_ExportResult" runat="server" Height="35px" TextMode="MultiLine" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 150px;" class="formItemBgStyle">&nbsp;</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="确 认" Enabled="False" />
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_BidID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                <tr>
                                    <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PingBiaoQueRenLieBiao%>"></asp:Label>：</td>
                                </tr>
                                <tr>
                                    <td align="center" class="formItemBgStyle">
                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <%--    <td width="15%" align="center">
                                                                  <strong>
                                                                      <asp:Label ID="Label9" runat="server" Text="承包商代码"></asp:Label></strong>
                                                              </td>--%>
                                                            <td width="35%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="50%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="评标意见"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px"
                                            OnItemCommand="DataGrid1_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged">

                                            <ItemStyle CssClass="itemStyle" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <%--   <asp:TemplateColumn HeaderText="承包商">
                                                          <ItemTemplate>
                                                              <%# GetBMSupplierCodeByID(Eval("SupplierBidID").ToString()) %>
                                                          </ItemTemplate>
                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                          <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                              HorizontalAlign="Center" />
                                                      </asp:TemplateColumn>--%>
                                                <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ExportResult" HeaderText="审批意见">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                            <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
