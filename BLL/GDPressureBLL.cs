using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDPressureBLL
    {
        public void AddGDPressure(GDPressure gDPressure)
        {
            GDPressureDAL dal = new GDPressureDAL();
            dal.AddGDPressure(gDPressure);
        }

        public void UpdateGDPressure(GDPressure gDPressure, string strPressureCode)
        {
            GDPressureDAL dal = new GDPressureDAL();
            dal.UpdateGDPressure(gDPressure, strPressureCode);
        }

        public void DeleteGDPressure(GDPressure gDPressure)
        {
            GDPressureDAL dal = new GDPressureDAL();
            dal.DeleteGDPressure(gDPressure);
        }

        public IList GetAllGDPressures(string strHQL)
        {
            GDPressureDAL dal = new GDPressureDAL();
            return dal.GetAllGDPressures(strHQL);
        }
    }
}