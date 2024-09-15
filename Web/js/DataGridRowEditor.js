//根据单元格的class名称来动态绑定单元格点击事件
//dgreType类型为text,combobox,date,checkbox
$(document).ready(function () {
    $("[class*='dgreType_']").each(function (index, item) {
        var $this = $(this);
        var className = $this.attr("class");
        var classNames = className.split(" ");
        for (var i = 0; i < classNames.length; i++) {
            if (classNames[i].indexOf("dgreType_") >= 0) {
                var dgreTypeTemp = classNames[i].replace("dgreType_", "");
                var dgreType = dgreTypeTemp.indexOf("_") < 0 ?dgreTypeTemp:dgreTypeTemp.substring(0,dgreTypeTemp.indexOf("_"));
                var dgreTypeId = dgreTypeTemp.indexOf("_") < 0 ? "" : dgreTypeTemp.substring(dgreTypeTemp.indexOf("_")+1);
                console.log(dgreType);
                $this.bind("click", function () {
                    if ($this.children("[name='dgreClick']").length == 0) {
                        var text = $this.html();
                        switch (dgreType) {
                            case "text":
                                $this.html("<input name='dgreClick' type='text' value='" + text + "' style=' width:90%' >");
                                $($this.children()[0]).select();
                                $($this.children()[0]).blur(function () {
                                    $this.html($(this).val());
                                });
                                break;
                            case "combobox": 
                                $this.html("<select id='select_single' name='dgreClick' multiple='multiple'>" + getOptionById(dgreTypeId) + "</select>");
                                $("#select_single").multiselect({
                                    //noneSelectedText: "==请选择==",
                                    selectedList: 4,
                                    multiple:false,
                                    header: false,
                                    minWidth: 100,
                                    autoOpen: true,
                                    blurFunc: function () {
                                        $this.html($("#select_single").multiselect("MyTexts"));
                                    }
                                });
                                break;
                            case "date":
                                var html = '<input id="dgreDate" value="' + text + '" style="width:90%;" name="dgreClick" class="Wdate" onfocus="var $dgreDate=$($dp.$(\'dgreDate\'));var $parent=$dgreDate.parent();WdatePicker({isShowClear:false,isShowToday:false,onpicked:function(){$parent.html($dp.cal.getDateStr());},dateFmt:\'yyyy/MM/dd\'})" />'
                                $this.html(html);
                                $($this.children()[0]).select();
                                $($this.children()[0]).blur(function () {
                                    $this.html($(this).val());
                                });
                                break;
                            case "checkbox":
                                $this.html("<select id='select_multiple' name='dgreClick' multiple='multiple'>" + jsonToOption($("#test").val()) + "</select>");
                                $("#select_multiple").multiselect({
                                    //noneSelectedText: "==请选择==",
                                    checkAllText: "全选",
                                    uncheckAllText: '全不选',
                                    selectedList: 4,
                                    autoOpen: true,
                                    blurFunc: function () {
                                        $this.html($("#select_multiple").multiselect("MyTexts"));
                                    }
                                });
                                break;
                            default:
                        }
                    }
                });


            }
        }
    });
});

//json转select的option
function jsonToOption(json) {
    var json = eval(json);
    console.log(json);
    var html = "";
    for (var i = 0; i < json.length; i++) {
        html += "<option value='" + json[i].id + "'>" + json[i].value + "</option>"
    }
    return html;
}

function getOptionById(id) {
    return $("#" + id).html();
}

//function getDateHtml($this,text) {
//    var html = '<input id="dgreDate" value="' + text + '" style="width:90%;" name="dgreClick" class="Wdate" onfocus="var $dgreDate=$($dp.$(\'dgreDate\'));var $parent=$dgreDate.parent();WdatePicker({onpicked:function(){$parent.html(getDateHtml($parent,$dp.cal.getDateStr()));},dateFmt:\'yyyy/MM/dd\'})" />'
//    $this.html(html);
//    $($this.children()[0]).select();
//    $($this.children()[0]).blur(function () {
//        $this.html($(this).val());
//    });
//}