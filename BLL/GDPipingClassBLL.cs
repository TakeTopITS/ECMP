using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDPipingClassBLL
    {
        public void AddGDPipingClass(GDPipingClass gDPipingClass)
        {
            GDPipingClassDAL dal = new GDPipingClassDAL();
            dal.AddGDPipingClass(gDPipingClass);
        }

        public void UpdateGDPipingClass(GDPipingClass gDPipingClass, int ID)
        {
            GDPipingClassDAL dal = new GDPipingClassDAL();
            dal.UpdateGDPipingClass(gDPipingClass, ID);
        }

        public void DeleteGDPipingClass(GDPipingClass gDPipingClass)
        {
            GDPipingClassDAL dal = new GDPipingClassDAL();
            dal.DeleteGDPipingClass(gDPipingClass);
        }

        public IList GetAllGDPipingClasss(string strHQL)
        {
            GDPipingClassDAL dal = new GDPipingClassDAL();
            return dal.GetAllGDPipingClasss(strHQL);
        }
    }
}