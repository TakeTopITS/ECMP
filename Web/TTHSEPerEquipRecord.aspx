<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTHSEPerEquipRecord.aspx.cs" Inherits="TTHSEPerEquipRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1180px;
            width: expression (document.body.clientWidth <= 1180? "1180px" : "auto" ));
        }
    </style>
    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            //disPostion = AssetListDivID.scrollTop;
        }

        function RestoreScroll() {
            //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            //AssetListDivID.scrollTop = disPostion;
        }
    </script>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenYuanSheBeiBeiAn%>"></asp:Label>
                                                        </td>
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
                                            <td align="center" >
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QiYeXinXi%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="100px"></asp:TextBox>
                                                &nbsp;
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YouXiaoQi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox2">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>
                                                &nbsp;
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="35%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,QiYeJianCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="35%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,QiYeDiZhi%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                        Width="100%" AllowPaging="True" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                        ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                            <asp:BoundColumn DataField="Code" HeaderText="编号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Name" HeaderText="企业名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="CompanyFor" HeaderText="企业简称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="AuditStatus" HeaderText="状态">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Address" HeaderText="地址">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataGrid>
                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label27" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 70%; margin-top: 5px"
                                align="center">
                                <tr>
                                    <td style="text-align: right;" width="20%" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:Label ID="LB_Code" runat="server" Enabled="False"></asp:Label>
                                        <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QiYeJianCheng%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="width: 35%">
                                        <asp:TextBox ID="TB_CompanyFor" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BeiAnLeiXing%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Type" runat="server" CssClass="shuru">
                                            <asp:ListItem Value="人员备案" Text="<%$ Resources:lang,RenYuanBeiAn%>" />
                                            <asp:ListItem Value="设备备案" Text="<%$ Resources:lang,SheBeiBeiAn%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="width: 35%">
                                        <asp:TextBox ID="TB_LinkTel" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ZipCode" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="width: 35%">
                                        <asp:TextBox ID="TB_EinNo" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DianZiYouXiang%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Email" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="width: 35%">
                                        <asp:TextBox ID="TB_Fax" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BankName" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YouXiaoQi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="width: 35%">
                                        <asp:TextBox ID="DLC_ValidityStart" runat="server" CssClass="shuru"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ValidityStart">
                                        </cc1:CalendarExtender>
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="DLC_ValidityEnd" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ValidityEnd">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_AuditStatus" runat="server" CssClass="shuru">
                                            <asp:ListItem Value="合格" Text="<%$ Resources:lang,HeGe%>" />
                                            <asp:ListItem Value="不合格" Text="<%$ Resources:lang,BuHeGe%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Address" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,QiYeWangZhi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_WebAddress" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongHuoFuWuFanWei%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_SuppServScope" runat="server" Height="35px" TextMode="MultiLine" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,QiYeZiZhi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_Qualifications" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>
                            <br />
                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
