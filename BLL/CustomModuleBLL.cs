using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomModuleBLL
    {
        public void AddCustomModule(CustomModule customModule)
        {
            CustomModuleDAL dal = new CustomModuleDAL();
            dal.AddCustomModule(customModule);
        }

        public void UpdateCustomModule(CustomModule customModule, int ID)
        {
            CustomModuleDAL dal = new CustomModuleDAL();
            dal.UpdateCustomModule(customModule, ID);
        }

        public void DeleteCustomerModule(CustomModule customModule)
        {
            CustomModuleDAL dal = new CustomModuleDAL();
            dal.DeleteCustomModule(customModule);
        }

        public IList GetAllCustomModules(string strHQL)
        {
            CustomModuleDAL dal = new CustomModuleDAL();
            return dal.GetAllCustomModules(strHQL);
        }
    }
}