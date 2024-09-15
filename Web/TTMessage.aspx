<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMessage.aspx.cs" Inherits="TTMessage" %>

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
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <table style="border-collapse: collapse; margin: 0px auto; width: 780px; height: 20px">
                    <tr>
                        <td style="vertical-align: bottom; text-align: right; width: 180px; height: 207px;">
                            <table style="width: 170px">
                                <tr>
                                    <td style="width: 130px; height: 8px; text-align: left">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YiYueDuDeXinWen%>"></asp:Label>：
                                    </td>
                                    <td style="width: 50px; height: 8px; text-align: left">
                                        <asp:HyperLink ID="HL_HeadLine" runat="server" Font-Size="10pt" ForeColor="Red" NavigateUrl="~/TTHeadLine.aspx"
                                            Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 8px; text-align: left">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YaoChuLiDeXieZuo%>"></asp:Label>：
                                    </td>
                                    <td style="width: 50px; height: 8px; text-align: left">
                                        <asp:HyperLink ID="HL_Collaboration" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTCollaborationManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 8px; text-align: left">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YaoShenHeDeShenQing%>"></asp:Label>：
                                    </td>
                                    <td style="width: 50px; height: 8px; text-align: left">
                                        <asp:HyperLink ID="HL_UnCheckWL" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTMeetingManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WeiYueDuDeYouJian%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:HyperLink ID="HL_UNReadEMail" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTMeetingManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YaoCanJiaDeHuiYi%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:HyperLink ID="HL_UNAttendMeeting" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTMeetingManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaiChuLiDeFengXian%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left">
                                        <asp:HyperLink ID="HL_UNHandledRisk" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTProjectRiskView.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left;">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaiChuLiDeRenWu%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left;">
                                        <asp:HyperLink ID="HL_UNHnadledTask" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTMyProjectTask.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 11px; text-align: left;">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaiChuLiDeXuQiu%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 11px; text-align: left;">
                                        <asp:HyperLink ID="HL_UNHandledReq" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTReqManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 18px; text-align: left;">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiChuLiDeXiangMu%>"></asp:Label>：</span>
                                    </td>
                                    <td style="width: 50px; height: 18px; text-align: left;">
                                        <asp:HyperLink ID="HL_UNHandledPro" runat="server" Font-Size="10pt" ForeColor="Red"
                                            NavigateUrl="~/TTProjectManage.aspx" Target="_blank">0</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
