jQuery.noConflict();

//获取URL参数方法  name为参数名
function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)
        return  unescape(r[2]); 
  
    return null;
}



$(document).ready(function(){
    var strProjectID =  GetQueryString("RelatedID");
    if(strProjectID==null){
        strProjectID=153;
    }
  
    var sqlQuery = "Select ProjectCode,ProjectName From T_Project Where ProjectID = " + strProjectID;
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Handler/GetCommon.ashx",
        data: "sql=" + escape(sqlQuery),
        success: function (json) {
            console.log(json);
          
            document.getElementById("_0_0_0_0_my:XiangMuID").value = json[0].ProjectCode;
            document.getElementById("_0_0_0_1_my:ChanPinMingCheng").value = json[0].ProjectName;          
        },
        error: function () {
            alert("加载失败");
        }
    });
});


function TakeTopInfoPath_DoButton(source) {
    //console.log(source);
    var txt = "";//存放文本框内容
    //点击查看按钮
    if ($(source).val() == "查看") {
        //相容性结束 的查看比较特殊  特殊处理
        if ($(source).attr("id") == "TakeTopInfoPath_Control29") {
            var item = $(source).parent().parent().parent().next().find("td").last().find("textarea:eq(0)");
            txt = item.val();
            //alert(txt);
        }
        else {

            var item = $(source).parent().parent().prev().find("textarea:eq(0)");
            console.log(item);
            if (item.length == 0) {
                item = $(source).parent().parent().parent().prev().find("textarea:eq(0)");
            }
            txt = item.val();
            //alert(txt);
        }

    }

    var ProjectCode=document.getElementById("_0_0_0_0_my:XiangMuID").value;
    $.ajax({
        type: "POST",    //页面请求的类型，通常使用POST,那么处理页需要使用Request.Form["参数名称"]来获取页面传递的参数
        url: "handler/KZLUpdateProjectProgressRecord.ashx",   //处理页的相对地址
        data: {ProjectProcess:txt, ProjectCode: ProjectCode },//ss为要传递的文本框的值                 　　   
        success: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
            alert(msg);
        }
    });

    if (TakeTopInfoPath_ValueChanging > 0 && TakeTopInfoPath_ValueChanging <= TakeTopInfoPath_WaitTimes) {
        TakeTopInfoPath_ValueChanging++;
        setTimeout(function () { TakeTopInfoPath_DoButton(source); }, TakeTopInfoPath_Interval);
    } else {
        if (TakeTopInfoPath_CheckClickFrequently(source)) {
            return;
        }
        TakeTopInfoPath_MoveProgress2ControlPosition(source);
        var ctrlId = source.getAttribute(TakeTopInfoPath_XdPrefix + "CtrlId");
        if (ctrlId == null) {
            return;
        }
        if ((!TakeTopInfoPath_IsViewValid()) && TakeTopInfoPath_IsIdInArray(ctrlId, "xdoc_data_valid_view_button_list")) {
            alert(TakeTopInfoPath_CorrectFirstMessage);
            return;
        }
        if ((!TakeTopInfoPath_IsValid()) && TakeTopInfoPath_IsFuncDefined("OnValidFormButton_" + ctrlId)) {
            eval("OnValidFormButton_" + ctrlId + "();");
            return;
        }
        if (TakeTopInfoPath_IsFuncDefined("OnClientScriptButton_" + ctrlId)) {
            if (!eval("OnClientScriptButton_" + ctrlId + "();")) {
                return;
            }
        }
        var isSubmitButton = source.getAttribute("submit_button");
        if (isSubmitButton != null && isSubmitButton == "true") {
            if (TakeTopInfoPath_ValidSubmit && (!TakeTopInfoPath_IsValid()) && (!TakeTopInfoPath_NoValidation)) {
                alert(TakeTopInfoPath_CorrectFirstMessage);
                return;
            }
        }
        document.getElementById("xdoc_param_command").value = "Update_Button";
        document.getElementById("xdoc_param_button").value = ctrlId;
        document.getElementById("xdoc_param_button_source").value = TakeTopInfoPath_GetInnerMostContextId(source);
        TakeTopInfoPath_Submit();
    }
}

function TakeTopInfoPath_OnClick(event,_this, control) {

    var strProjectID =  GetQueryString("RelatedID");
    if(strProjectID==null){
        strProjectID=153;
    }
  
    var sqlQuery = "Select ProjectCode,ProjectName From T_Project Where ProjectID = " + strProjectID;
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Handler/GetCommon.ashx",
        data: "sql=" + escape(sqlQuery),
        success: function (json) {
            console.log(json);
          
            document.getElementById("_0_0_0_0_my:XiangMuID").value = json[0].ProjectCode;
            document.getElementById("_0_0_0_1_my:ChanPinMingCheng").value = json[0].ProjectName;          
        },
        error: function () {
            alert("加载失败");
        }
    });
}
