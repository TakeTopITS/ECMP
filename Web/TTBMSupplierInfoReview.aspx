<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMSupplierInfoReview.aspx.cs" Inherits="TTBMSupplierInfoReview" %>

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
            width: 30%;
        }

        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 20%;
        }

        .auto-style4 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 30%;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChengBaoShangShenCha%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_SupplierInfoID" runat="server" Visible="False"></asp:Label>
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
                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,QiYeXinXi%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="100px"></asp:TextBox>
                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem Value="0" Text="<%$ Resources:lang,QingXuanZe%>" />
                                                    <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                    <asp:ListItem Value="合格" Text="<%$ Resources:lang,HeGe%>" />
                                                    <asp:ListItem Value="不合格" Text="<%$ Resources:lang,BuHeGe%>" />
                                                    <asp:ListItem Value="归档" Text="<%$ Resources:lang,GuiDang%>" />
                                                </asp:DropDownList>
                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox2">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>

                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2" style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,QiYeDiZhi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,PingJiaDengJi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                    Width="100%" AllowPaging="True" PageSize="25" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                    ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_SupplierID" runat="server" CssClass="inpu" Style="text-align: center" CommandName="Update"
                                                                    Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EvalueDegree") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Code" HeaderText="企业编码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTBMSupplierInfoView.aspx?SupplierID={0}" DataTextField="Name" HeaderText="企业名称" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Address" HeaderText="地址">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTBMSupplierAnaly.aspx?SupplierID={0}" DataTextField="EvalueDegree" HeaderText="评价等级" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Link" CommandName="Link" runat="server" Text="联系人"></asp:LinkButton>&nbsp;&nbsp;
                                                                <asp:LinkButton ID="LBT_Certification" CommandName="Certification" runat="server" Text="资质证书"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
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
                            <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 5px"
                                align="center">
                                <tr>
                                    <td style="text-align: left;" class="auto-style3">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_Code" runat="server" Enabled="False" CssClass="shuru" Width="90px"></asp:TextBox>
                                        <asp:HyperLink ID="HL_BMSupplierAnaly" runat="server" Enabled="False" Target="_blank">评价分析</asp:HyperLink>
                                    </td>
                                    <td style="text-align: left;" class="auto-style3">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:DropDownList ID="DL_Status" runat="server" Enabled="False">
                                            <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                            <asp:ListItem Value="合格" Text="<%$ Resources:lang,HeGe%>" />
                                            <asp:ListItem Value="不合格" Text="<%$ Resources:lang,BuHeGe%>" />
                                            <asp:ListItem Value="归档" Text="<%$ Resources:lang,GuiDang%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QiYeJianCheng%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_CompanyFor" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QiYeXingZhi%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:DropDownList ID="DL_CompanyType" runat="server">
                                            <asp:ListItem Value="国企" Text="<%$ Resources:lang,GuoQi%>" />
                                            <asp:ListItem Value="事业单位" Text="<%$ Resources:lang,ShiYeDanWei%>" />
                                            <asp:ListItem Value="私企" Text="<%$ Resources:lang,SiQi%>" />
                                            <asp:ListItem Value="外资(合资)" Text="<%$ Resources:lang,WaiZiHeZi%>" />
                                            <asp:ListItem Value="股份制" Text="<%$ Resources:lang,GuFenZhi%>" />
                                            <asp:ListItem Value="其它" Text="<%$ Resources:lang,QiTa%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_PhoneNum" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_ZipCode" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YouXiang%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_Email" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_Fax" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_EinNo" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_Bank" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KaiHuZhangHao%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_BankNo" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoRen%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_LegalRepresentative" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiShuFuZeRen%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_TechnicalDirector" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoDianHua%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_LegalTel" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiShuFuZeRenDianHua%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_TechnicalTel" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoRen%>"></asp:Label><br />
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JiShuZhiCheng%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_TechnicalTitles" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiShuFuZeRen%>"></asp:Label><br />
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiShuZhiCheng%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_TechnicalTitles_T" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ChengLiShiJian%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="DLC_SetUpTime" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_SetUpTime">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YuanGongZongRenShu%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_EmployeesNum" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZiZhiZhengShu%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_QualificationCertificate" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YingYeZhiZhao%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_BusinessLicense" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangMuJingLiRenShu%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_PMNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GaoJiZhiChengRenYuan%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_STNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhongJiZhiChengRenYuan%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_ITNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ChuJiZhiChengRenYuan%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_PTNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JiGongRenYuan%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_MNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                        人</td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuCeZiJin%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_RegisteredCapital" runat="server" CssClass="shuru"></asp:TextBox>
                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,Yuan%>"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_RecommendedUnits" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShangNianDuGongSi%>"></asp:Label><br />
                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,RuWeiBianHao%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="TB_LastFinalistsNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;" colspan="3">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShiFouZaiZhongShiYouHuoLanZhouShiHuaRuWei%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:DropDownList ID="DL_IsLand" runat="server">
                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">

                                        <asp:Repeater ID="RP_AccessoriesPath" runat="server">
                                            <ItemTemplate>
                                                <a href='<%# DataBinder.Eval(Container.DataItem,"AccessoriesPath") %>' target="_blank">
                                                    <%# DataBinder.Eval(Container.DataItem,"Code") %>附件
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="auto-style3">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhuCeDiZhi%>"></asp:Label>：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Address" runat="server" Width="95%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FenBaoZhuanYe%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_SubcontractProfessional" runat="server" Width="95%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,QiYeWangZhi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_WebUrl" runat="server" Width="95%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,GongHuoJingYingFanWei%>"></asp:Label><br />
                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,YingYeZhiZhao%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_SupplyScope" runat="server" Height="35px" TextMode="MultiLine" Width="95%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,QiYeZiZhiFanWei%>"></asp:Label><br />
                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ZiZhiZhengShu%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_Qualification" runat="server" Width="95%" CssClass="shuru" Height="35px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ShenPiRen%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <asp:TextBox ID="TB_Reviewer" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td align="left" class="auto-style3">
                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShenPiRiQi%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style4">
                                        <asp:TextBox ID="DLC_ReviewDate" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ReviewDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,PingFen%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style2">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Point" runat="server" CssClass="shuru">0.00</NickLee:NumberBox></td>
                                    <td align="right" class="auto-style3">&nbsp;</td>
                                    <td align="left" class="auto-style4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align: left;">
                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShenHeYiJian%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_Remark" runat="server" Height="35px" TextMode="MultiLine" Width="95%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="auto-style3"></td>
                                    <td colspan="3" align="left" class="formItemBgStyle">

                                        <asp:TextBox ID="TB_PassWord" runat="server" Visible="False" Width="16px"></asp:TextBox>
                                        <asp:TextBox ID="DLC_EnterDate" runat="server" Height="16px" ReadOnly="false" Visible="False" Width="19px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EnterDate">
                                        </cc1:CalendarExtender>
                                        <asp:TextBox ID="TB_EnterPer" runat="server" Visible="False" Width="19px"></asp:TextBox>
                                        <asp:Label ID="LB_ApplicantName" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc; text-align: center;">
                            <asp:Button ID="BT_NewAA" runat="server" OnClick="BT_NewClaim_Click" Text="<%$ Resources:lang,HeGe%>" class="layui-layer-btn notTab" />&nbsp;
                            <asp:Button ID="BT_UpdateAA" runat="server" OnClick="BT_UpdateClaim_Click" Text="<%$ Resources:lang,BoHui%>" class="layui-layer-btn notTab" />&nbsp;
                             
                            <asp:Button ID="BT_Archive" runat="server" Text="<%$ Resources:lang,GuiDang%>" class="layui-layer-btn notTab" OnClick="BT_Archive_Click" />&nbsp;
                            <asp:Button ID="BT_DeleteAA" runat="server" Text="<%$ Resources:lang,ShanChu%>" class="layui-layer-btn notTab" OnClick="BT_DeleteAA_Click" />
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowLink"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label83" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table width="98%" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" colspan="2" style="height: 6px">
                                        <table width="100%">
                                            <tr>
                                                <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                    <asp:Button ID="BT_CreateLink" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateLink_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                        </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong></td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong></td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label></strong></td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShouJiHaoMa%>"></asp:Label></strong></td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label></strong></td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,DianZiYouJian%>"></asp:Label></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">
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
                                                            <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Position" HeaderText="职务">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MobileNum" HeaderText="手机号码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OfficePhone" HeaderText="办公电话">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Email" HeaderText="电子邮箱">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                        </Columns>

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>


                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowLinkDetail"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label87" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_NameLink" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:DropDownList ID="DL_Gender" runat="server" Height="25px">
                                            <asp:ListItem Value="男" Text="<%$ Resources:lang,Nan%>" />
                                            <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Position" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,ShouJiHaoMa%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="TB_MobileNum" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_OfficePhone" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,DianZiYouJian%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_EmailLink" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td style="height: 1px; text-align: left;" class="formItemBgStyle" colspan="3">
                                        <asp:Button ID="BT_New" runat="server" Enabled="False" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>"
                                            CssClass="inpu" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" Enabled="False" OnClick="BT_Update_Click"
                                            CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />&nbsp;
                                            <asp:Button ID="BT_Delete" runat="server" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                    </td>
                                </tr>--%>
                            </table>


                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewLink_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>



                    <div class="layui-layer layui-layer-iframe" id="popwindowCertification"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label85" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">


                            <table width="100%">
                                <tr>
                                    <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                        <asp:Button ID="BT_CreateCertification" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateCertification_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,ZhengShuBianHao%>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,ZhengShuMingCheng%>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,FaZhengJiGuan%>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,FaZhengRiQi%>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,FuJianXiaZai%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%">
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

                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="CertificateNum" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="CertificateName" HeaderText="证书名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="LicenseAgency" HeaderText="发证机关">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ReleaseTime" HeaderText="发证日期" DataFormatString="{0:yyyy-MM-dd}">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundColumn>
                                                <%--     <asp:BoundColumn DataField="Attach" HeaderText="附件下载">
                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                      </asp:BoundColumn>--%>
                                                <asp:HyperLinkColumn DataNavigateUrlField="Attach" DataNavigateUrlFormatString="{0}" DataTextField="CertificateName" HeaderText="附件下载" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:HyperLinkColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="lbl_CerID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>

                            </table>


                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowCertificationDetail"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label89" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">
                            <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ZhengShuBianHao%>"></asp:Label>：</td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CertificateNum" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,ZhengShuMingCheng%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="TB_CertificateName" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,FaZhengJiGuan%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_LicenseAgency" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,FaZhengRiQi%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="DLC_ReleaseTime" runat="server" Width="110px" ReadOnly="false"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_ReleaseTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="400px" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadCertification" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:HyperLink ID="HL_Certification" runat="server" Text="查看附件"></asp:HyperLink>
                                        <asp:Button ID="BT_UploadCertification" runat="server" Text="<%$ Resources:lang,ShangChuan %>" CssClass="inpu" OnClick="BT_UploadCertification_Click" />
                                    </td>
                                </tr>
                                <%--   <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td style="height: 1px; text-align: left;" class="formItemBgStyle" colspan="3">
                                        <asp:Button ID="Button1" runat="server" Enabled="False" Text="<%$ Resources:lang,XinZeng%>"
                                            CssClass="inpu" OnClick="Button1_Click" />&nbsp;
                                     <asp:Button ID="Button2" runat="server" Enabled="False"
                                         CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="Button2_Click" />
                                    </td>
                                </tr>--%>
                            </table>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewCertification" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewCertification_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
