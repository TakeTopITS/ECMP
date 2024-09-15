
document.write("<script language=javascript src='js/layer/layer/layer.js'></script>");
document.write("<script language=javascript src='js/popwindow.js'></script>");

function aHandler() {

    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");


        //判断是否是tree，或者分页
        if (click != "" && click != null && click != undefined) {
            if (click.toLowerCase().indexOf("treeview") == -1 && url.toLowerCase().indexOf("lbt_delete") == -1) {
                $(this).click(function () {

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1 && url.indexOf("tencent:") == -1 && url.indexOf("tel:") == -1 && url.indexOf("#") == -1 && url.toLowerCase().indexOf(".doc") == -1 && url.toLowerCase().indexOf(".xls") == -1 && url.toLowerCase().indexOf(".mpp") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location);
                        return false;
                    }

                    //top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600,window.location);


                });
            }
        }
        else if (title != ">" && title != "<" && (title.toLowerCase().indexOf("img") == -1 || url.toLowerCase().indexOf("treeview") == -1 || url.indexOf("TTDocumentTreeView") != -1 || url.indexOf("TakeTopAPPMain") == -1 || url.toLowerCase().indexOf("lbt_delete") == -1) && title != null && title != "" && title != "&gt;" && title != "&lt;") {
            $(this).click(function () {
                if (title.toLowerCase().indexOf("icon_del") == -1 && url.toLowerCase().indexOf("javascript") == -1 && url.toLowerCase().indexOf(".doc") == -1 && url.toLowerCase().indexOf(".xls") == -1 && url.toLowerCase().indexOf(".mpp") == -1) {

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1 && url.indexOf("tencent:") == -1 && url.indexOf("tel:") == -1 && url.indexOf("#") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location);
                        return false;
                    }

                    //top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600,window.location);
                }
            });
        }

    });
}

function aHandlerForPopFixedSizeWindow() {

    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");


        //判断是否是tree，或者分页
        if (click != "" && click != null && click != undefined) {
            if (click.toLowerCase().indexOf("treeview") == -1 && url.toLowerCase().indexOf("lbt_delete") == -1) {
                $(this).click(function () {

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1 && url.indexOf("tencent:") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURLForFixedSize(url, title, 800, 600, window.location, window.location);
                        return false;
                    }

                    //top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600,window.location);


                });
            }
        }
        else if (title != ">" && title != "<" && (title.toLowerCase().indexOf("img") == -1 || url.toLowerCase().indexOf("treeview") == -1 || url.indexOf("TTDocumentTreeView") != -1 || url.indexOf("TakeTopAPPMain") == -1 || url.toLowerCase().indexOf("lbt_delete") == -1) && title != null && title != "" && title != "&gt;" && title != "&lt;") {
            $(this).click(function () {
                if (title.toLowerCase().indexOf("icon_del") == -1 && url.toLowerCase().indexOf("javascript") == -1) {

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1 && url.indexOf("tencent:") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURLForFixedSize(url, title, 800, 600, window.location, window.location)
                        return false;
                    }

                    //top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600,window.location);


                }
            });
        }

    });
}

//使链接打开的窗口在框架内，用于自定义表单页面
function aHandlerForWorkflowDIYFormDataPopWindow(e) {
    e = e || event;
    var target = e.target || e.srcElement,
        url;
    if (target.tagName === 'A') {

        url = target.href;
        title = target.innerText;

    } else if (target.tagName === 'SPAN') {

        //父标签onclick属性的值
        url = target.parentNode.href;
        if (url === 'undefined' || url === null || url === "") {
            return;
        }
        title = target.innerText;
    }

    if (url.toUpperCase().indexOf("TTUserInforSimple.aspx".toUpperCase()) !== -1 || url.toUpperCase().indexOf("TTWorkFlowViewMain.aspx".toUpperCase()) !== -1
        || url.toUpperCase().indexOf("TTWFChartView".toUpperCase()) !== -1 || url.toUpperCase().indexOf("TTWLRelatedDoc.aspx".toUpperCase()) !== -1
    ) {

        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location)

        stopDefault(e);
    }
}

