<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTenderList_BYJF.aspx.cs" Inherits="TTTenderList_BYJF" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>投标单据</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1480px;
            width: expression (document.body.clientWidth <= 1480? "1480px" : "auto" ));
        }

        th: expression (document.body.clientWidth <= 1180? "1180px" : "auto" ));
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
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TouBiaoDengJi%>"></asp:Label>
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
                            <td>
                                <table style="width: 100%;">
                                    <tr>

                                        <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;"
                                            valign="top">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td align="left" class="formItemBgStyle" style="padding-left: 10px;">
                                                        <table style="text-align: center;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YuJingLeiXing%>"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_WarningType" runat="server">
                                                                        <asp:ListItem />
                                                                        <asp:ListItem Value="标书购买" Text="<%$ Resources:lang,BiaoShuGouMai%>" />
                                                                        <asp:ListItem Value="交保证金" Text="<%$ Resources:lang,JiaoBaoZhengJin%>" />
                                                                        <asp:ListItem Value="收保证金" Text="<%$ Resources:lang,ShouBaoZhengJin%>" />
                                                                        <asp:ListItem Value="开标" Text="<%$ Resources:lang,KaiBiao%>" />
                                                                        <asp:ListItem Value="交中标费" Text="<%$ Resources:lang,JiaoZhongBiaoFei%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBianHao%>"></asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="TXT_TenderCode" runat="server" Width="100px"></asp:TextBox></td>

                                                                <td>
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="TXT_ProjectName" runat="server" Width="100px"></asp:TextBox></td>


                                                                <td>
                                                                    <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" class="formItemBgStyle">
                                                        <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />

                                                    </td>
                                                </tr>

                                            </table>
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="3%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                    </td>
                                                    <td width="3%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                    </td>
                                                    <td colspan="2" width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                    </td>

                                                    <td align="center" width="5%">
                                                        <strong>
                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="15%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="26%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label40" runat="server" Text="项目所属专业"></asp:Label></strong>
                                                    </td>

                                                    <td align="center" width="10%">
                                                        <strong>
                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                Width="100%" AllowPaging="True" PageSize="35" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                    </asp:ButtonColumn>
                                                    <asp:TemplateColumn HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                    </asp:TemplateColumn>
                                                    <asp:ButtonColumn ButtonType="LinkButton"  CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;" >
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:ButtonColumn>
                                                    <asp:TemplateColumn HeaderText="DIYWF">
                                                        <ItemTemplate>
                                                            <a href='TTRelatedDIYWorkflowForm.aspx?RelatedType=Tender&RelatedID=<%# Eval("ID").ToString() %>'>
                                                                <asp:Image ID="Image1" ImageUrl="ImagesSkin/DIYWF.png" runat="server" ToolTip="自定义表单工作流" />
                                                            </a>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="TenderCode" HeaderText="招标编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CompactCode" HeaderText="合同号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TenderContent" HeaderText="项目所属专业">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="26%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="Progress" HeaderText="状态">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
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
                            </td>
                        </tr>

                    </table>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow"
                    style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label41" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" style="width: 50%; border-right: solid 1px #D8D8D8; padding: 2px 2px 2px 2px;">
                                    <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 2px; background-color: white;"
                                        align="center">
                                        <tr>
                                            <td style="text-align: left; width: 15%;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBianHao%>"></asp:Label>：
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_TenderCode" runat="server" Width="95%"></asp:TextBox>
                                                <asp:HiddenField ID="HF_ID" runat="server" />
                                            </td>
                                            <td style="text-align: left; width: 10%;">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：</td>
                                            <td align="left" style="width: 30%;">
                                                <asp:TextBox ID="TB_ProjectName" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongHao%>" Visible="false"></asp:Label>：</td>
                                            <td align="left" colspan="2">
                                                <asp:TextBox ID="TB_CompactCode" runat="server" Visible="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBianDaiLi%>"></asp:Label>：</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="TB_BiddingAgent" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_BiddingAgentPhone" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label7" runat="server" Text="招标人"></asp:Label>：</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="TB_UserCode" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left; width: 15%;">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_UserCodePhone" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">

                                            <td style="text-align: left;">
                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XiaoShou%>"></asp:Label>：</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="TB_SalesCode" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_SalesCodePhone" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label9" runat="server" Text="项目经理"></asp:Label>：</td>
                                            <td align="right" colspan="2">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="text-align: right; width: 30%;">
                                                            <asp:Label ID="LB_PMCode" runat="server"></asp:Label></td>
                                                        <td style="text-align: right; width: 50%;">
                                                            <asp:TextBox ID="TB_PMName" runat="server" Width="100px"></asp:TextBox></td>
                                                        <td style="text-align: right;">
                                                            <asp:Button ID="BT_SelectPM" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" OnClick="BT_SelectPM_Click" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label10" runat="server" Text="技术负责人"></asp:Label>：</td>
                                            <td colspan="2" style="text-align: left;">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="LB_TechnicalDirectorCode" runat="server"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="TB_TechnicalDirectorName" runat="server" Width="100px"></asp:TextBox></td>
                                                        <td style="text-align: right;">
                                                            <asp:Button ID="BT_SelectTechnicalDirector" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" OnClick="BT_SelectTechnicalDirector_Click" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label46" runat="server" Text="项目经办人"></asp:Label>：</td>
                                            <td align="right" colspan="2">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="text-align: right; width: 30%;">
                                                            <asp:Label ID="LB_PrincipalCode" runat="server"></asp:Label></td>
                                                        <td style="text-align: right; width: 50%;">
                                                            <asp:TextBox ID="TB_PrincipalName" runat="server" Width="100px"></asp:TextBox></td>
                                                        <td style="text-align: right;">
                                                            <asp:Button ID="BT_SelectPrincipalr" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" OnClick="BT_SelectPrincipalr_Click" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label49" runat="server" Text="内外属性"></asp:Label>：</td>
                                            <td align="left" colspan="2">
                                                <asp:DropDownList ID="DL_InternalandExternal" runat="server">
                                                    <asp:ListItem Value="INNER" Text="内"></asp:ListItem>
                                                    <asp:ListItem Value="OUTER" Text="外"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiaoShuGouMaiRiQi%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_TenderBuyTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_TenderBuyDay" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:CheckBox ID="CKB_IsTender" runat="server" /><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label47" runat="server" Text="投标报价"></asp:Label>：</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="TB_BiddingPrice" runat="server" Text="0"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label48" runat="server" Text="控制价"></asp:Label>：</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="TB_ControlPrice" runat="server" Text="0"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BaoZhengJin%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_Margin" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BaoZhengJinZhiFuRiQi%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_MarginTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：
                                                                        <asp:TextBox ID="TB_MarginDay" runat="server" Width="60px"></asp:TextBox>

                                                <asp:CheckBox ID="CKB_IsMargin" runat="server" /><asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiRiQi%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_ReceiveMarginTime" runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                    runat="server" TargetControlID="TB_ReceiveMarginTime">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiShu%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_ReceiveMargin" runat="server"></asp:TextBox>
                                            </td>

                                            <td align="left" colspan="3">
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：
                                                                    <asp:TextBox ID="TB_ReceiveMarginDay" runat="server" Width="60px"></asp:TextBox>

                                                <asp:CheckBox ID="CKB_IsReceiveMargin" runat="server" /><asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiBiaoRiQi%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_BidOpeningDate" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_BidOpeningDay" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:CheckBox ID="CKB_IsBidOpening" runat="server" /><asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZBFJNRQ%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_WinningFeeDate" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                            <td align="left">
                                                <asp:TextBox ID="TB_WinningFeeDay" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:CheckBox ID="CKB_IsWinningFee" runat="server" /><asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label28" runat="server" Text="项目所属专业"></asp:Label>：</td>
                                            <td colspan="6" align="left" class="formItemBgStyle">
                                                <asp:DropDownList ID="DL_TenderContent" DataTextField="tendercontent" DataValueField="tendercontent" Width="95%" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="6">
                                                <asp:TextBox ID="TB_Remarks" runat="server" Height="35px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KeShiRenYuan%>"></asp:Label>
                        <table width="60%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="100%" align="left" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <asp:Repeater ID="RP_TenderMember" runat="server" OnItemCommand="RP_TenderMember_ItemCommand">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                Width="70px" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZhe %>" CssClass="inpu" OnClick="BT_Select_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popSelectMemberwindow"
                    style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label43" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td width="165px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <table style="width: 165px; height: 53px">
                                        <tr>
                                            <td style="width: 165; text-align: center;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,KeShiRenYuan %>"></asp:Label></strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="False">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                        CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                Font-Strikeout="False" Font-Underline="False" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('http://localhost:4783/Web/ImagesSkin/titleBG.jpg')">

                                                <table>

                                                    <tr>

                                                        <td>

                                                            <asp:Label ID="LB_tbActorGroupList" runat="server" Text="<%$ Resources:lang,ActorGroupList %>" />: </td>

                                                        <td>（</td>

                                                        <td>
                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JueSeZuMingCheng %>"></asp:Label>：</td>

                                                        <td>

                                                            <asp:TextBox ID="TB_ActorGroupName" runat="server" Width="150px"></asp:TextBox></td>

                                                        <td>

                                                            <asp:Button ID="BT_FindGroup" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindGroup_Click" />
                                                        </td>

                                                        <td>)
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td align="left">

                                                <table>

                                                    <tr>

                                                        <td align="left">

                                                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

                                                                <ItemTemplate>

                                                                    <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>

                                                    <tr>

                                                        <td style="height: 10px; text-align: left"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popSelectPMWindow"
                    style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label50" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td width="165px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <table style="width: 165px; height: 53px">
                                        <tr>
                                            <td style="width: 165; text-align: center;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="False">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                        CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                Font-Strikeout="False" Font-Underline="False" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>

                                            </td>

                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popSelectTechnicalDirectorWindow"
                    style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label52" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td width="165px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <table style="width: 165px; height: 53px">
                                        <tr>
                                            <td style="width: 165; text-align: center;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand"
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="False">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                        CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                Font-Strikeout="False" Font-Underline="False" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>

                                            </td>

                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popSelectPrincipalrWindow"
                    style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label54" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView4" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td width="165px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <table style="width: 165px; height: 53px">
                                        <tr>
                                            <td style="width: 165; text-align: center;" valign="top">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,KeShiRenYuan %>"></asp:Label></strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid5_ItemCommand"
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="False">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                        CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                Font-Strikeout="False" Font-Underline="False" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>

                                            </td>

                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                    style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                        <asp:Label ID="Label103" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">

                            <tr style="font-size: 10pt">

                                <td class="formItemBgStyle" colspan="2" style="height: 10px; text-align: left">

                                    <strong>
                                        <asp:Label ID="Label36" runat="server" Text="投标流程申请"></asp:Label>：</strong>
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td class="formItemBgStyle" style="text-align: right">
                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                </td>

                                <td class="formItemBgStyle" style="text-align: left">

                                    <asp:DropDownList ID="DL_WFType" runat="server">
                                        <asp:ListItem Value="投标管理" Text="投标管理" />
                                    </asp:DropDownList>

                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                        Width="144px">
                                    </asp:DropDownList>

                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                        Target="_blank">
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,MoBanWeiHu%>"></asp:Label>
                                    </asp:HyperLink>

                                    <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click"
                                        Text="<%$ Resources:lang,ShuaXin%>" />
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td class="formItemBgStyle" style="text-align: right">
                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                </td>

                                <td class="formItemBgStyle" style="text-align: left">

                                    <asp:TextBox ID="TB_WLName" runat="server" Width="387px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td class="formItemBgStyle" style="text-align: right">
                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：
                                </td>

                                <td class="formItemBgStyle" style="text-align: left">

                                    <asp:TextBox ID="TB_Description" runat="server" Height="48px" TextMode="MultiLine"
                                        Width="441px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td class="formItemBgStyle" style="text-align: right;"></td>

                                <td class="formItemBgStyle" style="text-align: left; height: 19px;">（<asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>要求收到处理信息：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" /><asp:CheckBox
                                    ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian%>" />

                                    <span style="font-size: 10pt">) </span>

                                    <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" />

                                    <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                        TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                        DynamicServicePath="">
                                    </cc1:ModalPopupExtender>
                                </td>
                            </tr>
                        </table>

                        <table cellpadding="0" cellspacing="0" width="100%">

                            <tr style="font-size: 10pt;">

                                <td style="height: 14px; text-align: left">
                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu%>"></asp:Label>：
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td style="height: 11px; text-align: left">

                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                        width="100%">

                                        <tr>

                                            <td width="7">

                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                            </td>

                                            <td>

                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                    <tr>

                                                        <td align="center" width="10%">

                                                            <strong>
                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>

                                                        <td align="center" width="55%">

                                                            <strong>
                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                        </td>

                                                        <td align="center" width="15%">

                                                            <strong>
                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                        </td>

                                                        <td align="center" width="10%">

                                                            <strong>
                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>

                                                        <td align="center" width="10%">

                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td align="right" width="6">

                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                            </td>
                                        </tr>
                                    </table>

                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False"
                                        Width="100%">

                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                        <EditItemStyle BackColor="#2461BF" />

                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                        <ItemStyle CssClass="itemStyle" />

                                        <Columns>

                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">

                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                DataTextField="WLName" HeaderText="工作流" Target="_blank">

                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                            </asp:HyperLinkColumn>

                                            <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">

                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>

                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>

                                            <asp:TemplateColumn>

                                                <ItemTemplate>

                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                        Target="_blank"><img class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                </ItemTemplate>

                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                            </tr>

                            <tr style="font-size: 10pt">

                                <td style="text-align: right">

                                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>

                                    <asp:Label ID="Label68" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>



                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                    Width="500px">
                    <div>
                        <table>
                            <tr>
                                <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                        ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
