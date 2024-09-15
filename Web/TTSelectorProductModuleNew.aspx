<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSelectorProductModuleNew.aspx.cs" Inherits="TTSelectorProductModuleNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模块</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script type="text/jscript" language="javascript">
        //复选框全选
        function ChooseAll(item) {
            $("input[name=dlCode]").each(function () {
                if (item.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }


        //复选框全选
        function ChooseTagAll(item,obj) {
            $("input[tag='" + item + "']").each(function () {
                if (obj.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }


        //多选择按钮判断
        function chooseUpdate() {
            var str = "";
            $("input[name=dlCode]").each(function () {
                if ($(this).attr("checked")) {
                    str = str + $(this).attr("id") + ","; // 整个以,隔开
                }
            });
            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                clickMember(str);
            }
        }

        function clickMember(resultList) {
            if (resultList != "" && resultList != undefined) {
                var resultListItem = resultList.split(',');

                var ids = "";
                var names = "";

                for (var i = 0; i < resultListItem.length; i++) {
                    if (resultListItem[i] != "") {
                        var IDNames = resultListItem[i].split('|');
                        ids += IDNames[0] + ",";
                        names += IDNames[1] + ",";
                    }
                }

                if (ids != "") {
                    window.parent.document.getElementById("HF_ModuleIDs").value = ids;
                }
                if (names != "") {
                    window.parent.document.getElementById("TXT_ModuleNames").value = names;
                }
            }
            CloseLayer();
        }

    </script>


<base target="_self">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MoKuai%>"></asp:Label>
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
                                            <tr>
                                                <td class="formItemBgStyle" width="100%">
                                                    <div>

                                                        <table>
                                                            <asp:Literal ID="LT_ShowHtml" runat="server"></asp:Literal>
                                                        </table>

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle">
                                                    <div style="text-align: center">
                                                        <input id="btnOk" class="inpu" onclick="return chooseUpdate()" type="button" value="确定" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                            type="button" value="关闭" />
                                                    </div>
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
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