//取消事件的默认行为
function stopDefault(e) {
    if (e && e.preventDefault) {
        e.preventDefault();
    } else {
        window.event.returnValue = false;
    }
}

//工作流表单数据显示，弹出顶层框架的层，调用当前方法
function aHandlerForWorkflowCommonFormDataPopWindow() {

    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");

        //判断是否是tree，或者分页
        if (click !== "") {

            $(this).click(function () {

                if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1 && url.indexOf("NoPop=YES") == -1) {

                    top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location)


                    return false;
                }

            });

        }

    });
}


//弹出顶层框架的层，调用当前方法
function aHandlerForSpecialPopWindow() {
    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");


        //判断是否是tree，或者分页
        if (click != "" && click != null && click != undefined) {
            if (click.toLowerCase().indexOf("treeview") == -1 && url.toLowerCase().indexOf("lbt_delete") == -1) {
                $(this).click(function () {

                    if (top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        /*  top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows = '40,*';*/

                        if (url != "https://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            /* top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab("PersonalSpace", "TakeTopPersonalSpace.aspx", "new");*/
                        }
                    }

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location)


                        return false;
                    }

                });
            }
        }
        else if (title != ">" && title != "<" && (title.toLowerCase().indexOf("img") == -1 || url.toLowerCase().indexOf("treeview") == -1 || url.indexOf("TTDocumentTreeView") != -1 || url.indexOf("TakeTopAPPMain") == -1 || url.toLowerCase().indexOf("lbt_delete") == -1) && title != null && title != "" && title != "&gt;" && title != "&lt;") {
            $(this).click(function () {
                if (title.toLowerCase().indexOf("icon_del") == -1 && url.toLowerCase().indexOf("javascript") == -1) {

                    if (top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        /*   top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows = '40,*';*/

                        if (url != "https://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            /*  top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab("PersonalSpace", "TakeTopPersonalSpace.aspx", "new");*/
                        }
                    }

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1) {

                        top.frames[0].frames[2].parent.frames["rightTabFrame"].popShowByURL(url, title, 800, 600, window.location, window.location)

                        return false;
                    }

                }
            });
        }

    });
}


//弹出顶层框架的层，调用当前方法
function aHandlerForPersonalSpaceIOSAddTab() {
    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");

        //判断是否是tree，或者分页
        if (click != "" && click != null && click != undefined) {

            if (click.toLowerCase().indexOf("treeview") == -1 && url.toLowerCase().indexOf("lbt_delete") == -1) {
                $(this).click(function () {

                    if (top.frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        /*   top.frames[2].parent.document.getElementById("rightFrame").rows = '40,*';*/

                        if (url != "https://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            /*  top.frames[2].parent.frames["rightTabFrame"].addTab("PersonalSpace", "TakeTopPersonalSpace.aspx", "new");*/
                        }
                    }

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1) {

                        top.frames[2].parent.frames["rightTabFrame"].addTab(title, url, "old");

                        return false;
                    }

                });
            }
        }
        else if (title != ">" && title != "<" && (title.toLowerCase().indexOf("img") == -1 || url.toLowerCase().indexOf("treeview") == -1 || url.indexOf("TTDocumentTreeView") != -1 || url.indexOf("TakeTopAPPMain") == -1 || url.toLowerCase().indexOf("lbt_delete") == -1) && title != null && title != "" && title != "&gt;" && title != "&lt;") {
            $(this).click(function () {

                if (title.toLowerCase().indexOf("icon_del") == -1 && url.toLowerCase().indexOf("javascript") == -1) {

                    if (top.frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        /*  top.frames[2].parent.document.getElementById("rightFrame").rows = '40,*';*/

                        if (url != "https://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            /*  top.frames[2].parent.frames["rightTabFrame"].addTab("PersonalSpace", "TakeTopPersonalSpace.aspx", "new");*/
                        }
                    }

                    if (url.indexOf("TakeTopAPPMain") == -1 && url.indexOf("TTAppTask") == -1) {

                        top.frames[2].parent.frames["rightTabFrame"].addTab(title, url, "old");

                        return false;
                    }

                }
            });
        }

    });
}


