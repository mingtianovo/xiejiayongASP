<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoomEdit.aspx.cs" Inherits="UI.RoomEdit" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>编辑房间</title>
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
        input[type="text"], select {
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
        <h2>编辑房间</h2>
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
                <asp:Button ID="btnUpdate" runat="server" Text="更新房间" OnClick="btnUpdate_Click" CssClass="btn" />
                <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="btn btn-secondary" />
            </div>
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html> 