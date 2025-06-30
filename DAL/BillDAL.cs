using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class BillDAL
    {
        public static DataTable GetBillByOrderId(int orderId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = @"SELECT o.id, u.username AS 顾客, r.room_number AS 房间, o.check_in AS 入住日期, o.check_out AS 退房日期, o.deposit AS 定金, r.price AS 单价,
                                DATEDIFF(o.check_out, o.check_in) AS 天数,
                                (DATEDIFF(o.check_out, o.check_in) * r.price - o.deposit) AS 应付金额
                                FROM orders o
                                JOIN users u ON o.user_id = u.id
                                JOIN rooms r ON o.room_id = r.id
                                WHERE o.id=@id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", orderId);
                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
} 