//判断是否关闭当前TAB
function aHandlerForTab() {
    $("a").not(".notTab").each(function () {

        var title = $(this).html().replace('---&gt;', '').replace('--&gt;', '');

        var url = $(this).attr("href");
        var click = $(this).attr("onclick");


        //判断是否是tree，或者分页
        if (click != "" && click != null && click != undefined) {
            if (click.toLowerCase().indexOf("treeview") == -1 && url.toLowerCase().indexOf("lbt_delete") == -1 && url.toLowerCase().indexOf("javascript") == -1) {
                $(this).click(function () {

                    if (top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows = '40,*';

                        if (url != "http://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab(currentParentPageTitle(), currentParentPageName(), "old");

                        }
                    }

                    top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab(title, url, "old");

                    return false;

                });
            }
        }
        else if (title != ">" && title != "<" && (title.toLowerCase().indexOf("img") == -1 || url.toLowerCase().indexOf("treeview") == -1 || url.indexOf("TTDocumentTreeView") != -1 || url.indexOf("TakeTopAPPMain") == -1 || url.toLowerCase().indexOf("lbt_delete") == -1) && title != null && title != "" && title != "&gt;" && title != "&lt;") {
            $(this).click(function () {
                if (title.toLowerCase().indexOf("icon_del") == -1 && url.toLowerCase().indexOf("javascript") == -1) {

                    if (top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows != '40,*') {

                        top.frames[0].frames[2].parent.document.getElementById("rightFrame").rows = '40,*';

                        if (url != "http://www.taketopits.com" & url != "TTTakeTopIM.aspx" & url != "TTUnHandledCaseMain.aspx") {

                            top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab("PersonalSpace", "TakeTopPersonalSpace.aspx", "new");

                        }
                    }

                    top.frames[0].frames[2].parent.frames["rightTabFrame"].addTab(title, url, "old");

                    return false;
                }
            });
        }

    });
}


//判断是否关闭当前窗口
function CloseWebPage() {
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
            window.opener = null;
            window.close();
        } else {
            window.open('', '_top');
            window.top.close();
        }
    }
    else if (navigator.userAgent.indexOf("Firefox") > 0) {
        window.location.href = 'about:blank ';
    }
    else {
        window.opener = null;
        window.open('', '_self', '');
        window.close();
    }
}

//判断是否关闭当前TAB
function CloseTab(msgText) {

    var con;
    con = confirm(msgText); //在页面上弹出对话框
    if (con == true) {

        var mylay = parent.parent.layer.getFrameIndex(parent.window.name);
        if (mylay != null) {

            parent.parent.layer.close(mylay);

        }
        else {

            /* top.frames[0].frames[2].parent.frames["rightTabFrame"].CloseCurrentTabPage();*/

            top.frames[0].frames[2].parent.frames["rightTabFrame"].CloseCurrentTabPageAndOpenSpecialPage();

        }
    }
}

//判断是否关闭所有TAB，并增加一TAB
function CloseAllTabAndAddNewTab(msgText) {

    var con;
    con = confirm(msgText); //在页面上弹出对话框
    if (con == true) {

        var mylay = parent.parent.layer.getFrameIndex(parent.window.name);
        if (mylay != null) {

            parent.parent.layer.close(mylay);

        }
        else {
            if (top.frames[0].frames[2].parent.frames["rightTabFrame"].intTabIndex > 2) {
                top.frames[0].frames[2].parent.frames["rightTabFrame"].CloseCurrentTabPage();
            }
            else {
                top.frames[0].frames[2].parent.frames["rightTabFrame"].CloseCurrentTabPageAndOpenSpecialPage();
            }

        }
    }
}

