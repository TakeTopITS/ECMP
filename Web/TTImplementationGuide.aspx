<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTImplementationGuide.aspx.cs" Inherits="TTImplementationGuide" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/liucheng.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            text-align: left;
            font-family: Arial, sans-serif, Helvetica, Tahoma;
            font-size: 12px;
            line-height: 1.5;
            color: black;
            background-image: url(ImagesSkin/Backgroud.jpg);
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
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
                <div id="main">
                    <div class="main_inner">
                        <table border="0">
                            <tr>
                                <td>
                                    <img src="Images/xuanmokuai.png"></td>
                                <td>
                                    <img src="Images/dajiagou.png"></td>
                                <td>
                                    <img src="Images/jiandangan.png"></td>
                                <td>
                                    <img src="Images/shouquanxian.png"></td>
                                <td>
                                    <img src="Images/sheyonghu.png"></td>
                            </tr>
                            <tr>
                                <td class="title"><a href="TTSystemModuleSet.aspx">1.<asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuanMoKuai%>"></asp:Label></a></td>
                                <td class="title"><a href="TTDepartment.aspx">2.<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaJiaGou%>"></asp:Label></a></td>
                                <td class="title"><a href="TTUserInfor.aspx">3.<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JianDangAn %>"></asp:Label></a></td>
                                <td class="title"><a href="TTProModuleAuthority.aspx">4.<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShouQuanXian%>"></asp:Label></a></td>
                                <td class="title"><a href="TTSystemActiveUserSet.aspx">5.<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,SheYongHu%>"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a href="PlayVideo/TakeTopPlay_player.html?MP4Name=SelectModule.mp4" target="_blank">
                                        <img src="Images/shipin.png" width="80"></a>
                                </td>
                                <td align="center">
                                    <a href="PlayVideo/TakeTopPlay_player.html?MP4Name=BuildArchitecture.mp4" target="_blank">
                                        <img src="Images/shipin.png" width="80"></a>
                                </td>
                                <td align="center">
                                    <a href="PlayVideo/TakeTopPlay_player.html?MP4Name=AddUserInformation.mp4" target="_blank">
                                        <img src="Images/shipin.png" width="80"></a>
                                </td>
                                <td align="center">
                                    <a href="PlayVideo/TakeTopPlay_player.html?MP4Name=Authorization.mp4" target="_blank">
                                        <img src="Images/shipin.png" width="80"></a>
                                </td>
                                <td align="center">
                                    <a href="PlayVideo/TakeTopPlay_player.html?MP4Name=SetSystemUser.mp4" target="_blank">
                                        <img src="Images/shipin.png" width="80"></a>
                                </td>
                            </tr>

                            <%--                         <tr>
                                <td class="title" align="center" colspan="5">
                                    <br />
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Text="关键模组培训视频下载"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="title"  align="center"><a href="https://www.taketopits.com/download/TrainVideo/KeyModule/Workflow.zip">流程管理</a></td>
                                <td class="title"  align="center"><a href="https://www.taketopits.com/download/TrainVideo/KeyModule/Knowledget.zip">知识管理</a></td>
                                <td class="title"  align="center"><a href="https://www.taketopits.com/download/TrainVideo/KeyModule/CRM.zip">客户管理</a></td>
                                <td class="title"  align="center"><a href="https://www.taketopits.com/download/TrainVideo/KeyModule/Contract.zip">合同管理</a></td>
                                <td class="title"  align="center"><a href="https://www.taketopits.com/download/TrainVideo/KeyModule/ProjectPlan.zip">项目计划</a></td>
                            </tr>--%>
                        </table>
                    </div>
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

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
