using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDHotHandlerBLL
    {
        public void AddGDHotHandler(GDHotHandler gDHotHandler)
        {
            GDHotHandlerDAL dal = new GDHotHandlerDAL();
            dal.AddGDHotHandler(gDHotHandler);
        }

        public void UpdateGDHotHandler(GDHotHandler gDHotHandler, int ID)
        {
            GDHotHandlerDAL dal = new GDHotHandlerDAL();
            dal.UpdateGDHotHandler(gDHotHandler, ID);
        }

        public void DeleteGDHotHandler(GDHotHandler gDHotHandler)
        {
            GDHotHandlerDAL dal = new GDHotHandlerDAL();
            dal.DeleteGDHotHandler(gDHotHandler);
        }

        public IList GetAllGDHotHandlers(string strHQL)
        {
            GDHotHandlerDAL dal = new GDHotHandlerDAL();
            return dal.GetAllGDHotHandlers(strHQL);
        }
    }
}