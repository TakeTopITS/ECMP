$(document).ready(function () {
    //窗体改变大小时改变弹窗位置
    $(window).resize(setPostion);
});

var nowId = null;
var childDivId = null;
var grandsonDivId = null;


//显示弹窗 id div的id rememberScroll true 记住滚动条位置  false 不记住滚动条位置 childId 子div的id
function popShow(id, rememberScroll, childId) {
    nowId = id;
    $("#" + id).show();
    childDivId = childId;
    $("#" + id).css("z-index", "9999");
    if (childId) {
        $("#" + childId).show();
        $("#" + childId).css("z-index", "10000");
        move(childId, 1);

    }
    $("#popwindow_shade").show();
    setPostion();
    if (rememberScroll == "true") {
        $("#" + nowId + ">div:eq(1)")[0].scrollTop = GetCookie("popScrollTop");
    }
    else {
        $("#" + nowId + ">div:eq(1)")[0].scrollTop = 0;
    }

    $("#" + nowId + ">div:eq(1)").scroll(function () {
        SetScrollTop($(this));
    });

    if (popWindowLeft != 0 && popWindowTop != 0) {
        $("#" + id).css({ left: popWindowLeft, top: popWindowTop });
    }

    move(id);

    return false;
}

//type 1 child  2 grandsonChild
function move(id, type) {
    var isMove = false;
    var X, Y;
    $("#" + id + " .layui-layer-title").click(function () {
    }).mousedown(function (e) {
        isMove = true;
        X = e.pageX - parseInt($("#" + id).css("left"));
        Y = e.pageY - parseInt($("#" + id).css("top"));
    });
    $(document).mousemove(function (e) {
        if (isMove) {
            var left = e.pageX - X;
            var top = e.pageY - Y;
            $("#" + id).css({ left: left, top: top });
            if (type == 1) {
                setChildPowWindowTopAndLeft(id);
            }
            else if (type == 2) {
                setGrandsonChildPowWindowTopAndLeft(id);
            }
            else {
                setPowWindowTopAndLeft(id);
            }
        }
    }).mouseup(function () {
        isMove = false;
    });
}


var popWindowTop = 0, popWindowLeft = 0;
var childPopWindowTop = 0, childPopWindowLeft = 0;
var grandsonChildPopWindowTop = 0, grandsonChildPopWindowLeft = 0;

function setPowWindowTopAndLeft(id) {
    popWindowTop = $("#" + id).position().top;
    popWindowLeft = $("#" + id).position().left;
}


function setChildPowWindowTopAndLeft(id) {
    childPopWindowTop = $("#" + id).position().top;
    childPopWindowLeft = $("#" + id).position().left;
}


function setGrandsonChildPowWindowTopAndLeft(id) {
    grandsonChildPopWindowTop = $("#" + id).position().top;
    grandsonChildPopWindowLeft = $("#" + id).position().left;
}


//显示弹窗 id div的id rememberScroll true 记住滚动条位置  false 不记住滚动条位置 childId 子div的id
function popShowWithGrandson(id, rememberScroll, childId, grandsonChildId) {
    nowId = id;
    $("#" + id).show();
    childDivId = childId;
    grandsonChildDivId = grandsonChildId;
    $("#" + id).css("z-index", "9999");
    if (childId) {
        $("#" + childId).show();
        $("#" + childId).css("z-index", "10000");
        move(childId, 1);
    }
    if (grandsonChildId) {
        $("#" + grandsonChildId).show();
        $("#" + grandsonChildId).css("z-index", "10005");

        move(grandsonChildId, 2);
    }
    $("#popwindow_shade").show();
    setPostion();
    if (rememberScroll == "true") {
        $("#" + nowId + ">div:eq(1)")[0].scrollTop = GetCookie("popScrollTop");
    }
    else {
        $("#" + nowId + ">div:eq(1)")[0].scrollTop = 0;
    }

    $("#" + nowId + ">div:eq(1)").scroll(function () {
        SetScrollTop($(this));
    });

    if (popWindowLeft != 0 && popWindowTop != 0) {
        $("#" + id).css({ left: popWindowLeft, top: popWindowTop });
    }

    move(id);

    return false;
}

