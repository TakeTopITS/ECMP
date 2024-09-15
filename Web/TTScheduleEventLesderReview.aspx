<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTScheduleEventLesderReview.aspx.cs" Inherits="TTScheduleEventLesderReview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

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
                                            <table width="150" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RiChengPingHe%>"></asp:Label>
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
                            <td valign="top">
                                <table style="width: 100%; padding: 5px 5px 5px 5px;">
                                    <tr>
                                        <td class="tdFullBorder" style="text-align: left; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,RiCheng%>"></asp:Label><strong>:
                                            <asp:Label ID="LB_ScheduleID" runat="server"></asp:Label>
                                            <asp:Label ID="LB_ScheduleName" runat="server"></asp:Label></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <table>
                                    <tr>
                                        <td><strong>
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>:<asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label></strong></td>
                                        <td>
                                            <asp:DropDownList ID="DL_Type" runat="server">
                                                <asp:ListItem Value="WEEK" Text="<%$ Resources:lang,ZhouPingShen%>"/>
                                                <asp:ListItem Value="DAY" Text="<%$ Resources:lang,TianPingShen%>"/>
                                            </asp:DropDownList>
                                        </td>
                                        <td>

                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,PingFen%>"></asp:Label>：</td>
                                        <td>
                                            <NickLee:NumberBox ID="NB_Scoring" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="80px">0.00</NickLee:NumberBox>
                                        </td>
                                    </tr>
                                </table>


                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <CKEditor:CKEditorControl ID="HE_LeaderReview" runat="server" Height="160px" Width="95%" Visible="False" />
                                <CKEditor:CKEditorControl runat="server" ID="HT_LeaderReview" Width="95%" Height="160px" Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <br />
                                <asp:Button ID="BT_Summit" runat="server" OnClick="BT_Summit_Click" Text="<%$ Resources:lang,TiJiao%>" CssClass="inpu" />
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <br />
                                <strong>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,WoDePingHeYiJian%>"></asp:Label>:</strong>（  
                                <asp:HyperLink ID="HL_ReviewReport" runat="server" Target="_blank">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,SuoYouYiJian%>"></asp:Label></asp:HyperLink>）
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <asp:DataList ID="DataList1" runat="server" Width="90%" CellPadding="0" ForeColor="#333333">
                                    <ItemTemplate>
                                        <table style="width: 100%;" cellpadding="4" cellspacing="0">
                                            <tr>
                                                <td style="width: 10%; text-align: center" class="tdLeft">
                                                    <%# DataBinder.Eval(Container.DataItem,"ReviewID") %>
                                                </td>
                                                <td style="width: 70%; text-align: center" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem ,"ReviewTime","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td style="width: 20%; text-align: center" class="tdRight">
                                                    <%# DataBinder.Eval(Container.DataItem,"LeaderName") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: center" class="tdLeft">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>
                                                </td>
                                                <td style="width: 70%; text-align: left" class="tdRight">
                                                    <%#DataBinder .Eval (Container .DataItem ,"Review") %>
                                                </td>
                                                <td style="width: 20%; text-align: center" class="tdRight">
                                                    <%# DataBinder.Eval(Container.DataItem,"Scoring") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderTemplate>
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
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="70%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PingHeRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    
                                    <ItemStyle CssClass="itemStyle" />
                                </asp:DataList>
                                <br />
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
