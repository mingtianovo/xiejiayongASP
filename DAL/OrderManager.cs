using System.Data;
using DAL;

namespace BLL
{
    /// <summary>
    /// 订单业务逻辑层，负责订单相关业务处理
    /// </summary>
    public class OrderManager
    {
        /// <summary>
        /// 查询所有订单信息（可扩展业务校验或权限判断）
        /// </summary>
        /// <returns>订单信息DataTable</returns>
        public static DataTable QueryOrders()
        {
            // 可加业务校验或权限判断
            return OrderDAL.SelectAllOrders();
        }

        public static bool DeleteOrder(int orderId)
        {
            return OrderDAL.DeleteOrder(orderId);
        }
    }
} 