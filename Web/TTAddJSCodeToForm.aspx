<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAddJSCodeToForm.aspx.cs" Inherits="TTAddJSCodeToForm" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <meta charset="utf-8" />

    <link rel="stylesheet" href="codemirror/lib/codemirror.css" />
    <script src="codemirror/lib/codemirror.js"></script>
    <script src="codemirror/addon/hint/show-hint.js"></script>
    <script src="codemirror/addon/hint/javascript-hint.js"></script>

    <script src="codemirror/addon/hint/anyword-hint.js"></script>
    <script src="codemirror/addon/hint/css-hint.js"></script>
    <script src="codemirror/addon/hint/html-hint.js"></script>
    <script src="codemirror/addon/hint/sql-hint.js"></script>
    <script src="codemirror/addon/hint/xml-hint.js"></script>

    <script src="codemirror/mode/javascript/javascript.js"></script>
    <link rel="stylesheet" href="codemirror/addon/hint/show-hint.css" />
    <link rel="stylesheet" href="codemirror/doc/docs.css" />

    <style type="text/css">
        .CodeMirror {
            height: auto;
            border: 1px solid #ddd;
            font-size: 12pt;
        }

        .CodeMirror-scroll {
            max-height: 600px;
        }

        .CodeMirror pre {
            padding-left: 7px;
            line-height: 1.25;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            $("#BT_Save").click(function () {

                displayWaitingImg('img_processing');

                var strTemName = $("#DL_WFTemplate").val();

                if (strTemName == "" || strTemName == null) {
                    alert("请选择流程模板！");
                    return;
                }

                /*  var strSql = $("#TXT_JSCode").val();*/

                var strSql = editor.getValue();

                if (strSql == "" || strSql == null) {
                    alert("代码不能为空！");
                    return;
                }
                var strComment = $("#TXT_Comment").val();
                var intID = $("#HF_ID").val();
                strSql = strSql.replace(/\+/g, "TAKETOP[PLUS]");


                var da = "strSql=" + escape(strSql) + "&strTemName=" + escape(strTemName) + "&strComment=" + escape(strComment) + "&intID=" + intID;


                $.ajax({
                    type: "POST",
                    url: "Handler/addJSCodeToFormHandler.ashx",
                    data: da,
                    success: function (json) {

                        $("#HF_ID").val = json;

                        alert("保存成功!");
                    },
                    error: function () {

                        alert("保存失败");
                    }

                });

            });

        });

        function setEditorValue() {

            displayWaitingImg('img_processing');

            this.document.getElementById("TXT_JSCode").innerHTML = editor.getValue();
        }

        function displayWaitingImg(img) {

            this.document.getElementById(img).style.display = 'block';
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <div id="AboveDiv">
            <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LiuChengBiaoDanJSDaiMa%>"></asp:Label>
                                                （<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Template\CodeTemplate\JS\JSCodeTemplate.pdf" Text="<%$ Resources:lang,ChaKanShiLiDaiMa%>" />）
                                            </td>
                                            <td width="5">
                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td style="padding: 0px 5px 5px 5px;" valign="top">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top" style="padding-top: 5px;">
                                    <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>

                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                            <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                Width="110px" AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>：
                                                    <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                        Width="210px" AutoPostBack="true" Height="20px" OnSelectedIndexChanged="DL_WFTemplate_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_WFTemJSCodeID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:Button ID="BT_DeleteByID" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_DeleteByID_Click" Visible="false"/>
                                                    </td>
                                                </tr>
                                                <tr style="font-weight: bold; font-size: 11pt">
                                                    <td style="text-align: left" class="formItemBgStyle" onclick="javascript:displayWaitingImg('img_processing');">
                                                        <asp:Button ID="BT_Save" class="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" />
                                                        <img id="img_processing" src="img/Processing.gif" alt="Loading,please wait..." style="display: none;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" class="formItemBgStyle">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JSDaiMa%>"></asp:Label>：<br />
                                                        <textarea id="TXT_JSCode" cols="150" rows="80" runat="server" onmouseout="javascript:setEditorValue();">
                                                        </textarea>
                                                        <br />
                                                        <asp:Label ID="LBL_JSCODEDescription" runat="server" Text="（域规则：当前用户代码：[TAKETOPUSERCODE]，当前用户名称：[TAKETOPUSERNAME]，当前用户部门代码：[TAKETOPDEPARTCODE],当前用户部门名称：[TAKETOPDEPARTNAME],申请者代码：[TAKETOPWFCREATORCODE]，申请者名称：[TAKETOPWFCREATORNAME]，申请者部门代码：[TAKETOPWFCREATORDEPARTCODE]，申请者部门名称：[TAKETOPWFCREATORDEPARTNAME]，关联类型：[TAKETOPRELATEDTYPE]，关联ID:[TAKETOPRELATEDID],关联代码：[TAKETOPRELATEDCODE]）"></asp:Label>

                                                    </td>
                                                </tr>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                        <tr>
                                            <td style="text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuShi%>"></asp:Label>：<br />
                                                <textarea id="TXT_Comment" cols="150" rows="4" runat="server"></textarea>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="HF_ID" runat="server" />
    </form>
    <script type="text/javascript">

        myTextarea = document.getElementById("TXT_JSCode");
        var editor = CodeMirror.fromTextArea(myTextarea, {

            lineNumbers: true,
            mode: "javascript",
            matchBrackets: true,

            textWrapping: true,
            lineWrapping: true,

            extraKeys: { "Ctrl": "autocomplete" }

        });

    </script>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
