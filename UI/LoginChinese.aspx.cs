using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace UI
{
    public partial class LoginChinese : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string role = ddlRole.SelectedValue;

                if (string.IsNullOrEmpty(username))
                {
                    lblMsg.Text = "请输入用户名";
                    lblMsg.CssClass = "error";
                    return;
                }
                if (string.IsNullOrEmpty(password))
                {
                    lblMsg.Text = "请输入密码！";
                    lblMsg.CssClass = "error";
                    return;
                }
                if (string.IsNullOrEmpty(role))
                {
                    lblMsg.Text = "请选择角色";
                    lblMsg.CssClass = "error";
                    return;
                }

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
                        Session["User"] = username;
                        Session["Role"] = role;
                        Session["UserId"] = reader["id"];
                        
                        lblMsg.Text = "登录成功，正在跳转...";
                        lblMsg.CssClass = "success";
                        
                        if (role == "admin")
                        {
                            Response.Redirect("Admin/AdminHome.aspx");
                        }
                        else if (role == "frontdesk")
                        {
                            Response.Redirect("FrontDesk.aspx");
                        }
                        else if (role == "customer")
                        {
                            Response.Redirect("Customer.aspx");
                        }
                    }
                    else
                    {
                        lblMsg.Text = "用户名、密码或角色错误";
                        lblMsg.CssClass = "error";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "登陆失败" + ex.Message;
                lblMsg.CssClass = "error";
            }
        }
    }
} 