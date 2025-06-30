<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>填写预订信息</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container { max-width: 500px; margin: 40px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h2 { text-align: center; color: #2d8cf0; margin-bottom: 32px; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; color: #333; }
        input, select { width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc; }
        .btn { background: #2d8cf0; color: white; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer; font-size: 15px; margin-top: 8px; }
        .btn:hover { background: #1e6fd9; }
        .msg { text-align: center; margin-top: 18px; color: #27ae60; }
        .debug { color: #e67e22; font-size: 13px; margin: 10px 0; word-break: break-all; }
    </style>
</head>
<body>
    <div class="container">
        <h2>填写预订信息</h2>
        <% 
            string roomType = Request.QueryString["type"];
            string msg = "";
            bool isPost = Request.HttpMethod == "POST";
            Response.Write("<div class='debug'>isPost=" + isPost + "</div>");
            if (isPost)
            {
                string username = Session["User"] as string;
                string role = Session["Role"] as string;
                Response.Write("<div class='debug'>User=" + username + ", Role=" + role + "</div>");
                if (string.IsNullOrEmpty(username) || role != "customer")
                {
                    Response.Write("<div class='debug'>Session丢失或不是顾客，跳转登录</div>");
                    Response.Redirect("LoginChinese.aspx");
                }
                string checkin = Request.Form["checkin"];
                string checkout = Request.Form["checkout"];
                Response.Write("<div class='debug'>checkin=" + checkin + ", checkout=" + checkout + "</div>");
                if (string.IsNullOrEmpty(checkin) || string.IsNullOrEmpty(checkout))
                {
                    msg = "请填写完整的入住和离店日期！";
                    Response.Write("<div class='debug'>" + msg + "</div>");
                }
                else
                {
                    try
                    {
                        string connStr = ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
                        using (MySqlConnection conn = new MySqlConnection(connStr))
                        {
                            conn.Open();
                            // 先查 KeHu 表的 id
                            string getKeHuIdSql = "SELECT id FROM KeHu WHERE uname=@uname";
                            MySqlCommand getKeHuCmd = new MySqlCommand(getKeHuIdSql, conn);
                            getKeHuCmd.Parameters.AddWithValue("@uname", username);
                            object kehuIdObj = getKeHuCmd.ExecuteScalar();
                            Response.Write("<div class='debug'>kehuIdObj=" + kehuIdObj + "</div>");
                            if (kehuIdObj == null)
                            {
                                msg = "客户信息不存在！";
                                Response.Write("<div class='debug'>" + msg + "</div>");
                            }
                            else
                            {
                                int kehuId = Convert.ToInt32(kehuIdObj);
                                string insertOrderSql = "INSERT INTO YuDing (khid, booktime, begntime, endtime, isOver) VALUES (@khid, @booktime, @begntime, @endtime, 0)";
                                MySqlCommand insertCmd = new MySqlCommand(insertOrderSql, conn);
                                insertCmd.Parameters.AddWithValue("@khid", kehuId);
                                insertCmd.Parameters.AddWithValue("@booktime", DateTime.Now.ToString("yyyy-MM-dd HH:mm"));
                                insertCmd.Parameters.AddWithValue("@begntime", checkin);
                                insertCmd.Parameters.AddWithValue("@endtime", checkout);
                                int rows = insertCmd.ExecuteNonQuery();
                                Response.Write("<div class='debug'>插入订单返回行数=" + rows + "</div>");
                                long orderId = insertCmd.LastInsertedId;
                                // 获取所选房型id
                                string getTypeIdSql = "SELECT id FROM KeFangLeiBie WHERE typename=@typename";
                                MySqlCommand getTypeCmd = new MySqlCommand(getTypeIdSql, conn);
                                getTypeCmd.Parameters.AddWithValue("@typename", roomType);
                                object typeIdObj = getTypeCmd.ExecuteScalar();
                                Response.Write("<div class='debug'>typeIdObj=" + typeIdObj + "</div>");
                                int? typeId = null;
                                if (typeIdObj != null) typeId = Convert.ToInt32(typeIdObj);
                                int? roomId = null;
                                if (typeId.HasValue) {
                                    // 查找一个空闲房间
                                    string getRoomSql = "SELECT id FROM KeFang WHERE kflbid=@kflbid AND status='空闲' LIMIT 1";
                                    MySqlCommand getRoomCmd = new MySqlCommand(getRoomSql, conn);
                                    getRoomCmd.Parameters.AddWithValue("@kflbid", typeId.Value);
                                    object roomIdObj = getRoomCmd.ExecuteScalar();
                                    if (roomIdObj != null) roomId = Convert.ToInt32(roomIdObj);
                                    Response.Write("<div class='debug'>roomId=" + roomId + "</div>");
                                }
                                // 插入订单明细
                                string insertDetailSql = "INSERT INTO YuDingXiangXi (ydid, kfid) VALUES (@ydid, @kfid)";
                                MySqlCommand insertDetailCmd = new MySqlCommand(insertDetailSql, conn);
                                insertDetailCmd.Parameters.AddWithValue("@ydid", orderId);
                                if (roomId.HasValue)
                                    insertDetailCmd.Parameters.AddWithValue("@kfid", roomId.Value);
                                else
                                    insertDetailCmd.Parameters.AddWithValue("@kfid", DBNull.Value);
                                insertDetailCmd.ExecuteNonQuery();
                                Response.Write("<div class='debug'>插入订单详细成功</div>");
                                Response.Write("<div class='debug'>插入订单成功，orderId=" + orderId + "</div>");
                                Response.Redirect("Customer.aspx");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<div class='debug'>数据库异常：" + ex.Message + "</div>");
                    }
                }
            }
        %>
        <form method="post">
            <div class="form-group">
                <label>房型：</label>
                <input type="text" name="roomtype" value="<%= roomType %>" readonly />
            </div>
            <div class="form-group">
                <label>入住日期：</label>
                <input type="date" name="checkin" required />
            </div>
            <div class="form-group">
                <label>离店日期：</label>
                <input type="date" name="checkout" required />
            </div>
            <button type="submit" class="btn">确认预订</button>
        </form>
        <% if (!string.IsNullOrEmpty(msg)) { %>
            <div class="msg"><%= msg %></div>
        <% } %>
    </div>
</body>
</html> 