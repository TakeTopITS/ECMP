using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDSystemBLL
    {
        public void AddGDSystem(GDSystem gDSystem)
        {
            GDSystemDAL dal = new GDSystemDAL();
            dal.AddGDSystem(gDSystem);
        }

        public void UpdateGDSystem(GDSystem gDSystem, int ID)
        {
            GDSystemDAL dal = new GDSystemDAL();
            dal.UpdateGDSystem(gDSystem, ID);
        }

        public void DeleteGDSystem(GDSystem gDSystem)
        {
            GDSystemDAL dal = new GDSystemDAL();
            dal.DeleteGDSystem(gDSystem);
        }

        public IList GetAllGDSystems(string strHQL)
        {
            GDSystemDAL dal = new GDSystemDAL();
            return dal.GetAllGDSystems(strHQL);
        }
    }
}