//设置弹窗内容高度和位置
function setPostion() {
    /* console.log($(window).height());*/
    if ($("#" + nowId).attr("name") != "fixedDiv" && $("#" + nowId).attr("name") != "fixedDivNoConfirm") {
        $("#" + nowId).css("height", $(window).height() * 0.8);
        $("#" + nowId).css("width", $(window).width() * 0.7);
    }
    $("#" + nowId + ">div:eq(1)").height($("#" + nowId).height() - 90);
    $("#" + nowId).css("top", 30 + $(document).scrollTop());
    $("#" + nowId).css("left", ($(window).width() - $("#" + nowId).outerWidth()) / 2);

    if (typeof (childDivId) != "undefined") {

        if (childPopWindowTop != 0 && childPopWindowLeft != 0) {
            $("#" + childDivId).css({ left: childPopWindowLeft, top: childPopWindowTop });
        }
        else {
            $("#" + childDivId).css("top", 75 + $(document).scrollTop());
            $("#" + childDivId).css("left", ($(window).width() - $("#" + childDivId).outerWidth()) / 2);
        }
        //else {

        if ($("#" + childDivId).attr("name") != "fixedDiv" && $("#" + childDivId).attr("name") != "fixedDivNoConfirm") {
            $("#" + childDivId).css("height", $(window).height() * 0.7);
            $("#" + childDivId).css("width", $(window).width() * 0.6);
        }
        $("#" + childDivId + ">div:eq(1)").height($("#" + childDivId).height() - 90);
        //}
    }

    if (typeof (grandsonChildDivId) != "undefined") {
        if (grandsonChildPopWindowTop != 0 && grandsonChildPopWindowLeft != 0) {
            $("#" + grandsonChildDivId).css({ left: grandsonChildPopWindowLeft, top: grandsonChildPopWindowTop });
        }
        else {

            if ($("#" + grandsonChildDivId).attr("name") != "fixedDiv" && $("#" + grandsonChildDivId).attr("name") != "fixedDivNoConfirm") {
                $("#" + grandsonChildDivId).css("height", $(window).height() * 0.7);
                $("#" + grandsonChildDivId).css("width", $(window).width() * 0.6);
            }
            $("#" + grandsonChildDivId + ">div:eq(1)").height($("#" + grandsonChildDivId).height() - 90);
            $("#" + grandsonChildDivId).css("top", 75 + $(document).scrollTop());
            $("#" + grandsonChildDivId).css("left", ($(window).width() - $("#" + grandsonChildDivId).outerWidth()) / 2);
        }
    }
}

var _h = 0;
function SetScrollTop(obj) {
    _h = obj.scrollTop();
    SetCookie("popScrollTop", _h);
}

//判断url后8位是否包含文件扩展名，排除程序语言
function urlLastSixCharsContainDot(url) {

    if (url.indexOf(".aspx") > 0 || url.indexOf(".html") > 0 || url.indexOf(".js") > 0 || url.indexOf(".htm") > 0 || url.indexOf(".razor") > 0 || url.indexOf(".cshtml") > 0 || url.indexOf(".pdf") > 0 || url.indexOf(".txt") > 0) {
        return false;
    }

    // 获取URL的路径部分
    var path = url.split('://')[1];

    // 如果路径的最后一段六位包含点号，则返回true
    return path.slice(-8).includes('.');
}

