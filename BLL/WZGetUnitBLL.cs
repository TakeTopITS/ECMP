using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZGetUnitBLL
    {
        public void AddWZGetUnit(WZGetUnit wZGetUnit)
        {
            WZGetUnitDAL dal = new WZGetUnitDAL();
            dal.AddWZGetUnit(wZGetUnit);
        }

        public void UpdateWZGetUnit(WZGetUnit wZGetUnit, string strUnitCode)
        {
            WZGetUnitDAL dal = new WZGetUnitDAL();
            dal.UpdateWZGetUnit(wZGetUnit, strUnitCode);
        }

        public void DeleteWZGetUnit(WZGetUnit wZGetUnit)
        {
            WZGetUnitDAL dal = new WZGetUnitDAL();
            dal.DeleteWZGetUnit(wZGetUnit);
        }

        public IList GetAllWZGetUnits(string strHQL)
        {
            WZGetUnitDAL dal = new WZGetUnitDAL();
            return dal.GetAllWZGetUnits(strHQL);
        }
    }
}