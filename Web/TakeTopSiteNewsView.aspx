<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteNewsView.aspx.cs" Inherits="TakeTopSiteNewsView" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=device-dpi" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js"></script>

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style>
        /*html {
            overflow-x: hidden;
        }*/
        div {
            cursor: pointer;
        }

        .ToolBarLeftRight {
            position: fixed !important;
            top: 250px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            /*border: 1px solid #dddddd;*/
            background-color: white;
            width: 25px;
            height: 169px;
            z-index: 99999;
        }
    </style>

    <script type="text/javascript" language="javascript">
        document.ontouchmove = function (e) { e.preventDefault(); };
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
            var browser = {
                versions: function () {
                    var u = navigator.userAgent, app = navigator.appVersion;
                    return {
                        mobile: !!u.match(/AppleWebKit.*Mobile.*/),
                        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
                        android: u.indexOf("Android") > -1 || u.indexOf("Linux") > -1,
                        iPhone: u.indexOf("iPhone") > -1,
                        iPad: u.indexOf("iPad") > -1
                    };
                }(),
                language: (navigator.browserLanguage || navigator.language).toLowerCase()
            };
            if (browser.versions.mobile == true) {
                var mouseX = new Array();
                var mouseY = new Array();
                $(document).on("touchend click", function (evt) {
                    var hxdx = Math.max.apply(Math, mouseX) - Math.min.apply(Math, mouseX);
                    var zxdy = Math.max.apply(Math, mouseY) - Math.min.apply(Math, mouseY);
                    if (hxdx > 30 && zxdy < hxdx * 0.5) {
                        if (mouseX[0] - mouseX[mouseX.length - 1] > 0) {
                            ChangeMenu(0);
                        }
                        else {
                            ChangeMenu(1);
                        }

                    }
                    mouseX = new Array();
                    mouseY = new Array();
                });
                $(document).on("touchmove", function (evt) {
                    var _touch = evt.originalEvent.targetTouches[0];
                    var touch_end = _touch.pageX;
                    mouseX.push(touch_end);
                    touch_end = _touch.pageY;
                    mouseY.push(touch_end);
                });
            }
        });
        function ChangeMenu(way) {

            if (way == 0) {

                window.parent.document.getElementById("TakeTopSiteMDI").cols = '0,*';

                top.frames[2].document.all('divLeftBar').style.display = "block";
                top.frames[2].document.all('IM_RightToLeft').style.display = "block";

                return;

            }

            if (way == 1) {
                var browser = {
                    versions: function () {
                        var u = navigator.userAgent, app = navigator.appVersion;
                        return {
                            mobile: !!u.match(/AppleWebKit.*Mobile.*/),
                            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
                            android: u.indexOf("Android") > -1 || u.indexOf("Linux") > -1,
                            iPhone: u.indexOf("iPhone") > -1,
                            iPad: u.indexOf("iPad") > -1
                        };
                    }(),
                    language: (navigator.browserLanguage || navigator.language).toLowerCase()
                };
                if (browser.versions.mobile == true)
                    window.parent.document.getElementById("TakeTopSiteMDI").cols = '50%,50%';
                else
                    window.parent.document.getElementById("TakeTopSiteMDI").cols = '181,*';
                top.frames[2].document.all('divLeftBar').style.display = "none";
                top.frames[2].document.all('IM_RightToLeft').style.display = "none";
                return;
            }
        }

        //传入URL作为参数
        function popShowByURL(url, title, width, height) {
            var w = 'auto', h = 'auto', t =  url.replace('.aspx', '').replace("TT",'');
            if (title) {
                t = title;
            }
            if (width) {
                w = width + 'px';
            }
            if (height) {
                h = height + 'px';
            }
            layer.open({
                type: 2,
                title: t,
                anim: 0,
                fixed: true,
                resize: true,
                scrollbar: true,
                moveOut: true,
                shade: false,
                shadeClose: false,
                maxmin: true,
                content: url,
                area: ["99%", "99%"]
                ,
                zIndex: layer..zIndex, //重点1
                success: function (layero) {
                    layer.setTop(layero); //重点2
                },
                end: function () {

                    if (location.href.indexOf("TTCollaborationManage.aspx") >= 0 || location.href.indexOf("TTPlanManagement.aspx") >= 0
                        || location.href.indexOf("TTTaskManagement.aspx") >= 0 || location.href.indexOf("TTKPIManagement.aspx") >= 0
                        || location.href.indexOf("TTWLManage.aspx") >= 0 || location.href.indexOf("TTProjectTaskManage.aspx") >= 0
                        || location.href.indexOf("TTReqManage.aspx") >= 0 || location.href.indexOf("TTProjectRequirementManage.aspx") >= 0
                        || location.href.indexOf("TTProjectWorkFlowManage.aspx") >= 0 || location.href.indexOf("TTDefectManage.aspx") >= 0
                        || location.href.indexOf("TTProjectTaskList.aspx") >= 0 || location.href.indexOf("TTProjectRelatedReqMain.aspx") >= 0
                        || location.href.indexOf("TTProjectRelatedDefectMain.aspx") >= 0

                    ) {

                        location.reload();
                    }

                }
            });
        }


    </script>

</head>
<body>
    <form id="form1" runat="server">

        <div id="divBody" width="100%">
            <table width="100%%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="LB_CompanyNews" runat="server" Text="<%$ Resources:lang,LastestNews%>"></asp:Label>
                                            </td>
                                            <td width="5">
                                                <img alt="" src="ImagesSkin/main_top_r.jpg" width="5" height="31" />
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td valign="top" style="padding: 5px 5px 5px 5px; overflow-y: auto;">
                        <asp:DataList ID="DataList1" runat="server" Width="100%">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#DataBinder .Eval (Container.DataItem ,"Content") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
