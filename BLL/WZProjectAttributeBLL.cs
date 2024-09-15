using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZProjectAttributeBLL
    {
        public void AddWZProjectAttribute(WZProjectAttribute wZProjectAttribute)
        {
            WZProjectAttributeDAL dal = new WZProjectAttributeDAL();
            dal.AddWZProjectAttribute(wZProjectAttribute);
        }

        public void UpdateWZProjectAttribute(WZProjectAttribute wZProjectAttribute, int ID)
        {
            WZProjectAttributeDAL dal = new WZProjectAttributeDAL();
            dal.UpdateWZProjectAttribute(wZProjectAttribute, ID);
        }

        public void DeleteWZProjectAttribute(WZProjectAttribute wZProjectAttribute)
        {
            WZProjectAttributeDAL dal = new WZProjectAttributeDAL();
            dal.DeleteWZProjectAttribute(wZProjectAttribute);
        }

        public IList GetAllWZProjectAttributes(string strHQL)
        {
            WZProjectAttributeDAL dal = new WZProjectAttributeDAL();
            return dal.GetAllWZProjectAttributes(strHQL);
        }
    }
}