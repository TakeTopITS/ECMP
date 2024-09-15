using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWMatchTypeBLL
    {
        public void AddDWMatchType(DWMatchType dWMatchType)
        {
            DWMatchTypeDAL dal = new DWMatchTypeDAL();
            dal.AddDWMatchType(dWMatchType);
        }

        public void UpdateDWMatchType(DWMatchType dWMatchType, int ID)
        {
            DWMatchTypeDAL dal = new DWMatchTypeDAL();
            dal.UpdateDWMatchType(dWMatchType, ID);
        }

        public void DeleteDWMatchType(DWMatchType dWMatchType)
        {
            DWMatchTypeDAL dal = new DWMatchTypeDAL();
            dal.DeleteDWMatchType(dWMatchType);
        }

        public IList GetAllDWMatchTypes(string strHQL)
        {
            DWMatchTypeDAL dal = new DWMatchTypeDAL();
            return dal.GetAllDWMatchTypes(strHQL);
        }
    }
}