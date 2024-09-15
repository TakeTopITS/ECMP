<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMSupplierResult.aspx.cs" Inherits="TTBMSupplierResult" %>

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

        .auto-style1 {
            font-size: medium;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 7%;
        }

        .auto-style5 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
        }

        .auto-style6 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 7%;
        }

        .auto-style7 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
        }

        .auto-style8 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 7%;
        }

        .auto-style9 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TouBiaoXinXiChaXun%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_SupplierInfoID" runat="server" Visible="False"></asp:Label>
                                                &nbsp;
                                                <asp:Label ID="lbl_CodePerson" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="middle" style="width: 98%; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;">
                                                <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 5px"
                                                    align="center">
                                                    <tr>
                                                        <td style="text-align: right;" class="auto-style2">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_Code" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="text-align: right;" class="auto-style2">&nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_Name" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style6">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QiYeJianCheng%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="lbl_CompanyFor" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style8">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QiYeXingZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_CompanyType" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_PhoneNum" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style6">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="lbl_ZipCode" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style8">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YouXiang%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:Label ID="lbl_Email" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_Fax" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style5">
                                                            <asp:Label ID="lbl_EinNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style6">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="lbl_Bank" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style8">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KaiHuZhangHao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:Label ID="lbl_BankNo" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" align="left" colspan="3">
                                                            <asp:Label ID="lbl_Address" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="auto-style6" align="right">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,QiYeWangZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Label ID="lbl_WebUrl" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GongHuoFanWei%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Label ID="lbl_SupplyScope" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="auto-style6">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,QiYeZiZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Label ID="lbl_Qualification" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: right;">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShenHeYiJian%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Label ID="lbl_Remark" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="left" class="auto-style6">&nbsp;</td>
                                                        <td align="left" class="auto-style7" colspan="3">&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 98%; border-right: solid 1px #D8D8D8;" valign="top">
                                                <table width="98%" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style="height: 6px">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhaoBiaoXinXi%>"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="40%"><strong>
                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhaoBiaoNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianZhiBuMen%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhaoBiaoRiQi%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="Name" HeaderText="招标公告/邀请函名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Remark" HeaderText="招标内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BidWay" HeaderText="招标方式">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="EnterUnit" HeaderText="编制部门">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="EnterDate" HeaderText="招标日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
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
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="40%"><strong>
                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhaoBiaoNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhaoBiaoRiQi%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="Name" HeaderText="招标公告/邀请函名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Remark" HeaderText="招标内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BidWay" HeaderText="招标方式">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="FilePath" DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="招标文件" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="EnterDate" HeaderText="招标日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
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
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBuYiXinXi%>"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="60%"><strong>
                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BuYiNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BuYiRiQi%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="招标公告/邀请函名称">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnInvitationByPlanName(Eval("BidPlanID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="AddendumContent" HeaderText="补遗内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="60%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AddendumDate" HeaderText="补遗日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
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
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label34" runat="server" Text="澄清信息回函"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="30%"><strong>
                                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ChengQingNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HuiHanNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ChengQingRiQi%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,HuiHanShiJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="招标公告/邀请函名称">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnInvitationByAnnClaFileName(Eval("AnnClaFileID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="澄清内容">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnClaFileSendContent(Eval("AnnClaFileID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="SendContent" HeaderText="回函内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="澄清日期">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnClaFileSentDate(Eval("AnnClaFileID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ReplyDate" HeaderText="回函时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
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
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label40" runat="server" Text="投标反馈信息"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,TouBiaoZhuangTai%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,TongZhiNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,TouBiaoShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label59" runat="server" Text="文件"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="招标公告/邀请函">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnInvitationName(Eval("AnnInvitationID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="投标状态">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMSupplierBidStatus(Eval("BidStatus").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" ForeColor="Blue" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="NoticeContent" HeaderText="通知内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BiddingDate" HeaderText="投标时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="通知文件">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    <ItemTemplate>
                                                                                        <a href='TTBMBidNoticeContentFileView.aspx?BidStatus=<%# DataBinder.Eval(Container.DataItem,"BidStatus") %>&BidSupplierID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="_blank">通知文件</a>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                                        HorizontalAlign="Center" />
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
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,TouBiaoLiShiXinXi%>"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="50%"><strong>
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,CaoZuoXingZhi%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,CaoZuoShiJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="招标公告/邀请函">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMAnnInvitationName(Eval("AnnInvitationID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OperationType" HeaderText="操作性质">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OperationDate" HeaderText="操作时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
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
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="font-size: x-large">
                                                                        <b><span class="auto-style1">
                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,HeTongTongZhiXinXi%>"></asp:Label></span></b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,TongZhiMingCheng%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,HeTongJia%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,HeTongZhuangTai%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,TongZhiRiQi%>"></asp:Label></strong></td>
                                                                                            <%--         <td align="center" width="10%"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShenPiRiQi%>"></asp:Label></strong></td>--%>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,YaoDianJiYao%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,QiaTanWenJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" ShowHeader="False" Width="100%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="Name" HeaderText="洽谈名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ContractPrice" HeaderText="合同价">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="合同状态">
                                                                                    <ItemTemplate>
                                                                                        <%# GetBMContractStatus(Eval("ID").ToString(),Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="EnterDate" HeaderText="编制日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ReviewDate" HeaderText="审批日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PointSummary" HeaderText="要点纪要">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="DiscussFilePath" DataNavigateUrlFormatString="{0}" DataTextField="DiscussFileName" HeaderText="洽谈文件" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
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
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
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
