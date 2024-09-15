<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeConstract_BYJF.aspx.cs" Inherits="TTMakeConstract_BYJF" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }*/
        .auto-style1 {
            position: absolute;
            left: 35%;
            top: 35%;
            height: 34px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <!--pageoffic.js一定要引用-->
    <%--<script type="text/javascript" src="pageoffice.js"></script>--%>


    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function autoheight() { //函数：获取尺寸
            //获取浏览器窗口高度
            var winHeight = 0;
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;

            if (document.documentElement && document.documentElement.clientHeight)
                winHeight = document.documentElement.clientHeight;

            document.getElementById("Div3").style.height = (winHeight - 120) + "px";
            document.getElementById("Div6").style.height = (winHeight - 80) + "px";
        }

        window.onresize = autoheight; //浏览器窗口发生变化时同时变化DIV高度

        //设置IFRMAE的高度
        function setBusinessFormIFrameHeight() {

            var winHeight = 0;

            winHeight = document.getElementById("popwindow").style.height;

            document.getElementById("TabContainer4_TabPanel16_IFrame_RelatedInformation").height = (winHeight.toString().replace("px", "") - 160);
        }
        window.onmousemove = setBusinessFormIFrameHeight;

    </script>
</head>
<body onload="autoheight();">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiDingHeTong%>"></asp:Label>
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
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                                <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer3" runat="server" ActiveTabIndex="0"
                                                    Width="100%">
                                                    <cc2:TabPanel ID="TabPanel8" runat="server" HeaderText="在用合同" TabIndex="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZaiYongHeTong%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <br />
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
                                                                <tr>
                                                                    <td width="5%" align="right">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiaFang %>"></asp:Label>：</td>
                                                                    <td width="12%">
                                                                        <asp:TextBox ID="TB_FindPartA" runat="server" Width="99%"></asp:TextBox></td>
                                                                    <td width="5%" align="right">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YiFang %>"></asp:Label>：</td>
                                                                    <td width="12%">
                                                                        <asp:TextBox ID="TB_FindPartB" runat="server" Width="99%"></asp:TextBox></td>
                                                                    <td width="8%" align="right">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,HeTongHao %>"></asp:Label>：</td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="TB_FindConstractCode" runat="server" Width="99%"></asp:TextBox></td>
                                                                    <td style="padding-left: 5px;">
                                                                        <asp:Button ID="BT_Find" runat="server" Text="<%$ Resources:lang,ChaXun %>" CssClass="inpu" OnClick="BT_Find_Click" /></td>
                                                                    <td align="right" style="padding-right: 5px;">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_Create_Click" /></td>
                                                                </tr>
                                                            </table>
                                                            <div id="Div3" style="text-align: left; width: 100%; overflow: auto;">
                                                                <table width="120%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label236" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label237" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>

                                                                                    <td width="5%" align="center"><strong></strong></td>

                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,HeTongDaiMa %>"></asp:Label></strong></td>
                                                                                    <td width="14%" align="center"><strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,HeTongMingCheng %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label105" runat="server" Text="内容"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>

                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BiZhong %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KaiShiRiQi %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JieZhiRiQi %>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JiaFangDanWei %>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YiFangDanWei %>"></asp:Label></strong></td>
                                                                                    <td colspan="3" align="center"><strong>工作流 </strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="30" Width="120%"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:TemplateColumn HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:ButtonColumn CommandName="Detail" Text="&lt;div&gt;&lt;img src=ImagesSkin/Detail.png border=0 alt='明细' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>

                                                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                            DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <table style="width: 100%;">
                                                                                    <tr>
                                                                                        <td style="text-align: center;">

                                                                                            <div onclick="popShowByURL('TTConstractMainContentEdit.aspx?ConstractID=<%# ShareClass.URLEncode(Eval("ConstractID").ToString()) %>','ConstractContent', 600, 500)">
                                                                                                <asp:Label ID="Label19222" Text="<%$ Resources:lang, BianJi%>" runat="server"></asp:Label>
                                                                                            </div>

                                                                                        </td>
                                                                                    </tr>
                                                                                    <%--  <tr>
                                                                                        <td style="text-align: center;">
                                                                                            <div onclick="popShowByURL('<%# ShareClass.URLEncode(Eval("ConstractMainDocURL").ToString().Trim()) %>','Download', 600, 500)">
                                                                                                <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>--%>
                                                                                    <%-- <tr>
                                                                                        <td style="text-align: center;">
                                                                                            <div id="divEdit" onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=<%# ShareClass.URLEncode(Eval("ConstractMainDocURL").ToString()) %>','fullscreen=yes;');">
                                                                                                <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,WenJianBianJi %>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>--%>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ConstractClass" HeaderText="大类">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>

                                                                                <%# ShareClass.GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="StartDate" HeaderText="开始日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="EndDate" HeaderText="截止日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <table style="width: 100%;">
                                                                                    <tr>
                                                                                        <td style="text-align: center;">

                                                                                            <div onclick="popShowByURL('TTRelatedDIYWorkflowForm.aspx?RelatedType=Constract&RelatedID=<%# ShareClass.URLEncode(Eval("ConstractID").ToString()) %>','ConstractReview', 600, 500)">
                                                                                                <asp:Label ID="Label19333" Text="<%$ Resources:lang, BiaoDan%>" runat="server"></asp:Label>
                                                                                            </div>


                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-align: center;">
                                                                                            <div onclick="popShowByURL('TTConstractReviewWL.aspx?ConstractCode=<%# ShareClass.URLEncode(Eval("ConstractCode").ToString()) %>','ConstractReview', 600, 500)">
                                                                                                <asp:Label ID="Label203" Text="<%$ Resources:lang, ChangGui%>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                   <%-- <tr>
                                                                                        <td style="text-align: center;">
                                                                                            <div onclick="popShowByURL('TTAttachWorkFlowTemplate.aspx?RelatedType=Constract&RelatedID=<%# ShareClass.URLEncode(Eval("ConstractID").ToString()) %>','ConstractReview', 600, 500)">
                                                                                                <asp:Label ID="Label206" Text="<%$ Resources:lang, GuanLian%>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>--%>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:TemplateColumn>
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
                                                    <cc2:TabPanel ID="TabPanel13" runat="server" HeaderText="在用合同" TabIndex="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,ZaiYongHeTongShu%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                                                        <asp:TreeView ID="TreeView5" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView5_SelectedNodeChanged"
                                                                            ShowLines="True" Width="220px">
                                                                            <RootNodeStyle CssClass="rootNode" />
                                                                            <NodeStyle CssClass="treeNode" />
                                                                            <LeafNodeStyle CssClass="leafNode" />
                                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                        </asp:TreeView>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                    <cc2:TabPanel ID="TabPanel11" runat="server" HeaderText="已删合同" TabIndex="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,YiShanHeTong%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <br />
                                                            <div id="Div6" style="text-align: left; width: 100%; overflow: auto;">
                                                                <table width="140%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label238" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>

                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HeTongDaiMa %>"></asp:Label></strong></td>
                                                                                    <td width="20%" align="center"><strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,HeTongMingCheng %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,BiZhong %>"></asp:Label></strong></td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,KaiShiRiQi %>"></asp:Label></strong></td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JieZhiRiQi %>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YiFangDanWei %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid15" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="1px" OnItemCommand="DataGrid15_ItemCommand" OnPageIndexChanged="DataGrid15_PageIndexChanged" PageSize="30" Width="140%"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                            DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="ConstractClass" HeaderText="大类">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate></ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="StartDate" HeaderText="开始日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="EndDate" HeaderText="截止日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartAOperator" HeaderText="负责人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartBOperator" HeaderText="负责人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer4" Width="100%" runat="server" ActiveTabIndex="0">
                                <cc1:TabPanel ID="TabPanel15" runat="server" HeaderText="基本信息" TabIndex="0">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>

                                        <table style="width: 100%;">
                                            <tr>
                                                <td colspan="4" align="left" style="padding: 5px 5px 5px 5px;">
                                                    <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,FuHeTong %>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_ParentConstract" Width="95%" runat="server"></asp:TextBox>
                                                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                    Enabled="True" TargetControlID="TB_ParentConstract" PopupControlID="Panel2"
                                                                    CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                </cc1:ModalPopupExtender>
                                                                <asp:Label ID="LB_ParentCode" runat="server" Font-Bold="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongDaiMa %>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_ConstractCode" runat="server" Width="90%"></asp:TextBox>
                                                                <span style="color: #ff0000">*</span>

                                                                <asp:Label ID="LB_OldConstractCode" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongMingCheng %>"></asp:Label>
                                                                ： </td>
                                                            <td class="formItemBgStyle" width="80%">
                                                                <asp:TextBox ID="TB_ConstractName" runat="server" Width="90%"></asp:TextBox>
                                                                <span style="color: #ff0000">*</span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_ConstractClass" runat="server" DataTextField="BigType" DataValueField="BigType">
                                                                            </asp:DropDownList><span style="color: #ff0000">*</span>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongLeiXing %>"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type">
                                                                            </asp:DropDownList><span style="color: #ff0000">*</span>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_ContractNotice" runat="server" Text="<%$ Resources:lang,HeTongTongZhi %>"></asp:Label>
                                                                        </td>
                                                                        <td id="td_CSNotice" runat="server">
                                                                            <asp:DropDownList ID="DL_ConstractNotice" runat="server" DataTextField="Name" DataValueField="ID" Width="80px">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td id="td1" runat="server">
                                                                            <asp:Label ID="Label245" runat="server" Text="合同立项依据"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_ProjectBasis" runat="server">
                                                                                <asp:ListItem Value="" Text="--select--"> </asp:ListItem>
                                                                                <asp:ListItem Value="中标通知书" Text="中标通知书"> </asp:ListItem>
                                                                                <asp:ListItem Value="成交通知书" Text="成交通知书"> </asp:ListItem>
                                                                                <asp:ListItem Value="会议纪要" Text="会议纪要"> </asp:ListItem>
                                                                                <asp:ListItem Value="请示或批示" Text="请示或批示"> </asp:ListItem>
                                                                                <asp:ListItem Value="其它" Text="其它"> </asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td tyle="text-align: right;">
                                                                            <asp:Label ID="Label246" runat="server" Text="中标日期"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="DLC_BiddingDate" runat="server" Width="100px"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender9" runat="server" TargetControlID="DLC_BiddingDate" Enabled="True">
                                                                            </ajaxToolkit:CalendarExtender>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QianDingRiQi %>"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <asp:TextBox ID="DLC_SignDate" runat="server" Width="100px"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_SignDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,SuoShuBuMen %>"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="TB_DepartCode" Width="80px" runat="server"></asp:TextBox>
                                                                            <cc2:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" Enabled="True"
                                                                                TargetControlID="TB_DepartCode" PopupControlID="Panel1" CancelControlID="IMBT_Close"
                                                                                BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                            </cc2:ModalPopupExtender>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                                            <span style="color: #ff0000">*</span></td>
                                                                        <td>
                                                                            <asp:Label ID="Label233" runat="server" Text="经办人"></asp:Label></td>
                                                                        <td>
                                                                            <asp:TextBox ID="TB_OperatorName" runat="server" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label234" runat="server" Text="签署人"></asp:Label></td>
                                                                        <td>
                                                                            <asp:TextBox ID="TB_SignName" runat="server" Width="100px"></asp:TextBox></td>
                                                                    </tr>
                                                                </table>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongJinE %>"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <NickLee:NumberBox ID="NB_Amount" runat="server" Width="150px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_Currency" runat="server" DataTextField="Type" DataValueField="Type"
                                                                    Height="25px" Width="100px">
                                                                </asp:DropDownList>
                                                                <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,ShouFuKuanFangShi %>"></asp:Label>
                                                                ：<asp:DropDownList ID="DL_ReAndPayType" runat="server" DataTextField="Type" DataValueField="Type">
                                                                </asp:DropDownList>
                                                                <span style="color: #ff0000">*</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label112" runat="server" Text="税率"></asp:Label>：

                                                            </td>
                                                            <td colspan="3" class="formItemBgStyle" style="text-align: right;">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label106" runat="server" Text="税率1"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate13" runat="server" AutoPostBack="True" Width="50px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnAmountChanged="NB_TaxRate13_AmountChanged" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label108" runat="server" Text="合同额"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate13Amount" runat="server" Width="100px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label107" runat="server" Text="税率2"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate9" runat="server" AutoPostBack="True" Width="50px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnAmountChanged="NB_TaxRate9_AmountChanged" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label109" runat="server" Text="合同额"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate9Amount" runat="server" Width="100px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label110" runat="server" Text="税率3"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate6" runat="server" AutoPostBack="True" Width="50px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnAmountChanged="NB_TaxRate6_AmountChanged" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label111" runat="server" Text="合同额"></asp:Label>：</td>
                                                                        <td>
                                                                            <NickLee:NumberBox ID="NB_TaxRate6Amount" runat="server" Width="100px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label101" runat="server" Text="暂列金"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <NickLee:NumberBox ID="NB_ProvisionalAmount" runat="server" Width="150px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label102" runat="server" Text="安全文明施工费"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <NickLee:NumberBox ID="NB_SafeCivilizedFee" runat="server" Width="150px" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="3" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.000</NickLee:NumberBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label10" runat="server" Text="约定开工日期"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label11" runat="server" Text="约定完工日期"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle">
                                                                <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                    runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>

                                                                <asp:Label ID="Label232" runat="server" Text="质保期"></asp:Label>：
                                                                   <NickLee:NumberBox ID="NB_Warranty" runat="server" Width="80px" AutoPostBack="True" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" OnAmountChanged="NB_Warranty_AmountChanged">0</NickLee:NumberBox>天
                                                                    <asp:TextBox ID="DLC_WarrantyDate" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender8"
                                                                    runat="server" TargetControlID="DLC_WarrantyDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right; height: 13px;"></td>
                                                            <td colspan="3" class="formItemBgStyle" align="right">
                                                                <table>
                                                                    <tr>
                                                                        <td style="padding-left: 30px;">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CongWordDocDaoRu%>"></asp:Label>：
                                                                        </td>
                                                                        <td>
                                                                            <div onclick="popShowByURLForFixedSize('TTConstractUploadDocForParentWindow.aspx','Upload Doc', 600, 500)">
                                                                                <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,ShangChuan%>"></asp:Label>
                                                                            </div>
                                                                        </td>
                                                                        <td style="padding-left: 10px;">
                                                                            <asp:HyperLink ID="HL_ContentDocURL" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:HyperLink>
                                                                        </td>
                                                                        <td style="display: none;">
                                                                            <asp:TextBox ID="TB_ContentDocURL" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                            <asp:Button ID="BT_Import" Text="<%$ Resources:lang,DaoRu %>" CssClass="inpu" runat="server" OnClick="BT_Import_Click"
                                                                                OnClientClick="return confirm('提示，导入之后会覆盖原先的内容，确定要导入吗(Warning, importing will overwrite the original content. Are you sure you want to import)？')" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" class="formItemBgStyle">
                                                                <asp:Label ID="Label247" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" align="left" class="formItemBgStyle">
                                                                <CKEditor:CKEditorControl ID="CKE_MainContent" Width="98%" Height="350px" runat="server" Visible="False">
                                                                </CKEditor:CKEditorControl>
                                                                <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Width="98%" Height="350px" Visible="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiaFangDanWei %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:Label ID="LB_CustomerCode" runat="server"></asp:Label>
                                                                            <asp:TextBox ID="TB_PartA" runat="server" Width="200px" Text=""></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_PartAOperator" runat="server" Width="100px"></asp:TextBox>
                                                                            <asp:DropDownList ID="DL_CustomerList" runat="server" DataTextField="CustomerName" DataValueField="CustomerCode" Width="70px" AutoPostBack="True" OnSelectedIndexChanged="DL_Customer_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label103" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_PartAConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YiFangDanWei %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:Label ID="LB_VendorCode" runat="server"></asp:Label>
                                                                            <asp:TextBox ID="TB_PartB" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_PartBOperator" runat="server" Width="100px"></asp:TextBox>
                                                                            <asp:DropDownList ID="DL_VendorList" runat="server" AutoPostBack="True" DataTextField="VendorName" DataValueField="VendorCode" Width="70px" OnSelectedIndexChanged="DL_VendorList_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label104" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_PartBConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label235" runat="server" Text="缔约方合同号"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">

                                                                <asp:TextBox ID="TB_PartyConstractCode" runat="server" Width="99%"></asp:TextBox>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label113" runat="server" Text="缔约方1"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part1" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label19444" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part1Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label203" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part1ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label114" runat="server" Text="缔约方2"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part2" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part2Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label211" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part2ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label214" runat="server" Text="缔约方3"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part3" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part3Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label216" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part3ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label217" runat="server" Text="缔约方4"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part4" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label218" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part4Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label219" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part4ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label220" runat="server" Text="缔约方5"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part5" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label221" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part5Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label222" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part5ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label223" runat="server" Text="缔约方6"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part6" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label224" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part6Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label225" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part6ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label226" runat="server" Text="缔约方7"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part7" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label227" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part7Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label228" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part7ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label229" runat="server" Text="缔约方8"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part8" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part8Operator" runat="server" Width="100px"></asp:TextBox>

                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label231" Text="联系方法" runat="server"></asp:Label>：
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:TextBox ID="TB_Part8ConnectWay" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" class="formItemBgStyle">
                                                                <CKEditor:CKEditorControl ID="TB_Exception" runat="server" Width="95%" Height="100px" Visible="False" />
                                                                <CKEditor:CKEditorControl runat="server" ID="HT_Exception" Width="95%" Height="120px" Visible="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_Status" runat="server">
                                                                    <asp:ListItem Value="新建" />
                                                                    <asp:ListItem Value="评审中" />
                                                                    <asp:ListItem Value="执行中" />
                                                                    <asp:ListItem Value="完成" />
                                                                    <asp:ListItem Value="取消" />
                                                                    <asp:ListItem Value="删除" />
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none;">
                                                            <td colspan="4">
                                                                <asp:HyperLink ID="HL_RelatedDoc" runat="server" Target="_blank" Text="<%$ Resources:lang,HeTongWenDang %>"></asp:HyperLink>

                                                                <asp:HyperLink ID="HL_MakeCollaboration" runat="server" Enabled="False" NavigateUrl="~/TTMakeCollaboration.aspx" Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration %>"></asp:HyperLink>

                                                                <asp:HyperLink ID="HL_TransferProject" runat="server" Enabled="False" Target="_blank" Text="<%$ Resources:lang,ZhuanChengXiangMu %>"></asp:HyperLink>
                                                                &nbsp
                                                    <asp:HyperLink ID="HL_ConstractReviewBYWF" runat="server" Target="_blank" Text="<%$ Resources:lang,HeTongPingShenBiaoDan %>"></asp:HyperLink>
                                                                &nbsp
                                                    <asp:HyperLink ID="HL_ConstractReview" runat="server" Target="_blank" Text="<%$ Resources:lang,HeTongPingShenChangGui %>"></asp:HyperLink>
                                                                &nbsp
                                                    <asp:HyperLink ID="HL_WFTemName" runat="server" Enabled="False" Target="_blank" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan %>"></asp:HyperLink>

                                                                <asp:Label ID="LB_ConstractID" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_ConstractCode" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_Sql15" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_Sql16" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_Sql17" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel16" runat="server" HeaderText="关联信息" TabIndex="1">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel_RelatedBusiness" runat="server" Visible="false">
                                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label3333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>: </td>
                                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="HomeName" DataValueField="Type"
                                                            AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                        </asp:DropDownList></td>
                                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label7333" runat="server" Text="<%$ Resources:lang,BiaoDanGuanLianDeLiuChengMoBan%>"></asp:Label>： </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="TemName"></asp:DropDownList></td>
                                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,YunXuHouXuXiuGe%>"></asp:Label>： </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_AllowUpdate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_AllowUpdate_SelectedIndexChanged">
                                                            <asp:ListItem Value="YES" Text="YES"></asp:ListItem>
                                                            <asp:ListItem Value="NO" Text="NO"></asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:Button ID="BT_StartupBusinessForm" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaKai %>" OnClick="BT_StartupBusinessForm_Click" /></td>
                                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <iframe id="IFrame_RelatedInformation" name="IFrame_RelatedInformation" src="TTRelatedDIYBusinessForm.aspx" runat="server" style="width: 100%; overflow: auto;"></iframe>
                                    </ContentTemplate>
                                </cc1:TabPanel>

                                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="可视人员" TabIndex="2">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,KeShiRenYuan%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table width="100%" cellpadding="0" cellspacing="0">
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
                                                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong></td>
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
                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                        CssClass="inpu" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                                Font-Strikeout="False" Font-Underline="False" />
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="500px" align="center" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong></td>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,CaoZuoQuanXian%>"></asp:Label></strong></td>
                                                                        <td align="center" width="20%"><strong></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                        ShowHeader="False"
                                                        Width="100%" OnItemCommand="DataGrid12_ItemCommand">
                                                        <Columns>
                                                            <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                                DataTextField="UserName" HeaderText="名称" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:TemplateColumn HeaderText="权限">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="DL_Authority" runat="server">
                                                                        <asp:ListItem Value="NO" Text="<%$ Resources:lang,ZhiChaKan%>" />
                                                                        <asp:ListItem Value="YES" Text="<%$ Resources:lang,KeCaoZuo%>" />
                                                                        <asp:ListItem Value="ALL" Text="<%$ Resources:lang,SuoYou%>" />
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                                <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" />
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_DeleteUser" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid><br />
                                                    <asp:Button ID="BT_UserAuthoritySave" runat="server" CssClass="inpu" OnClick="BT_UserAuthoritySave_Click" Text="<%$ Resources:lang,BaoCun%>" /><br />
                                                    <br />
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="LB_tbActorGroupList" runat="server" Text="<%$ Resources:lang,ActorGroupList %>" />: </td>
                                                                        <td>（</td>
                                                                        <td>
                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,JueSeZuMingCheng%>"></asp:Label>：</td>
                                                                        <td>
                                                                            <asp:TextBox ID="TB_ActorGroupName" runat="server" Width="150px"></asp:TextBox></td>
                                                                        <td>
                                                                            <asp:Button ID="BT_FindGroup" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_FindGroup_Click" /></td>
                                                                        <td>) </td>
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
                                    </ContentTemplate>
                                </cc1:TabPanel>

                            </cc1:TabContainer>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label191" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="98%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                            Width="100%">
                                            <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="业务人员" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
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
                                                                                            <asp:Label ID="Label239" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>

                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ZhiZe %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,YongJin %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,FaFangShiJian %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,FaFangZhuangTai %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                    OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
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
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                        Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>

                                            <cc2:TabPanel ID="TabPanel7" runat="server" HeaderText="物料清单">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShangPinQingDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table align="center" width="100%">
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="LB_GoodsOwner" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="padding-right: 5px;">
                                                                <asp:Button ID="BT_CreateGoodsList" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateGoodsList_Click" />
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
                                                                                            <asp:Label ID="Label241" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label242" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>

                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label270" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                    <td width="12%" align="center"><strong>
                                                                                        <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center">

                                                                                        <strong>

                                                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label></strong></td>
                                                                                    <td align="center"><strong>
                                                                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label></strong></td>
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
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Brand" HeaderText="品牌">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText=" 关联项目" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label178" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 200px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                                valign="top" align="left">
                                                                <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                    ShowLines="True" Width="220px" NodeWrap="True">
                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                    <NodeStyle CssClass="treeNode" />
                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                </asp:TreeView>
                                                            </td>
                                                            <td valign="top" align="left">
                                                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>：<asp:TextBox ID="TB_ProjectID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddProjectID" runat="server" Text="新增" CssClass="inpu" Enabled="False"
                                                                    OnClick="BT_AddProjectID_Click" /><br />
                                                                <table width="99%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                    <td width="25%" align="center"><strong>
                                                                                        <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,LiXiangRiQi%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                    GridLines="None" OnItemCommand="DataGrid4_ItemCommand" Width="99%">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="立项日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate></ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn HeaderText="完成程度">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="LB_FinishPercent" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FinishPercent")%> '></asp:Label>%
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_DeleteProject" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                        Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                            <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText=" 关联订单">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,GuanLianShangPinXiaoShouDingDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 400px; border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px"
                                                                valign="top" align="left">
                                                                <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="150%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="25%"><strong>
                                                                                            <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,XiaoShou%>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="150%" OnItemCommand="DataGrid6_ItemCommand">
                                                                        <Columns>
                                                                            <asp:TemplateColumn HeaderText="单号">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_SOID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"SOID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="SOID" DataNavigateUrlFormatString="TTGoodsSaleOrderView.aspx?SOID={0}" DataTextField="SOName" HeaderText="名称" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="SalesCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="SalesName" HeaderText="业务员" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:HyperLinkColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid>
                                                                </div>
                                                            </td>
                                                            <td valign="top" align="left">
                                                                <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,GuanLianDingDan%>"></asp:Label>：<asp:TextBox ID="TB_GoodsSaleOrderID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddSaleOrder" runat="server" Text="新增" CssClass="inpu" Enabled="False" OnClick="BT_AddSaleOrder_Click" /><br />
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="25%"><strong>
                                                                                        <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="6">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                    ShowHeader="False"
                                                                    Width="100%" OnItemCommand="DataGrid5_ItemCommand">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="SOID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="SOID" DataNavigateUrlFormatString="TTGoodsSaleOrderView.aspx?SOID={0}"
                                                                            DataTextField="SOName" HeaderText="名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SaleTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="销售时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="SalesCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                            DataTextField="SalesName" HeaderText="业务员" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate></ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_DeleteGoodsSO" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>

                                            <cc2:TabPanel ID="TabPanel5" runat="server" HeaderText=" 关联商品采购订单" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,GuanLianShangPinCaiGouDingDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 400px; border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px" valign="top" align="left">
                                                                <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="150%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="25%"><strong>
                                                                                            <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,CaiGou%>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="150%" OnItemCommand="DataGrid7_ItemCommand">
                                                                        <Columns>
                                                                            <asp:TemplateColumn HeaderText="单号">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_POID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"POID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTGoodsPurchaseOrderView.aspx?POID={0}" DataTextField="GPOName" HeaderText="名称" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="PurManName" HeaderText="业务员" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:HyperLinkColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid>
                                                                </div>
                                                            </td>
                                                            <td valign="top" align="left">
                                                                <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,GuanLianDingDan%>"></asp:Label>：<asp:TextBox ID="TB_GoodsPurchaseOrderID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddPurchaseOrder" runat="server" Text="新增" CssClass="inpu" Enabled="False" OnClick="BT_AddPurchaseOrder_Click" /><br />
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="25%"><strong>
                                                                                        <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label143" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="6">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                    ShowHeader="False"
                                                                    Width="100%" OnItemCommand="DataGrid8_ItemCommand">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="POID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTGoodsPurchaseOrderView.aspx?POID={0}"
                                                                            DataTextField="GPOName" HeaderText="名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                            DataTextField="PurManName" HeaderText="采购员" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate></ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_DeleteGoodsPO" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
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

                                            <cc2:TabPanel ID="TabPanel6" runat="server" HeaderText=" 关联资产采购订单" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,GuanLianZiChanCaiGouDingDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 400px; border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px"
                                                                valign="top" align="left">
                                                                <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="150%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="25%"><strong>
                                                                                            <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label147" runat="server" Text="<%$ Resources:lang,CaiGou%>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="150%" OnItemCommand="DataGrid9_ItemCommand">
                                                                        <Columns>
                                                                            <asp:TemplateColumn HeaderText="单号">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_POID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"POID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTAssetPurchaseOrderView.aspx?POID={0}" DataTextField="POName" HeaderText="名称" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="PurManName" HeaderText="业务员" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:HyperLinkColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid>
                                                                </div>
                                                            </td>
                                                            <td valign="top" align="left">
                                                                <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,GuanLianDingDan%>"></asp:Label>：<asp:TextBox ID="TB_AssetPurchaseOrderID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddAssetPurchaseOrder" runat="server" Text="新增" CssClass="inpu" Enabled="False" OnClick="BT_AddAssetPurchaseOrder_Click" /><br />
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label149" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="25%"><strong>
                                                                                        <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="6">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                    ShowHeader="False"
                                                                    Width="100%" OnItemCommand="DataGrid10_ItemCommand">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="POID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTAssetPurchaseOrderView.aspx?POID={0}"
                                                                            DataTextField="POName" HeaderText="名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="PurManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                            DataTextField="PurManName" HeaderText="采购员" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate></ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_DeleteAssetPO" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
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

                                            <cc2:TabPanel ID="TabPanel12" runat="server" HeaderText=" 关联合同" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 40%; border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px"
                                                                valign="top" align="left">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong></td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label160" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong></td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label161" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid16" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="1px" OnItemCommand="DataGrid16_ItemCommand" OnPageIndexChanged="DataGrid16_PageIndexChanged" PageSize="30" Width="100%"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="合同代码">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_ConstractCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ConstractCode") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                            DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                </asp:DataGrid></td>
                                                            <td valign="top" align="left">
                                                                <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>：<asp:TextBox ID="TB_RelatedConstractCode" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddRelatedConstractCode" runat="server" Text="新增" CssClass="inpu" Enabled="False" OnClick="BT_AddRelatedConstractCode_Click" /><br />
                                                                <div id="Div8" style="text-align: left; width: 100%; height: 800px; overflow: auto;">
                                                                    <table width="140%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label163" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label166" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                        <td width="7%" align="center"><strong>
                                                                                            <asp:Label ID="Label168" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong></td>
                                                                                        <td width="6%" align="center"><strong>
                                                                                            <asp:Label ID="Label169" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label170" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong></td>
                                                                                        <td width="7%" align="center"><strong>
                                                                                            <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong></td>
                                                                                        <td width="7%" align="center"><strong>
                                                                                            <asp:Label ID="Label172" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong></td>
                                                                                        <td width="8%" align="center"><strong>
                                                                                            <asp:Label ID="Label173" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label174" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong></td>
                                                                                        <td width="8%" align="center"><strong>
                                                                                            <asp:Label ID="Label175" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong></td>
                                                                                        <td width="5%" align="center"><strong>
                                                                                            <asp:Label ID="Label176" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid17" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="False"
                                                                        Height="1px" OnItemCommand="DataGrid17_ItemCommand" PageSize="30" Width="140%"
                                                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                        <Columns>
                                                                            <asp:TemplateColumn HeaderText="合同代码">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_ConstractCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ConstractCode") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                                DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="ConstractClass" HeaderText="大类">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate></ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="SignDate" HeaderText="签订日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="StartDate" HeaderText="开始日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndDate" HeaderText="截止日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PartAOperator" HeaderText="负责人">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PartBOperator" HeaderText="负责人">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                                </ContentTemplate>
                                            </cc2:TabPanel>

                                            <cc2:TabPanel ID="TabPanel14" runat="server" HeaderText=" 合同变更" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,HeTongBianGeng%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table style="width: 100%; text-align: left;">
                                                        <tr>
                                                            <td>
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td style="width: 15%;">
                                                                            <asp:Label ID="LB_NewConstractCode" runat="server" Text="新合同号"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 30%;">
                                                                            <asp:TextBox ID="TB_NewConstractCode" runat="server" Width="99%"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: left;">
                                                                            <asp:Button ID="BT_UpdateConstractCode" runat="server" Text="<%$ Resources:lang,Update %>" CssClass="inpu" OnClick="BT_UpdateConstractCode_Click" /></td>
                                                            </td>
                                                            <td></td>
                                                            <td align="right" style="padding-right: 5px;">
                                                                <asp:Button ID="BT_CreateChange" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateChange_Click" /></td>

                                                        </tr>
                                                    </table>
                                                    </td>
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
                                                                                            <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>

                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                    <td width="15%" align="center"><strong>
                                                                                        <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                    <td width="30%" align="center"><strong>
                                                                                        <asp:Label ID="Label185" runat="server" Text="<%$ Resources:lang,BianGengNeiRong %>"></asp:Label></strong></td>
                                                                                    <td width="15%" align="center"><strong>
                                                                                        <asp:Label ID="Label186" runat="server" Text="<%$ Resources:lang,BianGengHaoJinE %>"></asp:Label></strong></td>
                                                                                    <td width="15%" align="center"><strong>
                                                                                        <asp:Label ID="Label187" runat="server" Text="<%$ Resources:lang,BianGengShiJian %>"></asp:Label></strong></td>
                                                                                    <td align="center"><strong>
                                                                                        <asp:Label ID="Label188" runat="server" Text="<%$ Resources:lang,BianGengRen %>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid18" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                    OnItemCommand="DataGrid18_ItemCommand" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ChangeType" HeaderText="变更类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ChangeContent" HeaderText="变更内容">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="AfterChangeAmount" HeaderText="变更后金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ChangeTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="OperatorName" HeaderText="变更人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"></ItemStyle>
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                        Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc2:TabPanel>
                                        </cc2:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popGoodsListWindow"
                        style="z-index: 9999; width: 980px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2223">
                            <asp:Label ID="Label79" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content100" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="60%">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>： </td>
                                                <td colspan="5" class="formItemBgStyle" style="text-align: left; width: 100px;">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Height="20px" Width="95%"></asp:TextBox>
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type"
                                                        DataValueField="Type">
                                                    </asp:DropDownList>
                                                    <td class="formItemBgStyle" style="text-align: right"></td>
                                                    <td class="formItemBgStyle" style="text-align: left"></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>： </td>
                                                <td style="text-align: right;" colspan="5" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="40px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong %>" OnClick="BT_Clear_Click" /></td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">

                                                    <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="5" style="text-align: left;">

                                                    <asp:TextBox ID="TB_Brand" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="53px">0.00</NickLee:NumberBox></td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="70px">0.00</NickLee:NumberBox></td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ChengDanShiJian %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_SaleTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5" runat="server" TargetControlID="DLC_SaleTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,SongHuoShiJian %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left" colspan="2">
                                                    <asp:TextBox ID="DLC_DeleveryTime" Width="100px" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender6" runat="server" TargetControlID="DLC_DeleveryTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle"></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="TB_SaleOrderNumber" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="53px">0.00</NickLee:NumberBox></td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                    <NickLee:NumberBox ID="TB_PurchaseOrderNubmer" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="53px">0.00</NickLee:NumberBox></td>
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
                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeShangPin %>"></asp:Label>：
                                                    <div id="Div4" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                            </td>
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
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid13_ItemCommand" CellPadding="4"
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
                                            <cc2:TabPanel ID="TabPanel10" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label519" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label208" runat="server" Text="<%$ Resources:lang,QingXuanQuShangPin%>"></asp:Label>：
                                                    <div id="Div5" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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
                                                                            <td width="35%" align="center"><strong>
                                                                                <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center">
                                                                                <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                                            </td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label213" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid14" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid14_ItemCommand" CellPadding="4"
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
                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
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
                                        </cc2:TabContainer></td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton7" runat="server" class="layui-layer-btn notTab" OnClick="BT_SaveGoods_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popSalesWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label196" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr style="display: none;">
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:Label ID="LB_SalesID" runat="server"></asp:Label></td>
                                    <td style="text-align: Right;" width="15%" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SalesName" Width="220px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ZhiWei %>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SalesDuty" Width="220px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YongJin %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Commission" runat="server" Width="80px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Precision="3">0.000</NickLee:NumberBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,FaFangShiJian %>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_GiveTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_GiveTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,FaFangZhuangTai %>"></asp:Label>：
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
                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_SalesComment" runat="server" Width="80%"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer2" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton2" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewSales_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <asp:LinkButton ID="LBT_CloseSalesWindow" CssClass="layui-layer-btn notTab" OnClick="LBT_CloseSalesWindow_Click" OnClientClick="return popClose();" runat="server">
                                <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </asp:LinkButton>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popChangeWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title3">
                            <asp:Label ID="Label198" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content3" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>


                                    <td style="text-align: Right;" width="15%" class="formItemBgStyle">
                                        <asp:Label ID="Label514" runat="server" Text="<%$ Resources:lang,BianGengLeiXing %>"></asp:Label></td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_ChangeType" runat="server">
                                            <asp:ListItem Value="甲方原因" Text="<%$ Resources:lang,JiaFangYuanYing %>" />
                                            <asp:ListItem Value="乙方原因" Text="<%$ Resources:lang,YifangYuanYing %>" />
                                            <asp:ListItem Value="双方原因" Text="<%$ Resources:lang,ShuangFangYuanYing %>" />
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_ChangeID" runat="server" Visible="false"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,BianGengNeiRong %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <CKEditor:CKEditorControl ID="CKE_ChangeContent" runat="server" Height="100px" Width="99%" Visible="False" /><CKEditor:CKEditorControl ID="CLE_ChangeContent" runat="server" Height="100px" Width="99%" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,BianGengHouJinE %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_AfterChangeAmount" runat="server" Width="150px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Precision="3">0.000</NickLee:NumberBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,BianGengShiJian %>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_ChangeTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender7" runat="server" TargetControlID="DLC_ChangeTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer3" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton3" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewChange_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><asp:LinkButton ID="LBT_CloseChangeWindow" OnClick="LBT_CloseChangeWindow_Click" OnClientClick="return popClose();" runat="server" CssClass="layui-layer-btn notTab" Text="<%$ Resources:lang,GuanBi%>"> </asp:LinkButton>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
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
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView4" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseTree" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="auto-style1">
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
