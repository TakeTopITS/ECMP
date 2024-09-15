// JavaScript source code

// 设置Cookie
function setCookie(name, value, days) {
    document.cookie = name + "=" + encodeURIComponent(value) + "; max-age=" + days * 24 * 60 * 60 * 1000;
}

// 获取Cookie
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
    }
    return null;
}

//// 使用示例
//setCookie('chinese', '中文', 1); // 设置Cookie，确保编码正确
//var value = getCookie('chinese'); // 读取Cookie，确保解码正确
//console.log(value); // 输出正确显示中文，无乱码
function checkCookieExist(name) {
    if (getCookie(name))
        return true;
    else
        return false;
}

function deleteCookie(name, path, domain) {
    var strCookie;
    // 检查Cookie是否存在
    if (checkCookieExist(name)) {
        // 设置Cookie的期限为己过期
        strCookie = name + "=";
        strCookie += (path) ? "; path=" + path : "";
        strCookie += (domain) ? "; domain=" + domain : "";
        strCookie += "; expires=Thu, 01-Jan-70 00:00:01 GMT";
        document.cookie = strCookie;
    }
}
function saveCookie(name, value, expires, path, domain, secure) {
    var strCookie = name + "=" + value;
    if (expires) {
        // 计算Cookie的期限, 参数为天数
        var curTime = new Date();
        curTime.setTime(curTime.getTime() + expires * 24 * 60 * 60 * 1000);
        strCookie += "; expires=" + curTime.toGMTString();
    }
    // Cookie的路径
    strCookie += (path) ? "; path=" + path : "";
    // Cookie的Domain
    strCookie += (domain) ? "; domain=" + domain : "";
    // 是否需要保密传送,为一个布尔值
    strCookie += (secure) ? "; secure" : "";
    document.cookie = strCookie;
}