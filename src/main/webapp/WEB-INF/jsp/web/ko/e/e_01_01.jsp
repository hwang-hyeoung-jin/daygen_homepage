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
    <div class="content sub_cont01" id="E_01_01">
        <div class="wrap_1296">
            <div class="news_wrap">
            	<div class="filter_wrap">
            		<button type="button" value="" class="on">전체</button>
            		<button type="button" value="회사소식">회사소식</button>
            		<button type="button" value="언론보도">언론보도</button>
            		<button type="button" value="공지사항">공지사항</button>
            	</div>
                <ul name="BbsList"></ul>
                <button type="button" class="btn_more" name="btnMore">더보기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/x-tmpl" id="tmplBbsList">
    {% for (let i=0, data; data=o[i]; i++) { %}
    <li data-data="{%=JSON.stringify(data)%}">
        <a href='javascript:'>
            <div class="thumb">
                <img src='<%= MessageSourceWrapper.getStaticMessage("file.uploadPath") %>/{%=  data.category + '/' + data.virtualName %}' alt="news thumb" style="width: 400px;">
            </div>
            <label>{%= data.clTypeCode %}</label>
            <h4>{%= BIT.htmlDecode(data.sj) %}</h4>
            <span class="date">{%= BIT.convertToDate(data.creatDt).toString('yyyy.MM.dd') %}</span>
        </a>
    </li>
    {% } %}
</script>

<script type="text/javascript">
    let e_01_01 = (function () {
        let $container = $('#E_01_01');

        let param = {
            modelType: 'daygen.model.Logical.BbsSearchModel',
            pageSize: 3,
            pageNumber: 1,
            clturTypeCode: 'KO'
        };

        let clTypeCode = '';

        let getBbsList = function () {
            return BIT.callAjax('<c:url value="/frontbbs/getBbsList.do" />', 'post', param, function (response) {
                if (response.IsSucceed) {
                    if (response.totalrecords > 0) {
                        $container.find('[name=BbsList]').append(tmpl('tmplBbsList', response.rows));
                        $container.find('[name=btnMore]').show();
                        
                        if (response.totalrecords <= param.pageNumber * param.pageSize) {
                        	$container.find('[name=btnMore]').hide();
                        }
                    } else {
                        $container.find('[name=BbsList]').empty().append("<div style='text-align: center; line-height: 100px; font-size: 20px;color: #3E3E3E;font-weight:500'>뉴스가 없습니다.</div>");
                        $container.find('[name=btnMore]').hide();
                    }
                }
            });
        };

        let init = function () {
            getBbsList();
        };

        let registerEventHandler = function () {
            $container.find('[name=btnMore]').click(function (e) {
                e.preventDefault();

                param.pageNumber++;

                getBbsList();
            });

            $container.find('.filter_wrap').on('click', 'button', function (e) {
                e.preventDefault();

                $(this).closest('.filter_wrap').find('button').removeClass('on')
                $(this).addClass('on');

                clTypeCode = $(this).val();

                param.pageNumber = 1;
                param.clTypeCode = clTypeCode;

                $container.find('[name=BbsList]').empty();

                getBbsList();
            });

            $container.find('[name=BbsList]').on('click', 'li', function(e){
                e.preventDefault();

                let data = $(this).data('data');

                if (!BIT.isNullOrEmpty(clTypeCode)){
                    location.href = '<c:url value="/ko/index.do?pageid=e_01_02&bbsPid="/>' + data.bbsPid + '&clTypeCode=' + clTypeCode;
                } else{
                    location.href = '<c:url value="/ko/index.do?pageid=e_01_02&bbsPid="/>' + data.bbsPid;
                }
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }
        };
    })();

    e_01_01.init();
</script>