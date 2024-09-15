using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDRTNotQualifiedBLL
    {
        public void AddGDRTNotQualified(GDRTNotQualified gDRTNotQualified)
        {
            GDRTNotQualifiedDAL dal = new GDRTNotQualifiedDAL();
            dal.AddGDRTNotQualified(gDRTNotQualified);
        }

        public void UpdateGDRTNotQualified(GDRTNotQualified gDRTNotQualified, int ID)
        {
            GDRTNotQualifiedDAL dal = new GDRTNotQualifiedDAL();
            dal.UpdateGDRTNotQualified(gDRTNotQualified, ID);
        }

        public void DeleteGDRTNotQualified(GDRTNotQualified gDRTNotQualified)
        {
            GDRTNotQualifiedDAL dal = new GDRTNotQualifiedDAL();
            dal.DeleteGDRTNotQualified(gDRTNotQualified);
        }

        public IList GetAllGDRTNotQualifieds(string strHQL)
        {
            GDRTNotQualifiedDAL dal = new GDRTNotQualifiedDAL();
            return dal.GetAllGDRTNotQualifieds(strHQL);
        }
    }
}