using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Hotel
{
    public partial class OrderAdd : System.Web.UI.Page
    {
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(txtUserId.Text.Trim());
            int roomId = int.Parse(txtRoomId.Text.Trim());
            DateTime checkIn = DateTime.Parse(txtCheckIn.Text.Trim());
            DateTime checkOut = DateTime.Parse(txtCheckOut.Text.Trim());
            decimal deposit = decimal.Parse(txtDeposit.Text.Trim());
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO orders (user_id, room_id, check_in, check_out, deposit, status) VALUES (@user_id, @room_id, @check_in, @check_out, @deposit, '预订')";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@user_id", userId);
                cmd.Parameters.AddWithValue("@room_id", roomId);
                cmd.Parameters.AddWithValue("@check_in", checkIn);
                cmd.Parameters.AddWithValue("@check_out", checkOut);
                cmd.Parameters.AddWithValue("@deposit", deposit);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMsg.Text = "订房成功！";
                }
                else
                {
                    lblMsg.Text = "订房失败,请重试。";
                }
            }
        }
    }
} 