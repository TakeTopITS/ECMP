using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDWeldTypeBLL
    {
        public void AddGDWeldType(GDWeldType gDWeldType)
        {
            GDWeldTypeDAL dal = new GDWeldTypeDAL();
            dal.AddGDWeldType(gDWeldType);
        }

        public void UpdateGDWeldType(GDWeldType gDWeldType, int ID)
        {
            GDWeldTypeDAL dal = new GDWeldTypeDAL();
            dal.UpdateGDWeldType(gDWeldType, ID);
        }

        public void DeleteGDWeldType(GDWeldType gDWeldType)
        {
            GDWeldTypeDAL dal = new GDWeldTypeDAL();
            dal.DeleteGDWeldType(gDWeldType);
        }

        public IList GetAllGDWeldTypes(string strHQL)
        {
            GDWeldTypeDAL dal = new GDWeldTypeDAL();
            return dal.GetAllGDWeldTypes(strHQL);
        }
    }
}