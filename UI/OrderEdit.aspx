<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderEdit.aspx.cs" Inherits="Hotel.OrderEdit" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>编辑订单</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h1 { color: #2d8cf0; margin-bottom: 20px; text-align: center; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; color: #555; font-weight: bold; }
        input[type="text"], input[type="number"], input[type="date"] { width: 100%; padding: 10px; border: 2px solid #ddd; border-radius: 8px; font-size: 15px; }
        .btn { background: #2d8cf0; color: white; padding: 12px 24px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; margin-right: 10px; }
        .btn:hover { background: #1e6fd9; }
        .msg { text-align: center; margin-top: 18px; font-size: 16px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>编辑订单</h1>
        <form id="form1" runat="server">
            <div class="form-group">
                <label>订单编号：</label>
                <asp:Label ID="lblOrderId" runat="server" />
            </div>
            <div class="form-group">
                <label>用户ID：</label>
                <asp:TextBox ID="txtUserId" runat="server" />
            </div>
            <div class="form-group">
                <label>房间ID：</label>
                <asp:TextBox ID="txtRoomId" runat="server" />
            </div>
            <div class="form-group">
                <label>入住日期：</label>
                <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" />
            </div>
            <div class="form-group">
                <label>离店日期：</label>
                <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" />
            </div>
            <div class="form-group">
                <label>定金：</label>
                <asp:TextBox ID="txtDeposit" runat="server" />
            </div>
            <div class="form-group">
                <label>状态：</label>
                <asp:TextBox ID="txtStatus" runat="server" />
            </div>
            <asp:Button ID="btnSave" runat="server" Text="保存修改" OnClick="btnSave_Click" CssClass="btn" />
            <asp:Label ID="lblMsg" runat="server" CssClass="msg" />
            <a href="OrderList.aspx" class="btn">返回订单列表</a>
        </form>
    </div>
</body>
</html> 