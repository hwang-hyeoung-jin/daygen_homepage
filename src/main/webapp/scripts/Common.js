var COM = {};

/**
 *  @description CommonClass
 */
function CommonClass() {
    var $this = this;

    this.messages = {};
    this.defaultPageInitializerCaller = [];

    this.showLoading = function () {
        $('#divLoading').show();
    };

    this.hideLoading = function () {
        $('#divLoading').hide();
    };


    //#region callMultiFunction - 한페이지에 같은 아이템이 여러개 존재 할 경우 그 전부를 실행하게 함.
    this.callMultiFunction = function ($selector, targetSelectorString, functionName, param1, param2, param3, param4) {
        var deferred = Q.defer();
        if ($selector.length > 0) {
            var clientIds = [];
            for (var i = 0; i < $selector.length; i++) {
                var clientId = $selector[i].id.split('_')[1];
                var contains = false;
                for (var j = 0; j < clientIds.length; j++) {
                    if (clientIds[j] === clientId) {
                        contains = true;
                        break;
                    }
                }
                if (!contains) {
                    clientIds.push(clientId);
                }
            }
            var promises = [];
            for (var k = 0; i < clientIds.length; k++) {
                if (window[targetSelectorString + clientIds[k]] !== null) {
                    promises.push(window[targetSelectorString + clientIds[k]][functionName](param1, param2, param3, param4));
                }
            }
            return Q.all(promises);
        }
        deferred.resolve();
        return deferred.promise;
    };
    //#endregion


    // url, data, successCallback, failCallback
    // url, successCallback, failCallback
    this.download = function (url, arg1, arg2, arg3) {
        $this.showLoading();
        let data = null;
        var successCallback = null;
        var failCallback = null;
        if (typeof arg1 === 'object') {
            data = arg1;
            successCallback = arg2;
            failCallback = arg3;
        } else {
            successCallback = arg1;
            failCallback = arg2;
        }
        $.cookie('fileDownload', 'true');
        $.fileDownload(url, {
            httpMethod: 'POST',
            data: data,
            successCallback: function (url) {
                $this.hideLoading();
                if (!BIT.isNullOrEmpty(successCallback)) {
                    successCallback(url);
                }
            },
            failCallback: function (html, url) {
                $this.hideLoading();
                if (!BIT.isNullOrEmpty(failCallback)) {
                    failCallback(html, url);
                }
            }
        });
    };

    this.shareSns = function (sns) {
        let o;
        let url = encodeURIComponent(location.href);
        let title = encodeURIComponent(document.title);
        let _br = encodeURIComponent('\r\n');

        switch (sns) {
            case 'facebook':
                o = {
                    method: 'popup',
                    url: 'http://www.facebook.com/sharer/sharer.php?u=' + url + '&t=' + title
                };
                break;

            case 'twitter':
                o = {
                    method: 'popup',
                    url: 'http://twitter.com/share?text=' + title + '&url=' + url
                };
                break;

            case 'kakaotalk':
                Kakao.Link.sendDefault({
                    objectType: "feed",
                    content: {
                        title: document.title,
                        description: "",
                        imageUrl: "http://" + $(location).attr("host") + "/images/portal/layout/logo.png",
                        link: {
                            mobileWebUrl: location.href,
                            webUrl: location.href
                        }
                    },
                    buttons: [
                        {
                            title: '웹으로 보기',
                            link: {
                                mobileWebUrl: location.href,
                                webUrl: location.href
                            }
                        },
                        {
                            title: '앱으로 보기',
                            link: {
                                mobileWebUrl: location.href,
                                webUrl: location.href
                            }
                        }
                    ]
                });
                return;

            case 'kakaostory':
                o = {
                    method: 'web2app',
                    param: 'posting?post=' + title + _br + url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('한국교육과정평가원'),
                    a_store: 'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                    g_store: 'market://details?id=com.kakao.story',
                    a_proto: 'storylink://',
                    g_proto: 'scheme=storylink;package=com.kakao.story'
                };
                break;

            case 'band':
                o = {
                    method: 'web2app',
                    param: 'create/post?text=' + title + _br + url,
                    a_store: 'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                    g_store: 'market://details?id=com.nhn.android.band',
                    a_proto: 'bandapp://',
                    g_proto: 'scheme=bandapp;package=com.nhn.android.band'
                };
                break;

            default:
                BIT.modal('지원하지 않는 SNS입니다.');
                return false;
        }

        switch (o.method) {
            case 'popup':
                window.open(o.url, "sns", 'width=626,height=436');
                break;

            case 'web2app':
                if (navigator.userAgent.match(/android/i)) {
                    // Android
                    setTimeout(function () {
                        location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'
                    }, 100);
                } else if (navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)) {
                    // Apple
                    setTimeout(function () {
                        location.href = o.a_store;
                    }, 200);
                    setTimeout(function () {
                        location.href = o.a_proto + o.param
                    }, 100);
                } else {
                    BIT.modal('이 기능은 모바일에서만 사용할 수 있습니다.');
                }
                break;
        }
    };

    this.getMobileOS = function () {
        if (navigator.userAgent.match(/android/i)) {
            return 'android';
        } else if (navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)) {
            return 'ios';
        } else if (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) {
            return 'ios';
        } else {
            return '';
        }
    };

    //#region addEventHandler
    this.addEventHandler = function () {
        $('.uint').css('ime-mode', 'disabled');
        $('.int').css('ime-mode', 'disabled');
        $('.engnum').css('ime-mode', 'disabled');
        $('.float').css('ime-mode', 'disabled');
        $('.input-datepicker').css('ime-mode', 'disabled');


        $('.ellipsis').each(function () {
            let $this = $(this);
            if ($this.is('td')) {
                if ($this.find('div.ellipsis').length === 0) {
                    let $child = $('<div class="ellipsis_td"><em></em></div>');
                    $child.find('em').append($this[0].innerHTML);
                    $this.empty().append($child);
                }
            } else if ($this.is('span')) {

            } else {
                alert('관리자에게 문의');
            }
        });

        $('body').on('mouseover', 'span[name=WorkerName]', function (event) {
            if (!$(this).data('workerpid')) {
                $(this).css('cursor', 'text');
            } else {
                $(this).css('cursor', 'pointer');
            }
        });
        $('body').on('keydown', '.input-datepicker', function (event) {
            if (event.shiftKey || event.ctrlKey || event.altKey) {
                event.preventDefault();
            }
            // 숫자, -, BS, Left, Right, Del, Tab
            if (event.keyCode && (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)
                && event.keyCode !== 189 && event.keyCode !== 109
                && event.keyCode !== 8
                && event.keyCode !== 37
                && event.keyCode !== 39
                && event.keyCode !== 46
                && event.keyCode !== 9) {
                event.preventDefault();
            }
        });

        if ($(".scrollbar").length > 0) {
            $(".scrollbar").each(function () {
                if ($(this).getNiceScroll().length === 0) {
                    if ($(this).is('.horizrailenabled')) {
                        $(this).niceScroll({
                            cursorcolor: "#b4b4b4",
                            enableobserver: false
                        });
                    } else {
                        $(this).niceScroll({
                            cursorcolor: "#b4b4b4",
                            enableobserver: false,
                            horizrailenabled: false
                        });
                    }
                } else {
                    $(this).getNiceScroll().resize();
                }
            });
        }

        if ($.fn.datepicker) {
            $('.input-datepicker').datepicker({
                language: cultureCode,
                autoHide: true,
                zIndex: 9999999
            });
        }

        $('.button-datepicker').click(function (e) {
            e.preventDefault();
            $(this).prev().focus();
            return false;
        });

    }
    //#endregion

    this.pager = function ($target, records, options) {
        let defaults = {
            format: BIT.isNullOrEmpty(COM.getMobileOS()) ? "[ < nncnnnnnnn > ]" : "[ < nncnn > ]",
            perpage: 15,
            lapping: 0,
            page: 1,
            onSelect: function (page) {
            },
            onFormat: function (type) {
                switch (type) {
                    case 'block':
                        if (this.value !== this.page) {
                            return '<a class="paging_active" title="" href="javascript:;">' + this.value + '</a>';
                        } else {
                            return '<a class="paging_active active" title="" href="javascript:;">' + this.value + '</a>';
                        }
                    case 'next':
                        return '<a class="btn_paging_next" href="javascript:;">&gt</a>';
                    case 'prev':
                        return '<a class="btn_paging_prev" href="javascript:;">&lt</a>';
                    case 'first':
                        return '<a class="btn_paging_first" href="javascript:;">&lt&lt</a>';
                    case 'last':
                        return '<a class="btn_paging_last" href="javascript:;">&gt&gt</a>';
                }
            }
        };
        let opts = $.extend({}, defaults, options);
        $target.paging(records, opts);
    };
}

