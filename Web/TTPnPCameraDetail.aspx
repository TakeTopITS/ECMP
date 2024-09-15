<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPnPCameraDetail.aspx.cs" Inherits="TTPnPCameraDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>摄像头</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        function LoadCamera(Area, ProjectDepartment, ServerIP, CameraName, CameraID) {
            
            ServerIP = $.trim(ServerIP);
            var browser = {
                versions: function () {
                    var u = navigator.userAgent, app = navigator.appVersion;
                    return {
                        trident: u.indexOf('Trident') > -1, //IE内核                 
                        presto: u.indexOf('Presto') > -1, //opera内核                 
                        webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核                 
                        gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核                 
                        mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端                 
                        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端                 
                        android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器                 
                        iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器                 
                        iPad: u.indexOf('iPad') > -1, //是否iPad                 
                        webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部             
                    };
                }()
            }
            $("#LB_Area").html("<font style='color:red;'>" + Area + "-" + ProjectDepartment + "-" + CameraName + "</font>");

            var custom = "";
            if (navigator.userAgent.indexOf("MSIE") > 0) {
                //return "MSIE";
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/monitor.htm";
                custom = "http://" + ServerIP + "/monitor.htm";
            }
            else if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
                //return "Firefox";
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/monitor2.htm";
                custom = "http://" + ServerIP + "/monitor2.htm";
            }
            else if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
                //return "Safari";
                //document.getElementById("rightCamera").src = "http://" + ServerIP + "/monitor2.htm";
                custom = "http://" + ServerIP + "/monitor2.htm";
                window.open("http://" + ServerIP + "/monitor2.htm");
            }
            else if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
                //return "Camino";
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/monitor2.htm";
                custom = "http://" + ServerIP + "/monitor2.htm";
            }
            else if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) {
                //return "Gecko";
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/monitor2.htm";
                custom = "http://" + ServerIP + "/monitor2.htm";
            }
            else if (browser.versions.iPhone) {
                //是否为iPhone
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/iphone.htm";
                custom = "http://" + ServerIP + "/iphone.htm";
            }
            else if (browser.versions.iPad) {
                //是否iPad
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/pda.htm";
                custom = "http://" + ServerIP + "/pda.htm";
            }
            else if (browser.versions.android) {
                //android终端
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/pda.htm";
                custom = "http://" + ServerIP + "/pda.htm";
            }
            else if (browser.versions.ios) {
                //ios终端
                document.getElementById("rightCamera").src = "http://" + ServerIP + "/iphone.htm";
                custom = "http://" + ServerIP + "/iphone.htm";
            }

            var strArea = Area;
            var strProDepart = ProjectDepartment;
            var strServerIP = custom;

            var da = "strCameraName=" + escape(CameraName) + "&strCameraID=" + CameraID + "&strServerIP=" + escape(strServerIP);

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

            //window.showModalDialog(strServerIP, null, 'dialogWidth:' + 900 + 'px;dialogHeight:' + 600 + 'px;help:no;unadorned:no;resizable:no;status:no');

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
                                                    <tr style="font-size: 12pt; display: none;">
                                                        <td align="right" class="formItemBgStyle" colspan="5">
                                                            <input type="button" class="inpu" value="新增摄像头" onclick="window.location.href = 'TTPnPCameraAdd.aspx'" />
                                                        </td>
                                                    </tr>
                                                    <tr style="font-size: 12pt">
                                                        <td align="left" style="width: 10%;" class="formItemBgStyle">

                                                            <asp:TreeView ID="TV_DepartMent" runat="server" OnSelectedNodeChanged="TV_DepartMent_SelectedNodeChanged" ShowLines="True" NodeWrap="True">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>

                                                        </td>
                                                        <td align="left" style="width: 10%;" class="formItemBgStyle">
                                                            <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenSheXiangTou%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_Department" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                Font-Bold="true" ForeColor="#333333" ShowHeader="false" GridLines="None" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Resources.lang.ZZZBuMen">
                                                                        <ItemTemplate>
                                                                            <input type="button" class="inpuLong" onclick='LoadCamera("<%# Eval("TypeName") %>    ", "<%# Eval("DPName")%>    ","<%# Eval("ServerIP")%>    ","<%# Eval("CameraName")%>    ",<%# Eval("ID")%>)' value='<%# Eval("CameraName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                        <td class="formItemBgStyle" width="60%">
                                                            <label id="LB_Area">
                                                            </label>
                                                            <iframe id="rightCamera" frameborder="0" height="700" name="rightCamera" src="" style="margin-top: 0px;" width="100%"></iframe>
                                                        </td>
                                                        <td align="left" class="formItemBgStyle" style="width: 10%;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZuZhiSheXiangTou%>"></asp:Label></strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_Organization" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Bold="true" ForeColor="#333333" GridLines="None" ShowHeader="false" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="组织：">
                                                                        <ItemTemplate>
                                                                            <input type="button" class="inpuLong" onclick='LoadCamera("<%# Eval("TypeName") %>    ", "<%# Eval("DPName")%>    ","<%# Eval("ServerIP")%>    ","<%# Eval("CameraName")%>    ",<%# Eval("ID")%>)' value='<%# Eval("CameraName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                        <td align="left" class="formItemBgStyle" style="width: 10%;">
                                                            <asp:TreeView ID="TV_Organization" runat="server" NodeWrap="True" OnSelectedNodeChanged="TV_Organization_SelectedNodeChanged" ShowLines="True">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
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
