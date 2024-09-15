<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTableTemplateMapping.aspx.cs" Inherits="TTTableTemplateMapping" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=1)">
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=1)">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            $('#buttonToRight').click(function () {
                if ($("select[name=selectOne] option:selected").length > 0) {
                    $("select[name=selectOne] option:selected").each(function (i) {
                        $("select[name=selectTwo]").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option");  //从左移到右边
                        $(this).remove();  //左边的删除
                        GetTwoScrollcode();
                    });
                }
            });
            $('#buttonToLeft').click(function () {
                if ($("select[name=selectTwo] option:selected").length > 0) {
                    $("select[name=selectTwo] option:selected").each(function (i) {
                        $("select[name=selectOne]").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option");
                        $(this).remove();
                        GetTwoScrollcode();
                    });
                }
            });
            $('#buttonToUp').click(function () {
                if ($("select[name=selectTwo] option:selected").length > 0) {
                    $("select[name=selectTwo] option:selected").each(function (i) {
                        $(this).prev().before($(this));  //上移
                    });
                }
            });
            $('#buttonToDown').click(function () {
                if ($("select[name=selectTwo] option:selected").length > 0) {
                    $("select[name=selectTwo] option:selected").each(function (i) {
                        $(this).next().after($(this));
                        $(this).insertAfter($(this).next());  //下移
                    });
                }
            });


            $('#buttonOtherToLeft').click(function () {
                if ($("select[name=selectFour] option:selected").length > 0) {
                    $("select[name=selectFour] option:selected").each(function (i) {
                        $("select[name=selectThree]").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option");  //从左移到右边
                        $(this).remove();  //左边的删除
                        GetThreeScrollcode();
                    });
                }
            });
            $('#buttonOtherToRight').click(function () {
                if ($("select[name=selectThree] option:selected").length > 0) {
                    $("select[name=selectThree] option:selected").each(function (i) {
                        $("select[name=selectFour]").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option");
                        $(this).remove();
                        GetThreeScrollcode();
                    });
                }
            });
            $('#buttonOtherToUp').click(function () {
                if ($("select[name=selectThree] option:selected").length > 0) {
                    $("select[name=selectThree] option:selected").each(function (i) {
                        $(this).prev().before($(this));  //上移
                    });
                }
            });
            $('#buttonOtherToDown').click(function () {
                if ($("select[name=selectThree] option:selected").length > 0) {
                    $("select[name=selectThree] option:selected").each(function (i) {
                        $(this).next().after($(this));
                        $(this).insertAfter($(this).next());  //下移
                    });
                }
            });




            $("#BT_Save").click(function () {

                var strTemplateOption = "";
                var strTableOption = "";
                var TemplateCount = 0;
                var TableCount = 0;
                $("select[name=selectTwo] option").each(function (i) {
                    strTemplateOption = strTemplateOption + $(this).val() + "|";
                    TemplateCount++;
                });
                $("select[name=selectThree] option").each(function (i) {
                    strTableOption = strTableOption + $(this).val() + "|";
                    TableCount++;
                });
                if (strTemplateOption == "" || strTableOption == null) {
                    alert("请选择模板列，或者表格列！");
                    return;
                }
                if (TemplateCount != TableCount) {
                    alert("两边字段列不一致，请检查！要一一对应");
                    return;
                }

                var strTableName = $("#DL_Table ").val();
                var strTemplateName = $("#DL_WFTemplate").find("option:selected").text();
                var strXSNFile = $("#DL_WFTemplate ").val();


                var da = "strTableName=" + escape(strTableName) + "&strTableXMLNodeName=" + escape(strTableOption) + "&strWFTemplateName=" + escape(strTemplateName) + "&strXSNFile=" + escape(strXSNFile) + "&strWFTemplateXNLNodeName=" + escape(strTemplateOption);

                $.ajax({
                    type: "POST",
                    url: "Handler/addTableTemplateMappingHandler.ashx",
                    data: da,
                    success: function (json) {
                        alert(json);
                    },
                    error: function () {
                        alert("失败");
                    }

                });
            });

            $("#DL_WLType").change(function () {
                var TemplateCount = 0;
                var TableCount = 0;
                $("select[name=selectTwo] option").each(function (i) {
                    TemplateCount++;
                });
                $("select[name=selectThree] option").each(function (i) {
                    TableCount++;
                });
                if (TemplateCount > 0 || TemplateCount > 0) {
                    if (confirm("您确定要选择其它项吗？这样所选的列将会清空！")) {
                        return true;
                    } else {
                        $("#DL_WLType").attr("disabled", "disabled");
                        return;
                    }
                }
                return;
            });

            $("#DL_WFTemplate").change(function () {
                var TemplateCount = 0;
                var TableCount = 0;
                $("select[name=selectTwo] option").each(function (i) {
                    TemplateCount++;
                });
                $("select[name=selectThree] option").each(function (i) {
                    TableCount++;
                });
                if (TemplateCount > 0 || TemplateCount > 0) {
                    if (confirm("您确定要选择其它项吗？这样所选的列将会清空！")) {
                        return true;
                    } else {
                        $("#DL_WFTemplate").attr("disabled", "disabled");
                        return;
                    }
                }
                return;
            });

            $("#DL_Table").change(function () {
                var TemplateCount = 0;
                var TableCount = 0;
                $("select[name=selectTwo] option").each(function (i) {
                    TemplateCount++;
                });
                $("select[name=selectThree] option").each(function (i) {
                    TableCount++;
                });
                if (TemplateCount > 0 || TemplateCount > 0) {
                    if (confirm("您确定要选择其它项吗？这样所选的列将会清空！")) {
                        return true;
                    } else {
                        $("#DL_Table").attr("disabled", "disabled");
                        return;
                    }
                }
                return;
            });


            $("#selectTableName").click(function () {
                var strTableName = $("#DL_Table ").val();
                if (strTableName != null && strTableName != "") {
                    var TemplateCount = 0;
                    var TableCount = 0;
                    $("select[name=selectTwo] option").each(function (i) {
                        TemplateCount++;
                    });
                    $("select[name=selectThree] option").each(function (i) {
                        TableCount++;
                    });
                    if (TemplateCount > 0 || TemplateCount > 0) {
                        if (confirm("您确定要选择其它项吗？这样所选的列将会清空！")) {
                            return true;
                        } else {
                            $("#selectTableName").attr("disabled", "disabled");
                            //alert($("#HF_SelectTwo").val());
                            //var arrHF_SelectTwo = $("#HF_SelectTwo").val().split(',');
                            //for (var i = 0; i < arrHF_SelectTwo.length; i++)
                            //{
                            //    var strSelectTwo = arrHF_SelectTwo[i].split('|');
                            //    $("select[name=selectTwo]").append("<option value='" + strSelectTwo[0] + "'>" + strSelectTwo[1] + "</option");
                            //}
                            return;
                        }
                    }
                    return;
                }

            });


            $("#selectTwo").scroll(function () {
                $("#TT_Two")[0].scrollTop = $(this)[0].scrollTop;
            });

            $("#selectThree").scroll(function () {
                $("#TT_Three")[0].scrollTop = $(this)[0].scrollTop;
            });

            //双击移除
            $("#selectTwo").dblclick(function () {
                if ($("select[name=selectTwo] option:selected").length > 0) {
                    $("select[name=selectTwo] option:selected").each(function (i) {
                        $(this).remove();
                        GetTwoScrollcode();
                    });
                }
            });

            $("#selectThree").dblclick(function () {
                if ($("select[name=selectThree] option:selected").length > 0) {
                    $("select[name=selectThree] option:selected").each(function (i) {
                        $(this).remove();
                        GetThreeScrollcode();
                    });
                }
            });

        });


        function AddTableItem(objAll, obj) {
            var isExit = false;
            $("select[name=selectThree] option").each(function (i) {
                if ($(this).text() == obj) {
                    isExit = true;
                }
            });
            if (isExit) {
                alert("当前列已经存在" + obj + "！");
                return;
            } else {
                var varItem = new Option(obj, obj);
                $("select[name=selectThree]").append("<option value='" + objAll + "'>" + obj + "</option");
                GetThreeScrollcode();
                $("#HF_SelectThree").val($("#HF_SelectThree").val() + objAll + "|" + obj + ",");
            }
        }

        function AddTemplateItem(objAll, obj) {
            var isExit = false;
            $("select[name=selectTwo] option").each(function (i) {
                if ($(this).text() == obj) {
                    isExit = true;
                }
            });
            if (isExit) {
                alert("当前列已经存在" + obj + "！");
                return;
            } else {
                var isTable = false;
                if ($("#DL_Table ").val() != "" && $("#DL_Table ").val() != null) {
                    isTable = true;
                }
                if (isTable) {
                    $("select[name=selectTwo]").append("<option value='" + objAll + "'>" + obj + "</option");
                    GetTwoScrollcode();
                    $("#HF_SelectTwo").val($("#HF_SelectTwo").val() + objAll + "|" + obj + ",");
                } else {
                    alert("请先选择表格！");
                }
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

        function AddExistTableItem(objAll, obj) {
            if (jsSelectIsExitItem($("select[name=DL_Table] option"), obj)) {
                alert("当前列已经存在" + obj + "！");
            } else {
                $("select[name=DL_Table]").append("<option value='" + objAll + "'>" + obj + "</option");
            }
        }


        //获取行号
        function GetTwoScrollcode() {
            var temstring = "";
            var k = 1;
            $("select[name=selectTwo] option").each(function (i) {
                temstring += k + "\n";;
                k++;
            });

            $("#TT_Two").val(temstring);
            if ($("select[name=selectTwo] option")[0] != undefined) {
                $("#TT_Two")[0].scrollTop = $("select[name=selectTwo] option")[0].scrollHeight;
            }
        }

        //获取行号
        function GetThreeScrollcode() {
            var temstring = "";
            var k = 1;
            $("select[name=selectThree] option").each(function (i) {
                temstring += k + "\n";;
                k++;
            });

            $("#TT_Three").val(temstring);
            if ($("select[name=selectThree] option")[0] != undefined) {
                $("#TT_Three")[0].scrollTop = $("select[name=selectThree] option")[0].scrollHeight;
            }
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>

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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BDJDYSBZD%>"></asp:Label>
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
                            <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td colspan="8" class="formItemBgStyle" align="center">
                                        <input type="button" value="保存" id="BT_Save" class="inpu" />
                                    </td>
                                </tr>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <tr>
                                            <td colspan="3" class="formItemBgStyle">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</span>
                                                <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="Type" DataValueField="Type"
                                                    Width="110px" AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>：
                                                <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="XSNFile"
                                                    Width="210px" AutoPostBack="true" Height="20px" OnSelectedIndexChanged="DL_WFTemplate_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <th class="formItemBgStyle">&nbsp;</th>
                                            <td colspan="3" class="formItemBgStyle" style="text-align: right;">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XuanZeBiao%>"></asp:Label>：</span>
                                                <asp:DropDownList ID="DL_Table" name="DL_Table" runat="server" DataTextField="TableName" DataValueField="TableName"
                                                    Width="110px" AutoPostBack="true" Height="20px" OnSelectedIndexChanged="DL_Table_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td rowspan="2" class="formItemBgStyle">
                                                <asp:ListBox ID="selectTableName" name="selectTableName" runat="server" DataTextField="TableName" DataValueField="TableName"
                                                    OnSelectedIndexChanged="DL_TableName_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:TreeView ID="TV_WFTemplate" runat="server">
                                                </asp:TreeView>
                                            </td>
                                            <td style="width: 100px; text-align: center;" class="formItemBgStyle">
                                                <%--<input type="button" id="buttonToRight" value="&raquo;" style="background: none; width: 50px;" />
                                                <br />--%>
                                                <br />
                                                <input type="button" value="&laquo;" id="buttonToLeft" style="background: none; width: 50px;" />
                                                <br />
                                                <br />
                                                <input type="button" value="&uarr;" id="buttonToUp" style="background: none; width: 50px;" />
                                                <br />
                                                <br />
                                                <input type="button" value="&darr;" id="buttonToDown" style="background: none; width: 50px;" />
                                            </td>
                                            <td class="formItemBgStyle">
                                                <textarea class="KeyNum" id="TT_Two" name="wordsnum" cols="2" style="height: 500px!important; font-size: 11px;" readonly="readonly"></textarea>
                                                <select name="selectTwo" id="selectTwo" size="5" multiple style="height: 500px!important; width: 150px; font-size: 11px; border: none;" runat="server">
                                                </select>
                                                <asp:HiddenField ID="HF_SelectTwo" runat="server" />
                                            </td>
                                            <td class="formItemBgStyle">|<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |<br />
                                                |
                                            </td>
                                            <td class="formItemBgStyle" style="vertical-align: top;">
                                                <textarea class="KeyNum" id="TT_Three" name="wordsnum" style="height: 500px!important; font-size: 11px;" cols="2" readonly="readonly"></textarea><select name="selectThree" id="selectThree" size="5" multiple style="height: 500px!important; width: 150px; font-size: 11px; border: none; overflow-y: hidden;" runat="server">
                                                </select><asp:HiddenField ID="HF_SelectThree" runat="server" />
                                            </td>
                                            <td style="width: 100px; text-align: center;" class="formItemBgStyle">
                                                <%--<input type="button" value="&laquo;" id="buttonOtherToLeft" style="background: none; width: 50px;" />
                                                <br />--%>
                                                <br />
                                                <input type="button" id="buttonOtherToRight" value="&raquo;" style="background: none; width: 50px;" />
                                                <br />
                                                <br />
                                                <input type="button" value="&uarr;" id="buttonOtherToUp" style="background: none; width: 50px;" />
                                                <br />
                                                <br />
                                                <input type="button" value="&darr;" id="buttonOtherToDown" style="background: none; width: 50px;" />
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TreeView ID="TV_Table" runat="server">
                                                </asp:TreeView>
                                            </td>
                                        </tr>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
