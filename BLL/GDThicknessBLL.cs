using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDThicknessBLL
    {
        public void AddGDThickness(GDThickness gDThickness)
        {
            GDThicknessDAL dal = new GDThicknessDAL();
            dal.AddGDThickness(gDThickness);
        }

        public void UpdateGDThickness(GDThickness gDThickness, int ID)
        {
            GDThicknessDAL dal = new GDThicknessDAL();
            dal.UpdateGDThickness(gDThickness, ID);
        }

        public void DeleteGDThickness(GDThickness gDThickness)
        {
            GDThicknessDAL dal = new GDThicknessDAL();
            dal.DeleteGDThickness(gDThickness);
        }

        public IList GetAllGDThicknesss(string strHQL)
        {
            GDThicknessDAL dal = new GDThicknessDAL();
            return dal.GetAllGDThicknesss(strHQL);
        }
    }
}