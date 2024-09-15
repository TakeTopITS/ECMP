<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeCustomerByAgency.aspx.cs" Inherits="TTMakeCustomerByAgency" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeHuBeiAn%>"></asp:Label>
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
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px"
                                                valign="top" align="center">

                                                <table cellpadding="0" cellspacing="0" width="100%" style="padding-bottom: 5px;">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_CustCode" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_CustName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>

                                                        <td align="left">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_IndustryTypeFind" runat="server" Width="120px"></asp:TextBox>

                                                            <asp:DropDownList ID="DL_IndustryTypeFind" runat="server" AutoPostBack="True" DataTextField="Type"
                                                                DataValueField="Type" OnSelectedIndexChanged="DL_IndustryTypeFind_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />
                                                        </td>

                                                        <td align="right" width="30%">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />

                                                        </td>
                                                    </tr>


                                                </table>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>

                                                                    <%-- <td width="5%" align="center">
                                                                         &nbsp;
                                                                      </td>--%>
                                                                    <td width="7%" align="center"><strong>&nbsp;</strong> </td>
                                                                    <td width="6%" align="center">&nbsp;
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label></td>
                                                                                    <td>
                                                                                        <asp:Button ID="BT_SortByAreaAddress" CssClass="inpuUpDown" runat="server" OnClick="BT_SortByAreaAddress_Click" />
                                                                                        <asp:Label ID="LB_UpDown" runat="server" Text="UP" Visible="false"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BeiAnZhuangTai %>"></asp:Label></strong></td>

                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center">
                                                                        <strong>&nbsp;
                                                                        </strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    ShowHeader="false" Height="1px" OnItemCommand="DataGrid2_ItemCommand" PageSize="25"
                                                    OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="100%" CellPadding="4"
                                                    ForeColor="#333333" GridLines="None">
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
                                                        <asp:BoundColumn DataField="CustomerCode" HeaderText="客户代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                            DataTextField="CustomerName" HeaderText="客户名称" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:HyperLinkColumn>
                                                        <%--   <asp:TemplateColumn HeaderText="补充信息">
                                                            <ItemTemplate>
                                                             <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Customer&RelatedID=<%# getCustomerID(Eval("CustomerCode").ToString()) %>&IdentifyString=<%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Customer", getCustomerID(Eval("CustomerCode").ToString()))) %>'  >
                                                                <asp:Label ID="LB_BCXX" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label> </a>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <a href='TTCustomerQuestionHandleDetailFromCustomer.aspx?CustomerCode=<%# Eval("CustomerCode").ToString() %>'>
                                                                    <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,ZZKeHuFuWu%>"></asp:Label>
                                                                </a>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="SubmitReview">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_SubmitReview" CommandName="SubmitReview" runat="server" Text="提交备案"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ContactName" HeaderText="联系人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Tel1" HeaderText="电话">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AreaAddress" HeaderText="区域">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="RegistrationAddressCN" HeaderText="地址">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReviewStatus" HeaderText="状态">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CreateDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="建立日期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTContactList.aspx?RelatedType=Customer&RelatedID={0}"
                                                            HeaderText="联系人" Target="_blank" Text="<%$ Resources:lang,LianXiRen %>">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" />
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
                        <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="96%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" colspan="4">
                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc1:TabPanel ID="TabPanel9" runat="server" HeaderText="客户档案" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,KeHuZiLiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table style="width: 96%; text-align: center;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                        <%--  <tr>
                                                            <td colspan="4" style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Button ID="BT_SubmitReview" runat="server" CssClass="inpu" Enabled="False" Text="提交备案" OnClick="BT_SubmitReview_Click" />
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td style="text-align: right;" width="15%" class="formItemBgStyle">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" width="30%" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_CustomerCode" runat="server" Width="200px"></asp:TextBox>
                                                                <span style="color: #ff0000">*</span>
                                                                <asp:Label ID="LB_CustomerCode" runat="server" Visible="false"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,GSCSNDDASWXH %>"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right;" width="20%" class="formItemBgStyle">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" width="35%" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_CustomerName" runat="server" Style="margin-left: 0px" Width="95%"></asp:TextBox>
                                                                <span style="color: #ff0000">*</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" width="15%" class="formItemBgStyle">


                                                                <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,JianCheng %>"></asp:Label>： 

                                                            </td>


                                                            <td style="text-align: left;" width="30%" class="formItemBgStyle">


                                                                <asp:TextBox ID="TB_SimpleName" runat="server" Width="200px"></asp:TextBox>

                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YingWenMing %>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_CustomerEnglishName" runat="server" Height="20px" Width="95%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HangYeLeiXing %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Type" runat="server"></asp:TextBox>
                                                                <asp:DropDownList ID="DL_IndustryType" runat="server" Width="120px" AutoPostBack="True"
                                                                    DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DL_IndustryType_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <span style="color: #ff0000">*</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KaiHuYinHang %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Bank" runat="server" Width="95%"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YinHangZhangHao %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_BankAccount" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_InvoiceAddress" TextMode="MultiLine" Height="60px" runat="server"
                                                                    Width="95%"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen %>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_ContactName" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DianHuaYi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Tel1" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DianHuaEr %>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Tel2" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">EMail：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_EMailAddress" runat="server" Width="95%"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YouZhengBianMa %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_ZP" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ChuanZhen %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Fax" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,WangZhi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_WebSite" runat="server" Width="99%"></asp:TextBox>
                                                            </td>

                                                            <td style="text-align: right;" class="formItemBgStyle">


                                                                <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,BanGongWangZi %>"></asp:Label>： 

                                                            </td>


                                                            <td style="text-align: left;" class="formItemBgStyle">


                                                                <asp:TextBox ID="TB_WorkSiteURL" runat="server" Width="99%"></asp:TextBox>


                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_SalePerson" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                    Height="25px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZheKouLv %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Discount" runat="server" Height="23px" Width="44px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XinYongDengJi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_CreditRate" runat="server" Height="22px" Width="44px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuoJia %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Country" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShengFen %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_State" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ChengShi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_City" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label3111" runat="server" Text="<%$ Resources:lang,QuYu %>"></asp:Label>：
                                                            </td>

                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_AreaAddress" runat="server" Width="99%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XiangXiDiZhi %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_AddressCN" Height="60px" TextMode="MultiLine" runat="server"
                                                                    Width="95%"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YingWenDiZhi %>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_AddressEN" runat="server" Height="60px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuiShuBuMen %>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <asp:Label ID="LB_BelongDepartCode" runat="server"></asp:Label>
                                                                <asp:Label ID="LB_BelongDepartName" runat="server"></asp:Label>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,JianLiShiJian %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_CreateDate" runat="server"></asp:Label>
                                                                &nbsp;&nbsp;
                                                                <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,BeiAnZhuangTai %>"></asp:Label>
                                                                :

                                                            <asp:Label ID="LB_ReviewStatus" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Comment" runat="server" Height="60px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr style="display: none;">
                                                            <td style="text-align: right;" class="formItemBgStyle">&nbsp;
                                                            </td>
                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">&nbsp;&nbsp;
                                                                <asp:HyperLink ID="HL_RelatedContactInfor"
                                                                    runat="server" Enabled="False" Target="_blank">
                                                                    ---><asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,XiangGuanLianXiRen %>"></asp:Label>
                                                                </asp:HyperLink>
                                                                &nbsp;&nbsp;<asp:HyperLink ID="HL_TransferProject" runat="server" Enabled="False" Target="_blank">
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhuanChengXiangMu %>" Visible="False"></asp:Label>
                                                                </asp:HyperLink>
                                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>


                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="相关项目" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XiangGuanXiangMu%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table>
                                                        <tr style="display: none;">
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,XiangMuHao %>"></asp:Label>： </td>
                                                                        <td>
                                                                            <asp:TextBox ID="TB_ProjectID" runat="server" Width="150px"></asp:TextBox></td>
                                                                        <td>
                                                                            <asp:Button ID="BT_RelatedProject" runat="server" CssClass="inpu" OnClick="BT_RelatedProject_Click"
                                                                                Text="<%$ Resources:lang,GuanLian %>" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="8%"><strong>
                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,KaiShiRiQi %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieShuRiQi %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,LiXiangRiQi %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="9%"><strong>
                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,WanChengChengDu %>"></asp:Label></strong> </td>
                                                                        <td align="center" width="8%"><strong>
                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShanChu %>"></asp:Label></strong> </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid4_ItemCommand"
                                                        ShowHeader="False" Width="100%">

                                                        <Columns>
                                                            <asp:BoundColumn DataField="ProjectID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="立项日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="完成程度">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="LB_FinishPercent" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FinishPercent")%> '></asp:Label>%
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateColumn>
                                                            <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:ButtonColumn>
                                                        </Columns>
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="可视人员" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,KeShiRenYuan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="900px" cellpadding="0" cellspacing="0">
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
                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> </td>
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
                                                                            </asp:DataGrid></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="500px" align="left" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                                                <asp:Repeater ID="RP_CustomerMember" runat="server" OnItemCommand="RP_CustomerMember_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                            Width="70px" />
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <br />
                                                                <br />
                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('http://localhost:4783/Web/ImagesSkin/titleBG.jpg')">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="LB_tbActorGroupList" runat="server" Text="<%$ Resources:lang,ActorGroupList %>" />: </td>
                                                                                    <td>（</td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JueSeZuMingCheng %>"></asp:Label>：</td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="TB_ActorGroupName" runat="server" Width="150px"></asp:TextBox></td>
                                                                                    <td>
                                                                                        <asp:Button ID="BT_FindGroup" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindGroup_Click" /></td>
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

                                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText=" 客服记录" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="5%" align="center"><strong>
                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                        <td width="40%" align="center"><strong>
                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label></strong> </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong> </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong> </td>
                                                                        <td width="5%" align="center"><strong></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                        Height="1px" Width="100%"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None">

                                                        <Columns>
                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleRecordList.aspx?ID={0}"
                                                                DataTextField="Question" HeaderText="问题" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="RecorderCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                DataTextField="RecorderCode" HeaderText="记录人" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTCustomerQuestionRelatedDoc.aspx?RelatedID={0}") %>'
                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel7" runat="server" HeaderText="关联合同">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table align="center" cellpadding="0" cellspacing="0" width="98%">
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
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
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong> </td>
                                                                                    <td width="17%" align="center"><strong>
                                                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong> </td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>
                                                                                    <td width="5%" align="center"><strong>
                                                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong> </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractView.aspx?ConstractCode={0}"
                                                                            DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="SignDate" HeaderText="签订日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>

                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                </asp:DataGrid><asp:Label ID="Label4" runat="server" Visible="False"></asp:Label><asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                    Visible="False" Width="57px"></asp:Label><asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                        Visible="False" Width="57px"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="物料销售订单记录" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,ShangPinXiaoShouDingDanJiLu%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="25%"><strong>
                                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                        ShowHeader="False"
                                                        Width="100%">
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
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="关联物料退货单" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,GuanLianShangPinTuiHuoDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="15%" align="center"><strong>
                                                                            <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong> </td>
                                                                        <td width="40%" align="center"><strong>
                                                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                        <td width="15%" align="center"><strong>
                                                                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>
                                                                        <td width="15%" align="center"><strong>
                                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong> </td>
                                                                        <td width="15%" align="center"><strong>
                                                                            <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong> </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False"
                                                        ShowHeader="False" Height="1px"
                                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                        <Columns>
                                                            <asp:BoundColumn DataField="ROID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="ROID" DataNavigateUrlFormatString="TTGoodsReturnOrderView.aspx?ROID={0}"
                                                                DataTextField="ReturnName" HeaderText="名称" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="报价单">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,XiangGuanBaoJiaDan%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="40%"><strong>
                                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,BaoJiaShiJian%>"></asp:Label></strong> </td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                        ShowHeader="False"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:BoundColumn DataField="QOID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="QOID" DataNavigateUrlFormatString="TTGoodsSaleQuotationOrderView.aspx?QOID={0}"
                                                                DataTextField="QOName" HeaderText="名称" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="QuotationTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="报价时间">
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
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel8" runat="server" HeaderText=" 物料保修">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ShangPinBaoXiu%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,ZhongDuanKeHu%>"></asp:Label></strong> </td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,ChangJia%>"></asp:Label></strong> </td>
                                                                                    <td width="6%" align="center"><strong>
                                                                                        <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,ChuKuKeHu%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,ChuKuShiJian%>"></asp:Label></strong> </td>
                                                                                    <td width="7%" align="center"><strong>
                                                                                        <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label></strong> </td>
                                                                                    <td width="8%" align="center"><strong>
                                                                                        <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,DaoQiShiJian%>"></asp:Label></strong> </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid9_ItemCommand"
                                                                    ShowHeader="False" Height="1px"
                                                                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="系列号">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_GoodsSN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SN") %>'
                                                                                    class="inpuLong" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="FinalCustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                                            DataTextField="FinalCustomerName" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ShipmentNO" HeaderText="出库单号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                                            DataTextField="CustomerName" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="ShipTime" HeaderText="出库时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="WarrantyPeriod" HeaderText="保修期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="WarrantyEndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,ShouHouRenWu%>"></asp:Label>： </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="9%"><strong>
                                                                                        <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="12%"><strong>
                                                                                        <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False"
                                                                    ShowHeader="False" OnItemCommand="DataGrid10_ItemCommand"
                                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="编号">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_TaskID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TaskID") %>'
                                                                                    CssClass="inpu" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Task" HeaderText="任务">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="FinishPercent" HeaderText="完成程度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,LingYongPeiJian%>"></asp:Label>： </td>
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
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                    <td width="20%" align="center"><strong>
                                                                                        <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                                                    <td width="20%" align="center"><strong>
                                                                                        <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong> </td>
                                                                                    <td width="10%" align="center"><strong>
                                                                                        <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,ChangJia%>"></asp:Label></strong> </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                    Height="30px" Width="100%" ID="DataGrid11">

                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <ItemStyle CssClass="itemStyle"></ItemStyle>
                                                                    <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                                                </asp:DataGrid><asp:Label ID="LB_UserCode" runat="server"
                                                                    Visible="False"></asp:Label><asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_UserName" runat="server"
                                                                        Visible="False"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                        <br />
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
