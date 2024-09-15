using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 特种设备
    /// </summary>
    public class TRSpecialEquipmentBLL
    {
        public void AddTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment)
        {
            TRSpecialEquipmentDAL dal = new TRSpecialEquipmentDAL();
            dal.AddTRSpecialEquipment(tRSpecialEquipment);
        }

        public void UpdateTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment, int ID)
        {
            TRSpecialEquipmentDAL dal = new TRSpecialEquipmentDAL();
            dal.UpdateTRSpecialEquipment(tRSpecialEquipment, ID);
        }

        public void DeleteTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment)
        {
            TRSpecialEquipmentDAL dal = new TRSpecialEquipmentDAL();
            dal.DeleteTRSpecialEquipment(tRSpecialEquipment);
        }

        public IList GetAllTRSpecialEquipments(string strHQL)
        {
            TRSpecialEquipmentDAL dal = new TRSpecialEquipmentDAL();
            return dal.GetAllTRSpecialEquipments(strHQL);
        }
    }
}