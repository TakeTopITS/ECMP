using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class OilTypeDAL
    {
        private EntityControl control;

        public OilTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddOilType(OilType OilType)
        {
            control.AddEntity(OilType);
        }

        public void UpdateOilType(OilType OilType, int ID)
        {
            control.UpdateEntity(OilType, ID);
        }

        public void DeleteOilType(OilType OilType)
        {
            control.DeleteEntity(OilType);
        }

        public IList GetAllOilType(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}