<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZObjectSmallImport.aspx.cs" Inherits="TTWZObjectSmallImport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>小类导入</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript" type="text/javascript">

        $(function () { 
            $("#btnImport").click(function () {

                if (checkFile($("#fileExcel"), 'xls')) {
                    $("#divLoading").show();
                    return true;
                }

                return false;
            });

           
        });

        /*文件选择验证*/
        function checkFile(obj, postfix) {
            var postfix = postfix || "";
            var fileName = $(obj).val();
            if (fileName == "") {
                alert('请选择要导入的文件！');
                return false;
            }
            // 文件类型验证.
            if (postfix != "") {
                var re = new RegExp("(." + postfix + ")$");
                if (re.test(fileName.toLowerCase())) {
                    return true;
                }
                else {
                    alert("导入的文件必须为." + postfix + "类型的文件！");
                    return false;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WuZiDaiMaDaoRu%>"></asp:Label>
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
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px; display: none;" class="formItemBgStyle" valign="top">
                                                            <input type="button" value="返回" onclick="window.location.href = 'TTWZObjectCodeList.aspx'" class="inpu" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle">
                                                            <table class="formBgStyle" width="100%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuanZeDaoRuWenJian%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:FileUpload ID="fileExcel" runat="server" />
                                                                        <asp:Button ID="btnImport" runat="server" Text="<%$ Resources:lang,DaoRu%>" OnClick="btnImport_Click" CssClass="inpu" />&nbsp;
                                                                        <input type="button" value="返回" onclick="window.location.href = 'TTWZObjectCodeList.aspx'" class="inpu" />
                                                                        <div id="divLoading" style="display: none; color: Red; position: absolute;">
                                                                            <img src="resources/Images/Loading.gif" /><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhengZaiDaoRuZhongQingShaoHou%>"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <table style="width: 100%">
                                                                <tr style="display: none;">
                                                                    <td style="padding-top: 5px;">
                                                                        <b>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiaZaiMuBan%>"></asp:Label>:</b>
                                                                        <asp:LinkButton ID="lbTemplate" runat="server" OnClick="lbTemplate_Click" Text="<%$ Resources:lang,DMDZDRMBDJXZ%>"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px;">
                                                                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 20px;"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <fieldset>
                                                                            <legend>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuYiShiXiang%>"></asp:Label>：</legend>
                                                                            <font color="red">1、<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,TXSJSYXSJLWBTXXLDMWZMCGGXHBZJBJLDWHSDWHSXSDZMSDZBZ%>"></asp:Label>；<br />
                                                                                2、<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DRSHBYQDSJQK%>"></asp:Label>；<br />
                                                                            </font>
                                                                        </fieldset>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnImport" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
