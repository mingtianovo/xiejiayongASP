using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class RoomDAL
    {
        public static bool AddRoom(string roomNumber, string type, decimal price)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO rooms (room_number, type, price, status) VALUES (@room_number, @type, @price, '空闲')";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@room_number", roomNumber);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@price", price);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static bool DeleteRoom(int roomId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "DELETE FROM rooms WHERE id=@id";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", roomId);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
} 