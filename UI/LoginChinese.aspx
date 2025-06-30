<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginChinese.aspx.cs" Inherits="UI.LoginChinese" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>格林酒店管理系统 - 登录</title>
    <meta charset="utf-8" />
    <style>
        body { 
            font-family: 'Microsoft YaHei', Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: linear-gradient(135deg, #0F3443 0%, #34E89E 100%); 
            min-height: 100vh; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
        }
        .login-container { 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 15px 40px rgba(0,0,0,0.2); 
            width: 100%; 
            max-width: 400px; 
            border: 2px solid #0F3443;
        }
        h2 { 
            text-align: center; 
            color: #0F3443; 
            margin-bottom: 30px; 
            font-size: 2em; 
            font-weight: bold;
        }
        .form-group { 
            margin-bottom: 20px; 
        }
        label { 
            display: block; 
            margin-bottom: 8px; 
            color: #0F3443; 
            font-weight: bold; 
        }
        input[type="text"], input[type="password"], select { 
            width: 100%; 
            padding: 12px; 
            border: 2px solid #1A5F7A; 
            border-radius: 8px; 
            box-sizing: border-box; 
            font-size: 16px; 
            transition: border-color 0.3s; 
        }
        input[type="text"]:focus, input[type="password"]:focus, select:focus { 
            border-color: #34E89E; 
            outline: none; 
        }
        .btn { 
            background: linear-gradient(45deg, #1A5F7A, #0F3443); 
            color: white; 
            padding: 15px 20px; 
            border: none; 
            border-radius: 8px; 
            cursor: pointer; 
            width: 100%; 
            font-size: 16px; 
            font-weight: bold; 
            transition: transform 0.3s; 
        }
        .btn:hover { 
            transform: translateY(-2px); 
        }
        .error { 
            color: #e74c3c; 
            margin-top: 15px; 
            text-align: center; 
            padding: 10px; 
            background: #fdf2f2; 
            border-radius: 5px; 
            border: 1px solid #f5c6cb; 
        }
        .success { 
            color: #27ae60; 
            margin-top: 15px; 
            text-align: center; 
            padding: 10px; 
            background: #f0f9f4; 
            border-radius: 5px; 
            border: 1px solid #c3e6cb; 
        }
        .test-accounts {
            margin-top: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #1A5F7A;
        }
        .test-accounts h4 {
            margin: 0 0 10px 0;
            color: #0F3443;
        }
        .test-accounts p {
            margin: 5px 0;
            font-size: 14px;
            color: #0F3443;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>格林酒店管理系统</h2>
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
                <label for="ddlRole">选择角色：</label>
                <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem Value="">请选择角色</asp:ListItem>
                    <asp:ListItem Value="admin">系统管理员</asp:ListItem>
                    <asp:ListItem Value="frontdesk">客房前台</asp:ListItem>
                    <asp:ListItem Value="customer">顾客</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" CssClass="btn" />
            </div>
            <asp:Label ID="lblMsg" runat="server" />
        </form>
        
        <div class="test-accounts">
            <h4>测试账号：</h4>
            <p><strong>系统管理员：</strong>admin / admin123</p>
            <p><strong>客房前台：</strong>frontdesk1 / front123</p>
            <p><strong>顾客：</strong>张三 / 123456</p>
        </div>
    </div>
</body>
</html>