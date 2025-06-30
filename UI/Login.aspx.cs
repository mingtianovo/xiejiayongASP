using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace UI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string role = ddlRole.SelectedValue;

                // Validate input
                if (string.IsNullOrEmpty(username))
                {
                    lblMsg.Text = "Please enter username";
                    lblMsg.CssClass = "error";
                    return;
                }
                if (string.IsNullOrEmpty(password))
                {
                    lblMsg.Text = "Please enter password";
                    lblMsg.CssClass = "error";
                    return;
                }
                if (string.IsNullOrEmpty(role))
                {
                    lblMsg.Text = "Please select role";
                    lblMsg.CssClass = "error";
                    return;
                }

                // Connect to database and validate user
                string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();
                    string sql = @"SELECT dl.*, yhlb.shortcode as role_code 
                                  FROM DengLuYongHu dl 
                                  INNER JOIN YongHuLeiBie yhlb ON dl.yhlb = yhlb.id 
                                  WHERE dl.uname=@username AND dl.password=@password AND yhlb.shortcode=@role";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@role", role);
                    
                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Login successful
                        Session["User"] = username;
                        Session["Role"] = role;
                        Session["UserId"] = reader["id"];
                        
                        lblMsg.Text = "Login successful, redirecting...";
                        lblMsg.CssClass = "success";
                        
                        // Redirect based on role
                        if (role == "admin")
                        {
                            Response.Redirect("Admin/AdminHome.aspx");
                        }
                        else if (role == "user")
                        {
                            Response.Redirect("User/UserHome.aspx");
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Invalid username, password or role";
                        lblMsg.CssClass = "error";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Login failed: " + ex.Message;
                lblMsg.CssClass = "error";
            }
        }
    }
} 