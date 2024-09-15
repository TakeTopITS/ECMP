// JavaScript Document
function nTabs(thisObj, Num) {

    if (thisObj.className == "active") return;

    var tabObj = thisObj.parentNode.id;
    var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    for (i = 0; i < tabList.length; i++) {
        if (i == Num) {
            thisObj.className = "active";
            var tabObjContent = document.getElementById(tabObj + "_Content" + i);
            tabObjContent.style.display = "block";
        } else {
            tabList[i].className = "normal";
            var tabObjContent = document.getElementById(tabObj + "_Content" + i); 
            tabObjContent.style.display = "none";
        }
    }
}

