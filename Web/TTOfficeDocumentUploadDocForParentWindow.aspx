<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTOfficeDocumentUploadDocForParentWindow.aspx.cs" Inherits="TTOfficeDocumentUploadDocForParentWindow" %>

<!DOCTYPE html>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script>
        const { encode } = require("querystring");

        function SetDocURL(varDocURL) {

            /*alert(varDocURL);*/

            varDocURL = varDocURL.replace(/TAKETOP888888/g, "/");


            ////用于PageOffice
            //window.parent.document.getElementById('TabContainer4_TabPanel15_HL_ConstractMainDoc').href = "javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=" + varDocURL + "', 'fullscreen=yes;');";

            window.parent.document.getElementById('HL_ContentDocURL').href = varDocURL;

            window.parent.document.getElementById('TB_ContentDocURL').value = varDocURL;

            CloseLayer();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="padding-top: 40px; text-align: center; width: 100%;">
                            <table>
                                <tr>
                                    <td>
                                        <Upload:InputFile ID="AttachFile" runat="server" Width="300px" />
                                        <br />
                                        <div id="ProgressBar">
                                            <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                            </Upload:ProgressBar>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnUP" runat="server" CssClass="inpu" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnUP" />
                    </Triggers>
                </asp:UpdatePanel>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
