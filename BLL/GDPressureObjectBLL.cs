using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDPressureObjectBLL
    {
        public void AddGDPressureObject(GDPressureObject gDPressureObject)
        {
            GDPressureObjectDAL dal = new GDPressureObjectDAL();
            dal.AddGDPressureObject(gDPressureObject);
        }

        public void UpdateGDPressureObject(GDPressureObject gDPressureObject, int ID)
        {
            GDPressureObjectDAL dal = new GDPressureObjectDAL();
            dal.UpdateGDPressureObject(gDPressureObject, ID);
        }

        public void DeleteGDPressureObject(GDPressureObject gDPressureObject)
        {
            GDPressureObjectDAL dal = new GDPressureObjectDAL();
            dal.DeleteGDPressureObject(gDPressureObject);
        }

        public IList GetAllGDPressureObjects(string strHQL)
        {
            GDPressureObjectDAL dal = new GDPressureObjectDAL();
            return dal.GetAllGDPressureObjects(strHQL);
        }
    }
}