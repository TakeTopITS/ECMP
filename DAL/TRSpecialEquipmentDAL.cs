using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 特种设备
    /// </summary>
    public class TRSpecialEquipmentDAL
    {
        private EntityControl control;

        public TRSpecialEquipmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment)
        {
            control.AddEntity(tRSpecialEquipment);
        }

        public void UpdateTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment, int ID)
        {
            control.UpdateEntity(tRSpecialEquipment, ID);
        }

        public void DeleteTRSpecialEquipment(TRSpecialEquipment tRSpecialEquipment)
        {
            control.DeleteEntity(tRSpecialEquipment);
        }

        public IList GetAllTRSpecialEquipments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}