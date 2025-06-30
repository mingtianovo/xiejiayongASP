<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>顾客服务</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'SimSun', '宋体', 'Microsoft YaHei', '微软雅黑', Arial, sans-serif;
            background: #f5f0e1 url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23c8a96e' fill-opacity='0.15' fill-rule='evenodd'/%3E%3C/svg%3E");
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 40px;
            border: 2px solid #c8a96e;
            position: relative;
        }
        .container::before,
        .container::after {
            content: "";
            position: absolute;
            width: 100px;
            height: 100px;
            background-size: contain;
            background-repeat: no-repeat;
            opacity: 0.2;
            z-index: 0;
        }
        .container::before {
            top: -20px;
            left: -20px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Cpath fill='%23c8a96e' d='M20,20 L30,10 L40,20 L30,30 Z'/%3E%3C/svg%3E");
        }
        .container::after {
            bottom: -20px;
            right: -20px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Cpath fill='%23c8a96e' d='M80,80 L70,90 L60,80 L70,70 Z'/%3E%3C/svg%3E");
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
        }
        .header::after {
            content: "";
            display: block;
            width: 100px;
            height: 2px;
            background: #c8a96e;
            margin: 15px auto 0;
        }
        h1 {
            color: #8c1515;
            margin-bottom: 10px;
            font-size: 2.5em;
            font-family: 'KaiTi', '楷体', serif;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .subtitle {
            color: #6b5a3e;
            font-size: 1.1em;
            font-family: 'KaiTi', '楷体', serif;
        }
        .function-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
            position: relative;
        }
        .function-card {
            background: #f8f4e9;
            border-radius: 2px;
            padding: 24px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid #e6d5b8;
            position: relative;
            overflow: hidden;
        }
        .function-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: #8c1515;
        }
        .function-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(140, 21, 21, 0.1);
            border-color: #8c1515;
        }
        .function-icon {
            font-size: 2.5em;
            color: #8c1515;
            margin-bottom: 15px;
        }
        .function-title {
            font-size: 1.2em;
            font-weight: bold;
            color: #6b5a3e;
            margin-bottom: 10px;
            font-family: 'KaiTi', '楷体', serif;
        }
        .function-desc {
            color: #8d7b5d;
            font-size: 0.9em;
            margin-bottom: 15px;
        }
        .btn {
            background: #8c1515;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: transform 0.2s, background 0.2s;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }
        .btn::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }
        .btn:hover {
            transform: translateY(-2px);
            background: #6a1010;
        }
        .btn:focus::after {
            animation: ripple 1s ease-out;
        }
        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }
        .logout-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e6d5b8;
            position: relative;
        }
        .logout-section::before {
            content: "";
            position: absolute;
            top: -2px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: #8c1515;
        }
        .logout-btn {
            background: #8c1515;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background 0.3s;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }
        .logout-btn:hover {
            background: #6a1010;
        }
        .logout-btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: all 0.5s;
        }
        .logout-btn:hover::before {
            left: 100%;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fa fa-user-circle"></i> 顾客服务</h1>
            <p class="subtitle">欢迎使用格林酒店管理系统顾客服务功能</p>
        </div>
        
        <div class="function-grid">
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-bed"></i></div>
                <div class="function-title">预订房间</div>
                <div class="function-desc">在线预订酒店房间</div>
                <a href="OrderAdd.aspx" class="btn">立即预订</a>
            </div>
            
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-clipboard-list"></i></div>
                <div class="function-title">我的订单</div>
                <div class="function-desc">查看和管理我的预订订单</div>
                <a href="OrderList.aspx" class="btn">查看订单</a>
            </div>
            
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-user-edit"></i></div>
                <div class="function-title">个人信息</div>
                <div class="function-desc">修改个人资料和密码</div>
                <a href="User/UserHome.aspx" class="btn">个人中心</a>
            </div>
            
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-search"></i></div>
                <div class="function-title">房间查询</div>
                <div class="function-desc">查询可用房间和价格</div>
                <a href="RoomList.aspx" class="btn">查询房间</a>
            </div>
            
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-credit-card"></i></div>
                <div class="function-title">账单查询</div>
                <div class="function-desc">查看消费账单和支付记录</div>
                <a href="Bill.aspx" class="btn">查看账单</a>
            </div>
            
            <div class="function-card">
                <div class="function-icon"><i class="fa fa-headset"></i></div>
                <div class="function-title">客服支持</div>
                <div class="function-desc">联系客服获取帮助</div>
                <a href="ContactService.aspx" class="btn">联系客服</a>
            </div>
        </div>
        
        <div class="logout-section">
            <a href="LoginChinese.aspx" class="logout-btn"><i class="fa fa-sign-out-alt"></i> 退出登录</a>
        </div>
    </div>
</body>
</html>