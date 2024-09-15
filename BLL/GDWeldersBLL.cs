using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDWeldersBLL
    {
        public void AddGDWelders(GDWelders gDWelders)
        {
            GDWeldersDAL dal = new GDWeldersDAL();
            dal.AddGDWelders(gDWelders);
        }

        public void UpdateGDWelders(GDWelders gDWelders, string strWelders)
        {
            GDWeldersDAL dal = new GDWeldersDAL();
            dal.UpdateGDWelders(gDWelders, strWelders);
        }

        public void DeleteGDWelders(GDWelders gDWelders)
        {
            GDWeldersDAL dal = new GDWeldersDAL();
            dal.DeleteGDWelders(gDWelders);
        }

        public IList GetAllGDWelderss(string strHQL)
        {
            GDWeldersDAL dal = new GDWeldersDAL();
            return dal.GetAllGDWelderss(strHQL);
        }
    }
}