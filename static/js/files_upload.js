// 这里负责单/多文件的上传


// 单/多文件预览更新

const input = document.querySelector("input");
const files_preview = document.querySelector("#files_preview");

// input.style.opacity = 0;

input.addEventListener("change", updateImageDisplay);

function updateImageDisplay() {
    while (files_preview.firstChild) {
        files_preview.removeChild(files_preview.firstChild);
    }

    const curFiles = input.files;
    if (curFiles.length === 0) {
        const para = document.createElement("p");
        para.textContent = "没有文件";
        files_preview.appendChild(para);
    } else {
        pre = document.getElementById("files_preview");

        for (const file of curFiles) {
            const listItem = document.createElement("div");
            const para = document.createElement("p");
            if (validFileType(file)) {
                para.textContent = `${file.name}, 图像大小 ${returnFileSize(
                    file.size,
                )}.`;
                const image = document.createElement("img");
                image.src = URL.createObjectURL(file);

                listItem.appendChild(image);
                listItem.appendChild(para);
            } else {
                para.textContent = `${file.name}:无效文件类型,请重传`;
                listItem.appendChild(para);
            }

            pre.appendChild(listItem);
        }
    }
}

// https://developer.mozilla.org/zh-CN/docs/Web/Media/Formats/Image_types
const fileTypes = [
    "image/apng",
    "image/bmp",
    "image/gif",
    "image/jpeg",
    "image/pjpeg",
    "image/png",
    "image/svg+xml",
    "image/tiff",
    "image/webp",
    "image/x-icon",
];

function validFileType(file) {
    return fileTypes.includes(file.type);
}

function returnFileSize(number) {
    if (number < 1024) {
        return `${number} bytes`;
    } else if (number >= 1024 && number < 1048576) {
        return `${(number / 1024).toFixed(1)} KB`;
    } else if (number >= 1048576) {
        return `${(number / 1048576).toFixed(1)} MB`;
    }
}











// 模块0上传动作
// 摄影计划助手模块
$(document).ready(function () {
    $('#upload-file-form-0').on('submit', function (event) {
        event.preventDefault();  // 阻止表单的默认提交行为
        var formData = new FormData();  // 创建FormData对象
        var csrfToken = $('[name=csrfmiddlewaretoken]').val();  // 获取CSRF token
        var files = $('#avatars')[0].files;  // 获取选中的文件
        // 遍历文件列表并添加到formData
        for (var i = 0; i < files.length; i++) {
            formData.append('avatars', files[i]);
        }
        var extra_info = $('#extra_info').val(); // 获取额外要求
        formData.append('extra_info', extra_info);  // 添加额外要求到formData
        formData.append('type', 0);  // 添加type到formData
        var form = $(this);
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: formData,
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,  // 告诉jQuery不要设置Content-Type请求头
            headers: { 'X-CSRFToken': csrfToken },  // 设置CSRF token
            success: function (response) {
                alert(response.message);
                // 在这里处理成功的响应
            },
            error: function (xhr, status, error) {
                alert('订单提交失败：' + error);
                // 在这里处理错误的响应
            }
        });
        // 清空输入
        document.getElementById('upload-file-form-2').reset();
        $('#files_preview').empty();
    });
});



// 模块1上传动作
// 博客编写助手模块
$(document).ready(function () {
    $('#upload-file-form-1').on('submit', function (event) {
        event.preventDefault();  // 阻止表单的默认提交行为
        var formData = new FormData();  // 创建FormData对象
        var csrfToken = $('[name=csrfmiddlewaretoken]').val();  // 获取CSRF token

        var files = $('#avatars')[0].files;  // 获取选中的文件
        // 遍历文件列表并添加到formData
        for (var i = 0; i < files.length; i++) {
            formData.append('avatars', files[i]);
        }
        var extra_info = $('#extra_info').val(); // 获取额外要求
        formData.append('extra_info', extra_info);  // 添加额外要求到formData
        formData.append('type', 1);  // 添加type到formData
        var form = $(this);
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: formData,
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,  // 告诉jQuery不要设置Content-Type请求头
            headers: { 'X-CSRFToken': csrfToken },  // 设置CSRF token
            success: function (response) {
                alert(response.message);
                // 在这里处理成功的响应
            },
            error: function (xhr, status, error) {
                alert('订单提交失败：' + error);
                // 在这里处理错误的响应
            }
        });
        // 清空输入
        document.getElementById('upload-file-form-1').reset();
        $('#files_preview').empty();
    });
});




// 模块1上传动作
// 博客编写助手模块
$(document).ready(function () {
    $('#update_profile').on('submit', function (event) {
        event.preventDefault();  // 阻止表单的默认提交行为
        var formData = new FormData();  // 创建FormData对象
        var csrfToken = $('[name=csrfmiddlewaretoken]').val();  // 获取CSRF token

        var files = $('#avatars')[0].files;  // 获取选中的文件
        // 遍历文件列表并添加到formData
        for (var i = 0; i < files.length; i++) {
            formData.append('avatars', files[i]);
        }
        var extra_info = $('#extra_info').val(); // 获取额外要求
        formData.append('extra_info', extra_info);  // 添加额外要求到formData
        formData.append('type', 1);  // 添加type到formData
        var form = $(this);
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: formData,
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,  // 告诉jQuery不要设置Content-Type请求头
            headers: { 'X-CSRFToken': csrfToken },  // 设置CSRF token
            success: function (response) {
                alert(response.message);
                // 在这里处理成功的响应
            },
            error: function (xhr, status, error) {
                alert('订单提交失败：' + error);
                // 在这里处理错误的响应
            }
        });
        // 清空输入
        document.getElementById('upload-file-form-1').reset();
        $('#files_preview').empty();
    });
});
