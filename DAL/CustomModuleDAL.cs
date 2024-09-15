using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomModuleDAL
    {
        private EntityControl control;

        public CustomModuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomModule(CustomModule customModule)
        {
            control.AddEntity(customModule);
        }

        public void UpdateCustomModule(CustomModule customModule, int ID)
        {
            control.UpdateEntity(customModule, ID);
        }

        public void DeleteCustomModule(CustomModule customModule)
        {
            control.DeleteEntity(customModule);
        }

        public IList GetAllCustomModules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}