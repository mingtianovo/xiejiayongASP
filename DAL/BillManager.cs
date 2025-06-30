using System.Data;
using DAL;

namespace BLL
{
    public class BillManager
    {
        public static DataTable GetBillByOrderId(int orderId)
        {
            return BillDAL.GetBillByOrderId(orderId);
        }
    }
} 