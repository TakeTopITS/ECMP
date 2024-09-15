<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteLeft.aspx.cs" Inherits="TakeTopSiteLeft" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="Logo/website/css/bluelightSiteleftEx.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>

    <script type="text/javascript" language="javascript">
        document.ontouchmove = function (e) {
            e.preventDefault();
        };
        jQuery.noConflict();
        jQuery(function () {

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
            var itv = null;
            if (browser.versions.mobile == true) {
                var mouseX = new Array();
                var mouseY = new Array();
                clearInterval(itv);
                itv = setInterval(function () {
                    var hxdx = Math.max.apply(Math, mouseX) - Math.min.apply(Math, mouseX);
                    var zxdy = Math.max.apply(Math, mouseY) - Math.min.apply(Math, mouseY);
                    if (hxdx > 40 && zxdy < hxdx * 0.5) {
                        if (mouseX[0] - mouseX[mouseX.length - 1] > 0) {
                            ChangeMenu(0);
                        }
                    }
                    mouseX = new Array();
                    mouseY = new Array();
                }, 200);
                jQuery(document).on("touchmove", function (evt) {
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


        var preFrameW = '181,*';
        var LeftFrameHide = 0;

        var i = 0;
        var j = 0;

        var decreaseTimer;
        var creaseTimer;

        var userAgentInfo = navigator.userAgent;


        function CreateTab(title, url, obj) {

            scrollHeight = document.documentElement.scrollTop + document.body.scrollTop;

            jQuery("#divload").show();

            //parent.frames['rightTabFrame'].document.all('tabA').onclick();
            //window.parent.document.getElementById("SiteRightContainerFrameID").rows = '*,1,25';
            //parent.frames["SiteRightContainerFrame"].addTab(title, url, "new");

            // alert(jQuery(obj).parent().parent().parent().parent().html());
            // jQuery(obj).parent().parent().parent().parent().parent().find("a").css("color", "");
            //jQuery(obj).parent().find("a").css("color", "red");

            jQuery(obj).parent().parent().parent().parent().parent().find("font").css("color", "");
            jQuery(obj).parent().find("font").css("color", "red");


            //jQuery(obj).parent().parent().find("span").removeClass("testBold");
            //jQuery(obj).parent().parent().parent().parent().parent().parent().parent().find("span").removeClass("testBold");
            //jQuery(obj).parent().parent().parent().parent().parent().find("span").addClass("testBold");

            // jQuery(obj).parent().find("span").attr("color", "red");
            //jQuery(obj).parent().find("a").attr("background", "red");

            // alert(jQuery(obj).parent().html());

            //jQuery("#divload").hide();
            setTimeout("CloseDiv()", 500);


            //var iframeLeft = parent.frames["rightTabFrame"];//window.parent.document.getElementById("rightTabFrameID");
            //alert(iframeLeft.src);
            //if (iframe.attachEvent) {
            //    iframeLeft.attachEvent("onload", function ()
            //    {
            //        alert("Local iframe is now loaded.5555");
            //        jQuery("#divload").hide();
            //    });
            //} else {
            //    iframeLeft.onload = function () {
            //        alert("Local iframe is now loaded.4444");
            //        jQuery("#divload").hide();
            //    };
            //}


            //window.scroll(0.0);

            return false;

            //alert(document.body.clientHeight);
            //parent.frames["rightTabFrame"].document.getElementById("tt").style.height = document.body.clientHeight +"px";
        }


        function CreateTabModule(title, url, obj) {

            jQuery("#divload").show();

            //window.parent.document.getElementById("SiteRightContainerFrameID").rows = '*,1,25';
            //parent.frames["SiteRightContainerFrame"].addTab(title, url, "new");

            //jQuery(obj).parent().parent().find("span").removeClass("testBold");
            //jQuery(obj).parent().parent().parent().parent().parent().parent().parent().find("span").removeClass("testBold");
            //jQuery(obj).addClass("testBold");

            jQuery(obj).parent().parent().parent().parent().parent().parent().parent().parent().find("font").css("color", "");
            jQuery(obj).parent().find("font").css("color", "red");


            var clickStyle = jQuery(obj).parent().find(".plusSpan").css("display");
            //alert(clickStyle);
            if (clickStyle == "none") {

            } else {

                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").hide();
                jQuery(obj).parent().next(".text").slideToggle("slow");
            }

            //jQuery("#divload").hide();
            setTimeout("CloseDiv()", 500);

        }

        function CloseDiv() {
            jQuery("#divload").hide();
        }

        function OnMouseOverEvent(obj) {
            //alert(jQuery(obj).html());
            jQuery(obj).addClass("spanHover");
        }

        function OnMouseOutEvent(obj) {
            jQuery(obj).removeClass("spanHover");
        }


        function OnPlusEvent(obj) {
            var clickStyle = jQuery(obj).parent().find(".plusSpan").css("display");
            //alert(clickStyle);
            if (clickStyle == "none") {


                //alert("收起来");
                //jQuery("div.text").hide();

                //jQuery("img.minus").show();
                //jQuery("img.plus").show();
                //jQuery("img.minus").hide();
                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                ////jQuery(obj).next(".text").slideToggle("slow");
                //jQuery(obj).parent().next(".text").hide();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").hide();


                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                //jQuery(obj).parent().next(".text").hide();


            } else {
                //alert("展开");
                //alert(jQuery("#UpdatePanel1")[0].scrollTop);
                //alert(jQuery(obj).parent().parent().scrollTop());
                //jQuery("div.text").hide();

                //jQuery("img.minus").show();
                //jQuery("img.plus").show();
                //jQuery("img.minus").hide();
                //jQuery(obj).parent().find(".minus").show();
                //jQuery(obj).parent().find(".plus").hide();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").hide();
                jQuery(obj).parent().next(".text").slideToggle("slow");
            }
        }

        function OnMinusEvent(obj) {
            //alert(jQuery(obj).parent().html() + "aa" + jQuery(obj).attr("display"));
            var clickStyle = jQuery(obj).parent().find(".minusSpan").css("display");
            //alert(clickStyle);
            if (clickStyle == "none") {

                //alert("展开");
                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").slideToggle("slow");

            } else {
                //alert("收起来");
                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").hide();
            }



            //jQuery("#divload").hide();
            setTimeout("CloseDiv()", 500);



            //var iframeLeft = parent.frames["rightTabFrame"];//window.parent.document.getElementById("rightTabFrameID");
            //alert(iframeLeft);
            //if (iframeLeft.attachEvent) {
            //    iframeLeft.attachEvent("onload", function () {
            //        alert("Local iframe is now loaded.111");
            //        jQuery("#divload").hide();
            //    });
            //} else {
            //    iframeLeft.onload = function () {
            //        alert("Local iframe is now loaded.222");
            //        jQuery("#divload").hide();
            //    };
            //}
        }


        function CloseDiv() {
            jQuery("#divload").hide();
        }

        function OnMouseOverEvent(obj) {
            //alert(jQuery(obj).html());
            jQuery(obj).addClass("spanHover");
        }

        function OnMouseOutEvent(obj) {
            jQuery(obj).removeClass("spanHover");
        }


        function OnPlusEvent(obj) {
            var clickStyle = jQuery(obj).parent().find(".plusSpan").css("display");
            //alert(clickStyle);
            if (clickStyle == "none") {

                //alert("收起来");
                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").hide();


            } else {
                //alert("展开");
                //jQuery(obj).parent().find(".minus").show();
                //jQuery(obj).parent().find(".plus").hide();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").slideToggle("slow");


            }

        }



        function OnDoubleClickModule(obj) {
            var clickStyle = jQuery(obj).parent().find(".plus").css("display");
            if (clickStyle == "none") {
                //jQuery(obj).parent().find(".minus").hide();
                //jQuery(obj).parent().find(".plus").show();
                jQuery(obj).parent().find(".minusSpan").show();
                jQuery(obj).parent().find(".plusSpan").show();
                jQuery(obj).parent().next(".text").hide();
            }
        }

        /* function ChangeMenu(way) {
         
                 if (way == 0) {
 
                     window.parent.document.getElementById("TakeTopSiteMDI").cols = '0,*';
 
                     top.frames[2].document.all('divLeftBar').style.display = "block";
                     top.frames[2].document.all('IM_RightToLeft').style.display = "block";
 
                     return;
 
                 }
 
                 if (way == 1) {
 
                     window.parent.document.getElementById("TakeTopSiteMDI").cols = '181,*';
 
                     return;
                 }
         }*/

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 30) {
                window.parent.document.getElementById("TakeTopLRMDI").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 181) {
                window.parent.document.getElementById("TakeTopLRMDI").cols = j.toString() + ",*";
            }
        }


        // 收缩展开效果
        jQuery(document).ready(function () {
            //jQuery("img.minus").show();
            //jQuery("img.plus").show();
            //jQuery("img.minus").hide();


            jQuery("span.minusSpan").show();
            jQuery("span.plusSpan").show();
            //jQuery("span.minusSpan").hide();



            //jQuery(jQuery("img.minus")[0]).show();
            //jQuery(jQuery("img.plus")[0]).hide();
            //jQuery(jQuery("div.text")[0]).show();//默认隐藏div，或者在样式表中添加.text{display:none}，推荐使用后者
            //jQuery(".box span").click(function () {
            //jQuery("div.text").hide();

            //jQuery("img.minus").show();
            //jQuery("img.plus").show();
            //jQuery("img.minus").hide();
            //jQuery(this).find(".minus").show();
            //jQuery(this).find(".plus").hide();

            //jQuery(this).next(".text").slideToggle("slow");
            //});



        });

        function opim(id, htmlText) {

            var dg = new J.dialog({ id: id, title: 'TakeTopIM', width: 440, height: 570, btnBar: false, cancelBtn: false, page: htmlText, autoPos: { left: 'left', top: 'top' }, fixed: false, left: 'left', top: 'top', rang: true });

            dg.ShowDialog();
        }

        function getObject(objectId) {
            if (document.getElementById && document.getElementById(objectId)) {
                // W3C DOM
                return document.getElementById(objectId);
            }
            else if (document.all && document.all(objectId)) {
                // MSIE 4 DOM
                return document.all(objectId);
            }
            else if (document.layers && document.layers[objectId]) {
                // NN 4 DOM.. note: this won't find nested layers
                return document.layers[objectId];
            }
            else {
                return false;
            }
        }

        function showHide(objname) {
            var obj = getObject(objname);
            if (obj.style.display == "none") {
                obj.style.display = "block";
            } else {
                obj.style.display = "none";
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



    <style type="text/css">
        /* 收缩展开效果 */
        .text {
            line-height: 37px;
            padding: 0 1px;
            /*color: #666;*/
            /*display: none;*/
        }



        .box span img { /*display:none;*/
            vertical-align: middle;
        }



        .box:hover {
            background: #ececec;
        }

        div.leftSet {
            height: 40px;
            background: url(Logo/website/Images/leftSetbg.gif) 0 0 no-repeat;
            z-index: -2;
        }

        .content {
            padding-left: 5px;
            text-align: left;
            background: #EFF3F6;
            line-height: 37px;
            margin: 0;
        }

            .content span {
                background: url(Logo/website/Images/jiant.gif) 0 12px no-repeat;
                padding-left: 12px;
            }

        ul li {
            padding-left: 15px;
            /*padding: 0px 0;*/
            border-bottom: 1px dotted #ddd;
            list-style: none;
            line-height: 37px;
        }

        .titlecj {
            /*font-size: 12px;
            font-weight: bold;
            color: #003366;*/
            font-size: 14px;
            text-decoration: none;
            line-height: 37px;
        }

        .titleSpan {
            font-size: 14px;
            /*       color:#003366;*/
            text-decoration: none;
            position: relative;
            /*			font-weight:bold;*/
        }

        .plusSpan {
            padding: 0px 0px 0px 0px;
            margin: 0px 0px 0px 0px;
        }

        .minusSpan {
            padding: 0px 0px 0px 0px;
            margin: 0px 0px 0px 0px;
        }

        .spanHover {
            height: 37px;
            text-align: left;
            background-repeat: no-repeat;
            color: #022c56;
            text-decoration: none;
            font-weight: bold;
            line-height: 37px;
            background-position: left;
        }

        .testBold {
            font-weight: bold;
        }

        #topNav {
            /*background-color:#096;*/
            z-index: -2;
            overflow: visible;
        }

        #divBody {
            /*background-color:#096;*/
            z-index: -3;
            overflow: visible;
            /*margin-left:150px;*/
            width: 400px;
        }

        .ToolBarLeftRight {
            z-index: -10;
            position: fixed !important;
            top: 250px;
            left: 10px;
            margin: 0 auto;
            position: absolute;
            /*top: expression(offsetParent.scrollTop+0);*/
            border: 1px solid #dddddd;
            background-color: white;
            width: 25px;
            height: 169px;
            text-align: left;
        }


        /*----------触控功能------*/
    </style>

</head>

<body style="background-color: white;" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;" ontouchmove="event.preventDefault()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--<div class="ToolBarLeftRight">
                    <a href="javascript:ChangeMenu(0)">
                        <asp:Image ID="IM_LeftToRight" ImageUrl="Logo/website/Images/tupian-left.png" Style="width: 50px; height: 169px; border: 0;" alt="隐藏左边栏" runat="server" />
                    </a>
                </div>--%>

                <div id="divBody" style="height: 100%;">
                    <a href="javascript:ChangeMenu(0)">
                        <div class="leftSet">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="2%"></td>
                                    <td width="66%">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
                                            <tr style="height: 37px;">
                                                <td align="center" width="14"></td>
                                                <td class="title12">

                                                    <asp:Label ID="LB_HomeModuleName" runat="server" Text="<%$ Resources:lang,ModuleName%>"></asp:Label>

                                                </td>
                                                <td align="left" width="12">
                                                    <img src="Logo/website/Images/left-jiantou.png" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </a>

                    <!-- 收缩展开效果start -->
                    <asp:Literal ID="LT_Result" runat="server"></asp:Literal>
                    <!-- 收缩展开效果end -->


                </div>

                <asp:HiddenField ID="HF_ClickValue" runat="server" Value="" />
                <div id="divload" style="position: absolute; left: 40%; top: 30%; display: none;">
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
        <div style="position: absolute; left: 20%; top: 20%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
