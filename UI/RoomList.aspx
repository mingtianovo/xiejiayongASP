<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>可预订房间查询</title>
    <meta charset="utf-8" />
    <style>
        body { 
            font-family: 'Microsoft YaHei', Arial, sans-serif; 
            background: #f8f5f0; 
            margin: 0; 
            padding: 0; 
        }
        .container { 
            max-width: 700px; 
            margin: 40px auto; 
            background: rgba(255, 255, 255, 0.9); 
            border-radius: 12px; 
            box-shadow: 0 2px 12px rgba(0,0,0,0.1); 
            padding: 32px; 
            backdrop-filter: blur(5px);
            border: 1px solid rgba(16, 42, 67, 0.1);
        }
        h2 { 
            text-align: center; 
            color: #1a365d; 
            margin-bottom: 32px; 
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            background: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td { 
            border-bottom: 1px solid rgba(16, 42, 67, 0.1); 
            padding: 12px; 
            text-align: center; 
        }
        th { 
            background: rgba(240, 244, 248, 0.9);
            color: #1a365d;
            border-bottom: 2px solid #38a169;
        }
        tr:nth-child(even) { 
            background: rgba(240, 244, 248, 0.4);
        }
        tr:hover {
            background: rgba(240, 244, 248, 0.6);
            transition: background-color 0.2s;
        }
        .msg { 
            color: #e67e22; 
            text-align: center; 
            margin-top: 20px; 
            padding: 10px;
            background: rgba(255, 246, 235, 0.8);
            border-radius: 4px;
        }
        .btn {
            background: linear-gradient(135deg, #38a169 0%, #2f855a 100%);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            margin-right: 5px;
            transition: all 0.3s;
            box-shadow: 0 2px 4px rgba(56, 161, 105, 0.1);
            display: inline-block;
        }
        .btn:hover {
            background: linear-gradient(135deg, #2f855a 0%, #276749 100%);
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(56, 161, 105, 0.2);
        }
        .btn-danger {
            background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);
        }
        .btn-danger:hover {
            background: linear-gradient(135deg, #c53030 0%, #9b2c2c 100%);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>可预订房间列表</h2>
        <% 
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            // 处理删除请求
            if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
            {
                int delId;
                if (int.TryParse(Request.QueryString["delete"], out delId))
                {
                    using (var conn2 = new MySql.Data.MySqlClient.MySqlConnection(connStr))
                    {
                        conn2.Open();
                        string delSql = "DELETE FROM KeFang WHERE id=@id";
                        var delCmd = new MySql.Data.MySqlClient.MySqlCommand(delSql, conn2);
                        delCmd.Parameters.AddWithValue("@id", delId);
                        delCmd.ExecuteNonQuery();
                        Response.Redirect("RoomList.aspx");
                    }
                }
            }
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = @"SELECT kf.id, kf.roomnum, kflb.typename, kflb.price, fd.location 
                              FROM KeFang kf 
                              INNER JOIN KeFangLeiBie kflb ON kf.kflbid = kflb.id 
                              INNER JOIN FenDian fd ON kf.fdid = fd.id 
                              ORDER BY kf.roomnum";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                bool hasRoom = false;
        %>
        <table>
            <tr>
                <th>房间号</th>
                <th>房型</th>
                <th>价格(元/天)</th>
                <th>分店地址</th>
                <th>操作</th>
            </tr>
            <% while (reader.Read()) { hasRoom = true; %>
            <tr>
                <td><%= reader["roomnum"] %></td>
                <td><%= reader["typename"] %></td>
                <td><%= reader["price"] %></td>
                <td><%= reader["location"] %></td>
                <td>
                    <a href="RoomList.aspx?delete=<%= reader["id"] %>" class="btn btn-danger" onclick="return confirm('确定要删除该房间吗？');">删除</a>
                </td>
            </tr>
            <% } reader.Close(); %>
        </table>
        <% if (!hasRoom) { %>
            <div class="msg">当前没有可预订的空闲房间。</div>
        <% } %>
        <% } %>
    </div>
</body>
</html>