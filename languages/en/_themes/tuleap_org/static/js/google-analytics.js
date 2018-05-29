function loadGoogleAnalytics() {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-46520688-1');
    gtag('set', {'content_group4': 'docPages'});
}

(function() {
    var accept_cookie = getCookie('accept_cookies');

    if (accept_cookie === 'true') {
        loadGoogleAnalytics();
    }
})();
