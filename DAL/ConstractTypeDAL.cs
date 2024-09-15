using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractTypeDAL
    {
        private EntityControl control;

        public ConstractTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractType(ConstractType constractType)
        {
            control.AddEntity(constractType);
        }

        public void UpdateConstractType(ConstractType constractType, string Type)
        {
            control.UpdateEntity(constractType, Type);
        }

        public void DeleteConstractType(ConstractType constractType)
        {
            control.DeleteEntity(constractType);
        }

        public IList GetAllConstractTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}