using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace Hotel
{
    public partial class RoomStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomStatus();
            }
        }

        private void BindRoomStatus()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT id, room_number, type, status, price FROM rooms";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvRooms.DataSource = dt;
                gvRooms.DataBind();
            }
        }
    }
} 