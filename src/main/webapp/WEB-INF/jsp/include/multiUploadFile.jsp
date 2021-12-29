<%@ page import="com.google.common.base.Strings" %>
<%@ page import="static com.google.common.base.Strings.isNullOrEmpty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr id="trMultiFileUploadArea">
    <th scope="row">첨부파일</th>
    <td>
        <p class="inline">업로드 파일: <span name="fileCount">0</span>개</p>
        <button type="button" class="btn_del ml5" name="btnOpen">파일관리</button>
        <c:if test="${MaxlengthNull == 'true'}">
            <p class="file_notice mt5">*jpg, jpeg, pdf, ppt, pptx, doc, docx, hwp, txt, zip파일만 가능하며, 10MB 초과시 업로드 되지
                않습니다.</p>
        </c:if>
        <input type="hidden" name="filePids"/>
    </td>
</tr>

<script type="text/javascript">
    let multiFileUploadArea = (function () {
        let $container = $('#trMultiFileUploadArea');

        let push = function (filePids) {
            if (!BIT.isNullOrEmpty(filePids)) {
                $container.find('[name=filePids]').val(filePids);
                if (filePids.toString().indexOf(',') < 0) {
                    $container.find('[name=fileCount]').html(1);
                } else {
                    $container.find('[name=fileCount]').html(filePids.toString().split(',').length);
                }
            } else {
                $container.find('[name=filePids]').val(filePids);
                $container.find('[name=fileCount]').text(0);
            }
        };

        let init = function () {
        };

        let registerEventHandler = function () {
            $container.find('[name=btnOpen]').click(function () {
                let options = {
                    url: '<c:url value="/file/popup/fileUploadPage.do" />',
                    width: 840,
                    height: 480,
                    closeCallback: closeCallback,
                    title: BIT.messages.common_file_title,
                    data: {
                        category: '${Category}',
                        filePids: $container.find('[name=filePids]').val(),
                        maxNumberOfFiles: 15, /*파일 갯수*/
                        acceptFileTypes: '${AcceptFileTypes}', /*정규식*/
                        maxFileSize: '${MaxLength}' /*byte*/
                    }
                };
                BIT.modalDialog(options);

                function closeCallback($dialog) {
                    if (!BIT.isNull($dialog) && $dialog.data('data')) {
                        let files = $dialog.data('data');
                        let filePids = "";
                        for (let i = 0; i < files.length; i++) {
                            if (filePids) {
                                filePids += "," + files[i].FilePid;
                            } else {
                                filePids = files[i].FilePid;
                            }
                        }
                        push(filePids);
                    } else if (BIT.isNull($dialog.data('data'))) {
                    }
                }
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            },
            push: function (filePids) {
                push(filePids);
            }
        };
    })();
    multiFileUploadArea.init();
</script>