using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDFriBLL
    {
        public void AddGDFri(GDFri gDFri)
        {
            GDFriDAL dal = new GDFriDAL();
            dal.AddGDFri(gDFri);
        }

        public void UpdateGDFri(GDFri gDFri, int ID)
        {
            GDFriDAL dal = new GDFriDAL();
            dal.UpdateGDFri(gDFri, ID);
        }

        public void DeleteGDFri(GDFri gDFri)
        {
            GDFriDAL dal = new GDFriDAL();
            dal.DeleteGDFri(gDFri);
        }

        public IList GetAllGDFris(string strHQL)
        {
            GDFriDAL dal = new GDFriDAL();
            return dal.GetAllGDFris(strHQL);
        }
    }
}