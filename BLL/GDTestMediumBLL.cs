using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDTestMediumBLL
    {
        public void AddGDTestMedium(GDTestMedium gDTestMedium)
        {
            GDTestMediumDAL dal = new GDTestMediumDAL();
            dal.AddGDTestMedium(gDTestMedium);
        }

        public void UpdateGDTestMedium(GDTestMedium gDTestMedium, int ID)
        {
            GDTestMediumDAL dal = new GDTestMediumDAL();
            dal.UpdateGDTestMedium(gDTestMedium, ID);
        }

        public void DeleteGDTestMedium(GDTestMedium gDTestMedium)
        {
            GDTestMediumDAL dal = new GDTestMediumDAL();
            dal.DeleteGDTestMedium(gDTestMedium);
        }

        public IList GetAllGDTestMediums(string strHQL)
        {
            GDTestMediumDAL dal = new GDTestMediumDAL();
            return dal.GetAllGDTestMediums(strHQL);
        }
    }
}