// JavaScript source code

// ����Cookie
function setCookie(name, value, days) {
    document.cookie = name + "=" + encodeURIComponent(value) + "; max-age=" + days * 24 * 60 * 60 * 1000;
}

// ��ȡCookie
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

//// ʹ��ʾ��
//setCookie('chinese', '����', 1); // ����Cookie��ȷ��������ȷ
//var value = getCookie('chinese'); // ��ȡCookie��ȷ��������ȷ
//console.log(value); // �����ȷ��ʾ���ģ�������
function checkCookieExist(name) {
    if (getCookie(name))
        return true;
    else
        return false;
}

function deleteCookie(name, path, domain) {
    var strCookie;
    // ���Cookie�Ƿ����
    if (checkCookieExist(name)) {
        // ����Cookie������Ϊ������
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
        // ����Cookie������, ����Ϊ����
        var curTime = new Date();
        curTime.setTime(curTime.getTime() + expires * 24 * 60 * 60 * 1000);
        strCookie += "; expires=" + curTime.toGMTString();
    }
    // Cookie��·��
    strCookie += (path) ? "; path=" + path : "";
    // Cookie��Domain
    strCookie += (domain) ? "; domain=" + domain : "";
    // �Ƿ���Ҫ���ܴ���,Ϊһ������ֵ
    strCookie += (secure) ? "; secure" : "";
    document.cookie = strCookie;
}