this.COM = new CommonClass();

BIT.setup({
    errorViewType: 'tooltip',  // 'tooltip' 혹은 'alert'
    useClientEncrypt: false,  //클라이언트 암호화를 사용 할 것인가?
    useServerEncrypt: false,
    tooltipTimer: 3000,
    mode: 'Release'
});

$.fn.layerPop = function (options) {
    let defaults = {
        wrap: $(this), // 레이어 팝업
        speed: 400, // 페이드인 속도
        mask: 'layer_mask01', // 마스크 클래스명
        close: 'layer_pop_close_01', // 닫기버튼 클래스명
        x: 0,
        y: 0
    }

    options = $.extend({}, defaults, options);

    let _hei = $(window).outerHeight();
    if ($('.' + options.mask).length === 0) {
        let _mask = document.createElement('div');
        _mask.setAttribute('class', options.mask);
        $('body').prepend(_mask);
        $('.' + options.mask).css('height', _hei)

        options.wrap.fadeIn(options.speed);
        $('.' + options.mask).fadeIn(options.speed * 2);
    }

    options.wrap.css('top', options.y + 'px');
    options.wrap.css('left', options.x + 'px');
    options.wrap.show();
};

// window.onpageshow = function (event) {
//     if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
//         location.href = location.href;
//     }
// }

$(function () {

    COM.addEventHandler();

    $(':text,:password').each(function () {
        if (BIT.isNullOrEmpty($(this).attr('id'))) {
            let id = BIT.getRandomString();
            $(this).attr('id', id);
            $(this).before('<label for="' + id + '"></label>');
        }
    });

    // 뒤로가기 방지 스크립트
    // if (location.href.toLocaleLowerCase().indexOf('/download.do') < 0) {
    //     history.pushState(null, document.title, location.href);
    //     window.addEventListener('popstate', function (event) {
    //         history.pushState(null, document.title, location.href);
    //     });
    // }
});

