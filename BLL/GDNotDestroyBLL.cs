using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDNotDestroyBLL
    {
        public void AddGDNotDestroy(GDNotDestroy gDNotDestroy)
        {
            GDNotDestroyDAL dal = new GDNotDestroyDAL();
            dal.AddGDNotDestroy(gDNotDestroy);
        }

        public void UpdateGDNotDestroy(GDNotDestroy gDNotDestroy, int ID)
        {
            GDNotDestroyDAL dal = new GDNotDestroyDAL();
            dal.UpdateGDNotDestroy(gDNotDestroy, ID);
        }

        public void DeleteGDNotDestroy(GDNotDestroy gDNotDestroy)
        {
            GDNotDestroyDAL dal = new GDNotDestroyDAL();
            dal.DeleteGDNotDestroy(gDNotDestroy);
        }

        public IList GetAllGDNotDestroys(string strHQL)
        {
            GDNotDestroyDAL dal = new GDNotDestroyDAL();
            return dal.GetAllGDNotDestroys(strHQL);
        }
    }
}