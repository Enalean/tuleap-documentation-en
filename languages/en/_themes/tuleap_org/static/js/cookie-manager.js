function setCookie(cookie_name, cookie_value, expiration_days) {
    var d = new Date();
    d.setTime(d.getTime() + (expiration_days * 24 * 60 * 60 * 1000));

    var expires = "expires=" + d.toUTCString();

    document.cookie = cookie_name + "=" + cookie_value + ";" + expires + ";path=/;domain=.tuleap.org";
}

function getCookie(cookie_name) {
    var name = cookie_name + "=",
        ca   = document.cookie.split(';');

    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];

        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }

        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }

    return undefined;
}

function removeAllCookies() {
    var cookies = document.cookie.split(';');

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i],
            eqPos  = cookie.indexOf('='),
            name   = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;

        document.cookie = name.trim() + '=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;domain=docs.tuleap.org';
        document.cookie = name.trim() + '=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;domain=.tuleap.org';
    }
}
