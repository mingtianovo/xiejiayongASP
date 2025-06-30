using System.Data;
using DAL;

namespace BLL
{
    public class UserManager
    {
        public static bool AddUser(string username, string password, string role)
        {
            return UserDAL.AddUser(username, password, role);
        }

        public static DataTable GetAllUsers()
        {
            return UserDAL.GetAllUsers();
        }

        public static bool UpdateUserPassword(int userId, string newPassword)
        {
            return UserDAL.UpdateUserPassword(userId, newPassword);
        }

        public static bool DeleteUser(int userId)
        {
            return UserDAL.DeleteUser(userId);
        }
    }
} 