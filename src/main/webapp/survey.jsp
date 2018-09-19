<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>问卷调查</title>
    <link rel="stylesheet" href="/public/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/public/frame/static/css/style.css">
    <link rel="icon" href="/public/frame/static/image/code.png">
    <!-- <script>
        function handler(qsn_id) { //添加题目的click函数 点击这个函数 出现题目添加层
            layui.use(['element', 'form', 'table', 'layer', 'vip_table'], function() {
                var form = layui.form,
                    table = layui.table,
                    layer = layui.layer,
                    vipTable = layui.vip_table,
                    element = layui.element,
                    $ = layui.jquery;
                layer.open({
                    type: 4,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['660px', '350px'], //宽高
                    content: $('#set-add-put1')
                });
            });
        }
    </script> -->
</head>

<body class="body">
    <!-- 工具集 -->
    <!--答题弹出层-->
    <div id="set-answer" style="display:none; width:550px; padding:20px;">
        <form class="layui-form" lay-filter="answer">
            <div class="layui-form-item">
                <label class="layui-form-label">题目内容:</label>

                <label class="layui-form-label" name="qsn_content1"></label><br/><br/>

                <div class="layui-form-item" id="answer_list"></div>

            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="reset" class="layui-btn" lay-submit lay-filter="formDemo" id="next" name="next">下一题</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <div class="my-btn-box">
        <span class="fl">
            <a class="layui-btn layui-btn-danger radius btn-delect" id="btn-delete-all">删除模板</a>
            <a class="layui-btn btn-add btn-default" id="btn-add">添加模板</a>
            <a class="layui-btn btn-add btn-default" id="btn-answer">答题</a>
            <a class="layui-btn btn-add btn-default" id="btn-refresh"><i class="layui-icon">&#xe666;</i></a>
        </span>

    </div>

    <!-- 表格 -->
    <div id="dateTable" lay-filter="test"></div>


    <!--添加弹出层-->
    <div id="set-add-put" style="display:none; width:550px; padding:20px;">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">创建人名字</label>
                <div class="layui-input-block">
                    <input type="text" name="createName" required lay-verify="required" placeholder="请输入创建人姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block">
                    <input type="text" name="time" required lay-verify="required" placeholder="请输入创建时间" autocomplete="off" class="layui-input" id="time">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">模板名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" placeholder="请输入模板名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" lay-submit lay-filter="formDemo" id="add">立即添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <!--修改弹出层-->
    <div id="set-edit-put" style="display:none; width:900px; padding:20px;">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <label class="layui-form-label">模板信息</label>
                    <label class="layui-form-label" name="modelId_1"></label>
                    <label class="layui-form-label" name="name_1"></label>
                    <label class="layui-form-label" name="time_1"></label>
                    <label class="layui-form-label" name="createName_1"></label>
                    <!-- <input type="hidden" name="modelId" id="modelId"> -->
                    <hr class="layui-bg-red">
                </div>
                <div class="layui-input-block">
                    <label class="layui-form-label">题目信息</label>
                </div>
                <div class="layui-input-block">

                    <label class="layui-form-label-col" name="qsn_content"></label>

                    <!-- <input type="hidden" name="modelId" id="modelId"> -->
                </div>
            </div>
        </form>
    </div>

    <!--统计弹出层-->
    <div id="set-count" style="display:none; width:900px; padding:20px;">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <label class="layui-form-label">模板信息</label>
                    <label class="layui-form-label" name="count_modelId"></label>
                    <label class="layui-form-label" name="count_model_name"></label>

                    <!-- <input type="hidden" name="modelId" id="modelId"> -->
                    <hr class="layui-bg-red">
                </div>
                <div class="layui-input-block">
                    <label class="layui-form-label">题目信息</label>
                </div>
                <br />


                <div class="layui-input-block">
                    <label class="layui-form-label-col" name="qsn_count"></label>

                </div>
            </div>

        </form>

        <!-- <div class="layui-collapse" name="qsn_count" lay-accordion> </div> -->
    </div>

    <script type="text/javascript" src="/public/frame/layui/layui.js"></script>
    <script type="text/javascript" src="/public/js/index.js"></script>
    <script type="text/javascript" src="/public/frame/echarts/echarts.min.js"></script>



    <script type="text/javascript">
        layui.use(['element', 'form', 'table', 'layer', 'vip_table', 'laydate'], function() {
            var form = layui.form,
                table = layui.table,
                layer = layui.layer,
                vipTable = layui.vip_table,
                element = layui.element,
                $ = layui.jquery;
            var laydate = layui.laydate;

            laydate.render({
                elem: '#time' //指定元素
            });
            // function handler(qsn_id) {
            //     alert(qsn_id);
            // }
            // you code ...
            //统计按钮   
            $('#btn-count').click(function() {
                layer.open({
                    type: 1,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['900px', '500px'], //宽高
                    content: $('#set-count'),
                    title: "统计数据"
                });
            });

            // 数据表格

            function data_table(url) {
                //打开正在加载中弹出层
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                // 表格渲染
                var tableIns = table.render({
                    elem: '#dateTable' //指定原始表格元素选择器（推荐id选择器）
                        ,
                    height: vipTable.getFullHeight() //容器高度
                        ,
                    cols: [
                        [ //标题栏
                            {
                                checkbox: true,
                                sort: true,
                                fixed: true
                            }, {
                                field: 'createName',
                                title: '模板创建人',
                                sort: true
                            }, {
                                field: 'name',
                                title: '模板名称',
                                sort: true
                            }, {
                                field: 'time',
                                title: '模板创建时间',
                                sort: true
                            }, {
                                field: 'modelId',
                                title: '模板ID',
                                sort: true
                            }, {
                                fixed: 'right',
                                title: '操作',
                                align: 'center',
                                toolbar: '#barOption'
                            } //这里的toolbar值是模板元素的选择器

                        ]
                    ],
                    id: 'dataCheck',
                    url: url,
                    size: 'lg',
                    even: true, //开启隔行背景
                    method: 'get', //这里get查询数据
                    page: true,
                    limits: [30, 60, 90, 150, 300],
                    limit: 30 //默认采用30 默认分页30条
                        ,
                    loading: true,
                    done: function(res, curr, count) { //关闭加载中弹层 无论同步异步一定调用的回调
                        layer.close(layer.index); //关闭正在加载中弹出层

                    }
                });
            }
            layer.ready(function() {
                var url = 'survey/survey_list';
                data_table(url);
                return;
            });


            //弹出添加窗口
            $('#btn-add').click(function() {
                layer.open({
                    type: 1,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['660px', '350px'], //宽高
                    content: $('#set-add-put'),
                    title: "添加模板"
                });
            });


            //添加数据
            $('#add').click(function() {
                var createName = $('input[name="createName"]').val(); //获取值
                var name = $('input[name="name"]').val();
                var time = $('input[name="time"]').val();
                if (createName !== '') {
                    //打开正在加载中弹出层
                    layer.msg('加载中', {
                        icon: 16,
                        shade: 0.01,
                        time: '9999999'
                    });
                    var url = "survey/add_model";
                    var data = {
                        createName: createName,
                        name: name,
                        time: time
                    }
                    $.post(url, data, function(data) { //使用ajax提交
                        layer.closeAll();
                        if (data.code == 1) { //这里的code对应每行弹窗
                            layer.msg(data.msg, {
                                icon: 6
                            });
                            location.reload();
                        } else {
                            layer.msg(data.msg, {
                                icon: 5
                            });
                        }
                    }, "json");
                }
            });

            var id_array = []; //获取选中行
            // 获取选中行 这里我们可以选择删除 这里的id_array是一个隐藏的值 device对应device_id user对应code survry对应modelId
            table.on('checkbox(test)', function(obj) { //监听复选框
                if (obj.type == 'all') {
                    if (obj.checked == true) {
                        var data = table.cache.dataCheck; //批量操作的表格复选框
                        id_array = [];
                        for (var l = 0; l < data.length; l++) {
                            id_array.push(data[l].modelId);
                        }
                        console.log(id_array);
                    } else {
                        id_array = [];
                    }
                } else {
                    if (obj.checked == true) {
                        id_array.push(obj.data.modelId);
                        console.log(id_array);
                    } else {
                        var index = id_array.indexOf(obj.data.modelId);
                        id_array.splice(index, 1);
                        console.log(id_array);
                    }
                }
            });

            $('#btn-delete-all').click(function() { //删除全部通过一个获取选中行的值，来删除
                layer.confirm('您确定要删除这些数据吗？', function(index) {
                    //打开正在加载中弹出层
                    layer.msg('加载中', {
                        icon: 16,
                        shade: 0.01,
                        time: '9999999'
                    });
                    var url = "survey/del_model";

                    var data = {
                        array: id_array //这里将当前的modelId传到后端
                    }
                    $.post(url, data, function(data) {
                        layer.close(layer.index); //关闭正在加载中弹出层
                        console.log(id_array);
                        if (data.code == 1) {
                            layer.msg(data.msg, {
                                icon: 6
                            });
                            location.reload();
                        } else {
                            layer.msg(data.msg, {
                                icon: 5
                            });
                        }
                    }, "json");
                });

            });


            // 刷新
            $('#btn-refresh').on('click', function() {
                location.reload();
            });



            table.on('tool(test)', function(obj) { //点击编辑以后对应的事件

                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                $ = layui.jquery;
                if (layEvent === 'edit') { //如果当前是编辑事件
                    //打开正在加载中弹出层
                    layer.msg('加载中', {
                        icon: 16,
                        shade: 0.01,
                        time: '9999999'
                    });
                    var modelId = data.modelId; //将当前选中行的code给code变量
                    var url = "survey/look_model";
                    var data = {
                        modelId: modelId
                    };
                    $.getJSON(url, data, function(data) {
                        console.log(data);
                        layer.close(layer.index); //关闭正在加载中弹出层
                        if (data.code == 1) { //如果成功
							$('#set-edit-put label[name="modelId_1"]').css("width", "200px");
                            $('#set-edit-put label[name="modelId_1"]').text(data.data[0].modelId);
                            $('#set-edit-put label[name="name_1"]').css("width", "100px");
                            $('#set-edit-put label[name="name_1"]').text(data.data[0].name);
                            $('#set-edit-put label[name="time_1"]').text(data.data[0].time);
                            $('#set-edit-put label[name="createName_1"]').text(data.data[0].createName);
                            $('#set-edit-put label[name="qsn_content"]').text(data.data[0].content);
                            $('#set-edit-put label[name="modelId"]').text(data.data[0].modelId);
                            $('#set-edit-put label[name="qsn_content"]').html("") //清空info内容
                            $.each(data.data, function(i, item) {
                                $('#set-edit-put label[name="qsn_content"]').append(
                                    // "<div>"+i+item.content+"</div>"+
                                    // "<div>"+i+item.nickname+"</div>"+


                                    "<div class='layui-input-block'>第" + (i + 1) + "题:&nbsp;&nbsp;&nbsp;&nbsp;" + item.content + "</div>"
                                );
                            });
                            layer.open({
                                type: 1,
                                skin: 'layui-layer-rim', //加上边框
                                area: ['1000px', '500px'], //宽高
                                content: $('#set-edit-put')
                            });
                        } else if (data.code == 2) {
                            layer.msg(data.msg, {
                                icon: 5
                            });
                        }
                    });
                } else if (layEvent == 'count') {
                    layer.msg("加载中", {
                        icon: 16,
                        shade: 0.01,
                        time: '9999999'
                    });
                    $('#set-count label[name="count_modelId"]').text(data.modelId);
                    $('#set-count label[name="count_model_name"]').css("width", "200px");
                  $('#set-count label[name="count_modelId"]').css("width", "200px");
                    $('#set-count label[name="count_model_name"]').text(data.name); //弹出层的初始化
                    var modelId = data.modelId; //将当前选中行的code给code变量
                    var url = "survey/count";
                    var data = {
                        modelId: modelId
                    };
                    $.post(url, data, function(data) {
                        layer.close(layer.index); //关闭正在加载中弹出层

                        if (data.code == 1) {
                            layer.open({
                                type: 1,
                                skin: 'layui-layer-rim', //加上边框
                                area: ['1000px', '600px'], //宽高
                                content: $('#set-count')
                            });
                            $('#set-count label[name="qsn_count"]').html(""); //清空info内容

                            for (var i = 0; i < data.data.length; i++) {
                                var all;
                                var content = " ";
                                var title = '';
                                // alert(data.data[i].content);

                                if (data.data[i].qsn_type == 0 || data.data[i].qsn_type == 1) {
                                    title = '<div class="layui-input-block">第' + (i + 1) + '题:&nbsp;&nbsp;&nbsp;&nbsp;' + data.data[i].content + '</div>';
                                    var count = data.data[i].option_list.length;
                                    for (var j = 0; j < count; j++) {
                                        content = content + '<div class="layui-input-block">' + letter[data.data[i].option_list[j].orderNum - 1] + ':' + data.data[i].option_list[j].optionNum + '  <br/> 被' + data.data[i].option_list[j].count + '次点击</div><br/>';
                                    }
                                    all = title + content;
                                    $('#set-count label[name="qsn_count"]').append(all);
                                    $('#set-count label[name="qsn_count"]').append(' <hr class="layui-bg-red">');
                                    // else {
                                    title = null;
                                    content = null;
                                    all = null;

                                } else if (data.data[i].qsn_type == 2) {
                                    // alert(data.data[i].content);
                                    title = '<div class="layui-input-block">第' + (i + 1) + '题:&nbsp;&nbsp;&nbsp;&nbsp;' + data.data[i].content + '</div>';
                                    var count = data.data[i].answer.length;
                                    for (var j = 0; j < count; j++) {
                                        content = content + '<div class="layui-input-block">乘客答案:' + data.data[i].answer[j].choose + '</div>';
                                    }
                                    all = title + content;
                                    $('#set-count label[name="qsn_count"]').append(all);
                                    $('#set-count label[name="qsn_count"]').append(' <hr class="layui-bg-red">');
                                    title = null;
                                    content = null;
                                    all = null;
                                }
                                // }
                            };
                        } else {
                            layer.msg(data.msg, {
                                icon: 5
                            });
                        }
                    }, "json");
                }
            });


            //添加题目 真正的添加事件
            $('#edit').click(function() { //真正的添加事件 之前是填充弹出层，现在要获取弹出层修改的数据
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                var modelId = $('#set-edit-put label[name="modelId"]').text();
                var qsn_name = $('#set-edit-put input[name="qsn_name"]').val();
                var model_name = $('#set-edit-put label[name="name_1"]').text();
                // var createName = $('#set-edit-put input[name="createName"]').val();
                var url = "{:url('survey/edit_user')}?action=edit";

                var data = {
                    modelId: modelId,
                    qsn_name: qsn_name,
                    model_name: model_name
                };
                $.post(url, data, function(data) {
                    layer.close(layer.index); //关闭正在加载中弹出层
                    if (data.code == 1) {
                        layer.msg(data.msg, {
                            icon: 6
                        });
                        location.reload();
                    } else {
                        layer.msg(data.msg, {
                            icon: 5
                        });
                    }
                }, "json");
            });

            var letter = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

            $('#btn-answer').click(function() {
                alert(id_array);
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                var url = "survey/answer_list";
                var data = {
                    modelId: id_array //这里将当前的modelId数组传到后端
                }
                $.post(url, data, function(data) {
                    layer.close(layer.index); //关闭正在加载中弹出层
                    console.log(id_array);
                    if (data.code == 1) {
                        // alert(data.data[0].optionNum);
                        if (data.data.bool_num == true) {
                            $('#next').text("完成");
                        }
                        $('#set-answer label[name="qsn_content1"]').css("width", "200px");
                        $('#set-answer label[name="qsn_content1"]').text(data.data.content);
                        if (data.data.qsn_type == 1) {
                            $.each(data.data, function(i, item) {
                                if (item.orderNum == null) return false; //function中无法用break跳出 我们用return
                                //这边要将type也传过来 然后根据type来往anser_list中添加值

                                $('#answer_list').append(
                                    // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                    '<div class ="layui-input-block"><input type="checkbox" lay-skin="primary" name="checkbox[]" value="' + item.orderNum + '" title="' + letter[item.orderNum - 1] + ' : ' + item.optionNum + '"></div>'

                                )
                            });
                            form.render('checkbox');
                        } else if (data.data.qsn_type == 0) {
                            $.each(data.data, function(i, item) {
                                if (item.orderNum == null) return false; //function中无法用break跳出 我们用return
                                //这边要将type也传过来 然后根据type来往anser_list中添加值

                                $('#answer_list').append(
                                    // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                    '<div class ="layui-input-block"><input type="radio" lay-skin="primary" name="checkbox[]" value="' + item.orderNum + '" title="' + letter[item.orderNum - 1] + ' : ' + item.optionNum + '"></div>'
                                )
                            });
                            form.render('radio');
                        } else if (data.data.qsn_type == 2) {

                            // if (item.orderNum == null) return false; //function中无法用break跳出 我们用return
                            //这边要将type也传过来 然后根据type来往anser_list中添加值

                            $('#answer_list').append(
                                // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                ' <div class ="layui-input-block"><textarea name="text" id="text" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>'
                            )
                            form.render();

                        }



                        // alert(data.data.orderNum);
                        getqsn_type(data.data.qsn_type);
                        getmodelId(data.data.modelId);
                        getorderNum(data.data.orderNum);
                        layer.open({
                            type: 1,
                            skin: 'layui-layer-rim', //加上边框
                            area: ['660px', '350px'], //宽高
                            content: $('#set-answer'),
                            cancel: function(index, layero) {
                                $('#answer_list').empty();
                                $('#next').text("下一题");
                                layer.close(index)
                                return false;
                            },
                            end: function() {
                                $('#answer_list').empty();
                                $('#next').text("下一题");
                                layer.closeAll();
                            }
                        });
                    } else {
                        layer.msg(data.msg, {
                            icon: 5
                        });
                    }
                }, "json");

            });

            var t_modelId;
            var t_orderNum;
            var t_qsn_type;

            function getqsn_type(qsn_type) {
                t_qsn_type = qsn_type;
                // alert(t_qsn_type);
            }

            function getmodelId(modelId) {
                t_modelId = modelId;
                // alert(t_modelId);
            }

            function getorderNum(orderNum) {
                t_orderNum = orderNum;
                // alert(t_orderNum);
            }

            var choice = [];

            $('#next').click(function() {
                var qsn_type = t_qsn_type;

                var is_answered = false;
                if (qsn_type == 1) {
                    var count = $("#set-answer input[type='checkbox']:checked").length
                    if (count == 0) {
                        is_answered = true;
                    }
                    $("#set-answer input[type='checkbox']:checked").each(function() {
                        choice.push($(this).val());
                    });
                } else if (qsn_type == 0) {
                    var count = $("#set-answer input[type='radio']:checked").length
                    if (count == 0) {
                        is_answered = true;
                    }
                    $("#set-answer input[type='radio']:checked").each(function() {
                        choice.push($(this).val());
                    });
                } else if (qsn_type == 2) {
                    var count = $("#set-answer #text").length
                    if (count == 0) {
                        is_answered = true;
                    }
                    $("#set-answer #text").each(function() {
                        choice.push($(this).val());
                    });
                }
                if (is_answered == true) {
                    layer.msg('请选择答案');
                    return;
                }
                alert(choice);
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                alert(choice);
                var url = "survey/next_qsn";
                var t_choice = choice;
                var modelId = t_modelId;
                var orderNum = t_orderNum;
                var data = {
                    modelId: modelId,
                    orderNum: orderNum,
                    array: t_choice,
                    qsn_type: qsn_type
                }
                $.post(url, data, function(data) {
                    layer.close(layer.index); //关闭正在加载中弹出层
                    form.render(null, 'answer');
                    choice = [];
                    console.log(id_array);
                    if (data.code == 1) {
                        if (data.data.bool_num == true) {
                            $('#next').text("完成");
                        }
                        // alert(data.data[0].optionNum);
                        $('#answer_list').empty();
                        $('#set-answer label[name="qsn_content1"]').text(data.data.content);
                        // alert(data.data.orderNum);
                        if (data.data.qsn_type == 1) {
                            $.each(data.data, function(i, item) {
                                if (item.orderNum == null) return false; //function中无法用break跳出 我们用return
                                $('#answer_list').append(
                                    // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                    '<div class ="layui-input-block"><input type="checkbox" lay-skin="primary" name="sex" value="' + item.orderNum + '" title="' + letter[item.orderNum - 1] + ' : ' + item.optionNum + '"></div>'

                                )


                            });
                            form.render('checkbox');
                        } else if (data.data.qsn_type == 0) {
                            $.each(data.data, function(i, item) {
                                if (item.orderNum == null) return false; //function中无法用break跳出 我们用return
                                //这边要将type也传过来 然后根据type来往anser_list中添加值

                                $('#answer_list').append(
                                    // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                    '<div class ="layui-input-block"><input type="radio" lay-skin="primary" name="checkbox[]" value="' + item.orderNum + '" title="' + letter[item.orderNum - 1] + ' : ' + item.optionNum + '"></div>'
                                )
                            });
                            form.render('radio');
                        } else if (data.data.qsn_type == 2) {
                            $('#answer_list').append(
                                // ' <br/><label class="layui-form-label">' + item.orderNum + ':</label>' +
                                ' <div class ="layui-input-block"><textarea name="text" id="text"  lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>'
                            )
                            form.render();

                        }
                        getqsn_type(data.data.qsn_type);
                        getmodelId(data.data.modelId);
                        getorderNum(data.data.orderNum);

                    } else if (data.code == 2) {
                        layer.msg(data.msg, {
                            icon: 6
                        });
                        setTimeout('layer.closeAll()', 2000);
                    } else if (data.code == 3) {
                        layer.msg(data.msg, {
                            icon: 5
                        });
                    }
                }, "json");



            });


        });
    </script>
    <script type="text/html" id="barOption">
        <a class="layui-btn layui-btn-mini layui-btn-normal" lay-event="edit">查看</a>
        <a class="layui-btn layui-btn-mini layui-btn-normal" lay-event="count">统计</a>
    </script>

</body>

</html>