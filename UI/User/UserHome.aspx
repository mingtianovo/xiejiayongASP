<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>用户主页</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: linear-gradient(120deg, #e0eafc 0%, #cfdef3 100%);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 48px auto 0 auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(45,140,240,0.10);
            padding: 36px 36px 44px 36px;
            position: relative;
        }
        .avatar {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: linear-gradient(135deg, #2d8cf0 60%, #5ad1e6 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 2.6em;
            position: absolute;
            left: 50%;
            top: -36px;
            transform: translateX(-50%);
            box-shadow: 0 2px 8px rgba(45,140,240,0.12);
        }
        h2 {
            text-align: center;
            color: #2d8cf0;
            margin-top: 48px;
            margin-bottom: 18px;
            letter-spacing: 2px;
        }
        .welcome {
            text-align: center;
            color: #666;
            font-size: 1.08em;
            margin-bottom: 32px;
        }
        .card-list {
            display: flex;
            flex-wrap: wrap;
            gap: 22px;
            justify-content: center;
        }
        .card {
            background: #f8fafc;
            border-radius: 10px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.06);
            padding: 28px 32px;
            flex: 1 1 180px;
            min-width: 160px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 16px;
            transition: box-shadow 0.22s, transform 0.22s;
            position: relative;
        }
        .card:hover {
            box-shadow: 0 8px 24px rgba(45,140,240,0.16);
            transform: translateY(-4px) scale(1.03);
        }
        .card-icon {
            font-size: 2.2em;
            color: #2d8cf0;
            margin-bottom: 6px;
        }
        .card-link {
            text-decoration: none;
            color: #2d8cf0;
            font-weight: 600;
            font-size: 1.12em;
            background: #eaf4fe;
            border-radius: 6px;
            padding: 7px 18px;
            transition: background 0.18s, color 0.18s;
            box-shadow: 0 1px 2px rgba(45,140,240,0.04);
        }
        .card-link:hover {
            background: #2d8cf0;
            color: #fff;
        }
        @media (max-width: 600px) {
            .container { padding: 12px; }
            .card-list { flex-direction: column; gap: 14px; }
            .card { padding: 18px 10px; }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <div class="avatar"><i class="fa fa-user"></i></div>
        <h2>用户中心</h2>
        <div class="welcome">欢迎使用酒店管理系统。您可以在这里管理个人信息和预订房间。</div>
        <div class="card-list">
            <div class="card"><i class="fa fa-key card-icon"></i><a class="card-link" href="../UserPwdEdit.aspx">修改密码</a></div>
            <div class="card"><i class="fa fa-user-edit card-icon"></i><a class="card-link" href="../UserEdit.aspx">编辑资料</a></div>
        </div>
    </div>
</body>
</html> 