using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace DAL
{
    /// <summary>
    /// 订单数据访问层，负责与数据库orders表交互
    /// </summary>
    public class OrderDAL
    {
        /// <summary>
        /// 查询所有订单及其关联的顾客、房间信息
        /// </summary>
        /// <returns>订单信息DataTable</returns>
        public static DataTable SelectAllOrders()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = @"SELECT o.id, u.username AS 顾客, r.room_number AS 房间, o.check_in AS 起始时间, o.check_out AS 结束时间, o.deposit AS 定金, o.status AS 状态
                                FROM orders o
                                JOIN users u ON o.user_id = u.id
                                JOIN rooms r ON o.room_id = r.id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        /// <summary>
        /// 根据订单ID获取订单信息
        /// </summary>
        public static DataRow GetOrderById(int orderId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT * FROM orders WHERE id=@id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", orderId);
                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt.Rows.Count > 0 ? dt.Rows[0] : null;
                    }
                }
            }
        }

        /// <summary>
        /// 更新订单信息
        /// </summary>
        public static bool UpdateOrder(int id, int userId, int roomId, DateTime checkIn, DateTime checkOut, decimal deposit, string status)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "UPDATE orders SET user_id=@user_id, room_id=@room_id, check_in=@check_in, check_out=@check_out, deposit=@deposit, status=@status WHERE id=@id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    cmd.Parameters.AddWithValue("@room_id", roomId);
                    cmd.Parameters.AddWithValue("@check_in", checkIn);
                    cmd.Parameters.AddWithValue("@check_out", checkOut);
                    cmd.Parameters.AddWithValue("@deposit", deposit);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@id", id);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        /// <summary>
        /// 删除订单
        /// </summary>
        public static bool DeleteOrder(int orderId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "DELETE FROM orders WHERE id=@id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", orderId);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
} 