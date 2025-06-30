<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>修改密码</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container { max-width: 400px; margin: 60px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h2 { text-align: center; color: #2d8cf0; margin-bottom: 32px; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; color: #333; }
        input { width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #ccc; font-size: 15px; }
        .btn { background: #2d8cf0; color: white; padding: 12px 0; border: none; border-radius: 6px; cursor: pointer; width: 100%; font-size: 16px; margin-top: 10px; }
        .btn:hover { background: #1e6fd9; }
        .msg { text-align: center; margin-top: 18px; color: #e67e22; }
        .success { color: #27ae60; }
    </style>
</head>
<body>
    <div class="container">
        <h2>修改密码</h2>
        <% 
            string msg = "";
            string username = Session["User"] as string;
            if (string.IsNullOrEmpty(username))
            {
                Response.Redirect("LoginChinese.aspx");
            }
            if (Request.HttpMethod == "POST")
            {
                string oldPwd = Request.Form["oldpwd"];
                string newPwd = Request.Form["newpwd"];
                string confirmPwd = Request.Form["confirmpwd"];
                if (string.IsNullOrEmpty(oldPwd) || string.IsNullOrEmpty(newPwd) || string.IsNullOrEmpty(confirmPwd))
                {
                    msg = "请填写所有字段！";
                }
                else if (newPwd != confirmPwd)
                {
                    msg = "两次输入的新密码不一致！";
                }
                else
                {
                    string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                    using (MySqlConnection conn = new MySqlConnection(connStr))
                    {
                        conn.Open();
                        // 验证原密码
                        string sql = "SELECT pwd FROM KeHu WHERE uname=@uname";
                        MySqlCommand cmd = new MySqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@uname", username);
                        object pwdObj = cmd.ExecuteScalar();
                        if (pwdObj == null)
                        {
                            msg = "用户不存在！";
                        }
                        else if (pwdObj.ToString() != oldPwd)
                        {
                            msg = "原密码错误！";
                        }
                        else
                        {
                            // 更新新密码
                            string updateSql = "UPDATE KeHu SET pwd=@newpwd WHERE uname=@uname";
                            MySqlCommand updateCmd = new MySqlCommand(updateSql, conn);
                            updateCmd.Parameters.AddWithValue("@newpwd", newPwd);
                            updateCmd.Parameters.AddWithValue("@uname", username);
                            int rows = updateCmd.ExecuteNonQuery();
                            if (rows > 0)
                            {
                                msg = "<span class='success'>密码修改成功！请牢记新密码。</span>";
                            }
                            else
                            {
                                msg = "密码修改失败,请重试。";
                            }
                        }
                    }
                }
            }
        %>
        <form method="post">
            <div class="form-group">
                <label>原密码：</label>
                <input type="password" name="oldpwd" required />
            </div>
            <div class="form-group">
                <label>新密码：</label>
                <input type="password" name="newpwd" required />
            </div>
            <div class="form-group">
                <label>确认新密码：</label>
                <input type="password" name="confirmpwd" required />
            </div>
            <button type="submit" class="btn">修改密码</button>
        </form>
        <% if (!string.IsNullOrEmpty(msg)) { %>
            <div class="msg"><%= msg %></div>
        <% } %>
    </div>
</body>
</html> 