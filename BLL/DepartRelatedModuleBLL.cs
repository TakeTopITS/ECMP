using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedModuleBLL
    {
        public void AddDepartRelatedModule(DepartRelatedModule departRelatedModule)
        {
            DepartRelatedModuleDAL dal = new DepartRelatedModuleDAL();
            dal.AddDepartRelatedModule(departRelatedModule);
        }

        public void UpdateDepartRelatedModule(DepartRelatedModule departRelatedModule, int ID)
        {
            DepartRelatedModuleDAL dal = new DepartRelatedModuleDAL();
            dal.UpdateDepartRelatedModule(departRelatedModule, ID);
        }

        public void DeleteDepartRelatedModule(DepartRelatedModule departRelatedModule)
        {
            DepartRelatedModuleDAL dal = new DepartRelatedModuleDAL();
            dal.DeleteDepartRelatedModule(departRelatedModule);
        }

        public IList GetAllDepartRelatedModules(string strHQL)
        {
            DepartRelatedModuleDAL dal = new DepartRelatedModuleDAL();
            return dal.GetAllDepartRelatedModules(strHQL);
        }
    }
}