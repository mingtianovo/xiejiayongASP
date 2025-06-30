<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>系统管理员主页</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f8f5f0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
            padding: 32px 40px 40px 40px;
            backdrop-filter: blur(5px);
        }
        h2 {
            text-align: center;
            color: #1a365d;
            margin-bottom: 32px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        .section {
            margin-bottom: 32px;
        }
        .section-title {
            font-size: 1.2em;
            color: #1a365d;
            margin-bottom: 12px;
            border-left: 4px solid #38a169;
            padding-left: 8px;
            background: rgba(16, 42, 67, 0.05);
            padding: 8px 12px;
            border-radius: 4px 0 0 4px;
        }
        .card-list {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
        }
        .card {
            background: rgba(240, 244, 248, 0.85);
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
            padding: 18px 20px;
            flex: 1 1 220px;
            min-width: 200px;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.2s;
            border: 1px solid rgba(16, 42, 67, 0.05);
        }
        .card:hover {
            box-shadow: 0 4px 16px rgba(56, 161, 105, 0.15);
            transform: translateY(-2px);
            background: rgba(240, 244, 248, 0.95);
        }
        .card-icon {
            font-size: 1.6em;
            color: #38a169;
        }
        .card-link {
            text-decoration: none;
            color: #1a365d;
            font-weight: 500;
            font-size: 1.08em;
            transition: color 0.2s;
        }
        .card-link:hover {
            color: #2f855a;
        }
        @media (max-width: 600px) {
            .container { padding: 12px; }
            .card-list { flex-direction: column; gap: 10px; }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <h2>系统管理员仪表板</h2>
        <div class="section">
            <div class="section-title"><i class="fa fa-user-shield"></i> 用户与权限管理</div>
            <div class="card-list">
                <div class="card"><i class="fa fa-user-plus card-icon"></i><a class="card-link" href="../UserAdd.aspx">添加系统用户</a></div>
                <div class="card"><i class="fa fa-user-times card-icon"></i><a class="card-link" href="../UserList.aspx">删除系统用户</a></div>
            </div>
        </div>
        <div class="section">
            <div class="section-title"><i class="fa fa-bed"></i> 房间管理</div>
            <div class="card-list">
                <div class="card"><i class="fa fa-plus-square card-icon"></i><a class="card-link" href="../RoomAdd.aspx">添加房间</a></div>
                <div class="card"><i class="fa fa-trash-alt card-icon"></i><a class="card-link" href="../RoomList.aspx">删除房间</a></div>
            </div>
        </div>
        <div class="section">
            <div class="section-title"><i class="fa fa-file-invoice"></i> 订单与账单</div>
            <div class="card-list">
                <div class="card"><i class="fa fa-search card-icon"></i><a class="card-link" href="../OrderList.aspx">查询订单</a></div>
                <div class="card"><i class="fa fa-cash-register card-icon"></i><a class="card-link" href="../Bill.aspx?id=1">账单管理</a></div>
            </div>
        </div>
        <div class="section">
            <div class="section-title"><i class="fa fa-sign-in-alt"></i> 其他</div>
            <div class="card-list">
                <div class="card"><i class="fa fa-sign-out-alt card-icon"></i><a class="card-link" href="../LoginChinese.aspx">退出</a></div>
            </div>
        </div>
    </div>
</body>
</html>