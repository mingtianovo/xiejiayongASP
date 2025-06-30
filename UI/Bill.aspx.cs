using System;
using BLL;

namespace Hotel
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderId = int.Parse(Request.QueryString["id"]);
                var dt = BillManager.GetBillByOrderId(orderId);
                gvBill.DataSource = dt;
                gvBill.DataBind();
            }
        }
    }
} 