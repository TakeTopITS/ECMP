using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZMaterialDLBLL
    {
        public void AddWZMaterialDL(WZMaterialDL wZMaterialDL)
        {
            WZMaterialDLDAL dal = new WZMaterialDLDAL();
            dal.AddWZMaterialDL(wZMaterialDL);
        }

        public void UpdateWZMaterialDL(WZMaterialDL wZMaterialDL, string strDLCode)
        {
            WZMaterialDLDAL dal = new WZMaterialDLDAL();
            dal.UpdateWZMaterialDL(wZMaterialDL, strDLCode);
        }

        public void DeleteWZMaterialDL(WZMaterialDL wZMaterialDL)
        {
            WZMaterialDLDAL dal = new WZMaterialDLDAL();
            dal.DeleteWZMaterialDL(wZMaterialDL);
        }

        public IList GetAllWZMaterialDLs(string strHQL)
        {
            WZMaterialDLDAL dal = new WZMaterialDLDAL();
            return dal.GetAllWZMaterialDLs(strHQL);
        }
    }
}