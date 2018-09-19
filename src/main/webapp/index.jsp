<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>答题管理系统</title>
    <link rel="stylesheet" href="/public/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/public/frame/static/css/style.css">
    <link rel="icon" href="/public/frame/static/image/code.png">
</head>

<body>

    <!-- layout admin -->
    <div class="layui-layout layui-layout-admin">
        <!-- 添加skin-1类可手动修改主题为纯白，添加skin-2类可手动修改主题为蓝白 -->
        <!-- header -->
        <div class="layui-header my-header">
            <a href="{:url('Index/index')}">
                <!--<img class="my-header-logo" src="" alt="logo">-->
                <div class="my-header-logo">答题管理系统</div>
            </a>
            <div class="my-header-btn">
                <button class="layui-btn layui-btn-small btn-nav"><i class="layui-icon">&#xe65f;</i></button>
            </div>

            <!-- 顶部左侧添加选项卡监听 -->
            <ul class="layui-nav" lay-filter="side-top-left">
            </ul>

            <!-- 顶部右侧添加选项卡监听 -->
            <ul class="layui-nav my-header-user-nav" lay-filter="side-top-right">
                <li class="layui-nav-item">
                    <a class="name" href="javascript:;"><img src="/public/frame/static/image/code.png" alt="logo">
                        <?=cookie('username')?>

                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" id="outlogin"><i class="layui-icon">&#x1006;</i>退出</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
        <!-- side -->
        <div class="layui-side my-side">
            <div class="layui-side-scroll">
                <!-- 左侧主菜单添加选项卡监听 -->
                <ul class="layui-nav layui-nav-tree" lay-filter="side-main">
                </ul>

            </div>
        </div>
        <!-- body -->
        <div class="layui-body my-body">
            <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this" lay-id="1"><span><i class="layui-icon">&#xe638;</i>欢迎页</span></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe id="iframe" src="/customer/list.action" frameborder="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div class="layui-footer my-footer">
        </div>

    </div>

    <!-- pay -->


    <!-- 右键菜单 -->
    <div class="my-dblclick-box none">
        <table class="layui-tab dblclick-tab">
            <tr class="card-refresh">
                <td><i class="layui-icon">&#x1002;</i>刷新当前标签</td>
            </tr>
            <tr class="card-close">
                <td><i class="layui-icon">&#x1006;</i>关闭当前标签</td>
            </tr>
            <tr class="card-close-all">
                <td><i class="layui-icon">&#x1006;</i>关闭所有标签</td>
            </tr>
        </table>
    </div>

    <script type="text/javascript" src="/public/frame/layui/layui.js"></script>
    <script type="text/javascript" src="/public/frame/static/js/vip_comm.js"></script>
    <script type="text/javascript">
        layui.use(['layer', 'vip_nav'], function() {

            // 操作对象
            var layer = layui.layer,
                vipNav = layui.vip_nav,
                $ = layui.jquery;

            // 顶部左侧菜单生成 [请求地址,过滤ID,是否展开,携带参数]
            //vipNav.top_left('{:url("Index/nav_top")}', 'side-top-left', false);
            // 主体菜单生成 [请求地址,过滤ID,是否展开,携带参数]
            vipNav.main('/nav_left', 'side-main', true);

            // you code ...
            $('#outlogin').click(function() {
                var url = "/zyf/test";
                $.get(url, function(data) {
                    if (data.code == 1) {
                        layer.msg(data.msg, {
                            icon: 6
                        });
                        window.location.href = "{:url('Login/login')}";
                    } else {
                        layer.msg(data.msg, {
                            icon: 5
                        });
                    }
                }, "json");
            });

        });
    </script>
</body>

</html>