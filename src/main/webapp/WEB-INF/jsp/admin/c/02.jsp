<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="divContainer">
    <div class="cnt_tit">
        <h2 class="nav_2_1">ENG - NEWS 게시물 관리</h2>
    </div>
    <div class="contents" id="C_02">
        <form action='<c:url value="/admin/bbs/add.do" />' method="post" modeltype="daygen.model.physical.BbsModel">
            <div class="gnb01">
                <table class="tbl_1">
                    <caption>정보입력</caption>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 80%">
                    </colgroup>
                    <tbody>
	                    <tr>
	                        <th scope="row"><em>*</em>분류</th>
	                        <td>
	                            <select name="clTypeCode">
	                                <option value="Press">Press</option>
	                                <option value="Notice">Notice</option>
	                                <option value="Daygen news">Daygen news</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><em>*</em>제목</th>
	                        <td>
	                            <input type="text" name="sj" class="ipt_long" placeholder="제목을 입력합니다." />
	                        </td>
	                    </tr>
	                    <jsp:include page="/common/editor.do">
	                        <jsp:param name="textareaName" value="cn"/>
	                    </jsp:include>
	                    <jsp:include page="/file/mainScreenUploadImageFile.do">
	                        <jsp:param name="category" value="Main/en"/>
	                        <jsp:param name="imageSize" value="676px * 200px"/>
	                    </jsp:include>
	
	                    <jsp:include page="/file/multiUploadFile.do">
	                        <jsp:param name="category" value="Bbs/en"/>
	                    </jsp:include>
	                    <tr>
	                        <th scope="row"><em>*</em>게시글 노출여부</th>
	                        <td>
	                            <input type="radio" name="bbscttExpsrYn" value="Y" checked="checked" />
	                            <label>Yes</label>
	                            <input type="radio" name="bbscttExpsrYn" class="ml20" value="N" />
	                            <label>No</label>
	                        </td>
	                    </tr>
                    </tbody>
                </table>
                <div class="btn_area">
                    <button name="btn_delete" class="btn_left">삭제</button>
                    <button name="btn_list">목록</button>
                    <button type="submit" name="btn_submit">확인</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    let c_02 = (function () {
        let $container = $('#C_02');

        function setUI(isModify) {
            if (isModify) {
                $container.find('form').attr('action','<c:url value="/admin/bbs/modify.do" />');
                $container.find('[name=btn_delete]').show();
            } else {
                $container.find('form').attr('action','<c:url value="/admin/bbs/add.do" />');
                $container.find('[name=btn_delete]').hide();
            }
        }

        let init = function () {
            $container.find('form').data('formdata', {clturTypeCode: 'EN'});

            if ($.getUrlVar('bbsPid') != null) {
                setUI(true);
                if(isNaN($.getUrlVar('bbsPid'))){
                    BIT.modal('유효하지 않은 요청입니다','알림',function () {
                        $container.find('[name=btnList]').trigger('click');
                    });
                    return;
                }
                BIT.callAjax('<c:url value="/admin/bbs/getBbs.do" />', 'post', {
                    bbsPid: $.getUrlVar('bbsPid')
                }, function (response) {
                    if (response.IsSucceed) {
                        $container.find('form').data('formdata', {
                            bbsPid: response.Data.bbsPid
                        });
                        BIT.bindObjectData(response.Data, {$parent: $container});

                        $container.find('[name=filePid],[name=thumbFilePid]').val(response.Data.thumbFilePid);
                        $container.find('[name=fileName]').data('file', response.Data).val(response.Data.realName);

                        if (!BIT.isNullOrEmpty(editor)){
                            editor.initEditor();
                            editor.push(response.Data.cn);
                        }

                        if (!BIT.isNullOrEmpty(multiFileUploadArea)){
                            multiFileUploadArea.push(response.Data.filePids);
                        }
                    }
                });
            } else {
                setUI(false);
                if (!BIT.isNullOrEmpty(editor)){
                    editor.initEditor();
                }
            }

            BIT.validate($container.find('form'), 'formdata', function (response) {
                if (response.IsSucceed) {
                    if ($.getUrlVar('bbsPid') != null) {
                        location.href = '<c:url value="/admin/index.do?pageid=c_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                    } else {
                        location.href = '<c:url value="/admin/index.do?pageid=c_01"/>';
                    }
                }
            });
        };

        let registerEventHandler = function () {
            $container.find('[name=btn_submit]').click(function (e) {
                e.preventDefault();

                tinymce.triggerSave();

                if ($.trim($container.find('[name=cn]').val()) === '') {
                    BIT.modal('내용을 입력 하세요.');
                    return;
                }
                $container.find('form').submit();
            });

            $container.find('[name=btn_delete]').click(function (e) {
                e.preventDefault();

                BIT.confirmUI('게시물을 삭제하겠습니까?','확인', function (){
                    BIT.callAjax('<c:url value="/admin/bbs/remove.do" />', 'post', { bbsPid: $.getUrlVar('bbsPid') }, function (response) {
                        if (response.IsSucceed) {
                            if ($.getUrlVar('bbsPid') != null) {
                                location.href = '<c:url value="/admin/index.do?pageid=c_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                            } else {
                                location.href = '<c:url value="/admin/index.do?pageid=C_01"/>';
                            }
                        }
                    });
                });
            });

            $container.find('[name=btn_list]').click(function (e) {
                e.preventDefault();

                if ($.getUrlVar('bbsPid') != null) {
                    location.href = '<c:url value="/admin/index.do?pageid=c_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                } else {
                    location.href = '<c:url value="/admin/index.do?pageid=c_01"/>';
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

    c_02.init();
</script>