//传入URL作为参数
function popShowByURL(url, title, width, height, parentWindow) {
    var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');
    title = title.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');

    //如果url包含文件名，则不弹窗
    if (urlLastSixCharsContainDot(url)) {
        return;
    }

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
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        },
        end: function () {

            parentUrl = parentWindow.href;

            //// 获取粘贴的内容
            //setLongitudeLatitude(parentUrl);

            if (parentUrl.indexOf("TTCollaborationManage.aspx") >= 0 || parentUrl.indexOf("TTPlanManagement.aspx") >= 0
                || parentUrl.indexOf("TTTaskManagement.aspx") >= 0 || parentUrl.indexOf("TTKPIManagement.aspx") >= 0
                || parentUrl.indexOf("TTWLManage.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskManage.aspx") >= 0
                || parentUrl.indexOf("TTReqManage.aspx") >= 0 || parentUrl.indexOf("TTProjectRequirementManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0 || parentUrl.indexOf("TTDefectManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskList.aspx") >= 0 || parentUrl.indexOf("TTProjectRelatedReqMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectRelatedDefectMain.aspx") >= 0 || parentUrl.indexOf("TTReceivablesPayableAlert.aspx") >= 0
                || parentUrl.indexOf("TTReceivablesPayableAlertSAAS.aspx") >= 0 || parentUrl.indexOf("TTConstractUnHandleReceivePay.aspx") >= 0
                || parentUrl.indexOf("TTProductModule_YYUP.aspx") >= 0
                || parentUrl.indexOf("TTCustomerQuestionManage.aspx") >= 0 || parentUrl.indexOf("TTCustomerServiceAlert.aspx") >= 0
                || parentUrl.indexOf("TTCustomerToBeHandledQuestions.aspx") >= 0 || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomer.aspx") >= 0
                || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomerAPP.aspx") >= 0 || parentUrl.indexOf("TTMakeReport.aspx") >= 0
                || parentUrl.indexOf("TTTaskHandlePage.aspx") >= 0 || parentUrl.indexOf("TTReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTReqHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTDefectHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTDefectHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTAppTask.aspx") >= 0
                || parentUrl.indexOf("TTProjectManage.aspx") >= 0 || parentUrl.indexOf("TTUndertakeProjectSAAS.aspx") >= 0
                || parentUrl.indexOf("TTWorkPlanGanttForProject") >= 0 || parentUrl.indexOf("TTDIYSystemHandleRecord.aspx") >= 0
                || parentUrl.indexOf("TTDIYSystemMain.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectmentHandlePage.aspx") >= 0 || parentUrl.indexOf("TTProjectReqManageMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManageMain.aspx") >= 0 || parentUrl.indexOf("TTPersonalSpaceWorkflow.aspx") >= 0
                || parentUrl.indexOf("TTPersonalSpaceWorkflowForOuter.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpace.aspx") >= 0
                || parentUrl.indexOf("TakeTopPersonalSpaceForOuterUser.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpaceSAAS.aspx") >= 0
                || parentUrl.indexOf("TTAPPDIYSystemHandleRecord.aspx") >= 0 || parentUrl.indexOf("TTAPPDIYSystemMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectReviewWL.aspx") >= 0



            ) {

                parentWindow.reload();
            }

        }
    });
}

//传入URL作为参数
function popShowByURLNoCloseButton(url, title, width, height, parentWindow) {
    var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');
    title = title.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');

    //如果url包含文件名，则不弹窗
    if (urlLastSixCharsContainDot(url)) {
        return;
    }

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
        closeBtn: 0, // 不显示右上角的关闭按钮
        content: url,
        area: ["99%", "99%"]
        ,
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        },
        end: function () {

            parentUrl = parentWindow.href;

            //// 获取粘贴的内容
            //setLongitudeLatitude(parentUrl);

            if (parentUrl.indexOf("TTCollaborationManage.aspx") >= 0 || parentUrl.indexOf("TTPlanManagement.aspx") >= 0
                || parentUrl.indexOf("TTTaskManagement.aspx") >= 0 || parentUrl.indexOf("TTKPIManagement.aspx") >= 0
                || parentUrl.indexOf("TTWLManage.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskManage.aspx") >= 0
                || parentUrl.indexOf("TTReqManage.aspx") >= 0 || parentUrl.indexOf("TTProjectRequirementManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0 || parentUrl.indexOf("TTDefectManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskList.aspx") >= 0 || parentUrl.indexOf("TTProjectRelatedReqMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectRelatedDefectMain.aspx") >= 0 || parentUrl.indexOf("TTReceivablesPayableAlert.aspx") >= 0
                || parentUrl.indexOf("TTReceivablesPayableAlertSAAS.aspx") >= 0 || parentUrl.indexOf("TTConstractUnHandleReceivePay.aspx") >= 0
                || parentUrl.indexOf("TTProductModule_YYUP.aspx") >= 0
                || parentUrl.indexOf("TTCustomerQuestionManage.aspx") >= 0 || parentUrl.indexOf("TTCustomerServiceAlert.aspx") >= 0
                || parentUrl.indexOf("TTCustomerToBeHandledQuestions.aspx") >= 0 || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomer.aspx") >= 0
                || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomerAPP.aspx") >= 0 || parentUrl.indexOf("TTMakeReport.aspx") >= 0
                || parentUrl.indexOf("TTTaskHandlePage.aspx") >= 0 || parentUrl.indexOf("TTReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTReqHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTDefectHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTDefectHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTAppTask.aspx") >= 0
                || parentUrl.indexOf("TTProjectManage.aspx") >= 0 || parentUrl.indexOf("TTUndertakeProjectSAAS.aspx") >= 0
                || parentUrl.indexOf("TTWorkPlanGanttForProject") >= 0 || parentUrl.indexOf("TTDIYSystemHandleRecord.aspx") >= 0
                || parentUrl.indexOf("TTDIYSystemMain.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectmentHandlePage.aspx") >= 0 || parentUrl.indexOf("TTProjectReqManageMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManageMain.aspx") >= 0 || parentUrl.indexOf("TTPersonalSpaceWorkflow.aspx") >= 0
                || parentUrl.indexOf("TTPersonalSpaceWorkflowForOuter.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpace.aspx") >= 0
                || parentUrl.indexOf("TakeTopPersonalSpaceForOuterUser.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpaceSAAS.aspx") >= 0
                || parentUrl.indexOf("TTAPPDIYSystemHandleRecord.aspx") >= 0 || parentUrl.indexOf("TTAPPDIYSystemMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectReviewWL.aspx") >= 0



            ) {

                parentWindow.reload();
            }

        }
    });
}


