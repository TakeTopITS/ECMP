
//------内置到流程步骤示例----------------------------------

jQuery.noConflict();
function getRelatedData() {

    var htmlDiv = "<table border=\"1\" width=\"100%\" id=\"tableData\" class=\"formBgStyle\">";
    htmlDiv += "<tr><td class=\"formItemBgStyle\" width=\"30%\">项目代号</td><td class=\"formItemBgStyle\" width=\"70%\">项目名称</td></tr>";
    var sqlQuery = "Select ProjectID,ProjectName From T_Project";
    jQuery.ajax({
        type: "POST",
        dataType: "json",
        url: "Handler/GetCommon.ashx",
        data: "sql=" + escape(sqlQuery),
        success: function (json) {

            jQuery.each(json, function (i) {
                var trs = "<tr>";
                trs += "<td class=\"formItemBgStyle\">" + json[i].ProjectID + "</td>";
                trs += "<td class=\"formItemBgStyle\">" + json[i].ProjectName + "</td>";
                trs += "</tr>";
                htmlDiv += trs;
            });
            htmlDiv += "</table>";
            showdiv(100, 100, htmlDiv, "MaterialID", objID);
        },
        error: function () {
            //alert("加载失败");
        }
    });

}



function showdiv(l, t, content, id, objTID) {
    var divContent = document.createElement("div");
    divContent.id = id;
    divContent.style.zIndex = "666666";
    divContent.style.position = "absolute";
    // 设置div的绝对坐标
    var pos = findPos(document.getElementById(objTID));
    divContent.style.left = pos.x + "px";
    divContent.style.top = (pos.y + document.getElementById(objTID).offsetHeight) + "px";
    divContent.style.width = "800px";
    divContent.style.Height = "auto";
    divContent.style.border = "1px solid";
    divContent.style.overflow = "auto";
    divContent.style.backgroundColor = "#F7F4EC";
    divContent.innerHTML = content;
    document.body.appendChild(divContent);

    divContent.focus();
}
function removeDivContent() {
    document.body.removeChild(document.getElementById("MaterialID"));
}
function findPos(obj) {
    var curleft = obj.offsetLeft;
    var curtop = obj.offsetTop;

    while (obj = obj.offsetParent) {
        curleft += obj.offsetLeft
        curtop += obj.offsetTop
    }

    return { x: curleft, y: curtop };
}



//-------内置到流程模板示例(点击控件触发）---------------------------------
jQuery.noConflict();
jQuery(function () {
    jQuery("#要点击弹出层的ID").click(function () {

        var sqlQuery = "Select ProjectID,ProjectName From T_Project";
        jQuery.ajax({
            type: "POST",
            url: "Handler/GetCommon.ashx",
            dataType: "json",
            data: "sql=" + escape(sqlQuery),
            success: function (json) {

                //这里把读取的数据，用一个弹出层DIV显示

            },
            error: function () {
                alert("失败");
            }

        });
    }
  )
});


//-------内置到流程模板示例(表单直接触发）---------------------------------
jQuery.noConflict();
jQuery(function () {

    var sqlQuery = "Select ProjectID,ProjectName From T_Project";
    jQuery.ajax({
        type: "POST",
        url: "Handler/GetCommon.ashx",
        dataType: "json",
        data: "sql=" + escape(sqlQuery),
        success: function (json) {

            //这里把读取的数据，用一个弹出层DIV显示
            var trs;
            jQuery.each(json, function (i) {

                trs = "ProjectID:" + json[1].ProjectID;
                trs += " ProjectName:" + json[1].ProjectName;

            });

            alert(trs);

        },
        error: function () {
            alert("失败");
        }

    });

});

