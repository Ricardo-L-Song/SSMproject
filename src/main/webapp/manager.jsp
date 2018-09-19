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

</head>
<script type="text/javascript" src="/public/frame/layui/layui.js"></script>
<script type="text/javascript" src="/public/js/index.js"></script>
<script type="text/javascript" src="/public/frame/echarts/echarts.min.js"></script>

<body class="body">
    <div id="dateTable" lay-filter="test"></div>

    <hr class="layui-bg-cyan">
    <!-- 工具集 -->
    <div class="my-btn-box" style="display:none" id="tool_list">
        <span class="fl">
            <a class="layui-btn layui-btn-danger radius btn-delect" id="btn-delete-all" >批量删除</a>
            <a class="layui-btn btn-add btn-default" id="btn-add" >添加题目</a>
            <a class="layui-btn btn-add btn-default" id="btn-refresh"><i class="layui-icon">&#xe666;</i></a>
        </span>
    </div>

    <div id="dateTable1" lay-filter="test1"></div>

    <!--添加题目弹出层-->
    <div id="set-add-qsn" style="display:none; width:550px; padding:20px;">
        <form class="layui-form" lay-filter="qsn_form">
            <div class="layui-form-item">
                <label class="layui-form-label">题目内容</label>
                <div class="layui-input-block">
                    <input type="text" name="content" required lay-verify="required" placeholder="请输入题目内容" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">请选择问题的类型:</label>
                <div class="layui-input-block">
                    <select name="qsn_type" lay-verify="required" style="width: 212px;">
                      <option value=""></option>
                      <option value="0">单选题</option>
                      <option value="1">多选题</option>
                      <option value="2">问答题</option>
                    </select>
                </div>
                <br/>
                <div class="layui-input-block" id="input_qus" name="input_qus">

                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">

                    <button type="button" class="layui-btn" id="add_op">添加选项</button>
                    <button type="button" class="layui-btn" id="del_op">减少选项</button>
                    <button type="button" class="layui-btn" lay-submit lay-filter="formDemo" id="commit">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <!--添加选项弹出层 不看不看不看-->
    <!-- <div id="set-add-option" style="display:none; width:550px; padding:20px;">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">题目内容:</label>
                <div class="layui-input-block">
                    <label name="content_1"></label>
                   
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选项1(A):</label>
                <div class="layui-input-block">
                    <input type="text" name="option1" required lay-verify="required" placeholder="请输入选项1" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选项2(B):</label>
                <div class="layui-input-block">
                    <input type="text" name="option2" required lay-verify="required" placeholder="请输入选项2" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选项3(C):</label>
                <div class="layui-input-block">
                    <input type="text" name="option3" required lay-verify="required" placeholder="请输入选项3" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" lay-submit lay-filter="formDemo" id="add2">立即添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
 -->






    <script type="text/javascript">
        layui.use(['element', 'form', 'table', 'layer', 'vip_table'], function() {
            var form = layui.form,
                table = layui.table,
                layer = layui.layer,
                vipTable = layui.vip_table,
                element = layui.element,
                $ = layui.jquery;
            // you code ...
            //增加选项 一个值k用来控制步进 k是用来append 也是用来字母数组的索引
            var k = 0;
            var letter = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            $('#add_op').click(function() {
                $('#input_qus').append(
                    '<label class="layui-form-label" id="qs_letter" name="qs_letter">' + letter[k] + '</label>' + '<div class ="layui-input-block" id="qs_detail"><input type = "text" name = "user_op"  lay-verify="required" placeholder = "请输入选项' + (k + 1) + '" autocomplete = "off" class = "layui-input input_qs" id = "user_op' + k + '"></div>'
                );
                k++;
                alert(k);
            });

            // $('#del_op').click(function() {
            //     alert(k);
            //     $('.layui-input-block:eq(' + k + ')').remove(); //input_qs的第k个remove
            //     if (!$('.layui-input-block:eq(' + k + ')')) {
            //         k--;
            //     }

            // });

            $('#del_op').click(function() {

                $('#input_qus input[name="user_op"]:eq(' + (k - 1) + ')').remove(); //input_qs的第k个remove
                $('#input_qus label[name="qs_letter"]:eq(' + (k - 1) + ')').remove(); //input_qs的第k个remove
                $('#input_qus div[id="qs_detail"]:eq(' + (k - 1) + ')').remove();
                if ($('#input_qus :eq(' + (k - 1) + ')' != null)) {
                    k--;
                }
                if ((k + 1) == 0) {
                    layer.msg("无法删减更多选项了");
                    $('#input_qus').empty();
                    k = 0;
                }
                alert(k);
            });

            //确认提交问题到后台的按钮
            $('#commit').click(function() { //增加选项
                var a = [];
                $("#input_qus input[name='user_op']").each(function() { //往数组里添加input里获取到的值
                    a.push($(this).val()); //往a数组里添加
                });
                alert(a);
                var content = $('input[name="content"]').val(); //获取值

                if (content !== '') {
                    //打开正在加载中弹出层
                    layer.msg('加载中', {
                        icon: 16,
                        shade: 0.01,
                        time: '9999999'
                    });
                    var qsn_type = t_qsn_type;
                    var modelId = t_modelId; //选择到了模板的id 然后随机生成一个qsnid 这个qsn的id下生成诸多问题选项
                    var modelName = t_modelName;
                    var url = 'manager/add_qsn';
                    var data = {
                        modelId: modelId, //模板id用来生成qsnId
                        content: content, //用来存储问题内容
                        modelName: modelName,
                        a: a, //用来存储所有问题的数组
                        qsn_type: qsn_type
                    }
                    $.post(url, data, function(data) { //确认提交
                        k = 0;
                        $('#set-add-qsn input[name="content"]').val("");
                        $('#set-add-qsn div[name="input_qus"]').empty();
                        layer.closeAll();
                        if (data.code == 1) {
                            layer.msg(data.msg, {
                                icon: 6
                            });
                            refresh_table1();
                        } else {
                            layer.msg(data.msg, {
                                icon: 5
                            });
                        }
                    }, "json ");
                }
            });

            //数据表格
            function data_table(url) {
                //打开正在加载中弹出层
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                // 表格渲染
                var tableIns = table.render({
                    elem: '#dateTable' //将数据表格注入这个id
                        ,
                    height: 300,
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
                    id: 'dataCheck', //设定容器唯一id，该参数等价于 <table id="test"></table> 中的 id 值
                    url: url,
                    size: 'lg',
                    even: true, //开启隔行背景
                    method: 'get', //这里get查询数据
                    page: true,
                    limits: [30, 60, 90, 150, 300],
                    limit: 30 //默认采用30 默认分页30条
                        ,
                    loading: true, //是否显示加载条
                    done: function(res, curr, count) { //关闭加载中弹层 无论同步异步一定调用的回调
                        layer.close(layer.index); //关闭正在加载中弹出层

                    }
                });
            }

            function data_table1(modelId, url) {
                //打开正在加载中弹出层
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                // 表格渲染
                var tableIns = table.render({
                    elem: '#dateTable1' //将数据表格注入这个id
                        ,
                    height: 300,
                    cols: [
                        [ //标题栏
                            {
                                checkbox: true,
                                sort: true,
                                fixed: true
                            }, {
                                field: 'modelName',
                                title: '模板名称',
                                sort: true
                            }, {
                                field: 'content',
                                title: '题目内容',
                                sort: true
                            }, {
                                field: 'qsnId',
                                title: '题目id',
                                sort: true
                            }, {
                                field: 'modelId',
                                title: '模板ID',
                                sort: true
                            }, {
                                fixed: 'right',
                                title: '操作',
                                align: 'center',
                                toolbar: '#barOption1'
                            } //这里的toolbar值是模板元素的选择器

                        ]
                    ],
                    id: 'dataCheck1', //设定容器唯一id，该参数等价于 <table id="test"></table> 中的 id 值
                    url: url,
                    size: 'lg',
                    even: true, //开启隔行背景
                    method: 'post', //post异步查询数据
                    where: {
                        modelId: modelId //用这个id进行异步请求
                    },
                    page: true,
                    limits: [30, 60, 90, 150, 300],
                    limit: 30 //默认采用30 默认分页30条
                        ,
                    loading: true, //是否显示加载条
                    done: function(res, curr, count) { //关闭加载中弹层 无论同步异步一定调用的回调
                        layer.close(layer.index); //关闭正在加载中弹出层

                    }
                });
            }
            layer.ready(function() {
                var url = 'manager/survey_list';
                data_table(url);
                return;
            });

            var t_modelId;
            var t_modelName;
            var t_qsnId;

            function getmodelId(modelId) {
                // alert(modelId);
                t_modelId = modelId; //将modelId传出去
            }

            function getmodelName(modelName) {
                // alert(modelName);
                t_modelName = modelName; //将modelName传出去
            }

            function getqsnId(qsnId) {
                // alert(qsnId);
                t_qsnId = qsnId; //将modelName传出去
            }

            table.on('checkbox(test)', function(obj) {
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象

                //打开正在加载中弹出层
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                var modelName = data.name;
                var modelId = data.modelId; //将当前选中行的code给code变量
                var url = 'manager/qsn_list';
                data_table1(modelId, url); //将异步请求封装在了这个方法中
                getmodelId(modelId);
                getmodelName(modelName);
                $('#tool_list').show();
            });
            //模板数据表格的编辑与删除事件
            table.on('tool(test)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit') { //编辑模板的题目和选项
                    //打开正在加载中弹出层
                } else if (layEvent === 'del') { //删除模板
                    //打开正在加载中弹出层
                    var modelId = data.modelId;
                    layer.confirm('真的删除行么', function(index) {
                        layer.msg('加载中', {
                            icon: 16,
                            shade: 0.01,
                            time: '9999999'
                        });
                        var url = "manager/del_model";
                        var data = {
                            modelId: modelId
                        };
                        $.post(url, data, function(data) {
                            layer.close(layer.index); //关闭正在加载中弹出层
                            if (data.code == 1) { //删除成功
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
                }
            });

            //题目数据表格的编辑与删除事件
            table.on('tool(test1)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                var modelName = data.modelName;
                var qsnId = data.qsnId;
                var content = data.content;
                getqsnId(qsnId);
                // if (layEvent === 'edit1') { //编辑模板的题目和选项

                //     layer.msg('加载中', {
                //         icon: 16,
                //         shade: 0.01,
                //         time: '9999999'
                //     });
                //     var url = "{:url('manager/edit_qsn')}";
                //     var data = {
                //         qsnId: qsnId
                //     };
                //     $.post(url, data, function(data) {
                //         layer.close(layer.index); //关闭正在加载中弹出层
                //         if (data.code == 1) { //如果是修改

                //             $('#set-add-option label[name="content_1"]').text(content);
                //             // $('#edit_serial_number').val(data.data.serial_number);
                //             $('#set-add-option input[name="option1"]').val(data.data[0].option_num);
                //             $('#set-add-option input[name="option2"]').val(data.data[1].option_num);
                //             $('#set-add-option input[name="option3"]').val(data.data[2].option_num);
                //             layer.open({
                //                 type: 1,
                //                 skin: 'layui-layer-rim', //加上边框
                //                 area: ['660px', '350px'], //宽高
                //                 content: $('#set-add-option')
                //             });
                //         } else { //如果是第一次创建题目 清空所有的option
                //             $('#set-add-option label[name="content_1"]').text(content);
                //             $('#set-add-option input[name="option1"]').val("");
                //             $('#set-add-option input[name="option2"]').val("");
                //             $('#set-add-option input[name="option3"]').val("");
                //             layer.open({
                //                 type: 1,
                //                 skin: 'layui-layer-rim', //加上边框
                //                 area: ['660px', '350px'], //宽高
                //                 content: $('#set-add-option')
                //             });
                //         }
                //     }, "json")

                // } else
                if (layEvent === 'del1') { //删除题目
                    //打开正在加载中弹出层
                    var qsnId = data.qsnId;
                    layer.confirm('真的删除行么', function(index) {
                        layer.msg('加载中', {
                            icon: 16,
                            shade: 0.01,
                            time: '9999999'
                        });
                        var url = "{:url('manager/del_option')}";
                        var data = {
                            qsnId: qsnId
                        };
                        $.post(url, data, function(data) {
                            layer.close(layer.index); //关闭正在加载中弹出层
                            if (data.code == 1) { //删除成功 返回的code
                                layer.msg(data.msg, {
                                    icon: 6
                                });
                                refresh_table1();
                            } else {
                                layer.msg(data.msg, {
                                    icon: 5
                                });
                            }
                        }, "json");
                    });
                }
            });

            //修改题目
            $('#add2').click(function() {
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                // var device_id = $('#qsnId').val(); //可以通过声明一个隐藏的qsnId在弹出层打开时填充，点击按钮时调用。这里我直接用别的方法了
                var qsnId = t_qsnId;
                alert(qsnId);
                var option1 = $('#set-add-option input[name="option1"]').val(); //获取option1的input值
                var option2 = $('#set-add-option input[name="option2"]').val();
                var option3 = $('#set-add-option input[name="option3"]').val();
                var url = "{:url('manager/edit_option')}";
                var data = {
                    qsnId: qsnId,
                    option1: option1,
                    option2: option2,
                    option3: option3
                };
                $.post(url, data, function(data) {
                    layer.close(layer.index); //关闭正在加载中弹出层
                    if (data.code == 1) {
                        layer.msg(data.msg, {
                            icon: 6
                        });
                        layer.closeAll();
                    } else {
                        layer.msg(data.msg, {
                            icon: 5
                        });
                    }
                }, "json");
            });

            function refresh_table1() {
                layer.msg('加载中', {
                    icon: 16,
                    shade: 0.01,
                    time: '9999999'
                });
                var modelId = t_modelId; //将当前选中行的code给code变量
                var url = 'manager/qsn_list';
                data_table1(modelId, url);
            }
            // 刷新
            $('#btn-refresh').on('click', function() {
                var modelId = t_modelId;
                if (modelId == null) {
                    layer.msg("请先编辑模板");
                } else {
                    refresh_table1();
                }
            });

            //弹出添加题目窗口
            $('#btn-add').click(function() {
                // alert(t_modelId);


                layer.open({
                    type: 1,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['660px', '350px'], //宽高
                    content: $('#set-add-qsn'),
                    cancel: function(index, layero) {
                        $('#input_qus').empty();
                        layer.close(index)
                        k = 0;
                        $('#set-add-qsn input[name="content"]').val("");
                        $('#set-add-qsn div[name="input_qus"]').empty();

                        return false;
                    },

                });

            });

            var t_qsn_type;

            form.on('select()', function(data) {
                t_qsn_type = data.value;
                // alert($('#set-add-qsn select[name="op_type"]').val());
                if (data.value == 2) {
                    $('#add_op').attr('disabled', true);
                    $('#add_op').hide();
                    $('#del_op').attr('disabled', true);
                    $('#del_op').hide();
                    $('#input_qus').hide();
                    // form.render('select');
                } else {
                    $('#add_op').attr('disabled', false);
                    $('#add_op').show();
                    $('#del_op').attr('disabled', false);
                    $('#del_op').show();
                    $('#input_qus').show();
                }

            });

            //获取选中行 
            var id_array = []; //获取选中行
            // 获取选中行 这里我们可以选择删除 这里的id_array是一个隐藏的值 device对应device_id user对应code survry对应modelId
            table.on('checkbox(test1)', function(obj) { //监听复选框
                if (obj.type == 'all') {
                    if (obj.checked == true) {
                        var data = table.cache.dataCheck; //批量操作的表格复选框
                        id_array = [];
                        for (var l = 0; l < data.length; l++) {
                            id_array.push(data[l].qsnId);
                        }
                        console.log(id_array);
                    } else {
                        id_array = [];
                    }
                } else {
                    if (obj.checked == true) {
                        id_array.push(obj.data.qsnId);
                        console.log(id_array);
                    } else {
                        var index = id_array.indexOf(obj.data.qsnId);
                        id_array.splice(index, 1);
                        console.log(id_array);
                    }
                }
            });

            $("#btn-delete-all").click(function() {
                var modelId = t_modelId;
                if (modelId) {
                    layer.confirm('您确定要删除这些数据吗？', function(index) { //第二个参数为可选参数 点击确认以后的回调函数
                        layer.msg('加载中', {
                            icon: 16,
                            shade: 0.01,
                            time: '9999999'
                        });
                        var url = "manager/del_option";
                        var data = {
                            qsnId: id_array //将当前选中行的qsnId传到后端
                        }
                        $.post(url, data, function(data) {


                            layer.close(layer.index); //关闭加载中弹窗
                            if (data.code == 1) {
                                layer.msg(data.msg, {
                                    icon: 6
                                });
                                refresh_table1();
                            } else {
                                layer.msg(data.msg, {
                                    icon: 5
                                });
                            }
                        }, "json"); //一定不要忘了这个json！！！
                    })
                } else {
                    layer.msg("请先选择模板");
                }
            });


        });
    </script>
    <!-- 表格操作按钮集 -->
    <script type="text/html" id="barOption">
        <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="del">删除模板</a>
    </script>

    <!-- 表格1操作按钮集 -->
    <script type="text/html" id="barOption1">
        <a class="layui-btn layui-btn-mini layui-btn-normal" lay-event="edit1">编辑先不写了</a>
        <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="del1">删除</a>
    </script>
</body>

</html>