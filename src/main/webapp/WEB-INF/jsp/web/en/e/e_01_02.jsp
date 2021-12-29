<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="grinbi.message.MessageSourceWrapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container news">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>NEWS</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont01" id="E_01_02">
        <div class="wrap_1296">
            <div class="news_view">
                <label class="category"><span name="clTypeCode"></span></label>
                <h3 class="tit"><span name="sj"></span></h3>
                <div class="info">
                    <div class="file" name="fileDown">
                    </div>
                    <div class="info_date">
                        <span>Date</span>
                        <em></em>
                        <span name="creatDt"></span>
                    </div>
                </div>
                <div class="cont">
                    <img src="" name="imgFile">
                    <p><span name="cn"></span></p>
                </div>    
                <div class="page">
                    <div class="prev">
                        <label><em></em>Prev</label>
                        <a href="javascript:;" name="prevName">No article.</a>
                    </div>
                    <div class="next">
                        <label><em></em>Next</label>
                        <a href="javascript:;" name="nextName">No article.</a>
                    </div>
                </div>
                <button type="button" class="btn_more" name="btnList">List</button>
            </div>
        </div>
    </div>
</div>

<script type="text/x-tmpl" id="templFileList">
<div class="file_wrap">
    <label><em></em>Attachments</label>
    {% for (let i = 0, data; data = o[i]; i++) { %}
    <a data-data="{%= JSON.stringify(data) %}" href='<c:url value="/file/download.do?filePids="/>{%=data.FilePid%}' title="{%=data.RealName%}"><span class="txt_file">{%=data.RealName%}</span></a>
    {% } %}
</div>
</script>

<script type="text/javascript">
    let e_01_02 = (function () {
        let $container = $('#E_01_02');
        let filePids = '';
        let imgFile = '';
        let imgFileHeight = 0;
        let imgFileWidth = 0;
        let param = {
            modelType: 'daygen.model.Logical.BbsSearchModel',
            bbsPid: $.getUrlVar('bbsPid'),
            clturTypeCode: 'EN'
        };

        let clTypeCode = '';

        let getBbs = function () {
            return BIT.callAjax('<c:url value="/frontbbs/getBbs.do" />', 'post', { bbsPid: $.getUrlVar("bbsPid") }, function (response) {
                if (response.IsSucceed) {
                    let data = response.Data;
                    filePids = data.filePids;

                    if (!BIT.isNullOrEmpty(data.filePid)) {
                        imgFile = '<%= MessageSourceWrapper.getStaticMessage("file.uploadPath") %>/' + data.category + '/' + data.virtualName;
                        imgFileHeight = data.height;
                        imgFileWidth = data.width;

                        $container.find('[name=imgFile]').show().css('cursor', 'pointer').attr('src', imgFile);
                    }else{
                        $container.find('[name=imgFile]').hide();
                    }

                    BIT.bindObjectData(data, { $parent: $container });

                    $container.find('[name=creatDt]').text(BIT.convertToDate(data.creatDt).toString('yyyy-MM-dd'));
                    $container.find('[name=cn]').html(BIT.htmlDecode(data.cn));

                    // 파일
                    if (!BIT.isNullOrEmpty(filePids)) {
                        getFileList(filePids);
                    }
                }
            });
        };

        let getPrevBbs = function () {
            return BIT.callAjax('<c:url value="/frontbbs/getPrevBbs.do" />', 'post', param, function (response) {
                if (response.IsSucceed) {
                    let data = response.Data;

                    if (!$.isEmptyObject(data)) {
                        $container.find('[name=prevName]').text(BIT.htmlDecode(data.sj));

                        if (!BIT.isNullOrEmpty(clTypeCode)){
                            $container.find('[name=prevName]').attr('href', '<c:url value="/en/index.do?pageid=e_01_02&bbsPid=" />' + data.bbsPid + '&clTypeCode=' + data.clTypeCode);
                        } else{
                            $container.find('[name=prevName]').attr('href', '<c:url value="/en/index.do?pageid=e_01_02&bbsPid=" />' + data.bbsPid);
                        }
                    }
                }
            });
        };

        let getNextBbs = function () {
            return BIT.callAjax('<c:url value="/frontbbs/getNextBbs.do" />', 'post', param, function (response) {
                if (response.IsSucceed) {
                    let data = response.Data;

                    if (!$.isEmptyObject(data)) {
                        $container.find('[name=nextName]').text(BIT.htmlDecode(data.sj));

                        if (!BIT.isNullOrEmpty(clTypeCode)){
                            $container.find('[name=nextName]').attr('href', '<c:url value="/en/index.do?pageid=e_01_02&bbsPid=" />' + data.bbsPid + '&clTypeCode=' + data.clTypeCode);
                        } else{
                            $container.find('[name=nextName]').attr('href', '<c:url value="/en/index.do?pageid=e_01_02&bbsPid=" />' + data.bbsPid);
                        }
                    }
                }
            });
        };

        let getFileList = function (filePids) {
            BIT.callAjax('<c:url value="/file/getFiles.do" />', 'post', { filePids: filePids }, function (response) {
                if (response.IsSucceed) {
                    $container.find('[name=fileDown]').empty().append(tmpl('templFileList', response.Data));
                }
            });
        };

        let init = function () {
            clTypeCode = $.getUrlVar('clTypeCode');
            param.clTypeCode = clTypeCode;

            if ($.getUrlVar('bbsPid') != null) {
                if(isNaN($.getUrlVar('bbsPid'))){
                    BIT.modal('유효하지 않은 요청입니다','알림',function () {
                        $container.find('[name=btnList]').trigger('click');
                    });
                    return;
                }

                COM.showLoading();
                Q.all([getBbs(), getPrevBbs(), getNextBbs()]).done(function () {
                    COM.hideLoading();
                });
            } else {
                BIT.modal('유효하지 않은 요청입니다','알림',function () {
                    $container.find('[name=btnList]').trigger('click');
                });
            }
        };

        let registerEventHandler = function () {
            $container.find('[name=imgFile]').click(function () {
                BIT.showImage(imgFile, imgFileWidth, imgFileHeight);
            });

            $container.find('[name=fileDown]').on('click', 'a', function (e) {
                e.preventDefault();

                COM.download($(this).attr('href'), function (){
                    getFileList(filePids);
                });
            });

            $container.find('[name=btnList]').click(function (e) {
                e.preventDefault();

                location.href = '<c:url value="/en/index.do?pageid=e_01_01"/>';
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }
        };
    })();

    e_01_02.init();
</script> 