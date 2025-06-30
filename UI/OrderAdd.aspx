<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderAdd.aspx.cs" Inherits="Hotel.OrderAdd" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>预订房间</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container { max-width: 900px; margin: 40px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h2 { text-align: center; color: #2d8cf0; margin-bottom: 32px; }
        .room-list { display: flex; flex-wrap: wrap; gap: 24px; }
        .room-card { background: #f8fafc; border-radius: 10px; box-shadow: 0 1px 6px rgba(0,0,0,0.06); padding: 24px; flex: 1 1 260px; min-width: 240px; display: flex; flex-direction: column; align-items: center; }
        .room-img { width: 120px; height: 90px; object-fit: cover; border-radius: 6px; margin-bottom: 12px; }
        .room-title { font-size: 1.2em; font-weight: bold; color: #333; margin-bottom: 8px; }
        .room-desc { color: #666; font-size: 0.98em; margin-bottom: 8px; text-align: center; }
        .room-price { color: #e67e22; font-size: 1.1em; margin-bottom: 10px; }
        .btn { background: #2d8cf0; color: white; padding: 8px 20px; border: none; border-radius: 6px; cursor: pointer; font-size: 15px; margin-top: 8px; }
        .btn:hover { background: #1e6fd9; }
    </style>
</head>
<body>
    <div class="container">
        <h2>选择房间类型进行预订</h2>
        <div class="room-list">
            <% 
                string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();
                    string sql = "SELECT * FROM KeFangLeiBie";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string typename = reader["typename"].ToString();
                        string price = reader["price"].ToString();
                        string bookrate = reader["bookrate"].ToString();
                        string hourprice = reader["hourprice"].ToString();
                        string pic = reader["pic"].ToString();
            %>
            <div class="room-card">
                <div class="room-title"><%= typename %></div>
                <div class="room-desc">日常价：<%= price %> 元/天<br />预订价：<%= bookrate %> 元/天<br />钟点价：<%= hourprice %> 元/小时</div>
                <form method="get" action="OrderBook.aspx">
                    <input type="hidden" name="type" value="<%= typename %>" />
                    <button type="submit" class="btn">预订</button>
                </form>
            </div>
            <%      }
                    reader.Close();
                }
            %>
        </div>
        <form id="form1" runat="server">
            <asp:TextBox ID="txtUserId" runat="server" />
            <asp:TextBox ID="txtRoomId" runat="server" />
            <asp:TextBox ID="txtCheckIn" runat="server" />
            <asp:TextBox ID="txtCheckOut" runat="server" />
            <asp:TextBox ID="txtDeposit" runat="server" />
            <asp:Label ID="lblMsg" runat="server" />
        </form>
    </div>
</body>
</html> 