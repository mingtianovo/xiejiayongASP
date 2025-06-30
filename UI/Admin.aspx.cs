using System;

namespace Hotel
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
} 