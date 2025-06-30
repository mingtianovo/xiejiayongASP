using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace UI
{
    public partial class CustomerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomList();
            }
        }

        private void BindRoomList()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT id, roomnum FROM KeFang WHERE status='空闲'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                ddlRoom.DataSource = reader;
                ddlRoom.DataTextField = "roomnum";
                ddlRoom.DataValueField = "id";
                ddlRoom.DataBind();
                ddlRoom.Items.Insert(0, new System.Web.UI.WebControls.ListItem("请选择房间", ""));
                reader.Close();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string idCard = txtIdCard.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string roomId = ddlRoom.SelectedValue;
            string checkIn = txtCheckIn.Text.Trim();
            string checkOut = txtCheckOut.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(idCard) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(roomId) || string.IsNullOrEmpty(checkIn) || string.IsNullOrEmpty(checkOut))
            {
                lblMsg.Text = "请填写完整信息！";
                lblMsg.Style["color"] = "red";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                // 1. 插入客户表（如不存在）
                string selectKeHuSql = "SELECT id FROM KeHu WHERE sid=@sid";
                MySqlCommand selectCmd = new MySqlCommand(selectKeHuSql, conn);
                selectCmd.Parameters.AddWithValue("@sid", idCard);
                object kehuIdObj = selectCmd.ExecuteScalar();
                int kehuId;
                if (kehuIdObj == null)
                {
                    string insertKeHuSql = "INSERT INTO KeHu (sid, uname, addr, gender, pwd) VALUES (@sid, @uname, '', '', '')";
                    MySqlCommand insertCmd = new MySqlCommand(insertKeHuSql, conn);
                    insertCmd.Parameters.AddWithValue("@sid", idCard);
                    insertCmd.Parameters.AddWithValue("@uname", name);
                    insertCmd.ExecuteNonQuery();
                    kehuId = (int)insertCmd.LastInsertedId;
                }
                else
                {
                    kehuId = Convert.ToInt32(kehuIdObj);
                }
                // 2. 插入登记表
                string insertDengJiSql = "INSERT INTO DengJi (logintime, logouttime, kfid, fee, days) VALUES (@logintime, @logouttime, @kfid, 0, '')";
                MySqlCommand djCmd = new MySqlCommand(insertDengJiSql, conn);
                djCmd.Parameters.AddWithValue("@logintime", checkIn);
                djCmd.Parameters.AddWithValue("@logouttime", checkOut);
                djCmd.Parameters.AddWithValue("@kfid", roomId);
                djCmd.ExecuteNonQuery();
                int dengjiId = (int)djCmd.LastInsertedId;
                // 3. 插入登记详细表
                string insertDetailSql = "INSERT INTO DengJiXiangXi (khid, djid) VALUES (@khid, @djid)";
                MySqlCommand detailCmd = new MySqlCommand(insertDetailSql, conn);
                detailCmd.Parameters.AddWithValue("@khid", kehuId);
                detailCmd.Parameters.AddWithValue("@djid", dengjiId);
                detailCmd.ExecuteNonQuery();
                // 4. 更新房间状态为已占用
                string updateRoomSql = "UPDATE KeFang SET status='入住' WHERE id=@id";
                MySqlCommand updateCmd = new MySqlCommand(updateRoomSql, conn);
                updateCmd.Parameters.AddWithValue("@id", roomId);
                updateCmd.ExecuteNonQuery();
                lblMsg.Text = "客户登记成功！";
                lblMsg.Style["color"] = "green";
                BindRoomList(); // 刷新房间下拉
            }
        }
    }
} 