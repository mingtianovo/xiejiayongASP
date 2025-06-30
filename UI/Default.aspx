<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Green Hotel Management System</title>
    <meta charset="utf-8" />
    <meta http-equiv="refresh" content="0;url=LoginChinese.aspx" />
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
        }
        h1 {
            color: #2d8cf0;
            margin-bottom: 20px;
        }
        p {
            color: #666;
            margin-bottom: 20px;
        }
        .btn {
            background: #2d8cf0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
        }
        .btn:hover {
            background: #1e6fd9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>格林酒店管理系统</h1>
        <p>欢迎使用格林酒店管理系统</p>
        <p>正在跳转到登录页面...</p>
        <a href="LoginChinese.aspx" class="btn">立即登录</a>
    </div>
</body>
</html> 