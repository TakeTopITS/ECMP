<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPNewsView.aspx.cs" Inherits="TTAPPNewsView" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

      <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            

        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
      
            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td colspan="2" height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <%--<a href ="TTAPPNews.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                    <a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">              
                                    <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <img src="ImagesSkin/return.png" alt=""  />
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP"><asp:Label runat ="server" Text="<%$ Resources:lang,Back%>" />
                                            </td>
                                            <td width="5">
                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                             <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style ="display :none;" />
                                </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <table width="100%" cellpadding="5" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="LB_Title" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="DataList1" runat="server" Width ="100%">
                                        <ItemTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 100%;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"Content") %>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    
                    </td>
                </tr>
            </table>
     
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
