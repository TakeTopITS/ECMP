<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteDefaultLeftRight_TakeTopSoft.aspx.cs" Inherits="TakeTopSiteDefaultLeftRight_TakeTopSoft" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目管理软件与咨询服务提供商-泰顶拓鼎</title>

     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
       <script src="js/allAHandler.js" type="text/javascript"></script>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?59b6149c7d08132d9262552e18205ae6";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();


        //取得链接传入参数的值
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);
            return null;
        }

        function redirectHomePage() {

            var url = window.location.host;

            if (url.toLowerCase() == "www.ourpm.net") {

                window.location.href = "http://www.ourpm.net/error.html";

            }
            else {

                window.location.href = 'https://www.taketopits.com';
            }

        }


        //设置主页的SRC
        function setHomePageSrc() {

            var pageUrl = window.location.href;

            //不是在网站应用启动的网站，跳转到网站页面
            if (pageUrl.indexOf("TDSite") < 0 && pageUrl.toLowerCase().indexOf("taketopits.com") >=0) {

                redirectHomePage();
            }

            var TargetProduct = getUrlParam("TargetProduct");

            if (TargetProduct === "XMB") {

                this.document.getElementById("TakeTopSiteTop").src = "TakeTopSiteTop.aspx?TargetProduct=XMB";
                this.document.getElementById("SiteRightContainerFrameID").src = "https://www.taketopits.com/xmb/logo/indexXMB.html";

            }
            else if (TargetProduct === "ERP") {

                this.document.getElementById("TakeTopSiteTop").src = "TakeTopSiteTop.aspx?TargetProduct=ERP";
                this.document.getElementById("SiteLeftFrameID").src = "https://www.taketopits.com/TDSite/TakeTopSiteLeft.aspx?ModuleName=ERP平台&HomeModuleName=项目型ERP";
                this.document.getElementById("SiteRightContainerFrameID").src = "https://www.taketopits.com/TDSite/TakeTopSiteContainer.aspx?ModuleName=ERP平台&HomeModuleName=项目型ERP";

            }
            else if (TargetProduct === "PMP") {

                this.document.getElementById("TakeTopSiteTop").src = "TakeTopSiteTop.aspx?TargetProduct=PMP";
                this.document.getElementById("SiteLeftFrameID").src = "https://www.taketopits.com/TDSite/TakeTopSiteLeft.aspx?ModuleName=项目平台PMP&HomeModuleName=项目管理平台";
                this.document.getElementById("SiteRightContainerFrameID").src = "https://www.taketopits.com/TDSite/TakeTopSiteContainer.aspx?ModuleName=项目平台PMP&HomeModuleName=项目管理平台";

            }
            else {

                this.document.getElementById("TakeTopSiteTop").src = "TakeTopSiteTop.aspx";
                this.document.getElementById("SiteRightContainerFrameID").src = "Logo/WebSite/indexHomePage.html?ModuleName=主页&HomeModuleName=主页";
            }
        }

    </script>

</head>
<frameset rows="118,*" onload="setHomePageSrc()">
    <frame id="TakeTopSiteTop"  id="SiteTopFrameID" name="SiteTopFrame" frameborder="no" scrolling="no" marginwidth="0" marginheight="0" marginbottom="0" />
    <frameset id="TakeTopSiteMDI" name="TakeTopSiteMDI" cols="0,*" rows="*" frameborder="no" border="0" framespacing="0">
        <frame id="SiteLeftFrameID" name="leftFrame" src="TakeTopSiteLeft.aspx" width="100%" height="100%" scrolling="yes" />
        <div style="overflow: scroll !important; -webkit-overflow-scrolling: touch !important;">
            <frame id="SiteRightContainerFrameID" name="SiteRightContainerFrame"  width="100%" height="100%" scrolling="yes" />
        </div>
    </frameset>
</frameset>

<noframes>
    <body>你的浏览器不支持框架！</body>
</noframes>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
