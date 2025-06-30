<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="UI.Login" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Hotel Management System - Login</title>
    <meta charset="utf-8" />
    <style>
        body { 
            font-family: 'Microsoft YaHei', Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
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
        }
        h2 { 
            text-align: center; 
            color: #333; 
            margin-bottom: 30px; 
            font-size: 2em; 
        }
        .form-group { 
            margin-bottom: 20px; 
        }
        label { 
            display: block; 
            margin-bottom: 8px; 
            color: #555; 
            font-weight: bold; 
        }
        input[type="text"], input[type="password"], select { 
            width: 100%; 
            padding: 12px; 
            border: 2px solid #ddd; 
            border-radius: 8px; 
            box-sizing: border-box; 
            font-size: 16px; 
            transition: border-color 0.3s; 
        }
        input[type="text"]:focus, input[type="password"]:focus, select:focus { 
            border-color: #667eea; 
            outline: none; 
        }
        .btn { 
            background: linear-gradient(45deg, #667eea, #764ba2); 
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
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Hotel Management System</h2>
    <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter username" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password" />
            </div>
            <div class="form-group">
                <label for="ddlRole">Select Role:</label>
                <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem Value="">Please select role</asp:ListItem>
                    <asp:ListItem Value="admin">System Administrator</asp:ListItem>
                    <asp:ListItem Value="user">Regular User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn" />
        </div>
            <asp:Label ID="lblMsg" runat="server" />
    </form>
    </div>
</body>
</html> 