<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>编码测试页面</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .test-text {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>UTF-8编码测试</h1>
        <div class="test-text">
            <h3>中文测试：</h3>
            <p>系统管理员主页 - 这是一个中文标题测试</p>
            <p>用户主页 - 这是另一个中文标题测试</p>
            <p>格林酒店管理系统 - 登录页面标题</p>
        </div>
        <div class="test-text">
            <h3>特殊字符测试：</h3>
            <p>测试特殊字符：&lt;title&gt;系统管理员主页&lt;/title&gt;</p>
            <p>测试引号："系统管理员主页"</p>
            <p>测试单引号：'用户主页'</p>
        </div>
        <div class="test-text">
            <h3>页面链接测试：</h3>
            <p><a href="Admin/AdminHome.aspx">系统管理员主页</a></p>
            <p><a href="User/UserHome.aspx">用户主页</a></p>
            <p><a href="LoginChinese.aspx">登录页面</a></p>
        </div>
    </div>
</body>
</html> 