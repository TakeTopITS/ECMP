<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPnPCameraAdd.aspx.cs" Inherits="TTPnPCameraAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加摄像头</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            $("#BT_Save").click(function () {
                var strForegin = $("#HF_ForeignID").val();
                var strServerIP = $.trim($("#TXT_ServerIP").val());
                var strCameraUserName = $.trim($("#TXT_CameraUserName").val());
                var strCameraPass = $.trim($("#TXT_CameraPass").val());

                if (strForegin == "" || strForegin == null) {
                    alert("请选择项目部！");
                    return false;
                }
                if (!checkIP(strServerIP)) {
                    $("#TXT_ServerIP").focus();
                    return false;
                }
                if (strCameraUserName == "" || strCameraUserName == null) {
                    alert("摄像头用户名不能为空！");
                    $("#TXT_CameraUserName").focus();
                    return false;
                }
                if (strCameraPass == "" || strCameraPass == null) {
                    alert("摄像头密码不能为空！");
                    $("#TXT_CameraPass").focus();
                    return false;
                }

            });

            $("#BT_Return").click(function () {
                window.location.href = "TTPnPCameraView.aspx";
            });


        });



        function checkIP(str) {
            var strlength = str.length;
            if (strlength < 1) {
                alert("输入的内容不能为空");
                return false;
            } else {
                return true;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TianJiaSheXiangTou%>"></asp:Label>
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
                                                    <tr style="font-weight: bold; font-size: 11pt">
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TreeView ID="TV_Department" runat="server" ShowLines="True" NodeWrap="True" OnSelectedNodeChanged="TV_Department_SelectedNodeChanged">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,SheXiangTouMingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CameraName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,SheXiangTouIP%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ServerIP" runat="server"></asp:TextBox><span style="color: red"><br />
                                                                            *<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Ru%>"></asp:Label></span>
                                                                    </td>
                                                                </tr>
                                                                <tr style="font-weight: bold; font-size: 11pt">
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,SheXiangTouYongHuMing%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CameraUserName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,SheXiangTouMiMa%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CameraPass" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr style="font-weight: bold; font-size: 11pt">
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <textarea id="TXT_Description" cols="50" rows="4" runat="server"></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr style="font-weight: bold; font-size: 11pt">
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                                        <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;&nbsp;
                                                                        <input type="button" value="返回" id="BT_Return" class="inpu" />
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

                <asp:HiddenField ID="HF_ID" runat="server" />
                <asp:HiddenField ID="HF_ForeignID" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
