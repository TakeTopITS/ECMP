using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDAreaBLL
    {
        public void AddGDArea(GDArea gDArea)
        {
            GDAreaDAL dal = new GDAreaDAL();
            dal.AddGDArea(gDArea);
        }

        public void UpdateGDArea(GDArea gDArea, int ID)
        {
            GDAreaDAL dal = new GDAreaDAL();
            dal.UpdateGDArea(gDArea, ID);
        }

        public void DeleteGDArea(GDArea gDArea)
        {
            GDAreaDAL dal = new GDAreaDAL();
            dal.DeleteGDArea(gDArea);
        }

        public IList GetAllGDAreas(string strHQL)
        {
            GDAreaDAL dal = new GDAreaDAL();
            return dal.GetAllGDAreas(strHQL);
        }
    }
}