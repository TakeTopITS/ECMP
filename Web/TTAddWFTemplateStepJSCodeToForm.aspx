<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAddWFTemplateStepJSCodeToForm.aspx.cs" Inherits="TTAddWFTemplateStepJSCodeToForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>流程步骤JS代码</title>
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

    <!-- Create a simple CodeMirror instance -->
    <script type="text/javascript">
        var editor = CodeMirror.fromTextArea(myTextarea, {
            lineNumbers: true
        });
    </script>


    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            $("#BT_Save").click(function () {

                displayWaitingImg('img_processing');

                var strTemName = $("#DL_WFTemplate").val();
                if (strTemName == "" || strTemName == null) {
                    alert("请选择流程模板！");
                    return;
                }
                var strSortName = $("#LIB_WFStep").find("option:selected").text();
                if (strSortName == "" || strSortName == null) {
                    alert("请选择流程步骤！");
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
                var strWebServiceName = "";

                $("select[name=DL_WebService] option").each(function (i) {
                    strWebServiceName = strWebServiceName + $(this).val() + "|";
                });
                var da = "strSql=" + escape(strSql) + "&strSortName=" + escape(strSortName) + "&strTemName=" + escape(strTemName) + "&strComment=" + escape(strComment) + "&intID=" + intID + "&strWebServiceName=" + escape(strWebServiceName);

                $.ajax({
                    type: "POST",
                    url: "Handler/addWFTemplateStepJSCodeToFormHandler.ashx",
                    data: da,
                    success: function (json) {

                        $("#HF_ID").val(json);

                        alert("保存成功！");
                    },
                    error: function () {

                        alert("保存失败");
                    }

                });

            });



            $("#LIB_WebService").click(function () {
                var strWebServiceName = $("#LIB_WebService").find("option:selected").text();
                var strComment = $("#LIB_WebService ").val();
                $("#LBL_Comment").text(strComment);
                var isExit = false;
                $("select[name=DL_WebService] option").each(function (i) {
                    if ($(this).text() == strWebServiceName) {
                        isExit = true;
                    }
                });
                if (isExit) {
                    alert("警告，" + strWebServiceName + "已选取！");
                    return false;
                } else {
                    $("select[name=DL_WebService]").append("<option value='" + strWebServiceName + "'>" + strWebServiceName + "</option");
                }
            });

            $("#DL_WebService").dblclick(function () {
                var strWebService = $("#DL_WebService").find("option:selected").text();
                if (confirm("你确定要移除当前的Web Service吗？")) {
                    $("select[name=DL_WebService] option:selected").each(function (i) {
                        if ($(this).text() == strWebService) {
                            $(this).remove();
                        }
                    });
                }
            });

        });


        function AddWebServiceItem(objAll, obj) {
            if (jsSelectIsExitItem($("select[name=DL_WebService] option"), obj)) {
                alert("警告，已经选取" + obj + "，不能重复选取！");
            } else {
                $("select[name=DL_WebService]").append("<option value='" + objAll + "'>" + obj + "</option");
            }
        }


        function jsSelectIsExitItem(objSelect, objItemValue) {
            var isExit = false;
            $(objSelect).each(function (i) {
                if ($(this).find("option:selected").text() == objItemValue) {
                    isExit = true;
                }
            });
            return isExit;
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">

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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LiuChengBuZhouJSDaiMa%>"></asp:Label>
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
                                    <table style="width: 2000px;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                        <tr style="font-weight: bold; font-size: 11pt; display: none">
                                            <td style="text-align: left" class="formItemBgStyle"></td>
                                        </tr>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <tr>
                                                    <td align="left" class="formItemBgStyle" rowspan="5">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LiuChengLeiXing%>"></asp:Label>：
                                                            <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                Width="150px" AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                            </asp:DropDownList><br />
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>：
                                                    <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                        Width="210px" AutoPostBack="true" Height="20px" OnSelectedIndexChanged="DL_WFTemplate_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                        <br />
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>：</span><br />
                                                        <asp:ListBox ID="LIB_WFStep" runat="server"
                                                            Width="220px" Height="500px" OnSelectedIndexChanged="LIB_WFStep_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" class="formItemBgStyle">

                                                        <asp:Button ID="BT_Save" class="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" />
                                                        <asp:Label ID="LBL_Description" runat="server" Text=""></asp:Label>

                                                        <img id="img_processing" src="img/Processing.gif" alt="Loading,please wait..." style="display: none;" />
                                                        <br />
                                                        <textarea id="TXT_JSCode" cols="120" rows="30" runat="server">
                                                      
                                                    </textarea><br />
                                                        <asp:Label ID="LBL_JSCODEDescription" runat="server" Text="（域规则：当前用户代码：[TAKETOPUSERCODE]，当前用户名称：[TAKETOPUSERNAME]，当前用户部门代码：[TAKETOPDEPARTCODE],当前用户部门名称：[TAKETOPDEPARTNAME],申请者代码：[TAKETOPWFCREATORCODE]，申请者名称：[TAKETOPWFCREATORNAME]，申请者部门代码：[TAKETOPWFCREATORDEPARTCODE]，申请者部门名称：[TAKETOPWFCREATORDEPARTNAME]）"></asp:Label>

                                                        <br />
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuShi%>"></asp:Label>：</span><br />
                                                        <textarea id="TXT_Comment" cols="70" rows="4" runat="server"></textarea>
                                                    </td>
                                                    <td style="text-align: left" class="formItemBgStyle">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GuanLianWebService%>"></asp:Label>：</span><br />
                                                        <select name="DL_WebService" id="DL_WebService" size="5" multiple style="height: 500px!important; width: 150px;" runat="server">
                                                        </select>
                                                    </td>
                                                    <td style="text-align: left" class="formItemBgStyle">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,SuoYouWebService%>"></asp:Label>：</span><br />
                                                        <asp:ListBox ID="LIB_WebService" name="LIB_WebService" runat="server" DataTextField="WebServiceName" DataValueField="WebServiceName"
                                                            Width="220px" Height="500px"></asp:ListBox><br />
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="LBL_Comment" runat="server" Text=""></asp:Label></span>
                                                    </td>
                                                </tr>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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
