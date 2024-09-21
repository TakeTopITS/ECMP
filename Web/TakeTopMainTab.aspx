<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopMainTab.aspx.cs" Inherits="TakeTopMainTab" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title></title>

    <style type="text/css">
        html, body {
            height: 100%;
            height: auto;
            min-height: 100%;
            width: 100%;
            width: auto;
            min-width: 100%;
            margin: 0;
            margin-left: 0px;
          /*  background-image: url(ImagesSkin/Backgroud.jpg);
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;*/
        }
    </style>

    <link id="mainCss" href="css/bluelightleftEx.css" rel="stylesheet" type="text/css" />
    <link id="easyuiCss" href="css/easyui.css" rel="stylesheet" />
    <link id="iconCss" href="css/icon.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        intTabIndex = 1;

        $(function () {

            if (top.location != self.location) { }
            else {
                CloseWebPage();
            }

            var intSelectTabIndex = 0;

            var tabs = $('#tt').tabs("tabs");
            if (tabs.length == 0) {

                //依版本类型和用户类型打开相应的个人空间页面
                var varSystemVerType = '<%=Session["SystemVersionType"].ToString() %>'.trim();
                if (varSystemVerType == "SAAS") {

                    addTab('PersonalSpace', 'TakeTopPersonalSpaceSAAS.aspx', 'new');
                }
                else {
                    var varUserType = '<%=Session["UserType"].ToString() %>'.trim();
                    if (varUserType == "INNER") {
                        addTab('PersonalSpace', 'TakeTopPersonalSpace.aspx', 'new');
                    }
                    else {
                        addTab('PersonalSpace', 'TakeTopPersonalSpaceForOuterUser.aspx', 'new');
                    }
                }
            }

            $('#tt').tabs({
                onSelect: function (tt) {

                    var tabs = $('#tt').tabs("tabs");
                    var currentTab = $('#tt').tabs('getSelected'),
                        currentTabIndex = $('#tt').tabs('getTabIndex', currentTab);

                    intSelectTabIndex = currentTabIndex - 1;

                    //得到焦点时，刷新此页面
                    if (tabs.length > 0) {
                        var iframe = $(currentTab).find("iframe").get(0);

                        if (iframe.src.indexOf("TakeTopPersonalSpace") > 0) {

                            //alert(window.parent.document.getElementById("rightFrame").rows);
                            //window.parent.document.getElementById("rightFrame").rows = '0,*';
                        }

                        //if (iframe.src.indexOf("TakeTopPersonalSpace") != -1) {

                        //    window.parent.document.getElementById("rightFrame").rows = '0,*';  
                        //}

                    }

                },
                onClose: function (tt) {

                    $('#tt').tabs('select', intSelectTabIndex);

                }

            });

            changeIFrameDivWidth();
        });

        //添加TAB栏
        function addTab(title, url, type) {

            if (type == "new") {
                intTabIndex = 1;
            }

            ////弹出新页面
            //if (url.indexOf('TakeTopPersonalSpace') == -1) {

            //    //关闭所有子层
            //    CloseChildLayer();

            //    popShowByURL(url, 800, 600,window.location);

            //    return;

            //}

            title = $.trim(title).replaceAll("<div>", "").replaceAll("</div>", "");

            title = intTabIndex + " " + title;

            var tabHeight = (parent.document.body.scrollHeight - 33) + "px";

            if ($.trim(title).length > 13) {
                title = $.trim(title).substring(0, 10) + "...";
            }

            if (type == "new") {

                //关闭所有层
                layer.closeAll();

                //先删除其它tab
                $('.tabs-inner span').each(function (i, n) {
                    var t = $(n).text();
                    if (t != 'Home') {
                        $('#tt').tabs('close', t);
                    }
                });

                //再创建
                if ($('#tt').tabs('exists', title)) {
                    $('#tt').tabs('select', title);
                } else {

                    var content = '<iframe  scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:' + tabHeight + ';"></iframe>';

                    $('#tt').tabs('add', {
                        index: intTabIndex,
                        title: title,
                        content: content,
                        closable: true
                    });
                }
            } else {
                var content = '<iframe  scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:' + tabHeight + ';"></iframe>';
                $('#tt').tabs('add', {
                    index: intTabIndex,
                    title: title,
                    content: content,
                    closable: true
                });
            }

            intTabIndex++;

            changeIFrameDivWidth();
        }

        //关联所有子层
        function CloseChildLayer() {
            layer.closeAll('iframe');
        }

        //删除当前TAB
        function CloseCurrentTabPage() {

            //删除指定tab
            $('.tabs-inner span').each(function (i, n) {

                var t = $(n).text();

                var tClass = $(n).parent().parent().attr("class");

                if (tClass == 'tabs-selected') {
                    $('#tt').tabs('close', t);
                }
            });
        }

        //删除当前TAB
        function CloseCurrentTabPageAndOpenSpecialPage() {

            //删除指定tab
            $('.tabs-inner span').each(function (i, n) {

                var t = $(n).text();

                var tClass = $(n).parent().parent().attr("class");

                if (tClass == 'tabs-selected') {
                    $('#tt').tabs('close', t);
                }
            });

            $('.tabs-selected').remove();

            //依版本类型和用户类型打开相应的个人空间页面
            var varSystemVerType = '<%=Session["SystemVersionType"].ToString() %>'.trim();
            if (varSystemVerType == "SAAS") {
                addTab('PersonalSpace', 'TakeTopPersonalSpaceSAAS.aspx', 'new');
            }
            else {
                var varUserType = '<%=Session["UserType"].ToString() %>'.trim();
                if (varUserType == "INNER") {
                    addTab('PersonalSpace', 'TakeTopPersonalSpace.aspx', 'new');
                }
                else {
                    addTab('PersonalSpace', 'TakeTopPersonalSpaceForOuterUser.aspx', 'new');
                }
            }

            window.parent.document.getElementById("rightFrame").rows = '0,*';
        }

        function test_confirm() {
            $.confirm({
                title: '提示！',
                content: '将确认和取消按钮设置为中文显示！',
                buttons: {
                    ok: {
                        text: "确定",
                        btnClass: 'btn-primary',
                        keys: ['enter'],
                        action: function () {
                            alert("你点击了确认按钮！")

                        }
                    },
                    cancel: {
                        text: "取消",
                        btnClass: 'btn-primary',
                        keys: ['esc'],
                        action: function () {
                            alert("你点击了取消按钮！")
                        }

                    }
                }
            });
        }


        //刷新页面
        function reloadPage() {

            location.reload();
        }


        window.parent.window.onresize = function () {

            changeIFrameDivWidth();
        }



        //设置Tab内容的宽度，使之自适应框架的宽度
        function changeIFrameDivWidth() {

            var cNodes = document.getElementsByClassName("panel-body panel-body-noheader panel-body-noborder");
            for (var i = 0; i < cNodes.length; i++) {

                cNodes[i].style.width = "100%";
                cNodes[i].style.tabHeight = (parent.document.body.scrollHeight - 33) + "px";
            }

            var cFrameNodes = document.getElementsByTagName('iframe');
            for (var j = 0; j < cFrameNodes.length; j++) {

                /*  alert(cFrameNodes[j].src);*/

                if (cFrameNodes[j].src.indexOf('TakeTopPersonalSpace') > 0) {

                    cFrameNodes[j].style.height = (parent.document.body.scrollHeight - 0) + "px";
                }
                else {
                    cFrameNodes[j].style.height = (parent.document.body.scrollHeight - 45) + "px";
                }

            }

        }

    </script>

</head>
<body style="margin: 0 0 0 0;">

    <%-- <div id="tt" class="easyui-tabs" onmousemove="changeIFrameDivWidth();">--%>
    <div id="tt" class="easyui-tabs">
    </div>

</body>
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';

    var oMainLink = document.getElementById('mainCss');
    oMainLink.href = 'css/' + cssDirectory + '/' + 'bluelightleftEx.css';

    var oEasyuiLink = document.getElementById('easyuiCss');
    oEasyuiLink.href = 'css/' + cssDirectory + '/' + 'easyui.css';

    var oIconLink = document.getElementById('iconCss');
    oIconLink.href = 'css/' + cssDirectory + '/' + 'icon.css';
</script>
</html>
