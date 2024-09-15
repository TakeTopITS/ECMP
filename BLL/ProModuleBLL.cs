using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProModuleBLL
    {
        public void AddProModule(ProModule proModule)
        {
            ProModuleDAL dal = new ProModuleDAL();
            dal.AddProModule(proModule);
        }

        public void UpdateProModule(ProModule proModule, int ID)
        {
            ProModuleDAL dal = new ProModuleDAL();
            dal.UpdateProModule(proModule, ID);
        }

        public void DeleteProModule(ProModule proModule)
        {
            ProModuleDAL dal = new ProModuleDAL();
            dal.DeleteProModule(proModule);
        }

        public IList GetAllProModules(string strHQL)
        {
            ProModuleDAL dal = new ProModuleDAL();
            return dal.GetAllProModules(strHQL);
        }
    }
}