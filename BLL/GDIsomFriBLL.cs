using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDIsomFriBLL
    {
        public void AddGDIsomFri(GDIsomFri gDIsomFri)
        {
            GDIsomFriDAL dal = new GDIsomFriDAL();
            dal.AddGDIsomFri(gDIsomFri);
        }

        public void UpdateGDIsomFri(GDIsomFri gDIsomFri, int ID)
        {
            GDIsomFriDAL dal = new GDIsomFriDAL();
            dal.UpdateGDIsomFri(gDIsomFri, ID);
        }

        public void DeleteGDIsomFri(GDIsomFri gDIsomFri)
        {
            GDIsomFriDAL dal = new GDIsomFriDAL();
            dal.DeleteGDIsomFri(gDIsomFri);
        }

        public IList GetAllGDIsomFris(string strHQL)
        {
            GDIsomFriDAL dal = new GDIsomFriDAL();
            return dal.GetAllGDGDIsomFris(strHQL);
        }
    }
}