using System;

namespace UI
{
    public partial class RoomEdit : System.Web.UI.Page
    {
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "房间更新成功！";
            lblMsg.Style["color"] = "green";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomList.aspx");
        }
    }
} 