//传入URL作为参数,固定大小
function popShowByURLForFixedSize(url, title, width, height, parentWindow) {
    var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');
    title = title.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');

    //如果url包含文件名，则不弹窗
    if (urlLastSixCharsContainDot(url)) {
        return;
    }

    if (title) {
        t = title;
    }
    if (width) {
        w = width + 'px';
    }
    if (height) {
        h = height + 'px';
    }
    return layer.open({
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
        offset: '5px',
        area: [w, h]
        ,
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        }
        ,
        end: function () {

            parentUrl = parentWindow.href;

            if (parentUrl.indexOf("TTCollaborationManage.aspx") >= 0 || parentUrl.indexOf("TTPlanManagement.aspx") >= 0
                || parentUrl.indexOf("TTTaskManagement.aspx") >= 0 || parentUrl.indexOf("TTKPIManagement.aspx") >= 0
                || parentUrl.indexOf("TTWLManage.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskManage.aspx") >= 0
                || parentUrl.indexOf("TTReqManage.aspx") >= 0 || parentUrl.indexOf("TTProjectRequirementManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0 || parentUrl.indexOf("TTDefectManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskList.aspx") >= 0 || parentUrl.indexOf("TTProjectRelatedReqMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectRelatedDefectMain.aspx") >= 0 || parentUrl.indexOf("TTReceivablesPayableAlert.aspx") >= 0
                || parentUrl.indexOf("TTReceivablesPayableAlertSAAS.aspx") >= 0 || parentUrl.indexOf("TTConstractUnHandleReceivePay.aspx") >= 0
                || parentUrl.indexOf("TTProductModule_YYUP.aspx") >= 0
                || parentUrl.indexOf("TTCustomerQuestionManage.aspx") >= 0 || parentUrl.indexOf("TTCustomerServiceAlert.aspx") >= 0
                || parentUrl.indexOf("TTCustomerToBeHandledQuestions.aspx") >= 0 || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomer.aspx") >= 0
                || parentUrl.indexOf("TakeTopSoftRent_SiteInfoByCustomerAPP.aspx") >= 0 || parentUrl.indexOf("TTMakeReport.aspx") >= 0
                || parentUrl.indexOf("TTTaskHandlePage.aspx") >= 0 || parentUrl.indexOf("TTReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTReqHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTDefectHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTDefectHandlePageThirdPart.aspx") >= 0 || parentUrl.indexOf("TTAppTask.aspx") >= 0
                || parentUrl.indexOf("TTProjectManage.aspx") >= 0 || parentUrl.indexOf("TTUndertakeProjectSAAS.aspx") >= 0
                || parentUrl.indexOf("TTWorkPlanGanttForProject") >= 0 || parentUrl.indexOf("TTDIYSystemHandleRecord.aspx") >= 0
                || parentUrl.indexOf("TTDIYSystemMain.aspx") >= 0 || parentUrl.indexOf("TTProjectTaskHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectTaskManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectReqHandlePage.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectmentHandlePage.aspx") >= 0 || parentUrl.indexOf("TTProjectReqManageMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectDefectManageMain.aspx") >= 0 || parentUrl.indexOf("TTProjectWorkFlowManage.aspx") >= 0
                || parentUrl.indexOf("TTProjectWorkFlowManageMain.aspx") >= 0 || parentUrl.indexOf("TTPersonalSpaceWorkflow.aspx") >= 0
                || parentUrl.indexOf("TTPersonalSpaceWorkflowForOuter.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpace.aspx") >= 0
                || parentUrl.indexOf("TakeTopPersonalSpaceForOuterUser.aspx") >= 0 || parentUrl.indexOf("TakeTopPersonalSpaceSAAS.aspx") >= 0
                || parentUrl.indexOf("TTAPPDIYSystemHandleRecord.aspx") >= 0 || parentUrl.indexOf("TTAPPDIYSystemMain.aspx") >= 0
                || parentUrl.indexOf("TTProjectReviewWL.aspx") >= 0


            ) {

                parentWindow.reload();
            }


        }
    });
}

