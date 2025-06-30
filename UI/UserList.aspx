<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>用户管理</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f8f5f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        .btn-secondary {
            background: linear-gradient(135deg, #718096 0%, #4a5568 100%);
        }
        .btn-secondary:hover {
            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
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
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid rgba(16, 42, 67, 0.1);
        }
        th {
            background-color: rgba(240, 244, 248, 0.9);
            font-weight: bold;
            color: #1a365d;
            border-bottom: 2px solid #38a169;
        }
        tr:nth-child(even) {
            background-color: rgba(240, 244, 248, 0.4);
        }
        tr:hover {
            background-color: rgba(240, 244, 248, 0.6);
            transition: background-color 0.2s;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>用户管理</h2>
        <div style="margin-bottom: 20px;">
            <a href="Admin/AdminHome.aspx" class="btn btn-secondary">返回仪表板</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>角色</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
<%
    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
    using (var conn = new MySql.Data.MySqlClient.MySqlConnection(connStr))
    {
        conn.Open();
        string sql = "SELECT id, uname, email, phone, yhlb FROM DengLuYongHu";
        var cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, conn);
        var reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            int role = reader.GetInt32("yhlb");
            string roleName = "";
            switch (role)
            {
                case 1: roleName = "系统管理员"; break;
                case 2: roleName = "客房前台"; break;
                case 3: roleName = "顾客"; break;
                default: roleName = "未知"; break;
            }
%>
    <tr>
        <td><%= reader["id"] %></td>
        <td><%= reader["uname"] %></td>
        <td><%= reader["email"] %></td>
        <td><%= reader["phone"] %></td>
        <td><%= roleName %></td>
        <td>
            <a href="UserEdit.aspx?id=<%= reader["id"] %>" class="btn">编辑</a>
            <a href="UserList.aspx?delete=<%= reader["id"] %>" class="btn btn-danger" onclick="return confirm('确定要删除该用户吗？');">删除</a>
        </td>
    </tr>
<%
        }
        reader.Close();
    }
%>
            </tbody>
        </table>
    </div>
<%
    // 处理删除请求
    if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
    {
        int delId;
        if (int.TryParse(Request.QueryString["delete"], out delId))
        {
            using (var conn2 = new MySql.Data.MySqlClient.MySqlConnection(connStr))
            {
                conn2.Open();
                string delSql = "DELETE FROM DengLuYongHu WHERE id=@id";
                var delCmd = new MySql.Data.MySqlClient.MySqlCommand(delSql, conn2);
                delCmd.Parameters.AddWithValue("@id", delId);
                delCmd.ExecuteNonQuery();
                Response.Redirect("UserList.aspx");
            }
        }
    }
%>
</body>
</html>