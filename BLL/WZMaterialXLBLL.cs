using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZMaterialXLBLL
    {
        public void AddWZMaterialXL(WZMaterialXL wZMaterialXL)
        {
            WZMaterialXLDAL dal = new WZMaterialXLDAL();
            dal.AddWZMaterialXL(wZMaterialXL);
        }

        public void UpdateWZMaterialXL(WZMaterialXL wZMaterialXL, string strXLCode)
        {
            WZMaterialXLDAL dal = new WZMaterialXLDAL();
            dal.UpdateWZMaterialXL(wZMaterialXL, strXLCode);
        }

        public void DeleteWZMaterialXL(WZMaterialXL wZMaterialXL)
        {
            WZMaterialXLDAL dal = new WZMaterialXLDAL();
            dal.DeleteWZMaterialXL(wZMaterialXL);
        }

        public IList GetAllWZMaterialXLs(string strHQL)
        {
            WZMaterialXLDAL dal = new WZMaterialXLDAL();
            return dal.GetAllWZMaterialXLs(strHQL);
        }
    }
}