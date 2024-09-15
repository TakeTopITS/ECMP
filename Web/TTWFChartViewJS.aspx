<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWFChartViewJS.aspx.cs" Inherits="TTWFChartViewJS" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TakeTopWF.Designer</title>
    <style type="text/css">
        #AboveDiv {
            min-width: 1440px;
            width: expression (document.body.clientWidth <= 1440? "1440px" : "auto" ));
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
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) {
            }
            else {
                CloseWebPage();
            }
        });

        function autoHeight() {

            var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);

            this.document.getElementById("_WFDesignerFrame").style.width = (document.body.scrollWidth - 12) + "px";
            this.document.getElementById("_WFDesignerFrame").style.height = (document.body.clientHeight - 15) + "px";
        }

    </script>
</head>
<body onload="autoHeight()" onresize="autoHeight()">
    <form id="OboveForm" runat="server">

        <div id="AboveDiv" class="page_topbj">

            <table style="width: 100%;">
                <tr>
                    <td style="padding-top: 2px;">
                        <iframe id="_WFDesignerFrame" style="width: 100%; height: 800px;" runat="server"></iframe>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td>
                        <asp:TextBox ID="TB_CopyRight" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFIdentifyString" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFXML" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFName" runat="server" Style="width: 50px; visibility: hidden;"></asp:TextBox>

                        <asp:TextBox ID="TB_WFChartString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                        <asp:TextBox ID="TB_WFChartString4" runat="server" Style="visibility: hidden"></asp:TextBox>

                        <%-- <asp:Label ID="LB_Sql1" runat="server"></asp:Label>--%>
                        <%-- <asp:Button ID="BT_SaveWFDefinition" runat="server" CssClass="inpuLong" Text="--&gt;保存工作流模板定义" OnClick="BT_SaveWFDefinition_Click"  Style="visibility: hidden"/>--%>
                        <%--<asp:Button ID="BT_SaveWFChart" runat="server" CssClass="inpuLong" Text="--&gt;保存流程图" OnClick="BT_SaveWFChart_Click" Style="visibility: hidden;" />--%>
                    </td>
                </tr>
            </table>

        </div>

    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
