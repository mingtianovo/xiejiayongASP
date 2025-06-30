<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerRegister.aspx.cs" Inherits="UI.CustomerRegister" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>客户登记</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 40px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h2 { text-align: center; color: #2d8cf0; margin-bottom: 32px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; color: #555; font-weight: bold; }
        input[type="text"], input[type="datetime-local"], select { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 8px; box-sizing: border-box; font-size: 16px; }
        .btn { background: #2d8cf0; color: white; padding: 12px 24px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; margin-right: 10px; }
        .btn:hover { background: #1e6fd9; }
    </style>
</head>
<body>
    <div class="container">
        <h2>客户登记</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtName">客户姓名：</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtIdCard">证件号：</label>
                <asp:TextBox ID="txtIdCard" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtPhone">电话：</label>
                <asp:TextBox ID="txtPhone" runat="server" />
            </div>
            <div class="form-group">
                <label for="ddlRoom">选择房间：</label>
                <asp:DropDownList ID="ddlRoom" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtCheckIn">入住时间：</label>
                <asp:TextBox ID="txtCheckIn" runat="server" TextMode="DateTimeLocal" />
            </div>
            <div class="form-group">
                <label for="txtCheckOut">离店时间：</label>
                <asp:TextBox ID="txtCheckOut" runat="server" TextMode="DateTimeLocal" />
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="登记" OnClick="btnRegister_Click" CssClass="btn" />
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html> 