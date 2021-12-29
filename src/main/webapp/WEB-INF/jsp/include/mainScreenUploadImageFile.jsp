<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tr id="divMainScreenUplaodImageFile">
    <th scope="row"><em>*</em>메인, 리스트 썸네일 이미지 등록</th>
    <td>
        <input type="text" name="fileName" class="ipt_file" readonly="readonly"/>
        <input type="hidden" name="filePid"/>
        <input type="hidden" name="thumbFilePid"/>
        <input type="file" name="file" style="display: none;" accept=".gif,.jpg,.jpeg,.png"/>
        <button type="button" class="btn_del" name="btnFile">파일선택</button>
        <button type="button" class="btn_del" name="btnRemoveFile">삭제</button>
        <span class="txt">*권장이미지사이즈 : <c:out value="${ImageSize}"/> / 파일 확장자 : JPG, JPEG, PNG, GIF</span>
</tr>

<script type="text/javascript">

    let mainScreenUplaodImageFile = (function () {
        let $container = $("#divMainScreenUplaodImageFile");

        function bindFile(file) {
            $container.find('[name=filePid],[name=thumbFilePid]').val(file.FilePid)
            $container.find('[name=fileName]').data('file', file).val(file.RealName)
            $container.find('[name=imgFile]').show().css('cursor', 'pointer').attr('src', '<c:out value="${UploadPath}" />/' + file.Category + '/' + file.VirtualName);
            BIT.globalCallback("MainScreenImageFile_Add", file);
        }

        let push = function (data) {
            if (!BIT.isNullOrEmpty(data.filePid)) {
                BIT.callAjax('<c:url value="/file/getFiles.do" />', 'post', {
                    filePids: data.filePid
                }, function (response) {
                    if (response.IsSucceed) {
                        if (response.Data.length) {
                            bindFile(response.Data[0]);
                        }
                    }
                });
            }
        }

        let init = function () {
            BIT.uploadSingleFile($container.find('[name=file]'), '<c:url value="/file/upload.do"/>', {
                Category: '${Category}'
            }, /(\.|\/)(gif|jpe?g|png)$/i, <c:out value="${MaxLength}" />, function (data) {
                bindFile(data);
            });
            $container.find('[name=fileName]').click(function (e) {
                e.preventDefault();
                COM.download('<c:url value="/file/download.do" />', {filePids: $(this).next().val()});
            });
        };

        let registerEventHandler = function () {
            $container.find('[name=btnFile]').click(function (e) {
                e.preventDefault();
                $container.find('[name=file]').trigger('click');
            });

            $container.find('[name=imgFile]').click(function () {
                let file = $container.find('[name=fileName]').data('file');
                BIT.showImage('<c:out value="${UploadPath}" />/' + file.Category + '/' + file.VirtualName, file.Width, file.Height);
            });

            $container.find('[name=btnRemoveFile]').click(function () {
                $container.find('[name=filePid],[name=thumbFilePid]').val('');
                $container.find('[name=fileName]').removeData('file').val('');
                $container.find('[name=imgFile]').hide().css('cursor', 'pointer').attr('src', '');
                BIT.globalCallback("MainScreenImageFile_Remove");
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }, push: function (data) {
                push(data);
            }
        };
    })();
    mainScreenUplaodImageFile.init();
</script>