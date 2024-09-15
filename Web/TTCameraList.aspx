<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCameraList.aspx.cs" Inherits="TTCameraList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">


        function LoadCamera(_this, Area, ProjectDepartment, ServerIP, ServerPort, ServerChannel, CameraName, CameraUserName, CameraPass) {
            $(_this).attr("style", "red");
            $("#LB_Area").html("<font style='color:red;'>"+Area + "-" + ProjectDepartment+"</font>");
            var cmrai = new Array(Camera1);
            cmrai[0].StopView();
            cmrai[0].url = ServerIP;
            cmrai[0].wServerPort = ServerPort;
            cmrai[0].channel = ServerChannel;
            cmrai[0].servername = CameraName;
            cmrai[0].username = CameraUserName;
            cmrai[0].password = CameraPass;
            cmrai[0].trantype = 3;
            cmrai[0].SetLanguage(0);
            cmrai[0].PostProMethon(0);
            cmrai[0].StartView();



            var strArea = Area;
            var strProDepart = ProjectDepartment;
            var strServerIP = ServerIP;
            var strServerPort = ServerPort;
            var strServerChannel = ServerChannel;
            var strCameraName = CameraName;

            var da = "strArea=" + escape(strArea) + "&strProDepart=" + escape(strProDepart) + "&strServerIP=" + escape(strServerIP) + "&strServerPort=" + escape(strServerPort) + "&strServerChannel=" + escape(strServerChannel) + "&strCameraName=" + escape(strCameraName);

            $.ajax({
                type: "POST",
                url: "Handler/addCameraLogHandler.ashx",
                data: da,
                success: function (json) {
                    //alert(json);
                },
                error: function () {
                    //alert("失败");
                }

            });
        }


    </script>


</head>
<body>

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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SheXiangJianKong%>"></asp:Label>
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
                                        <tr style="font-size: 12pt">
                                            <td align="right" class="formItemBgStyle" colspan="2">
                                                <input type="button" class="inpu" value="新增摄像头" onclick="window.location.href = 'TTCameraAdd.aspx'" />
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td align="left" style="width: 10%;" class="formItemBgStyle">

                                                <% if (CameraListCollect != null && CameraListCollect.Count > 0)
                                                   {
                                                       for (int i = 0; i < CameraListCollect.Count; i++)
                                                       {
                                                           ProjectMgt.Model.CameraList cameList = (ProjectMgt.Model.CameraList)CameraListCollect[i];
                                                %>
                                                <label style="cursor: pointer; color:blue;" onclick="LoadCamera(this,'<%=cameList.Area %>','<%=cameList.ProjectDepartment %>','<%=cameList.ServerIP %>','<%= cameList.ServerPort%>','<%=cameList.ServerChannel %>','<%=cameList.CameraName %>','<%=cameList.CameraUserName %>','<%=cameList.CameraPass %>');"><%=cameList.Area %>-<%=cameList.ProjectDepartment %></label><br />

                                                <%}
                                                       } %>

                                            </td>
                                            <td class="formItemBgStyle">
                                                <div align="center">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <div align="center">
                                                                    <table border="1">
                                                                        <tr>
                                                                            <td>
                                                                                <label id="LB_Area"></label>
                                                                                <object name="Camera1" id="Camera1" width="1200" height="680"
                                                                                    classid="CLSID:0C615F36-0C1C-497B-B9E4-833B0D7AA8CA"
                                                                                    codebase="/NetViewX.cab">
                                                                                </object>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </table>
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


</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
