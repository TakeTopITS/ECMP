using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProModuleLevelDAL
    {
        private EntityControl control;

        public ProModuleLevelDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProModuleLevel(ProModuleLevel proModuleLevel)
        {
            control.AddEntity(proModuleLevel);
        }

        public void UpdateProModuleLevel(ProModuleLevel proModuleLevel, int ID)
        {
            control.UpdateEntity(proModuleLevel, ID);
        }

        public void DeleteProModuleLevel(ProModuleLevel proModuleLevel)
        {
            control.DeleteEntity(proModuleLevel);
        }

        public IList GetAllProModuleLevels(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}