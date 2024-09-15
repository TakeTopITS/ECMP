using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDLineWeldBLL
    {
        public void AddGDLineWeld(GDLineWeld gDLineWeld)
        {
            GDLineWeldDAL dal = new GDLineWeldDAL();
            dal.AddGDLineWeld(gDLineWeld);
        }

        public void UpdateGDLineWeld(GDLineWeld gDLineWeld, int ID)
        {
            GDLineWeldDAL dal = new GDLineWeldDAL();
            dal.UpdateGDLineWeld(gDLineWeld, ID);
        }

        public void DeleteGDLineWeld(GDLineWeld gDLineWeld)
        {
            GDLineWeldDAL dal = new GDLineWeldDAL();
            dal.DeleteGDLineWeld(gDLineWeld);
        }

        public IList GetAllGDLineWelds(string strHQL)
        {
            GDLineWeldDAL dal = new GDLineWeldDAL();
            return dal.GetAllGDLineWelds(strHQL);
        }
    }
}