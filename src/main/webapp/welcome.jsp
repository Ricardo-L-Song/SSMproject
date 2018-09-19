<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>欢迎页</title>
    <link rel="stylesheet" href="/public/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/public/frame/static/css/style.css">
    <link rel="icon" href="/public/frame/static/image/code.png">
</head>

<body class="body">
${requestScope.message}
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>

</table>


    <script type="text/javascript" src="/public/frame/layui/layui.js"></script>
    <script type="text/javascript" src="/public/js/index.js"></script>
    <script type="text/javascript" src="/public/frame/echarts/echarts.min.js"></script>
    <script type="text/javascript">
        layui.use(['element', 'form', 'table', 'layer', 'vip_tab'], function() {
            var form = layui.form,
                table = layui.table,
                layer = layui.layer,
                vipTab = layui.vip_tab,
                element = layui.element,
                $ = layui.jquery;

            // you code ...


        });
    </script>
</body>

</html>