//隐藏和显示当前弹出层‘关闭’按钮
function HideAndDisplayCurrentlayerCloseButton(varVisible) {
  
    try
    {
        var varCloseButtons = top.frames[0].frames[2].parent.frames["rightTabFrameID"].contentWindow.document.getElementsByClassName("layui-layer-ico layui-layer-close layui-layer-close1");
        top.frames[0].frames[2].parent.frames["rightTabFrameID"].contentWindow.document.getElementsByClassName("layui-layer-ico layui-layer-close layui-layer-close1")[varCloseButtons.length - 1].style.display = varVisible;
    }
    catch
    {
    }
}


//判断是否关闭当前层
function CloseLayer() {

    var mylay = parent.layer.getFrameIndex(this.window.name);

    //alert(this.window.name);

    if (mylay != null) {

        //alert(this.window.name);
        parent.layer.close(mylay);
    }
}

//判断是否关闭当前层
function CloseCurrentLayer(msgText) {

    var con;
    con = confirm(msgText); //在页面上弹出对话框
    if (con == true) {

        var mylay = parent.parent.layer.getFrameIndex(parent.window.name);
        if (mylay != null) {
            parent.parent.layer.close(mylay);
        }
        else {

            top.frames[0].frames[2].parent.frames["rightTabFrame"].CloseCurrentTabPageAndOpenSpecialPage();
        }

    }
}


//取当前页面名称(带后缀名)
function currentPageName() {
    var strUrl = location.href;
    var arrUrl = strUrl.split("/");
    var strPage = arrUrl[arrUrl.length - 1];
    return strPage;
}

//取当前页面父页面名称(带后缀名)
function currentParentPageName() {
    var strUrl = location.parent.href;
    var arrUrl = strUrl.split("/");

    var strPage = arrUrl[arrUrl.length - 1];
    return strPage;
}


//取父页面Title
function currentParentPageTitle() {

    var strTitle = parent.location.title;

    return strTitle;
}


//用于点击APP里的DATAGRID行任一点，就打开行里的一链接
//一般结构设置行点击
function setTrClickLink(gridId) {
    //阻止事件冒泡
    jQuery("#" + gridId).find("tr:not(.notTab)").find("a").click(function () {
        event.stopPropagation();
    });

    //tr点击跳转
    jQuery("#" + gridId).find("tr:not(.notTab)").find("a").closest("tr").click(function () {
        location.href = $(this).find("a").attr("href");
    });
}

//特殊结构设置行点击
function setTrClickLinkSpec(gridId) {
    //阻止事件冒泡
    jQuery("#" + gridId).find("tr:not(.notTab)").find("a").click(function () {
        event.stopPropagation();
    });

    //tr点击跳转
    jQuery("#" + gridId).find("tr:not(.notTab)").find("a").closest("table").closest("tr").click(function () {
        location.href = $(this).find("a").attr("href");
    });
}


//用于APP，向右滑动返回上一页
function swiperRightToBack(backId) {
    //修改触发像素大小  
    jQuery.event.special.swipe.horizontalDistanceThreshold = 100;
    jQuery("body").on("swiperight", function () {
        jQuery("#" + backId).click();
    });
}


//获取指定名称的cookie的值
function getcookie(objname) {
    var arrstr = document.cookie.split("; ");
    for (var i = 0; i < arrstr.length; i++) {
        var temp = arrstr[i].split("=");
        if (temp[0] == objname) return unescape(temp[1]);
    }
}



