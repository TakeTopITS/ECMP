<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCameraAdd.aspx.cs" Inherits="TTCameraAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加摄像头</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            $("#BT_Save").click(function () {

                var strArea = $("#TXT_Area").val();
                var strProDepart = $("#TXT_ProDepart").val();
                var strServerIP = $("#TXT_ServerIP").val();
                var strServerPort = $("#TXT_ServerPort").val();
                var strServerChannel = $("#TXT_ServerChannel").val();
                var strCameraName = $("#TXT_CameraName").val();
                var strCameraUserName = $("#TXT_CameraUserName").val();
                var strCameraPass = $("#TXT_CameraPass").val();
                var strDescription = $("#TXT_Description").val();

                var da = "strArea=" + escape(strArea) + "&strProDepart=" + escape(strProDepart) + "&strServerIP=" + escape(strServerIP) + "&strServerPort=" + escape(strServerPort) + "&strServerChannel=" + escape(strServerChannel) + "&strCameraName=" + escape(strCameraName) + "&strCameraUserName=" + escape(strCameraUserName) + "&strCameraPass=" + escape(strCameraPass) + "&strDescription=" + escape(strDescription);

                $.ajax({
                    type: "POST",
                    url: "Handler/addCameraHandler.ashx",
                    data: da,
                    success: function (json) {
                        //alert(json);
                        if (json == "保存成功！") {
                            window.location.href = 'TTCameraList.aspx';
                        }
                    },
                    error: function () {
                        alert("失败");
                    }

                });
            });

        });
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
        div>
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
                                        <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_Area" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,SheXiangTouIP%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_ServerIP" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DuanKou%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_ServerPort" />
                                                </td>
                                            </tr>
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuBu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_ProDepart" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TongDaoHao%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_ServerChannel" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,SheXiangTouMingCheng%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_CameraName" />
                                                </td>
                                            </tr>
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,SheXiangTouYongHuMing%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_CameraUserName" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,SheXiangTouMiMa%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <input type="text" id="TXT_CameraPass" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <textarea id="TXT_Description" cols="50" rows="4" runat="server"></textarea>
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
