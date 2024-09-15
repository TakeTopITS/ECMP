<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteTop.aspx.cs" Inherits="TakeTopSiteTop" %>

<%@ OutputCache Duration="2678400" VaryByParam="*" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta charset="UTF-8" />
    <meta name="keywords" content="泰顶,拓鼎，泰顶软件,泰顶系统,泰顶管理软件,泰顶项目,泰顶协同,泰顶OA,泰顶PMP,泰顶ERP,泰顶CMP,泰顶CRM,拓鼎ERP,拓鼎EMP,拓鼎FSP,拓鼎SIMP,拓鼎HMP,拓鼎云服务,泰顶云办公" />
    <meta name="description" content="泰顶、拓鼎、项目软件、项目系统、协同OA、ERP,协同平台、教育管理、金融服务、客户管理、客户关系、客户平台、系统实施、猎头、猎聘、云办公、泰顶最新产品、技术、解决方案价值及成功案例" />

    <title>企业管理软件提供商-泰顶拓鼎首页</title>
    <link href="Logo/website/css/shouye.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/public.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/header.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/forever.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/scrollDiv.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .mylist li {
            float: left;
        }

        html, body {
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
        }

        .TextColor {
            /*color :red ;*/
            background: #017afb;
            padding: 3px;
        }
    </style>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/public.js"></script>
    <script type="text/javascript" src="./js/wk_inc.js" language="javascript"></script>
    <script type="text/javascript" src="./js/forever.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/javascript">

        //取得链接传入参数的值
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);
            return null;
        }


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



        function OnMouseDownEvent(obj) {

            jQuery(obj).parent().parent().find("a").removeClass("current");
            jQuery(obj).parents().find("span").removeClass("TextColor");
            jQuery(obj).addClass("current");

            window.parent.frames['SiteBottomFrame'].location = "TakeTopSiteTop.aspx";
        }

        function OnMouseDownEventForWholePage(obj) {

            jQuery(obj).parents().find("a").removeClass("current");
            jQuery(obj).parents().find("span").removeClass("TextColor");
            jQuery(obj).parent().find("span").addClass("TextColor");

            window.parent.frames['SiteBottomFrame'].location = "TakeTopSiteTop.aspx";
        }

    </script>

    <script type="text/javascript">
        function adClick(site1, site2) {
            window.open(site1, "SiteRightContainerFrame");
            window.open(site2, "leftFrame");
        }
    </script>

    <!--上下文字滚动效果-->
    <script type="text/javascript">
        function AutoScroll(obj) {
            $(obj).find("ul:first").animate({
                marginTop: "-30px"
            }, 1000, function () {
                $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
            });
        }
        $(document).ready(function () {

            if (top.location != self.location) {
            }
            else {
                redirectHomePage();
            }

            setInterval('AutoScroll("#s1")', 3000);

            //设置模组栏模组样式
            setModuleCSS();
        });

        function redirectHomePage() {

            var url = window.location.host;

            if (url.toLowerCase() == "www.ourpm.net") {

                window.location.href = "http://www.ourpm.net/error.html";

            }
            else {

                window.location.href = 'https://www.taketopits.com/TDSite/TakeTopSiteDefaultLeftRight_TakeTopSoft.aspx';
            }

        }

        //设置模组栏模组样式
        function setModuleCSS() {

            var TargetProduct = getUrlParam("TargetProduct");

            var list = document.getElementById("navlist");
            var lis = list.getElementsByTagName("a");

            for (var i = 0; i < lis.length; i++) {

                if (lis[i].href.indexOf(TargetProduct) > 0) {

                    lis[i].className = "current";
                    lis[0].className = "";

                }
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
<body>
    <form id="form1" runat="server">
        <div class="warp">
            <div id="headerbg">
                <div id="header">
                    <div id="logo">
                        <img class="pc" src="Logo/website/Images/SiteLogoPC.png" />
                        <img class="mobile" src="Logo/website/Images/SiteLogoMobile.png" />
                    </div>

                    <div id="lianjie1">
                        <table width="100%">
                            <tr>
                                <td style="width: 35px; text-align: center;">
                                    <a onmousedown="OnMouseDownEventForWholePage(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=线下购买&HomeModuleName=线下购买', 'TakeTopSiteLeft.aspx?ModuleName=线下购买&HomeModuleName=线下购买')">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GouMai%>"></asp:Label>
                                    </a>
                                </td>
                                <td style="width: 2px;"></td>
                                <td style="width: 35px; text-align: left;">
                                    <a onmousedown="OnMouseDownEventForWholePage(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=在线租用&HomeModuleName=在线租用', 'TakeTopSiteLeft.aspx?ModuleName=在线租用&HomeModuleName=在线租用')">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZuYong%>"></asp:Label>
                                    </a>
                                </td>
                                <td style="width: 2px;"></td>
                                <td style="width: 35px; text-align: left;">
                                    <a onmousedown="OnMouseDownEventForWholePage(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=下载&HomeModuleName=下载', 'TakeTopSiteLeft.aspx?ModuleName=下载&HomeModuleName=下载')">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="f_head_news" id="scrollDiv">
                        <!-- 收缩展开效果start -->
                        <asp:Literal ID="LT_Result" runat="server"></asp:Literal>
                        <!-- 收缩展开效果end -->
                    </div>

                    <div id="lianjie2">
                        <table width="100%">
                            <tr>
                                <td></td>
                                <td>
                                    <a onmousedown="OnMouseDownEventForWholePage(this)" href="javascript:adClick('TakeTopSiteContainer.aspx?ModuleName=渠道合作&HomeModuleName=渠道合作', 'TakeTopSiteLeft.aspx?ModuleName=渠道合作&HomeModuleName=渠道合作')">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QuDaoHeZuo%>"></asp:Label></a>
                                </td>

                                <td>&nbsp;</td>
                                <%--<td>

                                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=623077337&site=qq&menu=yes">
                                        <img border="0" src="Images/qq.png" height="20" width="20" alt="点击这里和我交谈" title="点击这里和我交谈" />
                                    </a>
                                </td>--%>

                                <td></td>

                                <%--  <td>
                                    <a href="http://weibo.com/TakeTopSoftware" target="_blank">
                                        <table>
                                            <tr>
                                                <td>
                                                    <img src="Images/weibo.png" height="20" width="20" />
                                                </td>
                                                <td>官方微博</td>
                                            </tr>
                                        </table>
                                    </a>
                                </td>--%>

                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                </td>

                                <td>
                                    <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="nav">
                        <ul id="navlist">
                            <asp:Repeater ID="RP_ModuleList" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a onmousedown="OnMouseDownEvent(this)" href="javascript:adClick('<%# (DataBinder.Eval(Container, "DataItem.PageName")).ToString().Trim() %>?ModuleName=<%# DataBinder.Eval(Container.DataItem,"ModuleName").ToString().Trim () %>&HomeModuleName=<%# DataBinder.Eval(Container.DataItem,"HomeModuleName").ToString ().Trim () %> ', 'TakeTopSiteLeft.aspx?ModuleName=<%# DataBinder.Eval(Container.DataItem,"ModuleName").ToString ().Trim () %>&HomeModuleName=<%# DataBinder.Eval(Container.DataItem,"HomeModuleName").ToString ().Trim () %>');">
                                            <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>

                        <div class="navcon" style="display: none;"></div>
                    </div>
                    <div class="jiantou">＜&nbsp;&nbsp;＞</div>
                </div>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