//检测设备是否是移动端
function detectmob() {
    if (navigator.userAgent.match(/Android/i)
        || navigator.userAgent.match(/webOS/i)
        || navigator.userAgent.match(/iPhone/i)
        || navigator.userAgent.match(/iPad/i)
        || navigator.userAgent.match(/iPod/i)
        || navigator.userAgent.match(/BlackBerry/i)
        || navigator.userAgent.match(/Windows Phone/i)
    ) {
        return true;
    }
    else {
        return false;
    }
}

// 判断安卓
function isAndroid() {
    var u = navigator.userAgent;
    if (u.indexOf("Android") > -1 || u.indexOf("Linux") > -1) {
        if (window.ShowFitness !== undefined) return true;
    }
    return false;
}
// 判断设备为 ios
function isIos() {
    var u = navigator.userAgent;
    if (u.indexOf("iPhone") > -1 || u.indexOf("iOS") > -1) {
        return true;
    }
    return false;
}

//取得链接传入参数的值
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}


//--------------------物资管理模块的方法----------------------------------

//--------------------打开人员选择窗口------------------------------------
function SelectEmployee(url, id, name) {
    popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择人员', 600, 500);
}

function AlertProjectPage(url) {
    popShowByURLForFixedSize(url, '', 1200, 500);
}

function SelectDLCode(url, id, name) {

    popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择物料类型', 600, 500);

}

// 选择供应商
function SelectSupplier(id, name) {
    var url = "TTWZSelectorSupplier.aspx";

    popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择供应商', 600, 500);
}


//选择库别
function SelectStock(id, name) {

    var url = "TTWZSelectorStock.aspx";

    popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择库别', 900, 500);
}

//选择领料单位
function OnClickPickingUnit(id, name) {
    var url = "TTWZSelectorDepartment2.aspx";

    popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择部门', 600, 500);

}

//隐藏没有数据的分析图
function hideIframesForNoDataAnalystChart(callback) {
    // 遍历所有 iframe 控件
    $('iframe').each(function () {
        var iframe = this;

        // 等待 iframe 加载完成后再执行
        $(iframe).on('load', function () {
            // 获取 iframe 内部的文档对象
            var doc = iframe.contentWindow.document;

            // 查找 id 为 m2 的元素
            var m2 = $(doc).find('#m2');

            // 查找 m2 下的 canvas 元素
            var canvas = m2.find('canvas');

            if (canvas.length == 1) {
                $(iframe).hide();
            } else {
                $(iframe).show();
            }

            // 如果所有 iframe 都处理完成，执行回调函数
            if ($('iframe').length == $('iframe:hidden').length) {
                callback();
            }
        });
    });
}


//多语种退出平台消息
function getExitMsgByLangCode() {

    var varLangCode = getcookie("LangCode");
    var varMsg;

    if (varLangCode == "zh-CN") {
        varMsg = '确定要退出管理平台吗?';
    }
    else if (varLangCode == "zh-tw") {
        varMsg = '確定要退出管理平台嗎?';
    }
    else if (varLangCode == "en") {
        varMsg = 'Are you sure you want to quit the management platform?';
    }
    else if (varLangCode == "de") {
        varMsg = 'Möchten Sie die Verwaltungsplattform wirklich beenden?';
    }
    else if (varLangCode == "es") {
        varMsg = '¿Estás seguro de que quieres abandonar la plataforma de gestión?';
    }
    else if (varLangCode == "fr") {
        varMsg = 'Êtes-vous sûr de vouloir quitter la plate-forme de gestion?';
    }
    else if (varLangCode == "it") {
        varMsg = 'Sei sicuro di voler lasciare la piattaforma di gestione?';
    }
    else if (varLangCode == "ja") {
        varMsg = '管理プラットフォームを終了してもよろしいですか？';
    }
    else if (varLangCode == "ko") {
        varMsg = '관리 플랫폼을 종료 하시겠습니까?';
    }
    else if (varLangCode == "pt") {
        varMsg = 'Tem certeza de que deseja sair da plataforma de gerenciamento?';
    }
    else if (varLangCode == "ru") {
        varMsg = 'Вы действительно хотите выйти из платформы управления?';
    }
    else {
        varMsg = 'Are you sure you want to quit the management platform?';
    }

    return varMsg;

}

