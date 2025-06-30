<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="UI.UserAdd" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>添加用户</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f8f5f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
            padding: 32px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(16, 42, 67, 0.1);
        }
        h2 {
            text-align: center;
            color: #1a365d;
            margin-bottom: 32px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-size: 24px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 24px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #1a365d;
            font-weight: bold;
            font-size: 16px;
        }
        input[type="text"], input[type="password"], input[type="email"], select {
            width: 100%;
            padding: 12px;
            border: 2px solid #d0d7de;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            background: rgba(240, 244, 248, 0.8);
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, select:focus {
            border-color: #38a169;
            outline: none;
        }
        .btn {
            background: linear-gradient(135deg, #38a169 0%, #2f855a 100%);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(56, 161, 105, 0.1);
        }
        .btn:hover {
            background: linear-gradient(135deg, #2f855a 0%, #276749 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(56, 161, 105, 0.2);
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .form-group:last-child {
            margin-top: 32px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>添加系统用户</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtUsername">用户名：</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="请输入用户名" />
            </div>
            <div class="form-group">
                <label for="txtPassword">密码：</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="请输入密码" />
            </div>
            <div class="form-group">
                <label for="txtEmail">邮箱：</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="请输入邮箱地址" />
            </div>
            <div class="form-group">
                <label for="txtPhone">电话：</label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="请输入电话号码" />
            </div>
            <div class="form-group">
                <label>角色：</label>
                <select name="role" required>
                    <option value="">请选择角色</option>
                    <option value="1">系统管理员</option>
                    <option value="2">客房前台</option>
                    <option value="3">顾客</option>
                </select>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAdd" runat="server" Text="添加用户" OnClick="btnAdd_Click" CssClass="btn" />
            </div>
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html>