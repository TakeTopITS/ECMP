using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZMaterialZLBLL
    {
        public void AddWZMaterialZL(WZMaterialZL wZMaterialZL)
        {
            WZMaterialZLDAL dal = new WZMaterialZLDAL();
            dal.AddWZMaterialZL(wZMaterialZL);
        }

        public void UpdateWZMaterialZL(WZMaterialZL wZMaterialZL, string strZLCode)
        {
            WZMaterialZLDAL dal = new WZMaterialZLDAL();
            dal.UpdateWZMaterialZL(wZMaterialZL, strZLCode);
        }

        public void DeleteWZMaterialZL(WZMaterialZL wZMaterialZL)
        {
            WZMaterialZLDAL dal = new WZMaterialZLDAL();
            dal.DeleteWZMaterialZL(wZMaterialZL);
        }

        public IList GetAllWZMaterialZLs(string strHQL)
        {
            WZMaterialZLDAL dal = new WZMaterialZLDAL();
            return dal.GetAllWZMaterialZLs(strHQL);
        }
    }
}