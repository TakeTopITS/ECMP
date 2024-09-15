using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProModuleDAL
    {
        private EntityControl control;

        public ProModuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProModule(ProModule proModule)
        {
            control.AddEntity(proModule);
        }

        public void UpdateProModule(ProModule proModule, int ID)
        {
            control.UpdateEntity(proModule, ID);
        }

        public void DeleteProModule(ProModule proModule)
        {
            control.DeleteEntity(proModule);
        }

        public IList GetAllProModules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}