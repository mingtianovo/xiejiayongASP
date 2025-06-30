<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>房间状态</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
            text-align: center;
        }
        h1 {
            color: #2d8cf0;
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
            margin: 10px;
            display: inline-block;
        }
        .btn:hover {
            background: #1e6fd9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>房间状态管理</h1>
        <p>欢迎使用格林酒店管理系统房间状态管理功能</p>
        <a href="RoomList.aspx" class="btn">查看房间列表</a>
        <a href="RoomAdd.aspx" class="btn">添加新房间</a>
        <a href="LoginChinese.aspx" class="btn">返回登录页面</a>
    </div>
</body>
</html> 