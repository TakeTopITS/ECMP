<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAddTableNameMapping.aspx.cs" Inherits="TTAddTableNameMapping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加数据交互字段配对</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            $("#BT_Save").click(function () {

                var strTableName = $("#TXT_TableName").val();
                var strDescription = $("#TXT_Description").val();

                if (strTableName == "" || strTableName == null) {
                    alert("数据表名不能为空！");
                    $("#TXT_TableName").focus();
                    return;
                }

                var intID = $("#HF_ID").val();

                var da = "strTableName=" + escape(strTableName) + "&strDescription=" + escape(strDescription) + "&intID=" + intID;

                $.ajax({
                    type: "POST",
                    url: "Handler/addTableNameMappingHandler.ashx",
                    data: da,
                    success: function (json) {
                        alert(json);
                        if (json == "保存成功！") {
                            window.location.href = "TTTableNameMapppingList.aspx";
                        }
                    },
                    error: function () {
                        alert("失败");
                    }

                });
            });

        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TianJiaShuJuJiaoHuZiDuan%>"></asp:Label>
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
                                        <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShuJuBiaoMing%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_TableName" style="width: 320px" runat="server" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <textarea id="TXT_Description" cols="50" rows="4" runat="server" runat="server"></textarea>
                                                </td>
                                            </tr>
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle" colspan="6">
                                                    <input type="button" value="保存" id="BT_Save" class="inpu" />
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
        </div>
        <asp:HiddenField ID="HF_ID" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
