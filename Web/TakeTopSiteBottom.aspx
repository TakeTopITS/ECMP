<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteBottom.aspx.cs" Inherits="TakeTopSiteBottom" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta charset="UTF-8" />
    <meta name="keywords" content="泰顶,拓鼎,项目管理,项目管理软件,项目管理系统,项目管理平台,项目型ERP" />
    <meta name="description" content="泰顶、拓鼎、项目管理、项目软件、项目系统、ERP、CRM、OA、协同平台、云办公、泰顶最新产品、技术、解决方案价值及成功案例" />

    <title>项目型企业管理软件提供商-泰顶拓鼎首页</title>
    <link href="Logo/website/css/shouye.css" rel="stylesheet" type="text/css" />
    <link href="./css/public.css" rel="stylesheet" type="text/css" />
    <link href="./css/header.css" rel="stylesheet" type="text/css" />
    <link href="./css/forever.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/public.js"></script>
    <script src="./js/wk_inc.js" language="javascript"></script>
    <script type="text/javascript" src="./js/forever.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <style type="text/css">
        .TextColor {
            color: red;
            background: #017afb;
            padding: 3px;
        }
    </style>

    <script type="text/javascript">
        document.ontouchmove = function (e) {
            e.preventDefault();
        };
        function AddFavorite(sURL, sTitle) {
            try {
                window.external.addFavorite(sURL, sTitle);
            }
            catch (e) {
                try {
                    window.sidebar.addPanel(sTitle, sURL, "");
                }
                catch (e) {
                    alert("加入收藏失败，请使用Ctrl+D进行添加");
                }
            }
        }

        function OnMouseDownEventForWholePage(obj) {

            jQuery(obj).parents().find("a").removeClass("current");
            jQuery(obj).parents().find("span").removeClass("TextColor");
            jQuery(obj).parent().find("span").addClass("TextColor");

            //window.parent.frames["msg1"].document.getElementById("按钮的ID")

            //window.parent.frames['SiteTopFrame'].document.all("a").removeClass("current");
            //window.parent.frames['SiteTopFrame'].document.all("span").removeClass("TextColor");

        }


        function adClick(site1, site2) {
            window.open(site1, "SiteRightContainerFrame");
            window.open(site2, "leftFrame");
         /*   window.open("TakeTopSiteBottom.aspx", "SiteTopFrame");*/
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
<body>
    <form id="form1" runat="server">
        <div class="warp">
            <div class="footer">
                <p>
                    <span><a onmousedown="OnMouseDownEvent(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=意见反馈&amp;HomeModuleName=意见反馈', 'TakeTopSiteLeft.aspx?ModuleName=意见反馈&amp;HomeModuleName=意见反馈');" class="current">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YiJianFanKui%>"></asp:Label>
                    </a>
                    </span>|<span>  <a onmousedown="OnMouseDownEvent(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=法律声明&amp;HomeModuleName=法律声明', 'TakeTopSiteLeft.aspx?ModuleName=法律声明&amp;HomeModuleName=法律声明');" class="current">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FaLuShengMing%>"></asp:Label>
                    </a>
                    </span>|<span> <a onmousedown="OnMouseDownEvent(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=关于我们&amp;HomeModuleName=关于我们', 'TakeTopSiteLeft.aspx?ModuleName=关于我们&amp;HomeModuleName=关于我们');" class="current">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanYuWoMen%>"></asp:Label>
                    </a>
                    </span>
                </p>
                <p>CopyRight：拓鼎信息(TakeTopITS Group)© 2006-2026 TakeTop ITS. <a href="http://www.miitbeian.gov.cn" target="_blank">沪ICP备18022438号-1 </a>taketopits.com</p>
            </div>

        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>

