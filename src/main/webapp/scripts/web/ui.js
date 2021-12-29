$(document).ready(function () {
    var trigger = new ScrollTrigger({
        addHeight: true
    });

    $(window).scroll(function () {
        //top버튼
        if ($(this).scrollTop() > 500) {
            $('.btn_top').fadeIn();
        } else {
            $('.btn_top').fadeOut();
        }
    });

    $('.btn_top').on('click', function () {
        $('html, body').animate({
            scrollTop: 0
        }, 400);
        return false;
    })

    if ($('.txt_box > h4').text() == 'ABOUT US') {
	    var _fixBar = $('.gnb  > li:eq(0)');
	    _fixBar.addClass('selected')
	} else if ($('.txt_box > h4').text() == 'TECHNOLOGY') {
	    var _fixBar = $('.gnb  > li:eq(1)');
	    _fixBar.addClass('selected')
	} else if ($('.txt_box > h4').text() == 'PRODUCTS') {
	    var _fixBar = $('.gnb  > li:eq(2)');
	    _fixBar.addClass('selected')
	} else if ($('.txt_box > h4').text() == 'CONTACT US') {
	    var _fixBar = $('.gnb  > li:eq(5)');
	    _fixBar.addClass('selected')
	}
});



