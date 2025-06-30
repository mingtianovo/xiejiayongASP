using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Hotel
{
    public partial class OrderEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderId = int.Parse(Request.QueryString["id"]);
                string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();
                    string sql = "SELECT * FROM YuDing WHERE id=@id";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", orderId);
                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblOrderId.Text = orderId.ToString();
                        txtUserId.Text = reader["khid"].ToString();
                        // 这里假设有订单明细表YuDingXiangXi，取第一个房间id
                        txtRoomId.Text = GetRoomId(orderId);
                        txtCheckIn.Text = reader["begntime"].ToString();
                        txtCheckOut.Text = reader["endtime"].ToString();
                        try { txtDeposit.Text = reader["deposit"].ToString(); } catch { txtDeposit.Text = ""; }
                        try { txtStatus.Text = reader["status"].ToString(); } catch { txtStatus.Text = ""; }
                    }
                    reader.Close();
                }
            }
        }

        private string GetRoomId(int orderId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT kfid FROM YuDingXiangXi WHERE ydid=@ydid LIMIT 1";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ydid", orderId);
                object val = cmd.ExecuteScalar();
                return val != null ? val.ToString() : "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = int.Parse(lblOrderId.Text);
            int userId = int.Parse(txtUserId.Text.Trim());
            int roomId = int.Parse(txtRoomId.Text.Trim());
            string checkIn = txtCheckIn.Text.Trim();
            string checkOut = txtCheckOut.Text.Trim();
            string deposit = txtDeposit.Text.Trim();
            string status = txtStatus.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "UPDATE YuDing SET khid=@khid, begntime=@begntime, endtime=@endtime WHERE id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@khid", userId);
                cmd.Parameters.AddWithValue("@begntime", checkIn);
                cmd.Parameters.AddWithValue("@endtime", checkOut);
                cmd.Parameters.AddWithValue("@id", id);
                int result = cmd.ExecuteNonQuery();
                // 更新订单明细表房间id
                string sql2 = "UPDATE YuDingXiangXi SET kfid=@kfid WHERE ydid=@ydid";
                MySqlCommand cmd2 = new MySqlCommand(sql2, conn);
                cmd2.Parameters.AddWithValue("@kfid", roomId);
                cmd2.Parameters.AddWithValue("@ydid", id);
                cmd2.ExecuteNonQuery();
                lblMsg.Text = result > 0 ? "修改成功！" : "修改失败！";
            }
        }
    }
} 