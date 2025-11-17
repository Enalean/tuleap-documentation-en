(function() {
    var scroll_coordinates = {};

    window.onscroll = function() {
        scroll_coordinates = {
            x: window.pageXOffset,
            y: window.pageYOffset
        }

        if(scroll_coordinates.y > 61) {
            document.body.classList.add('pinned');
        } else {
            document.body.classList.remove('pinned');
        }
    };
})();
