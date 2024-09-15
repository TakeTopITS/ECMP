using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class OilTypeBLL
    {
        public void AddOilType(OilType OilType)
        {
            OilTypeDAL dal = new OilTypeDAL();
            dal.AddOilType(OilType);
        }

        public void UpdateOilType(OilType OilType, int ID)
        {
            OilTypeDAL dal = new OilTypeDAL();
            dal.UpdateOilType(OilType, ID);
        }

        public void DeleteOilType(OilType OilType)
        {
            OilTypeDAL dal = new OilTypeDAL();
            dal.DeleteOilType(OilType);
        }

        public IList GetAllOilType(string strHQL)
        {
            OilTypeDAL dal = new OilTypeDAL();
            return dal.GetAllOilType(strHQL);
        }
    }
}