using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZDivideBLL
    {
        public void AddWZDivide(WZDivide wZDivide)
        {
            WZDivideDAL dal = new WZDivideDAL();
            dal.AddWZDivide(wZDivide);
        }

        public void UpdateWZDivide(WZDivide wZDivide, string strDivideCode)
        {
            WZDivideDAL dal = new WZDivideDAL();
            dal.UpdateWZDivide(wZDivide, strDivideCode);
        }

        public void DeleteWZDivide(WZDivide wZDivide)
        {
            WZDivideDAL dal = new WZDivideDAL();
            dal.DeleteWZDivide(wZDivide);
        }

        public IList GetAllWZDivides(string strHQL)
        {
            WZDivideDAL dal = new WZDivideDAL();
            return dal.GetAllWZDivides(strHQL);
        }
    }
}