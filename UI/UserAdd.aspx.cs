using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace UI
{
    public partial class UserAdd : System.Web.UI.Page
    {
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string role = Request.Form["role"];

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                lblMsg.Text = "请填写完整信息！";
                lblMsg.Style["color"] = "red";
                return;
            }

            int roleInt;
            if (!int.TryParse(role, out roleInt))
            {
                lblMsg.Text = "请选择正确的角色！";
                lblMsg.Style["color"] = "red";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO DengLuYongHu (uname, password, email, phone, yhlb) VALUES (@username, @password, @email, @phone, @role)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@role", roleInt);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMsg.Text = "用户添加成功！";
                    lblMsg.Style["color"] = "green";
                    Response.Redirect("Admin/AdminHome.aspx");
                }
                else
                {
                    lblMsg.Text = "添加用户失败，用户名可能已存在！";
                    lblMsg.Style["color"] = "red";
                }
            }
        }
    }
} 