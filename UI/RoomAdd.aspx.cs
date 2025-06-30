using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace UI
{
    public partial class RoomAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomType();
                BindBranch();
            }
        }

        private void BindRoomType()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT id, typename FROM KeFangLeiBie";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                ddlType.DataSource = cmd.ExecuteReader();
                ddlType.DataTextField = "typename";
                ddlType.DataValueField = "id";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new System.Web.UI.WebControls.ListItem("请选择房间类型", ""));
            }
        }

        private void BindBranch()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT id, fdname FROM FenDian";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                ddlBranch.DataSource = cmd.ExecuteReader();
                ddlBranch.DataTextField = "fdname";
                ddlBranch.DataValueField = "id";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("请选择分店", ""));
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string roomNum = txtRoomNumber.Text.Trim();
            string status = ddlStatus.SelectedValue;
            string typeId = ddlType.SelectedValue;
            string branchId = ddlBranch.SelectedValue;

            if (string.IsNullOrEmpty(roomNum) || string.IsNullOrEmpty(status) || string.IsNullOrEmpty(typeId) || string.IsNullOrEmpty(branchId))
            {
                lblMsg.Text = "请填写完整信息！";
                lblMsg.Style["color"] = "red";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO KeFang (roomnum, status, kflbid, fdid) VALUES (@roomnum, @status, @kflbid, @fdid)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@roomnum", roomNum);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@kflbid", typeId);
                cmd.Parameters.AddWithValue("@fdid", branchId);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMsg.Text = "房间添加成功！";
                    lblMsg.Style["color"] = "green";
                }
                else
                {
                    lblMsg.Text = "添加失败，请重试！";
                    lblMsg.Style["color"] = "red";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin/AdminHome.aspx");
        }
    }
} 