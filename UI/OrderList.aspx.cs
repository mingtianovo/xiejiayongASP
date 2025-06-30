using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace Hotel
{
    public partial class OrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderList();
            }
        }

        private void BindOrderList()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = @"SELECT o.id, u.username AS 顾客, r.room_number AS 房间, o.check_in AS 起始时间, o.check_out AS 结束时间, o.deposit AS 定金, o.status AS 状态
                                FROM orders o
                                JOIN users u ON o.user_id = u.id
                                JOIN rooms r ON o.room_id = r.id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }
    }
} 