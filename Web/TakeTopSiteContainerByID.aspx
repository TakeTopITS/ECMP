<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteContainerByID.aspx.cs" Inherits="TakeTopSiteContainerByID" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link id="mainCss" href="css/cssGreen/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <style type="text/css">
        /*html {
            overflow-x: hidden;
        }*/
        div {
            cursor: pointer
        }

        .ToolBarLeftRight {
            position: fixed !important;
            top: 320px;
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
        $(function () {

            aHandler();

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

    </script>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?59b6149c7d08132d9262552e18205ae6";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>


</head>
<body onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;">
    <form id="form1" runat="server">

        <div id="divLeftBar" runat="server" class="ToolBarLeftRight" width="95%">
            <table width="100%">
                <tr>
                    <td width="100px" align="left">
                        <a href="javascript:ChangeMenu(1)">
                            <asp:Image ID="IM_RightToLeft" ImageUrl="Logo/website/Images/tupian.png" Width="50" Height="169" border="0" alt="隐藏左边栏" runat="server" /></a>

                    </td>
                </tr>
            </table>
        </div>

        <div id="divBody" width="100%">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
                        <asp:DataList ID="DataList1" runat="server" Width="100%">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#DataBinder .Eval (Container.DataItem ,"Content") %>
                            </ItemTemplate>
                            <%--  <ItemStyle HorizontalAlign="center" />--%>
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <iframe src="TakeTopSiteTop.aspx" id="SiteBottomFrameID" name="SiteBottomFrame" style="width: 100%; height: 80px;" frameborder="no" scrolling="no" marginwidth="0" marginheight="0" marginbottom="0" />

    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
