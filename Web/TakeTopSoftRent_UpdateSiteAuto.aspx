<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_UpdateSiteAuto.aspx.cs" Inherits="TakeTopSoftRent_UpdateSiteAuto" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线租用---云平台</title>
    <link href="Logo/website/css/media.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/qudaohezuo.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/zuyong.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="Logo/website/js/jquery-1.3.1.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            //aHandler();

        });

        function openMDIFrom(strMDIPageName) {

            window.open(strMDIPageName, '_top');

        }

        function displayRelatedUI() {

            //alert(this.parent.window.document.getElementById("DIV_SiteMsg"));
            this.parent.window.document.getElementById("DIV_SiteMsg").style.display = "none";

        }

    </script>

    <style type="text/css">
        a {
            color: #333;
            text-decoration: none;
        }
    </style>

</head>
<body>
    <center>
    <form id="form1" runat="server">
         <table style="text-align: left;">
            <tr>
                <td class="formItemBgStyle">
                    <div style="top: 29px; width: 100%;">
                        <table width="100%">
                            <tr>
                                <td width="70%">
                                        <div id="DIV_Message"  style="text-align:center;padding-top:100px;">   
                                          <table>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="IMB_Process" ImageUrl="Images/Processing.gif" runat="server"></asp:Image>
                                                </td>
                                                <td style="color:red;">
                                                    <asp:Label ID="LB_Message" runat="server"  Text ="正在升级你的应用站点，大概需要10分钟，请耐心等候......"></asp:Label>  
                                                </td>
                                            </tr>
                                        </table>
                                      </div> 
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
