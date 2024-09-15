using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDWelderWPSNoBLL
    {
        public void AddGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo)
        {
            GDWelderWPSNoDAL dal = new GDWelderWPSNoDAL();
            dal.AddGDWelderWPSNo(gDWelderWPSNo);
        }

        public void UpdateGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo, int ID)
        {
            GDWelderWPSNoDAL dal = new GDWelderWPSNoDAL();
            dal.UpdateGDWelderWPSNo(gDWelderWPSNo, ID);
        }

        public void DeleteGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo)
        {
            GDWelderWPSNoDAL dal = new GDWelderWPSNoDAL();
            dal.DeleteGDWelderWPSNo(gDWelderWPSNo);
        }

        public IList GetAllGDWelderWPSNos(string strHQL)
        {
            GDWelderWPSNoDAL dal = new GDWelderWPSNoDAL();
            return dal.GetAllGDWelderWPSNos(strHQL);
        }
    }
}