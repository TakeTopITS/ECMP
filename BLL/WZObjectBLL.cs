using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZObjectBLL
    {
        public void AddWZObject(WZObject wZObject)
        {
            WZObjectDAL dal = new WZObjectDAL();
            dal.AddWZObject(wZObject);
        }

        public void UpdateWZObject(WZObject wzProject, string strObjectCode)
        {
            WZObjectDAL dal = new WZObjectDAL();
            dal.UpdateWZObject(wzProject, strObjectCode);
        }

        public void DeleteWZObject(WZObject wzProject)
        {
            WZObjectDAL dal = new WZObjectDAL();
            dal.DeleteWZObject(wzProject);
        }

        public IList GetAllWZObjects(string strHQL)
        {
            WZObjectDAL dal = new WZObjectDAL();
            return dal.GetAllWZObjects(strHQL);
        }
    }
}