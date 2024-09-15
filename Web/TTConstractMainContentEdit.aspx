<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractMainContentEdit.aspx.cs" Inherits="TTConstractMainContentEdit" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }*/
        .auto-style1 {
            position: absolute;
            left: 35%;
            top: 35%;
            height: 34px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>


    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function autoheight() { //函数：获取尺寸
            //获取浏览器窗口高度
            var winHeight = 0;
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;

            if (document.documentElement && document.documentElement.clientHeight)
                winHeight = document.documentElement.clientHeight;

            document.getElementById("Div3").style.height = (winHeight - 120) + "px";
            document.getElementById("Div6").style.height = (winHeight - 80) + "px";
        }

        window.onresize = autoheight; //浏览器窗口发生变化时同时变化DIV高度

        //设置IFRMAE的高度
        function setBusinessFormIFrameHeight() {

            var winHeight = 0;

            winHeight = document.getElementById("popwindow").style.height;

            document.getElementById("TabContainer4_TabPanel16_IFrame_RelatedInformation").height = (winHeight.toString().replace("px", "") - 160);
        }
        window.onmousemove = setBusinessFormIFrameHeight;




    </script>
</head>
<body onload="autoheight();">
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div id="AboveDiv">
                        <table style="width: 100%;">
                            <tr>
                                <td class="formItemBgStyle" align="right">
                                    <table>
                                        <tr>

                                            <td class="formItemBgStyle">
                                                <asp:Button ID="BT_Save" Text="<%$ Resources:lang,BaoCun %>" CssClass="inpu" runat="server" OnClick="BT_Save_Click" />
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="LB_Watermark" Text="水印字符" runat="server"></asp:Label>
                                            </td>
                                            <td class="formItemBgStyle" width="100px">
                                                <asp:TextBox ID="TB_Watermark" runat="server" Width="99%"></asp:TextBox>
                                            </td>
                                            <td class="formItemBgStyle" style="text-align: right; padding-right: 5px; padding-left: 5px;">
                                                <asp:Button ID="BT_Export" Text="<%$ Resources:lang,DaoChu %>" CssClass="inpu" runat="server" OnClick="BT_Export_Click" />
                                            </td>

                                            <td class="formItemBgStyle" style="width: 100px; text-align: center;">
                                                <asp:Button ID="BT_Import" Text="<%$ Resources:lang,DaoRu %>" CssClass="inpu" runat="server"  OnClick="BT_Import_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle">
                                    <CKEditor:CKEditorControl ID="TB_ConstractMainContent" runat="server" Width="100%" Height="850px" Visible="false" />
                                    <CKEditor:CKEditorControl runat="server" ID="HT_ConstractMainContent" Width="100%" Height="850px" Visible="false" />
                                </td>
                            </tr>
                        </table>

                    </div>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
