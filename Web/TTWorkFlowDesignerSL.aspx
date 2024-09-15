<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="TTWorkFlowDesignerSL.aspx.cs"
    Inherits="TTWorkFlowDesignerSL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TakeTopWF.Designer</title>
    <style type="text/css">
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

        #OboveForm {
            min-width: 2750px;
            width: expression (document.body.clientWidth <= 2750? "2750px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/Silverlight.js"></script>
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null & sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Silverlight 应用程序中未处理的错误 " + appSource + "\n";

            errMsg += "代码: " + iErrorCode + "    \n";
            errMsg += "类别: " + errorType + "       \n";
            errMsg += "消息: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "文件: " + args.xamlFile + "     \n";
                errMsg += "行: " + args.lineNumber + "     \n";
                errMsg += "位置: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "行: " + args.lineNumber + "     \n";
                    errMsg += "位置: " + args.charPosition + "     \n";
                }
                errMsg += "方法名称: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); } });

    </script>
</head>
<body>
    <form id="OboveForm" runat="server" style="height: 100%;">
        <table style="height: 100%; width: 100%;">
            <tr>
                <td style="width: 65%; height: 100%;">
                    <div id="silverlightControlHost" style="width: 100%; height: 100%; float: left;">
                        <object id="WFChart" data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                            width="100%" height="2000">
                            <param name="source" value="ClientBin/TakeTopWF.Designer.xap" />
                            <param name="onerror" value="onSilverlightError" />
                            <param name="background" value="white" />
                            <param name="minRuntimeVersion" value="4.0.41108.0" />
                            <param name="autoUpgrade" value="true" />
                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.41108.0" style="text-decoration: none">
                                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight"
                                    style="border-style: none" />
                            </a>
                        </object>
                        <iframe id="_sl_historyFrame" style='visibility: hidden; height: 0; width: 0; border: 0px'></iframe>
                    </div>
                </td>
                <td style="width: 35%; height: 100%;">
                    <iframe id="_WFSetAreaFrame" style="width: 100%; height: 100%"></iframe>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="TB_CopyRight" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFIdentifyString" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFXML" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFName" runat="server" Style="width: 50px; visibility: hidden;"></asp:TextBox>

                    <asp:TextBox ID="TB_WFChartString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFChartString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFChartString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_WFChartString4" runat="server" Style="visibility: hidden"></asp:TextBox>

                    <asp:Button ID="BT_SaveWFDefinition" runat="server" CssClass="inpuLong" Text="--&gt;保存工作流模板定义" Style="visibility: hidden;" />

                    <asp:Button ID="BT_SaveWFChart" runat="server" CssClass="inpuLong" Text="--&gt;保存流程图" OnClick="BT_SaveWFChart_Click" Style="visibility: hidden;" />
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
