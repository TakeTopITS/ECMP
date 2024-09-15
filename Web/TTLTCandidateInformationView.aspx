<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTLTCandidateInformationView.aspx.cs" Inherits="TTLTCandidateInformationView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 145px;
        }
    </style>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CandidateInformation%>"></asp:Label>
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
                    <td style="padding-top: 5px;" align="center">
                        <table border="0" width="550px">
                            <tr>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:DataList ID="DataList2" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="550px">
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Gender") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Age") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"CurrentDuty") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Company") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Department") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"MobilePhone") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"CreateTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"BelongDepartName") %>
                                                    </td>
                                                </tr>
                                            </table>

                                        </ItemTemplate>
                                    </asp:DataList></td>
                                <td style="text-align: left;" class="auto-style1">
                                    <asp:Image ID="IM_MemberPhoto" runat="server" Height="140px" Width="154px" AlternateText="Candidate Photo"
                                        ImageAlign="Left" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 5px;" align="center">
                          <asp:DataList ID="DataList1" runat="server" Width="1080" CellPadding="0" ForeColor="#333333">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            
                            <ItemStyle CssClass="itemStyle" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table width="100%" class="bian" cellpadding="5" cellspacing="0">
                                    <tr>

                                        <td style="text-align: left;">
                                            <%# DataBinder.Eval(Container.DataItem,"Brief") %>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
