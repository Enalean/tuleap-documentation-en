(function() {
    var accept_cookie      = getCookie('accept_cookies'),
        accept_cookies_bar = document.getElementById('accept-cookies-bar');

    handleCookiesBar();
    optOutCookies();

    function handleCookiesBar() {
        if (accept_cookie !== 'true' && accept_cookie !== 'false') {
            displayAcceptCookiesBar();
        }

        document.getElementById('cookies-ok').addEventListener('click', function(event) {
            event.preventDefault();

            hideAcceptCookiesBar();
            acceptCookies();
        });

        document.getElementById('cookies-nok').addEventListener('click', function(event) {
            event.preventDefault();

            hideAcceptCookiesBar();
            refuseCookies();
        });
    }

    function optOutCookies() {
        var opt_out_cookies = document.getElementById('opt-out-cookies');

        if (opt_out_cookies) {
            opt_out_cookies.addEventListener('click', function(event) {
                event.preventDefault();

                removeAllCookies();
                refuseCookies();
                document.getElementById('cookies-cleaned').classList.add('shown');
            });
        }
    }

    function displayAcceptCookiesBar() {
        accept_cookies_bar.classList.add('shown');
    }

    function hideAcceptCookiesBar() {
        accept_cookies_bar.classList.remove('shown');
    }

    function acceptCookies() {
        setCookie('accept_cookies', 'true', 365);
    }

    function refuseCookies() {
        setCookie('accept_cookies', 'false', 365);
    }
 })();
