<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerManagement.aspx.cs" Inherits="TTCustomerManagement" %>

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
            min-width: 1400px;
            width: expression (document.body.clientWidth <= 1300? "1300px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" width="100%">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>

                                                        <td align="left">
                                                            <table>
                                                                <tr>
                                                                    <td align="left">（<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_CustCode" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>

                                                                    <td align="left">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_CustName" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>

                                                                    <td align="left">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_IndustryTypeFind" runat="server" Width="120px"></asp:TextBox>
                                                                        <asp:DropDownList ID="DL_IndustryTypeFind" runat="server" AutoPostBack="True" DataTextField="Type"
                                                                            DataValueField="Type" OnSelectedIndexChanged="DL_IndustryTypeFind_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_ContactPerson" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FenGuanDaiLiShang%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_AgencyName" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_AreaAddress" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_State" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_City" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />）
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
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                        <cc1:TabPanel ID="TabPanel9" runat="server" HeaderText="客户档案" TabIndex="0">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,KeHuZiLiao%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <br />
                                                <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">&nbsp;
                                                                                </td>
                                                                                <td width="7%" align="center"><strong>&nbsp;</strong> </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LianXiRen %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,FenGuanDaiLiShang%>"></asp:Label>

                                                                                </strong></td>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>

                                                                                </strong></td>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>

                                                                                </strong></td>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>

                                                                                </strong></td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DianHua %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>EMail</strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong>
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
                                                                ShowHeader="False" Height="1px" PageSize="25"
                                                                OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="CustomerCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                                        DataTextField="CustomerName" HeaderText="客户名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="补充信息">
                                                                        <ItemTemplate>
                                                                            <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Customer&RelatedID=<%# getCustomerID(Eval("CustomerCode").ToString()) %>&IdentifyString=<%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Customer", getCustomerID(Eval("CustomerCode").ToString()))) %>'>
                                                                                <asp:Label ID="LB_BCXX" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                                                            </a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <a href='TTCustomerQuestionHandleDetailFromCustomer.aspx?CustomerCode=<%# Eval("CustomerCode").ToString() %>'>
                                                                                <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,ZZKeHuFuWu%>"></asp:Label>
                                                                            </a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ContactName" HeaderText="联系人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BelongAgencyName" HeaderText="分管代理商">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="AreaAddress" HeaderText="区域">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="State" HeaderText="省份">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="City" HeaderText="城市">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Tel1" HeaderText="电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EmailAddress" HeaderText="EMail">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="RegistrationAddressCN" HeaderText="地址">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
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

                                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="客户备案" TabIndex="0">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,KeHuBeiAn%>"></asp:Label>
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
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center"><strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                    <td width="7%" align="center"><strong>&nbsp;</strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuangJianRen %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LianXiRen %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DianHua %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>EMail</strong> </td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BeiAnZhuangTai %>"></asp:Label></strong></td>
                                                                    <td width="5%" align="center"><strong>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TianShu %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShiJian %>"></asp:Label></strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Height="1px" AllowPaging="True" PageSize="30" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                    ShowHeader="False" Width="100%" GridLines="None" CellPadding="4" ForeColor="#333333">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="CustomerCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoViewForReview.aspx?CustomerCode={0}"
                                                            DataTextField="CustomerName" HeaderText="客户名称" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:HyperLinkColumn>

                                                        <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerQuestionRecord.aspx?CustomerCode={0}"
                                                            Text="服务需求" HeaderText="问题" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                            DataTextField="CreatorName" HeaderText="创建人" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="ContactName" HeaderText="联系人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Tel1" HeaderText="电话">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EmailAddress" HeaderText="EMail">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReviewStatus" HeaderText="状态">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="天数">
                                                            <ItemTemplate>
                                                                <%# GetIntervalDaysByNow(Eval("CreateDate").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="CreateDate" HeaderText="时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid><asp:Label ID="Label18" runat="server" Visible="False"></asp:Label><asp:Label ID="Label19" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
