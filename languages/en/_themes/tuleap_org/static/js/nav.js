(function() {
    var header_burger = document.querySelector('.header-burger'),
        header_nav    = document.querySelector('.header-menu');

    header_burger.addEventListener('click', function(event) {
        header_nav.classList.toggle('show');
    });
})();