//多语种删除消息

function getDeleteMsgByLangCode() {

    var varLangCode = getcookie("LangCode");
    var varMsg;

    if (varLangCode == "zh-CN") {
        varMsg = '确定要删除吗?';
    }
    else if (varLangCode == "zh-tw") {
        varMsg = '確定要刪除嗎？';
    }
    else if (varLangCode == "en") {
        varMsg = 'Are you sure you want to delete?';
    }
    else if (varLangCode == "de") {
        varMsg = 'Sind Sie sicher, dass Sie löschen möchten?';
    }
    else if (varLangCode == "es") {
        varMsg = '¿Estás seguro de que quieres eliminarlo?';
    }
    else if (varLangCode == "fr") {
        varMsg = 'Êtes-vous sûr de vouloir supprimer ?';
    }
    else if (varLangCode == "it") {
        varMsg = 'Sei sicuro di voler eliminare?';
    }
    else if (varLangCode == "ja") {
        varMsg = '削除してもよろしいですか?';
    }
    else if (varLangCode == "ko") {
        varMsg = '삭제하시겠습니까?';
    }
    else if (varLangCode == "pt") {
        varMsg = 'Tem certeza de que deseja excluir?';
    }
    else if (varLangCode == "ru") {
        varMsg = 'Вы уверены, что хотите удалить?';
    }
    else {
        varMsg = 'Are you sure you want to delete?';
    }

    return varMsg;
}

//多语种项目计划复制消息
function getCopyProjectPlanMsgByLangCode() {

    var varLangCode = getcookie("LangCode");
    var varMsg;

    if (varLangCode == "zh-CN") {
        varMsg = '复制操作会完全覆盖原来的计划数据，您确定要复制吗?';
    }
    else if (varLangCode == "zh-tw") {
        varMsg = '複製操作會完全覆蓋原來的計劃數據，您確定要複製嗎？';
    }
    else if (varLangCode == "en") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "de") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "es") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "fr") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "it") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "ja") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "ko") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "pt") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else if (varLangCode == "ru") {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }
    else {
        varMsg = 'Copy operation will delete all old plan data,Are you sure you want to copy it?';
    }

    return varMsg;
}

//多语种项目计划启动消息
function getStartupProjectPlanMsgByLangCode() {

    var varLangCode = getcookie("LangCode");
    var varMsg;

    if (varLangCode == "zh-CN") {
        varMsg = '启动后，计划内容不能更改，确定要启动吗?';
    }
    else if (varLangCode == "zh-tw") {
        varMsg = '啟動後，計劃內容不能更改，確定要啟動嗎？';
    }
    else if (varLangCode == "en") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "de") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "es") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "fr") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "it") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "ja") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "ko") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "pt") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else if (varLangCode == "ru") {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }
    else {
        varMsg = 'After launching, the content of the plan cannot be changed, are you sure you want to start?';
    }

    return varMsg;
}

//多语种项目计划拼接消息
function getJoinProjectPlanMsgByLangCode() {

    var varLangCode = getcookie("LangCode");
    var varMsg;

    if (varLangCode == "zh-CN") {
        varMsg = '拼接操作会影响原来的计划结构，您确定要拼接吗?';
    }
    else if (varLangCode == "zh-tw") {
        varMsg = '拼接操作會影響原來的計劃結構，您確定要拼接嗎';
    }
    else if (varLangCode == "en") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "de") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "es") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "fr") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "it") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "ja") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "ko") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "pt") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else if (varLangCode == "ru") {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }
    else {
        varMsg = 'Joint operation will impact old plan data,Are you sure you want to joint it?';
    }

    return varMsg;

}
