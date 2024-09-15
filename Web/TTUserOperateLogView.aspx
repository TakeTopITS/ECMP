<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserOperateLogView.aspx.cs" Inherits="TTUserOperateLogView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目工作日志</title>
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuoRiZhi%>"></asp:Label>
                            </td>
                            <td>（</td>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td align="right">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                    runat="server" TargetControlID="DLC_EndDate">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td align="right">
                                <asp:Button ID="BT_DateFind" runat="server" CssClass="inpu" Font-Size="10pt" OnClick="BT_DateFind_Click"
                                    Text="<%$ Resources:lang,ChaXun%>" />
                            </td>
                            <td>&nbsp;&nbsp;</td>
                            <td>
                                <a href="#" onclick="preview1()">
                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                </a>）
                            </td>
                        </tr>
                    </table>
                    <!--startprint1-->
                    <table cellpadding="0" cellspacing="0" width="980" class="bian">
                        <tr>
                            <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                <br />
                                <br />
                                <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="center" style="padding: 5px 5px 5px 5px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td colspan="2" style="background: #f0f0f0; text-align: left; width: 65%; height: 25px;">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChaXunFanWeiShi%>"></asp:Label><asp:Label ID="LB_QueryScope" runat="server"
                                                            Font-Underline="True"></asp:Label>
                                                    </td>
                                                    <td colspan="2" style="background: #f0f0f0; text-align: right; width: 35%; height: 25px;">
                                                        <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" Visible="false" />
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        &nbsp;
                                                    <asp:Label ID="LB_UserName" runat="server" Font-Size="9pt" Visible="false"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="padding: 5px 5px 5px 5px;">
                                            <table width="100%" cellpadding="0" cellspacing="0">
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
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>">></asp:Label></strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaiMa%>">></asp:Label></strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingMing%>">></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="IP">IP</asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="30%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaoZuoShiJian%>">></asp:Label></strong>
                                                                            </td>

                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataKeyField="ID"
                                                            ShowHeader="false" ForeColor="#333333" Width="100%" BorderWidth="0">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderTemplate>
                                                            </HeaderTemplate>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemTemplate>
                                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td style="width: 10%; text-align: center" class="tdLeft">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                        </td>

                                                                        <td style="width: 20%; text-align: center" class="tdLeft">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"UserCode") %>
                                                                        </td>
                                                                        <td style="width: 20%; text-align: center" class="tdLeft">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                        </td>
                                                                        <td style="width: 20%; text-align: center" class="tdLeft">
                                                                            <%#DataBinder.Eval(Container.DataItem, "UserIP")%>
                                                                        </td>
                                                                        <td style="width: 30%; text-align: center" class="tdLeft">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"OperateTime") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" valign="top" style="width: 10%; padding-left: 5px" class="tdLeft">
                                                                            <span style="font-size: 10pt">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuoYuJu%>">></asp:Label></span>
                                                                        </td>
                                                                        <td colspan="4" valign="top" style="text-align: left; padding-left: 5px; word-break: break-all;"
                                                                            class="tdLeft">
                                                                            <span style="font-size: 9pt">&nbsp;<%#DataBinder .Eval (Container .DataItem ,"OperateContent") %></span></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>

                                                            <ItemStyle BackColor="#EFF3FB" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        </asp:DataList>
                                                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                            <tr>
                                                                <td colspan="11" class="tdTopLine">&nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
