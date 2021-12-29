<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" id="divContainer">
    <div class="cnt_tit">
        <h2 class="nav_1_1">KOR - NEWS 게시물 관리</h2>
    </div>
    <div class="contents" id="B_01">
        <div class="gnb01">
            <table class="tbl_1">
                <caption>검색</caption>
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 80%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">검색</th>
                    <td>
                        <select name="SearchType">
                            <option value="">전체</option>
                            <option value="S">제목</option>
                            <option value="C">내용</option>
                        </select>
                        <input type="text" class="ipt_basic" name="SearchText" />
                        <button type="button" class="btn_basic" name="btnSearch">검색</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="tbl_2">
                <caption>리스트</caption>
                <colgroup>
                    <col style="width: 8%" />
                    <col style="width: 14%" />
                    <col style="width: 56%" />
                    <col style="width: 13%" />
                    <col style="width: 9%" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">분류</th>
                    <th scope="col">제목</th>
                    <th scope="col">게시글 등록일</th>
                    <th scope="col">조회수</th>
                </tr>
                </thead>
                <tbody name="tbodyBbsList"></tbody>
                <tfoot>
                <tr>
                    <td colspan="5">
                        <div class="pager" name="pager"></div>
                    </td>
                </tr>
                </tfoot>
            </table>
            <div class="btn_area">
                <a class="btn_register" name="btnRegist" href="<c:url value='/admin/index.do?pageid=b_02' />">등록하기</a>
            </div>
        </div>
    </div>
</div>

<script type="text/x-tmpl" id="tmplBbsList">
    {% for (let i=0, data; data=o[i]; i++) { %}
    <tr data-data="{%=JSON.stringify(data)%}">
        <td>{%= data.rowNum %}</td>
        <td>{%= data.clTypeCode %}</td>
        <td><a href='<c:url value="/admin/index.do?pageid=b_02&bbsPid="/>{%= data.bbsPid %}'>{%= BIT.htmlDecode(data.sj) %}</a></td>
        <td>{%= BIT.convertToDate(data.creatDt).toString('yyyy-MM-dd') %}</td>
        <td>{%= data.rdcnt %}</td>
    </tr>
    {% } %}
</script>

<script type="text/javascript">
    let b_01 = (function () {
        let $container = $('#B_01');
        let currentPage = parseInt(BIT.isNullOrEmpty($.getUrlVar('pageNumber')) ? 1 : $.getUrlVar('pageNumber'));
        let searchData = {};

        let search = function () {
            searchData = $.extend({}, $container.getObject(), {
                pageSize: 15,
                pageNumber: currentPage,
                clturTypeCode: 'KO'
            });

            return BIT.callAjax('<c:url value="/admin/bbs/getBbsList.do" />', 'post', searchData, function (response) {
                if (response.IsSucceed) {
                    if (response.totalrecords > 0) {
                        $container.find('[name=tbodyBbsList]').empty().append(tmpl('tmplBbsList', response.rows));

                        let options = {
                            page: response.pagenum,
                            perpage: searchData.pageSize,
                            onSelect: function (page) {
                                currentPage = isNaN(page) ? 1 : page;
                                if (currentPage != response.pagenum) {
                                    COM.showLoading();
                                    search().done(function () {
                                        COM.hideLoading();
                                    });
                                }
                            },
                        };

                        COM.pager($container.find('[name=pager]'), response.totalrecords, options);
                        $container.find('[name=pager]').closest('tr').show();
                    } else {
                        $container.find('[name=tbodyBbsList]').empty().append("<tr><td colspan='5' style='height: 50px;alignment: center;vertical-align: center'>검색결과가 없습니다.</td></tr>");
                        $container.find('[name=pager]').closest('tr').hide();
                    }
                }
            });
        }

        let init = function () {
            searchData = location.href.queryStringToJSON();
            BIT.bindObjectData(searchData, {$parent: $container});
        };

        let lazyInit = function () {
            search();
        };

        let registerEventHandler = function () {

            $container.find('[name=btnSearch]').click(function () {
                currentPage = 1;
                search();
            });

            $container.find('[name=searchText]').keydown(function (e) {
                if (e.keyCode === 13) {
                    $container.find('[name=btnSearch]').trigger('click');
                }
            });

            $container.find('[name=tbodyBbsList]').on('click', 'tr a', function (e) {
                e.preventDefault();
                location.href = $(this).attr('href') + '&' + $(searchData).convertQueryString();
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
                $(function () {
                    lazyInit();
                });
            }
        };
    })();

    b_01.init();
</script>