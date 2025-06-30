<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="UI.UserEdit" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>编辑用户</title>
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
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
        }
        h2 {
            text-align: center;
            color: #2d8cf0;
            margin-bottom: 32px;
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
        input[type="text"], input[type="password"], input[type="email"], select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .btn {
            background: #2d8cf0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn:hover {
            background: #1e6fd9;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>编辑用户</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtUsername">用户名：</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="请输入用户名" />
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
                <label for="ddlRole">角色：</label>
                <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem Value="">请选择角色</asp:ListItem>
                    <asp:ListItem Value="1">系统管理员</asp:ListItem>
                    <asp:ListItem Value="2">客房前台</asp:ListItem>
                    <asp:ListItem Value="3">顾客</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="更新用户" OnClick="btnUpdate_Click" CssClass="btn" />
                <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="btn btn-secondary" />
            </div>
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html> 