using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDOrderCodeDAL
    {
        private EntityControl control;

        public GDOrderCodeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDOrderCode(GDOrderCode gDOrderCode)
        {
            control.AddEntity(gDOrderCode);
        }

        public void UpdateGDOrderCode(GDOrderCode gDOrderCode, int ID)
        {
            control.UpdateEntity(gDOrderCode, ID);
        }

        public void DeleteGDOrderCode(GDOrderCode gDOrderCode)
        {
            control.DeleteEntity(gDOrderCode);
        }

        public IList GetAllGDOrderCodes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}