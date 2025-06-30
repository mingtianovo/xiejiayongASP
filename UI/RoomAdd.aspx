<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoomAdd.aspx.cs" Inherits="UI.RoomAdd" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>添加房间</title>
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
        input[type="text"], select {
            width: 100%;
            padding: 12px;
            border: 2px solid #d0d7de;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            background: rgba(240, 244, 248, 0.8);
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, select:focus {
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
            background: linear-gradient(135deg, #718096 0%, #4a5568 100%);
        }
        .btn-secondary:hover {
            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>添加房间</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtRoomNumber">房间号：</label>
                <asp:TextBox ID="txtRoomNumber" runat="server" placeholder="请输入房间号" />
            </div>
            <div class="form-group">
                <label for="ddlStatus">状态：</label>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Value="">请选择状态</asp:ListItem>
                    <asp:ListItem Value="Available">可用</asp:ListItem>
                    <asp:ListItem Value="Occupied">已占用</asp:ListItem>
                    <asp:ListItem Value="Maintenance">维护中</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlType">房间类型：</label>
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem Value="">请选择房间类型</asp:ListItem>
                    <asp:ListItem Value="1">标准单人间</asp:ListItem>
                    <asp:ListItem Value="2">豪华双人间</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlBranch">分店：</label>
                <asp:DropDownList ID="ddlBranch" runat="server">
                    <asp:ListItem Value="">请选择分店</asp:ListItem>
                    <asp:ListItem Value="1">北京分店</asp:ListItem>
                    <asp:ListItem Value="2">上海分店</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAdd" runat="server" Text="添加房间" OnClick="btnAdd_Click" CssClass="btn" />
                <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="btn btn-secondary" />
            </div>
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html>