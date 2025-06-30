using DAL;

namespace BLL
{
    public class RoomManager
    {
        public static bool AddRoom(string roomNumber, string type, decimal price)
        {
            return RoomDAL.AddRoom(roomNumber, type, price);
        }

        public static bool DeleteRoom(int roomId)
        {
            return RoomDAL.DeleteRoom(roomId);
        }
    }
} 