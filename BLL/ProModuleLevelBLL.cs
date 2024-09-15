using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProModuleLevelBLL
    {
        public void AddProModuleLevel(ProModuleLevel proModuleLevel)
        {
            ProModuleLevelDAL dal = new ProModuleLevelDAL();
            dal.AddProModuleLevel(proModuleLevel);
        }

        public void UpdateProModuleLevel(ProModuleLevel proModuleLevel, int ID)
        {
            ProModuleLevelDAL dal = new ProModuleLevelDAL();
            dal.UpdateProModuleLevel(proModuleLevel, ID);
        }

        public void DeleteProModuleLevel(ProModuleLevel proModuleLevel)
        {
            ProModuleLevelDAL dal = new ProModuleLevelDAL();
            dal.DeleteProModuleLevel(proModuleLevel);
        }

        public IList GetAllProModuleLevels(string strHQL)
        {
            ProModuleLevelDAL dal = new ProModuleLevelDAL();
            return dal.GetAllProModuleLevels(strHQL);
        }
    }
}