jQuery.noConflict();

//取得URL参数的值
function GetQueryValue(queryName) {
    var query = decodeURI(window.location.search.substring(1));
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split('=');
        if (pair[0] == queryName) { return pair[1]; }
    }
    return null;
}


//供Jquery(document).ready调用的函数，发起工作流的页面会单独调用执行
var jqueryDocumentReady = function () {

    ////取得页面传入的参数值
    //var strRelatedID = GetQueryString('RelatedID');
    //this.document.getElementById('元素ID').value = 111;
    ////通过代码改变的控件内容，必须调用此方法才能保存
    // TakeTopInfoPath_OnControlChange(null, document.getElementById('元素ID'));

    var strFromWFID = GetQueryValue('WFID');

    alert(strFromWFID);

    if (strFromWFID == null) {
        return;
    }
    var sqlQuery = "Select FieldValue From t_workflowformdata Where WLID in(Select WFChildID From t_wfsteprelatedwf Where WFID = " + strFromWFID +
        " and WFChildID in (Select WLID From T_WorkFlow Where TemName = '1.1投标信息收集及报名审批'))   and fieldname = 'my:xiangmumingchen'";

    alert(sqlQuery);
  
    jQuery.ajax({
        type: "POST",
        dataType: "json",
        url: "Handler/GetCommon.ashx",
        data: "sql=" + escape(sqlQuery),
        success: function (json) {
            console.log(json);
            document.getElementById("_0_42_my:field24").value = json[0].fieldvalue;


            //调用控件改变方法 只要改变的文本框才会保存
            TakeTopInfoPath_OnControlChange(null, document.getElementById("_0_42_my:field24"));
              
        },
        error: function () {
            alert("加载失败");
        }
    });


};

//初始化页面，写法可以参考本页顶部的示例（点击可打开示例页面）
jQuery(document).ready(jqueryDocumentReady);





//调用一般处理程序，保存表单数据到后台数据库
function saveWFFormDataToDatabase() {


    return;
}


//