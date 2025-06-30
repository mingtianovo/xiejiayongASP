using System;

namespace Hotel
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "customer")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
} 