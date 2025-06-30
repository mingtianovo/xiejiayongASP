using System;

namespace Hotel
{
    public partial class FrontDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "frontdesk")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
} 