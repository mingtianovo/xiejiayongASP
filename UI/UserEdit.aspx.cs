using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace UI
{
    public partial class UserEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                    using (MySqlConnection conn = new MySqlConnection(connStr))
                    {
                        conn.Open();
                        string sql = "SELECT uname, email, phone, yhlb FROM DengLuYongHu WHERE id=@id";
                        MySqlCommand cmd = new MySqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@id", id);
                        var reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            txtUsername.Text = reader["uname"].ToString();
                            txtEmail.Text = reader["email"].ToString();
                            txtPhone.Text = reader["phone"].ToString();
                            ddlRole.SelectedValue = reader["yhlb"].ToString();
                        }
                        reader.Close();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string role = ddlRole.SelectedValue;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(role))
            {
                lblMsg.Text = "请填写完整信息！";
                lblMsg.Style["color"] = "red";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "UPDATE DengLuYongHu SET uname=@username, email=@email, phone=@phone, yhlb=@role WHERE id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@role", int.Parse(role));
                cmd.Parameters.AddWithValue("@id", id);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMsg.Text = "用户更新成功！";
                    lblMsg.Style["color"] = "green";
                }
                else
                {
                    lblMsg.Text = "更新失败，请重试！";
                    lblMsg.Style["color"] = "red";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
        }
    }
} 