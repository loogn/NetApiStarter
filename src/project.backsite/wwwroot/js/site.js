var editorAllItems = [
    'source', '|', 'preview', 'plainpaste', 'wordpaste', '|',
    'justifyleft', 'justifycenter', 'justifyright',
    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'subscript',
    'superscript', 'clearhtml', '|', 'fullscreen',
    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', '/', 'bold',
    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
    'anchor', 'link', 'unlink', '|', 'about'
];

var editorSimpleItems = [
    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
    'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'];


/*
 var bodyEditor = null;
        KindEditor.ready(function (K) {
            bodyEditor = K.create('#body', {
                resizeType: 1,
                height: '600px;',
                width: '100%',
                uploadJson: '/upload/upload_json',
                fileManagerJson : '/upload/file_manager_json',
				allowFileManager : true,
                items: editorSimpleItems,
            });
        });
 
 */


function bindUpload(eleId) {

    $("#" + eleId + "_file").change(function () {
        $.ajaxFileUpload({
            fileElementId: eleId + '_file',
            url: '/upload/ajaxfileupload',
            dataType: 'json',
            success: function (data) {
                if (data.success) {
                    $("#" + eleId + "_show").attr('src', data.result.fileUrl);
                    $("#" + eleId).val(data.result.fileUrl);
                }
            }
        });
    });
}


function closeXWindow(noReload) {
// 获得frame索引
    var index = parent.layer.getFrameIndex(window.name);
//关闭当前frame
    parent.layer.close(index);
    if (noReload) return;
    parent.location.reload();
}