//传入URL作为参数,固定大小,并返回值
function popShowByURLForFixedSizeHaveReturnValue(url, title, width, height, linkedPicture) {
    var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');
    title = title.replace('.aspx', '').replace('TT', '').replace('WL', 'WF').replace('Constract', 'Contract');

    //如果url包含文件名，则不弹窗
    if (urlLastSixCharsContainDot(url)) {
        return;
    }

    if (title) {
        t = title;
    }
    if (width) {
        w = width + 'px';
    }
    if (height) {
        h = height + 'px';
    }
    return layer.open({
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
        offset: '5px',
        area: [w, h]
        ,
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        }
        ,
        end: function () {

        }
    });
}

//传入URL作为参数,固定大小,并返回值
function popShowByURLForFixedSizeHaveReturnValueAndNoClose(url, title, width, height, linkedPicture) {
    var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace("TT", '');
    if (title) {
        t = title;
    }
    if (width) {
        w = '380px';
    }
    if (height) {
        h = '610px';
    }
    return layer.open({
        type: 2,
        title: t,
        anim: 0,
        fixed: true,
        resize: false,
        scrollbar: true,
        closeBtn: false,
        moveOut: true,
        shade: false,
        shadeClose: false,
        maxmin: false,
        content: url,
        offset: '5px',
        area: [w, h],
        close: true
        ,
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        }
        ,
        // end 函数执行的是弹框关闭时触发的事件 
        end: function () { // 未点击确定按钮，点击关闭按钮  
            layer.closeAll();
        }
    });
}

