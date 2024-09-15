using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MTTypeDAL
    {
        private EntityControl control;

        public MTTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMTType(MTType mtType)
        {
            control.AddEntity(mtType);
        }

        public void UpdateMTType(MTType mtType, string Type)
        {
            control.UpdateEntity(mtType, Type);
        }

        public void DeleteMTType(MTType mtType)
        {
            control.DeleteEntity(mtType);
        }

        public IList GetAllMTTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}