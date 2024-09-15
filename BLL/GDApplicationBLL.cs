using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDApplicationBLL
    {
        public void AddGDApplication(GDApplication gDApplication)
        {
            GDApplicationDAL dal = new GDApplicationDAL();
            dal.AddGDApplication(gDApplication);
        }

        public void UpdateGDApplication(GDApplication gDApplication, int ID)
        {
            GDApplicationDAL dal = new GDApplicationDAL();
            dal.UpdateGDApplication(gDApplication, ID);
        }

        public void DeleteGDApplication(GDApplication gDApplication)
        {
            GDApplicationDAL dal = new GDApplicationDAL();
            dal.DeleteGDApplication(gDApplication);
        }

        public IList GetAllGDApplications(string strHQL)
        {
            GDApplicationDAL dal = new GDApplicationDAL();
            return dal.GetAllGDApplications(strHQL);
        }
    }
}