using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WLTypeBLL
    {
        public void AddWLType(WLType wlType)
        {
            WLTypeDAL dal = new WLTypeDAL();
            dal.AddWLType(wlType);
        }

        public void UpdateWLType(WLType wlType, string Type)
        {
            WLTypeDAL dal = new WLTypeDAL();
            dal.UpdateWLType(wlType, Type);
        }

        public void DeleteWLType(WLType wlType)
        {
            WLTypeDAL dal = new WLTypeDAL();
            dal.DeleteWLType(wlType);
        }

        public IList GetAllWLTypes(string strHQL)
        {
            WLTypeDAL dal = new WLTypeDAL();
            return dal.GetAllWLTypes(strHQL);
        }
    }
}