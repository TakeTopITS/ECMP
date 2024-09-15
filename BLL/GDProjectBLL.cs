using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDProjectBLL
    {
        public void AddGDProject(GDProject gDProject)
        {
            GDProjectDAL dal = new GDProjectDAL();
            dal.AddGDProject(gDProject);
        }

        public void UpdateGDProject(GDProject gDProject, int ID)
        {
            GDProjectDAL dal = new GDProjectDAL();
            dal.UpdateGDProject(gDProject, ID);
        }

        public void DeleteGDProject(GDProject gDProject)
        {
            GDProjectDAL dal = new GDProjectDAL();
            dal.DeleteGDProject(gDProject);
        }

        public IList GetAllGDProjects(string strHQL)
        {
            GDProjectDAL dal = new GDProjectDAL();
            return dal.GetAllGDProjects(strHQL);
        }
    }
}