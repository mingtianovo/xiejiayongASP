<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>角色功能测试</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 40px;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        h1 {
            color: #2d8cf0;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        .subtitle {
            color: #666;
            font-size: 1.1em;
        }
        .role-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 30px;
        }
        .role-card {
            background: #f8fafc;
            border-radius: 16px;
            padding: 30px;
            border: 2px solid transparent;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        }
        .role-card.admin {
            border-color: #e74c3c;
        }
        .role-card.frontdesk {
            border-color: #f39c12;
        }
        .role-card.customer {
            border-color: #27ae60;
        }
        .role-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .role-icon {
            font-size: 3em;
            margin-bottom: 10px;
        }
        .role-title {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .role-desc {
            color: #666;
            font-size: 0.9em;
        }
        .admin .role-icon { color: #e74c3c; }
        .admin .role-title { color: #e74c3c; }
        .frontdesk .role-icon { color: #f39c12; }
        .frontdesk .role-title { color: #f39c12; }
        .customer .role-icon { color: #27ae60; }
        .customer .role-title { color: #27ae60; }
        
        .test-info {
            background: #fff;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 4px solid #2d8cf0;
        }
        .test-info h4 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .test-info p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }
        .features {
            margin-top: 20px;
        }
        .features h4 {
            color: #333;
            margin-bottom: 10px;
        }
        .feature-list {
            list-style: none;
            padding: 0;
        }
        .feature-list li {
            padding: 5px 0;
            color: #666;
            font-size: 14px;
        }
        .feature-list li:before {
            content: "✓ ";
            color: #27ae60;
            font-weight: bold;
        }
        .login-btn {
            display: block;
            width: 100%;
            background: linear-gradient(45deg, #2d8cf0, #5ad1e6);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            text-align: center;
            margin-top: 20px;
            transition: transform 0.2s;
        }
        .login-btn:hover {
            transform: translateY(-2px);
        }
        .back-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        .back-btn {
            background: #95a5a6;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background 0.3s;
        }
        .back-btn:hover {
            background: #7f8c8d;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fa fa-users"></i> 角色功能测试</h1>
            <p class="subtitle">格林酒店管理系统 - 三个角色的功能展示</p>
        </div>
        
        <div class="role-grid">
            <!-- 系统管理员 -->
            <div class="role-card admin">
                <div class="role-header">
                    <div class="role-icon"><i class="fa fa-user-shield"></i></div>
                    <div class="role-title">系统管理员</div>
                    <div class="role-desc">拥有系统最高权限，管理所有功能</div>
                </div>
                
                <div class="test-info">
                    <h4>测试账号：</h4>
                    <p><strong>用户名：</strong>admin</p>
                    <p><strong>密码：</strong>admin123</p>
                    <p><strong>角色：</strong>系统管理员</p>
                </div>
                
                <div class="features">
                    <h4>主要功能：</h4>
                    <ul class="feature-list">
                        <li>用户管理（添加、修改、删除系统用户）</li>
                        <li>房间管理（添加、删除房间）</li>
                        <li>订单与账单管理</li>
                        <li>系统设置和配置</li>
                        <li>数据统计和报表</li>
                        <li>权限分配和管理</li>
                    </ul>
                </div>
                
                <a href="LoginChinese.aspx" class="login-btn">测试管理员功能</a>
            </div>
            
            <!-- 客房前台 -->
            <div class="role-card frontdesk">
                <div class="role-header">
                    <div class="role-icon"><i class="fa fa-concierge-bell"></i></div>
                    <div class="role-title">客房前台</div>
                    <div class="role-desc">负责日常前台服务和客户接待</div>
                </div>
                
                <div class="test-info">
                    <h4>测试账号：</h4>
                    <p><strong>用户名：</strong>frontdesk1</p>
                    <p><strong>密码：</strong>front123</p>
                    <p><strong>角色：</strong>客房前台</p>
                </div>
                
                <div class="features">
                    <h4>主要功能：</h4>
                    <ul class="feature-list">
                        <li>房间状态管理</li>
                        <li>客户入住登记</li>
                        <li>订单处理和修改</li>
                        <li>账单管理和收费</li>
                        <li>房间查询和预订</li>
                        <li>客户服务支持</li>
                    </ul>
                </div>
                
                <a href="LoginChinese.aspx" class="login-btn">测试前台功能</a>
            </div>
            
            <!-- 顾客 -->
            <div class="role-card customer">
                <div class="role-header">
                    <div class="role-icon"><i class="fa fa-user-circle"></i></div>
                    <div class="role-title">顾客</div>
                    <div class="role-desc">酒店客户，使用预订和服务功能</div>
                </div>
                
                <div class="test-info">
                    <h4>测试账号：</h4>
                    <p><strong>用户名：</strong>customer1</p>
                    <p><strong>密码：</strong>customer123</p>
                    <p><strong>角色：</strong>顾客</p>
                </div>
                
                <div class="features">
                    <h4>主要功能：</h4>
                    <ul class="feature-list">
                        <li>在线房间预订</li>
                        <li>查看个人订单</li>
                        <li>修改个人信息</li>
                        <li>查询房间和价格</li>
                        <li>查看消费账单</li>
                        <li>联系客服支持</li>
                    </ul>
                </div>
                
                <a href="LoginChinese.aspx" class="login-btn">测试顾客功能</a>
            </div>
        </div>
        
        <div class="back-section">
            <a href="LoginChinese.aspx" class="back-btn"><i class="fa fa-arrow-left"></i> 返回登录页面</a>
        </div>
    </div>
</body>
</html> 