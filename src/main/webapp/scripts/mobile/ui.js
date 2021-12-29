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
});

function menuSlideOn(){
    $('body').prepend('<a id="mask" class="mask" href="javascript:;" onclick="menuSlideOff()"></a>')
    //document.getElementById('layout').style.position = 'fixed';
     $('.lnbContainer').css('transform','matrix(1,0,0,1,0,0)');
     $('.btn_lnb_close').show()
     $('.btn_ham').hide()
}
function menuSlideOff() {
    $('.lnbContainer').css('transform','matrix(1,0,0,1,0,-1314)')
    $('.lnb').animate({opacity:1},200,function(){
        //document.getElementById('layout').style.position = 'relative';
        $('#mask').remove();
        $('.btn_ham').show()
        $('.btn_lnb_close').hide()
    })
    
}

$(function(){
    $('#btnHam').on('click', function(){
        menuSlideOn()
    });
    
    $('#btnLnbClose').on('click', function(){
        menuSlideOff()
    })
})

