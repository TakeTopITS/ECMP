<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTModuleFlowDesignerJS.aspx.cs" Inherits="TTModuleFlowDesignerJS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TakeTopMF.Designer</title>
    <style type="text/css">
        #AboveDiv {
            min-width: 2400px;
            width: expression (document.body.clientWidth <= 2300? "2300px" : "auto" ));
        }

        html, body {
            height: 100%;
            overflow: auto;
        }

        body {
            padding: 0;
            margin: 0;
        }

        #silverlightControlHost {
            height: 100%;
            text-align: center;
        }

        #toolNav {
            z-index: 9999;
            position: fixed;
            top: 15px;
            left: 10px;
            _position: absolute; /* for IE6 */
            _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
            font-size: small;
            color: white;
            background-color: gray;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">

        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

            autoHeight();
        });

        function autoHeight() {

            var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);
            this.document.getElementById("_WFDesignerFrame").style.height = (b_height) + "px";
        }

        function ReloadLeftBar() {

            top.frames[0].frames[2].parent.frames["leftMiddleFrame"].ReloadPage();
        }

        function DisplayOrHideWFXMlBox(varStatus) {

            this.document.getElementById("TB_WFXML").style.display = varStatus;
            this.document.getElementById("BT_SaveWFDefinition").style.display = varStatus;
        }

    </script>
</head>
<body onresize="autoHeight()">
    <form runat="server" style="height: 100%;">
        <div id="AboveDiv">

            <table style="height: 100%; width: 100%;">
                <tr>
                    <td style="width: 100%; height: 100%; vertical-align: top;">
                        <iframe id="_WFDesignerFrame" src="WFDesigner/TTTakeTopMFDesignerJSWorker.aspx?IdentifyString=2020060217063966" style="width: 100%; height: 800px;"></iframe>
                    </td>
                </tr>

                <tr style="display: none;">
                    <td>
                        <iframe id="_WFSetAreaFrame" src="TTModuleFlowTemplateView.aspx?DesignType=JS&IdentifyString=2020060217063966" style="display: none;"></iframe>

                        <asp:TextBox ID="TB_CopyRight" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFIdentifyString" runat="server" Style="visibility: hidden"></asp:TextBox>

                        <asp:TextBox ID="TB_WFName" runat="server" Style="visibility: hidden;"></asp:TextBox>

                        <asp:TextBox ID="TB_WFChartString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString4" runat="server" Style="visibility: hidden"></asp:TextBox>

                        <asp:Label ID="LB_Sql" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>



            <table style="width: 100%; padding-left: 0px; padding-top: 0px;" onmouseover="DisplayOrHideWFXMlBox('block')">
                <tr>
                    <td width="95%" style="height: 60px;">
                        <asp:TextBox ID="TB_WFXML" runat="server" TextMode="MultiLine" Width="99%" Height="60px" Style="display: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="BT_SaveWFDefinition" runat="server" Width="100px" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_SaveWFDefinition_Click" Style="display: none;" />
                    </td>
                </tr>
            </table>



        </div>

        <div id="toolNav">
            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DianJiDaKaiTaoHuangYeMian%>"></asp:Label>
            <asp:DropDownList ID="DL_IsDIYFlow" runat="server">
                <asp:ListItem>NO</asp:ListItem>
                <asp:ListItem>YES</asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
