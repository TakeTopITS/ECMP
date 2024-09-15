using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZProjectBLL
    {
        public void AddWZProject(WZProject wzProject)
        {
            WZProjectDAL dal = new WZProjectDAL();
            dal.AddWZProject(wzProject);
        }

        public void UpdateWZProject(WZProject wzProject, string strProjectCode)
        {
            WZProjectDAL dal = new WZProjectDAL();
            dal.UpdateWZProject(wzProject, strProjectCode);
        }

        public void DeleteWZProject(WZProject wzProject)
        {
            WZProjectDAL dal = new WZProjectDAL();
            dal.DeleteWZProject(wzProject);
        }

        public IList GetAllWZProjects(string strHQL)
        {
            WZProjectDAL dal = new WZProjectDAL();
            return dal.GetAllWZProjects(strHQL);
        }
    }
}