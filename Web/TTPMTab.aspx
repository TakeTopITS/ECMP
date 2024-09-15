<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPMTab.aspx.cs" Inherits="TTPMTab" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />--%>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style>
        * {
            font-family: 'Work Sans', sans-serif;
        }

        html, body {
            height: 100%;
            color: #1a1b1c;
        }

        body {
            background-color: #FFFFFF
        }


        label, a {
            cursor: pointer;
            user-select: none;
            text-decoration: none;
            display: inline-block;
            color: inherit;
            transition: border 0.2s;
            border-bottom: 5px solid rgba(142, 68, 173, 0.2);
            padding: 3px 2px;
        }

            label:hover, a:hover {
                border-bottom-color: #9b59b6;
            }

        .layout {
            display: grid;
            height: 100%;
            width: 100%;
            overflow: hidden;
            grid-template-rows: 50px 1fr;
            grid-template-columns: 1fr 1fr 1fr;
            border-radius: 12px 0px 0px 0px;
        }

        input[type="radio"] {
            display: none;
        }

        label.nav {
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border-bottom: 2px solid #8e44ad;
            background-color:lightgreen;
            user-select: none;
            transition: background 0.4s, padding-left 0.2s;
            padding-left: 0;
        }

        input[type="radio"]:checked + .page + label.nav {
            background-color:#2e8ded;
            color: #ffffff;
            padding-left: 20px;
        }

            input[type="radio"]:checked + .page + label.nav span {
                padding-left: 20px;
            }

            input[type="radio"]:checked + .page + label.nav svg {
                opacity: 1;
            }

        label.nav span {
            padding-left: 0px;
            position: relative;
        }

        label.nav svg {
            left: 0;
            top: -3px;
            position: absolute;
            width: 15px;
            opacity: 0;
            transition: opacity 0.2s;
        }

        .page {
            grid-column-start: 1;
            grid-row-start: 2;
            grid-column-end: span 3;
            padding: 0px 20px;
            display: flex;
            align-items: center;
        }

        .page-contents > * {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.2s, transform 0.2s;
        }

            .page-contents > *:nth-child(1) {
                transition-delay: 0.4s;
            }

            .page-contents > *:nth-child(2) {
                transition-delay: 0.6s;
            }

            .page-contents > *:nth-child(3) {
                transition-delay: 0.8s;
            }

            .page-contents > *:nth-child(4) {
                transition-delay: 1s;
            }

            .page-contents > *:nth-child(5) {
                transition-delay: 1.2s;
            }

            .page-contents > *:nth-child(6) {
                transition-delay: 1.4s;
            }

            .page-contents > *:nth-child(7) {
                transition-delay: 1.6s;
            }

            .page-contents > *:nth-child(8) {
                transition-delay: 1.8s;
            }

            .page-contents > *:nth-child(9) {
                transition-delay: 2s;
            }

            .page-contents > *:nth-child(10) {
                transition-delay: 2.2s;
            }

            .page-contents > *:nth-child(11) {
                transition-delay: 2.4s;
            }

            .page-contents > *:nth-child(12) {
                transition-delay: 2.6s;
            }

            .page-contents > *:nth-child(13) {
                transition-delay: 2.8s;
            }

            .page-contents > *:nth-child(14) {
                transition-delay: 3s;
            }

            .page-contents > *:nth-child(15) {
                transition-delay: 3.2s;
            }

            .page-contents > *:nth-child(16) {
                transition-delay: 3.4s;
            }

            .page-contents > *:nth-child(17) {
                transition-delay: 3.6s;
            }

            .page-contents > *:nth-child(18) {
                transition-delay: 3.8s;
            }

            .page-contents > *:nth-child(19) {
                transition-delay: 4s;
            }

            .page-contents > *:nth-child(20) {
                transition-delay: 4.2s;
            }

        input[type="radio"] + .page {
            transition: transform 0.2s;
            transform: translateX(100%);
        }

        input[type="radio"]:checked + .page {
            transform: translateX(0%);
        }

            input[type="radio"]:checked + .page .page-contents > * {
                opacity: 1;
                transform: translateY(0px);
            }

        .page-contents {
            max-width: 30%;
            width: 100px;
            margin: 0 auto;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="layout">
                    <input name="nav" type="radio" class="nav home-radio" id="home" checked="checked" />
                    <div class="page home-page">
                        <div class="page-contents">
                            <h1>
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MyUnderTakeProject%>"></asp:Label>
                            </h1>
                        </div>
                    </div>
                    <label class="nav" for="home" onclick="JavaScript:parent.detailPMFrame.location.href='TTUndertakeProject.aspx'">
                        <span>
                            <svg viewbox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MyUnderTakeProject%>"></asp:Label>
                        </span>
                    </label>

                    <input name="nav" type="radio" class="about-radio" id="about" />
                    <div class="page about-page">
                        <div class="page-contents">
                            <h1>
                                <asp:Label ID="LB_InvolvedProject" runat="server" Text="<%$ Resources:lang,MyInvolvedProject%>"></asp:Label>
                            </h1>
                        </div>
                    </div>
                    <label class="nav" for="about" onclick="JavaScript:parent.detailPMFrame.location.href='TTInvolvedProject.aspx'">
                        <span>
                            <svg viewbox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MyInvolvedProject%>"></asp:Label>
                        </span>
                    </label>

                    <input name="nav" type="radio" class="contact-radio" id="contact" />
                    <div class="page contact-page">
                        <div class="page-contents">
                            <h1>
                                <asp:Label ID="LB_CreatedProject" runat="server" Text="<%$ Resources:lang,MyCreatedProject%>"></asp:Label>
                            </h1>

                        </div>
                    </div>
                    <label class="nav" for="contact" onclick="JavaScript:parent.detailPMFrame.location.href='TTCreatedProject.aspx'">
                        <span>
                             <svg viewbox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MyCreatedProject%>"></asp:Label>
                        </span>

                    </label>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 40%; top: 1%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';
    var oLink = document.getElementById('mainCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';
</script >
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/forever.js"></script>
</html>
