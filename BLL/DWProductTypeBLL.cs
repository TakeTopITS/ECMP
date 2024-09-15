using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWProductTypeBLL
    {
        public void AddDWProductType(DWProductType dWProductType)
        {
            DWProductTypeDAL dal = new DWProductTypeDAL();
            dal.AddDWProductType(dWProductType);
        }

        public void UpdateDWProductType(DWProductType dWProductType, int ID)
        {
            DWProductTypeDAL dal = new DWProductTypeDAL();
            dal.UpdateDWProductType(dWProductType, ID);
        }

        public void DeleteDWProductType(DWProductType dWProductType)
        {
            DWProductTypeDAL dal = new DWProductTypeDAL();
            dal.DeleteDWProductType(dWProductType);
        }

        public IList GetAllDWProductTypes(string strHQL)
        {
            DWProductTypeDAL dal = new DWProductTypeDAL();
            return dal.GetAllDWProductTypes(strHQL);
        }
    }
}