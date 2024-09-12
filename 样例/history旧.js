
// 根据用户和界面类型获取对应类型的历史表
$(document).ready(function () {
    $('#get_history').on('click', function (event) {
        var csrfToken = $('[name=csrfmiddlewaretoken]').val();  // 获取CSRF token
        var dataValue = $(this).attr('data-value')
        $.ajax({
            url: "/get/history/",
            type: 'POST',
            data: dataValue,
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,  // 告诉jQuery不要设置Content-Type请求头
            headers: { 'X-CSRFToken': csrfToken },  // 设置CSRF token
            success: function (response) {
                // 成功接收到 JSON 响应后的处理
                console.log(response['success']);  // 在控制台打印返回的数据
                // 在页面上显示历史记录
                var history_table = $('#history_table');
                history_table.empty();  // 清空历史记录列表
                history_table.append('<tr><th>订单ID</th><th>开始时间</th><th>完成时间</th><th>处理状态</th><th>详情</th><th>部分描述</th></tr>');
                // 使用 forEach 方法遍历 success 数组中的每个对象
                response['success'].forEach(item => {
                    var newRow = $('<tr></tr>');
                    newRow.append('<td>' + item.id + '</td>');
                    newRow.append('<td>' + item.created_time.substring(5, 16).replace('T', ':') + '</td>');
                    newRow.append('<td>' + item.finished_time.substring(5, 16).replace('T', ':') + '</td>');
                    // 定义状态字典
                    const stateMapping = {
                        "0": "正在处理",
                        "1": "已完成",
                        "2": "未识别成功"
                    };
                    newRow.append('<td>' + stateMapping[item.state] + '</td>');
                    newRow.append('<td><button class="order_button" data-value="' + item.id + '"> 点击查看详情</button></td>');
                    newRow.append('<td>' + item.extra_info.substring(0, 20) + '</td>');
                    history_table.append(newRow);
                });
                // 在创建完按钮之后进行按钮事件的绑定
                bindOrderButtonEvent();
            },
            error: function (xhr, status, error) {
                alert('历史记录获取失败：' + error);
                // 在这里处理错误的响应
            }
        });
        // 显示历史栏,隐藏答案结果
        $('#history_list').removeClass('hide')
        $('#order_answer').addClass('hide');
    });
});



// 绑定按钮的点击事件
function bindOrderButtonEvent() {
    // 在创建完按钮之后进行按钮事件的绑定
    $('.order_button').on('click', function (event) {
        // 获取按钮上的 data-value 属性值
        var dataValue = $(this).attr('data-value');
        var csrfToken = $('[name=csrfmiddlewaretoken]').val();  // 获取CSRF token
        var submit_date = { order_id: dataValue };

        $.ajax({
            url: "/get/answer/",
            type: 'POST',
            data: submit_date,
            headers: { 'X-CSRFToken': csrfToken },  // 设置CSRF token
            success: function (response) {
                // 获取图片url列表
                var url_list = response['success'].url_list;
                var answer_area = $('#order_answer');
                answer_area.empty();  // 清空历史记录列表
                // 加入轮播图
                answer_area.append(create_carousel(url_list));
                // 填充答案区
                answer_area.append('<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">' + response['success'].extra_info + '</h3></div><pre class="panel-body" style="white-space: pre-wrap; overflow-y: auto;" contenteditable="true">' + response['success'].answer + '</pre></div>');

                // 显示答案结果,隐藏历史记录
                $('#history_list').addClass('hide');
                $('#order_answer').removeClass('hide');
            },
            error: function (xhr, status, error) {
                alert('答案获取失败：' + error);
                // 在这里处理错误的响应
            }
        });

    });
}


//根据图片url列表, 返回轮播图html文本
function create_carousel(url_list) {
    var carousel = `<!-- 轮播图 -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
        `;
    for (var i = 0; i < url_list.length; i++) {
        // 填充滑动定位点
        if (i == 0) {
            carousel += `
            <li data-target="#carousel-example-generic" data-slide-to="
            `;
            carousel += i;
            carousel += `" class="active"></li>
            `;
        } else {
            carousel += `
            <li data-target="#carousel-example-generic" data-slide-to="
            `;
            carousel += i;
            carousel += `
            "></li>
            `;
        }
    }
    carousel += `
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
        `;
    for (var i = 0; i < url_list.length; i++) {
        // 填充图片
        if (i == 0) {
            carousel += `
            <div class="item active">
                <img src="`;
            carousel += url_list[i];
            carousel += `" alt="..." class="img-responsive">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            `;
        } else {
            carousel += `<div class="item">
                <img src="
                `;
            carousel += url_list[i];
            carousel += `" alt="..." class="img-responsive">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            `;
        }
    }
    carousel += `
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
        `;
    return carousel;
}