//依HTML内容弹出提示层
function openPopWindowByContent(divID, title, width, height) {

    document.getElementById(divID).style.display = 'block';

    var varInnerHTML = document.getElementById(divID).innerHTML;

 /*   alert(varInnerHTML);*/

    var w = 'auto', h = 'auto', title = title.replace('.aspx', '').replace("TT", '');

    if (title) {
        t = title;
    }

    if (width) {
        w = width + "px";
    }

    if (height) {
        h = height + "px";
    }

    
    layer.open({
        type: 1,
        anim: 0,
        fixed: false,
        resize: false,
        scrollbar: false,
        closeBtn: false,
        moveOut: true,
        shade: false,
        shadeClose: false,
        maxmin: false,
        content: varInnerHTML,
        area: [w, h],
       
        offset: {
            top: '50px',
            left: '100px'
        },
        close: false,
        zIndex: layer.zIndex, //重点1
        success: function (layero) {
            layer.setTop(layero); //重点2
        }
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

//关闭弹窗
function popClose() {
    var theEvent = window.event || arguments.callee.caller.arguments[0];

    var srcElement = theEvent.srcElement;

    if (!srcElement) {
        srcElement = theEvent.target;
    }
    var $target = $(srcElement);
    var $popWindow;
    if ($target[0].tagName.toLowerCase() == "span") {
        $popWindow = $target.parent().parent().parent();
    }
    else {
        $popWindow = $target.parent().parent();
    }
    var isCloseParentDiv = true;
    //关闭子div 不隐藏遮罩层
    if ($popWindow.attr("id") == childDivId) {
        isCloseParentDiv = false;
    }

    if ($popWindow.attr("name") == "noConfirm" || $popWindow.attr("name") == "fixedDivNoConfirm") {
        $popWindow.hide();
        if (isCloseParentDiv) {
            $("#popwindow_shade").hide();
        }
    }
    else {
        if (JudgesubmitForm() == -1) {
            var varLangCode = getcookie("LangCode");
            var varMsg;

            if (varLangCode == "zh-CN") {
                varMsg = '确定要关闭吗？';
            }
            else if (varLangCode == "zh-tw") {
                varMsg = '確定要關閉嗎？'
            }
            else if (varLangCode == "en") {
                varMsg = 'Are you sure you want to close？';
            }
            else if (varLangCode == "de") {
                varMsg = 'Bist du sicher, dass du schließen möchtest？';
            }
            else if (varLangCode == "es") {
                varMsg = '¿Estás seguro de que quieres cerrar?';
            }
            else if (varLangCode == "fr") {
                varMsg = 'Êtes-vous sûr de vouloir fermer?';
            }
            else if (varLangCode == "it") {
                varMsg = 'Sei sicuro di voler chiudere?';
            }
            else if (varLangCode == "ja") {
                varMsg = '閉じてもよろしいですか？';
            }
            else if (varLangCode == "ko") {
                varMsg = '닫으시겠습니까?';
            }
            else if (varLangCode == "pt") {
                varMsg = 'Tem certeza de que deseja fechar?';
            }
            else if (varLangCode == "ru") {
                varMsg = 'Вы действительно хотите закрыть?';
            }
            else {
                varMsg = 'Are you sure you want to close？';
            }

            if (confirm(varMsg)) {
                $popWindow.hide();
                if (isCloseParentDiv) {
                    $("#popwindow_shade").hide();
                }
            }
        }
        else {
            $popWindow.hide();
            if (isCloseParentDiv) {
                $("#popwindow_shade").hide();
            }
        }
    }
}

//关闭弹窗
function popCloseNoPromt() {
    var theEvent = window.event || arguments.callee.caller.arguments[0];

    var srcElement = theEvent.srcElement;

    if (!srcElement) {
        srcElement = theEvent.target;
    }
    var $target = $(srcElement);
    var $popWindow;
    if ($target[0].tagName.toLowerCase() == "span") {
        $popWindow = $target.parent().parent().parent();
    }
    else {
        $popWindow = $target.parent().parent();
    }
    var isCloseParentDiv = true;
    //关闭子div 不隐藏遮罩层
    if ($popWindow.attr("id") == childDivId) {
        isCloseParentDiv = false;
    }

    if ($popWindow.attr("name") == "noConfirm" || $popWindow.attr("name") == "fixedDivNoConfirm") {
        $popWindow.hide();
        if (isCloseParentDiv) {
            $("#popwindow_shade").hide();
        }
    }
    else {
        //layer.confirm('当前内容未保存，确定要关闭吗？', {
        //    btn: ['确定', '取消'] //按钮
        //}, function (index, layero) {
        //    $popWindow.hide();
        //    $("#popwindow_shade").hide();
        //    layer.close(index); //如果设定了yes回调，需进行手工关闭
        //}, function () {
        //});
        //console.log("confirm");

        $popWindow.hide();
        if (isCloseParentDiv) {
            $("#popwindow_shade").hide();
        }
    }
}

//判断表单内容有没有被修改
function JudgesubmitForm() {
    var ijk = 1;

    var form = document.getElementById('form1');
    for (var i = 0; i < form.length; i++) {
        var element = form.elements[i];
        var type = element.type;
        if (type == "checkbox" || type == "radio") {
            if (element.checked == element.defaultChecked) {
                //console.log("没有选择单选或多选框");
            }
            else {
                ijk = -1;
            }
        }
        if (type == "hidden" || type == "password" || type == "text" || type == "textarea") {
            if (element.value == element.defaultValue) {
                //console.log("没有进行文本输入");
            }
            else {
                ijk = -1;
            }
        }

        if (type == "select-one" || type == "select-multiple") {
            for (var j = 0; j < element.options.length; j++) {
                if (element.options[j].selected == element.options[j].defaultSelected) {
                    //console.log("没有选择下拉框");
                }
                else {
                    ijk = -1;
                }
            }
        }

        $('#Select').change(function () {
            ijk = -1;
        });

        if (type == "file") {
            if (element.value.length == 0) {
                Filechange = false;

                //console.log("没选择图片");
            }
            else {
                ijk = -1;
            }
        }
    }

    return ijk;
}


function SetCookie(sName, sValue) {
    document.cookie = sName + "=" + escape(sValue) + "; ";
}
function GetCookie(sName) {
    var aCookie = document.cookie.split("; ");
    for (var i = 0; i < aCookie.length; i++) {
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0])
            return unescape(aCrumb[1]);
    }
    return 0;
}

// 获取粘贴的内容
function setLongitudeLatitude(parentUrl) {

    if (parentUrl.indexOf("TTMakeProjectForEngineeringIndustry") >= 0) {

        alert(parentWindow);

        //var pastedText = top.frames["layui-layer-iframe3"].getElementById("pointInput").value;

        //alert(pastedText);

        var pastedText = "333,4444";

        // 处理粘贴的内容
        const arr = pastedText.split(",");


        parentWindow.document.getElementById("TabContainer1_TabPanel1_TB_Longitude").value = arr[0];
        parentWindow.document.getElementById("TabContainer1_TabPanel1_TB_Latitude").value = arr[0];
    }
}


