using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDPressureTestBLL
    {
        public void AddGDPressureTest(GDPressureTest gDPressureTest)
        {
            GDPressureTestDAL dal = new GDPressureTestDAL();
            dal.AddGDPressureTest(gDPressureTest);
        }

        public void UpdateGDPressureTest(GDPressureTest gDPressureTest, int ID)
        {
            GDPressureTestDAL dal = new GDPressureTestDAL();
            dal.UpdateGDPressureTest(gDPressureTest, ID);
        }

        public void DeleteGDPressureTest(GDPressureTest gDPressureTest)
        {
            GDPressureTestDAL dal = new GDPressureTestDAL();
            dal.DeleteGDPressureTest(gDPressureTest);
        }

        public IList GetAllGDPressureTests(string strHQL)
        {
            GDPressureTestDAL dal = new GDPressureTestDAL();
            return dal.GetAllGDPressureTests(strHQL);
        }
    }
}