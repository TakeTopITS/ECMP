using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedModuleDAL
    {
        private EntityControl control;

        public DepartRelatedModuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedModule(DepartRelatedModule departRelatedModule)
        {
            control.AddEntity(departRelatedModule);
        }

        public void UpdateDepartRelatedModule(DepartRelatedModule departRelatedModule, int ID)
        {
            control.UpdateEntity(departRelatedModule, ID);
        }

        public void DeleteDepartRelatedModule(DepartRelatedModule departRelatedModule)
        {
            control.DeleteEntity(departRelatedModule);
        }

        public IList GetAllDepartRelatedModules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}