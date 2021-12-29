<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="fileupload" action='<c:url value="/file/upload.do"/>' method="post" enctype="multipart/form-data">
    <div class="fileupload-buttonbar">
        <div class="fileupload-buttons">
                <span class="fileinput-button">
                    <span class="btn_icon"><em></em>파일추가</span>
                    <input type="file" name="files[]" multiple="multiple"/>
                </span>
            <button type="submit" class="start"><em class="btn_icon"></em>업로드시작</button>
            <button type="reset" class="cancel"><em class="btn_icon"></em>업로드 취소</button>
            <button type="button" class="delete"><em class="btn_icon"></em>삭제</button>
            <button type="button" class="download"><em class="btn_icon"></em>전체 다운로드</button>
            <button name="btnApply" class="btn_apply"><em class="btn_icon"></em>적용</button>
            <div class="check_box">
                <label>
                    <input name="checkAll" type="checkbox" class="toggle"/>
                    <span class="chk_img"></span>
                </label>
            </div>
            <!-- 로딩중... -->
            <span class="fileupload-process"></span>
        </div>
        <!-- 전체 프로그레스바 영역 -->
        <div class="fileupload-progress fade" style="display: none">
            <!-- 프로그레스바 -->
            <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar"></div>
            </div>
            <!-- 진행 상태 나오는 부분. -->
            <!-- "14.19 kbit/s | 00:00:00 | 100.00 % | 86.36 KB / 86.36 KB" -->
            <div class="progress-extended">&nbsp;</div>
        </div>
    </div>
    <!-- form 내부에 있어야 함. -->
    <div class="scroll_auto margin_t5">
        <table role="presentation" style="width: 100%">
            <colgroup>
                <col style="width: 25%"/>
                <col style="width: 40%"/>
                <col style="width: 20%"/>
                <col style="width: 15%"/>
            </colgroup>
            <tbody class="files scrollbar"></tbody>
        </table>
    </div>
</form>


<script id="template-upload" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
            <td class="img_thumb">
                <span class="preview"></span>
            </td>
            <td class="file_name">
                <p class="name">{%=file.name%}</p>
                <br />
                <span class="error"></span>
            </td>
            <td class="file_size">
                <p class="size">Processing...</p>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
            </td>
            <td class="file_btn">
                {% if (!i && !o.options.autoUpload) { %}
                    <button class="start icon_start"></button>
                {% } %}
                {% if (!i) { %}
                    <button class="cancel icon_cancel"></button>
                {% } %}
            </td>
        </tr>
    {% } %}



</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-download fade" data-file="{%=JSON.stringify(file.fileRef) %}">
            <td class="img_thumb">
                <span class="preview">
                    {% if (file.thumbnailUrl) { %}
                        <a href="{%=file.url%}" title="{%=file.name%}"  download="{%=file.name%}" data-gallery><img width="80px" height="80px" src="{%=file.thumbnailUrl%}"></a>
                    {% } %}
                </span>
            </td>
            <td class="file_name">
                <p class="name">
                    <a href="{%=file.url%}" title="{%=file.name%}" class="fileDownload" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                </p>
                <br /><div><span class="error">{%=file.error%}</span> </div>
            </td>
            <td class="file_size">
                <span class="size">{%= BIT.formatFileSize(file.size)%}</span>
            </td>
            <td class="file_btn">
                <button class="delete icon_delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"></button>
                <div class="check_box">
                    <label>
                        <input type="checkbox" name="delete" class="toggle" />
                        <span class="chk_img"></span>
                    </label>
                </div>
            </td>
        </tr>
    {% } %}



</script>

<script type="text/javascript">
    let fileupload = (function () {

        let fileOptions = $('#fileupload').closest('div[id^=container]').data('options');
        let $container = $('#fileupload');
        let filePids = '';
        if (!BIT.isNullOrEmpty(fileOptions) && !BIT.isNullOrEmpty(fileOptions.data)) {
            filePids = unescape(fileOptions.data.filePids);
        }

        let init = function () {
            BIT.uploadMultiFiles($container, {
                maxFileSize: BIT.isNull(fileOptions.data.maxFileSize) ? parseInt('<c:out value="${MaxLength}" />') : fileOptions.data.maxFileSize,
                maxNumberOfFiles: parseInt(fileOptions.data.maxNumberOfFiles),
                acceptFileTypes: BIT.isNull(fileOptions.data.acceptFileTypes) ? new RegExp('') : typeof (fileOptions.data.acceptFileTypes) === 'string' ? new RegExp('(\.|\/)(' + unescape(fileOptions.data.acceptFileTypes) + ')$') : unescape(fileOptions.data.acceptFileTypes),
                formData: {
                    Category: fileOptions.data.category,
                    ModelType: 'grinbi.common.model.FileModel'
                },
                downloadUrl: '<c:url value="/file/download.do?filePids=" />',
                //deleteUrl: '<c:url value="/file/remove.do?filePid=" />',
                uploadRoot: '<c:out value="${UploadPath}" />'
            }, function (data) {    //completed
                let response = data;
                if (!BIT.isNull(data.result)) {
                    response = data.result;
                }

                if (!BIT.isNull(response.Data) && response.IsSucceed) {
                    //do something
                } else if (!response.IsSucceed) {
                    if (data.context) {
                        $(data.context).find('.name').html(data.files[0].name);
                        $(data.context).find('.size').html(BIT.formatFileSize(data.files[0].size));
                        $(data.context).find('.error').html(response.Message);
                    }
                }
            }, function (data) {    //destroyed
                let response = data;
                if (!BIT.isNull(data.result)) {
                    response = data.result;
                    BIT.modal(response.Message);
                }
            }, function (data) {    //finished
                let filePids = '';
                $container.find('.files tr').each(function () {
                    if (!BIT.isNull($(this).data('file')) && $(this).data('file') !== '') {
                        filePids += $(this).data('file').filePid + ',';
                    }
                });
                if (filePids.length > 0) {
                }
            });

            if (!BIT.isNull(filePids) && filePids !== '') {
                $container.addClass('fileupload-processing');
                BIT.callAjax('<c:url value="/file/getFiles.do" />', 'post', {
                    filePids: filePids
                }, function (response) {
                    let files = $container.fileupload('option', 'getFilesFromResponse').call(this, response);
                    $('.files tr').remove();
                    if (!BIT.isNull(files)) {
                        $('.files').append(tmpl('template-download', {files: files}));
                    }

                }).done(function () {
                    $container.removeClass('fileupload-processing');
                });
            }
        };

        let registerEventHandler = function () {
            $container.find('[name=btnApply]').click(function (e) {
                e.preventDefault();
                let files = [];
                $container.find('.files tr').each(function () {
                    if (!BIT.isNull($(this).data('file')) && $(this).data('file') !== '') {
                        files.push($(this).data('file'));
                    }
                });
                $container.closest('.modalContainer').data('data', files);
                BIT.modalDialogCloseClick($container.closest("div[id^=container_]").attr("id"));
            });

            $container.find('.files').on('click', ' .preview', function (e) {
                e.preventDefault();

                let file = $(this).closest('tr').data('file');
                if (!BIT.isNull(file)) {
                    BIT.showImage('<c:out value="${UploadPath}" />/' + file.Category + '/' + file.VirtualName, file.Width, file.Height);
                }
            });

            $container.find('.download').click(function (e) {
                e.preventDefault();
                $container.find('.fileDownload').multiDownload();
            });

            $container.find('.files').on('click', '.file_name a', function (e) {

                e.preventDefault();
                COM.download($(this).attr('href'));
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }
        };
    })();

    fileupload.init();

</script>
