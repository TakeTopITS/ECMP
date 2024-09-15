<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTContactListView.aspx.cs"
    Inherits="TTContactListView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

           

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
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TongXunLu%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center">
                                <table style="width: 100%;">
                                    <tr>
                                        <td width="100%" align="left">
                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                Width="98%">
                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="联系人列表">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="4" cellspacing="0">
                                                            <tr>
                                                                <td width="20%" align="left">
                                                                    <span style="font-size: 10pt">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZongHeChaXunLeiXing %>"></asp:Label>：</span><asp:DropDownList ID="DL_ContactType"
                                                                        runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ContactType_SelectedIndexChanged">
                                                                        <asp:ListItem Value="客户"/>
                                                                        <asp:ListItem Value="供应商"/>
                                                                        <asp:ListItem Value="同事"/>
                                                                        <asp:ListItem Value="朋友"/>
                                                                        <asp:ListItem Value="同学"/>
                                                                        <asp:ListItem Value="亲属"/>
                                                                        <asp:ListItem Value="其它"/>
                                                                        <asp:ListItem/>
                                                                    </asp:DropDownList>
                                                                    <span style="font-size: 10pt">&nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>：</span><asp:TextBox ID="TB_ContactName"
                                                                        runat="server" Width="100px"></asp:TextBox>
                                                                    <span style="font-size: 9pt">&nbsp; <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongSi %>"></asp:Label>：<asp:TextBox ID="TB_CompanyName" runat="server"
                                                                        Width="150px"></asp:TextBox>
                                                                        &nbsp;<asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,MoHuChaXun %>" />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>

                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongSi %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BanGongDianHua %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>Email</strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server"
                                                            AutoGenerateColumns="False" Height="1px"
                                                            OnItemCommand="DataGrid1_ItemCommand" Width="100%"
                                                            CellPadding="4" ShowHeader="False"
                                                            ForeColor="#333333" GridLines="None">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="FirstName" HeaderText="姓名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Age" HeaderText="年龄">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OfficePhone" HeaderText="办公电话">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="MobilePhone" HeaderText="手机">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Email1" HeaderText="Email1">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_Select" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                        </asp:DataGrid><br />
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="联系人资料">
                                                    <ContentTemplate>
                                                        <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 100%">
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label>：
                                                                </td>
                                                                <td align="left" colspan="3" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_FirstName" runat="server" Width="220px"></asp:TextBox>
                                                                    <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right; height: 3px;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px; height: 3px;" align="left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Type" runat="server">
                                                                        <asp:ListItem Value="客户"/>
                                                                        <asp:ListItem Value="供应商"/>
                                                                        <asp:ListItem Value="同事"/>
                                                                        <asp:ListItem Value="朋友"/>
                                                                        <asp:ListItem Value="同学"/>
                                                                        <asp:ListItem Value="亲属"/>
                                                                        <asp:ListItem Value="其它"/>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 100px; text-align: right; height: 3px;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px; height: 3px;" align="left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Gender" runat="server">
                                                                        <asp:ListItem Value="男"/>
                                                                        <asp:ListItem Value="女"/>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Age" runat="server" Height="21px" Width="61px">0</asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BanGongDianHua %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_OfficePhone" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right; height: 22px;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JiaTingDianHua %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px; height: 22px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_HomePhone" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; text-align: right; height: 22px;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px; height: 22px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_MobilePhone" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right;" class="formItemBgStyle">EMail：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_EMail1" runat="server" Width="400px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,WangZhan %>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_WebSite" runat="server" Width="400px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle"> <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,IM %>"></asp:Label>:
                                                                </td>
                                                                <td colspan="3" style="width: 200px" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_QQ" runat="server"></asp:TextBox>
                                                                </td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongSi %>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Company" runat="server" Width="400px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Department" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhiWu %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Duty" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GongSiDiZhi %>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_CompanyAddress" runat="server" Width="400px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YouZhengBianMa %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_PostCode" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GuoJia %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Country" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShengFen %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 200px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_State" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ChengShi %>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 400px;" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_City" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JiaTingDiZhi %>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_HomeAddress" runat="server" Width="400px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </cc1:TabContainer>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; text-align: left;">
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server"  Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
