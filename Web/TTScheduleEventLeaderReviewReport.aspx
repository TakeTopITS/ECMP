<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTScheduleEventLeaderReviewReport.aspx.cs" Inherits="TTScheduleEventLeaderReviewReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

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
                    <table width="100%">
                        <tr>
                            <td width="" align="right">
                                <a href="#" onclick="preview1()">
                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                </a>
                            </td>
                        </tr>
                    </table>
                    <!--startprint1-->
                    <table cellpadding="0" cellspacing="0" width="980" class="bian">
                        <tr>
                            <td align="center" height="31" style="font-size: x-large">
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RiCheng%>"></asp:Label>:
                                            <asp:Label ID="LB_ScheduleID" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="LB_ScheduleName" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
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
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>
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
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="70%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,PingHeRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label></strong>
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
                    <!--endprint1-->
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
