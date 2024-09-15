using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProStatusChangeBLL
    {
        public void AddProStatusChange(ProStatusChange proStatusChange)
        {
            ProStatusChangeDAL dal = new ProStatusChangeDAL();
            dal.AddProStatusChange(proStatusChange);
        }

        public void UpdateProStatusChange(ProStatusChange proStatusChange, int ID)
        {
            ProStatusChangeDAL dal = new ProStatusChangeDAL();
            dal.UpdateProStatusChange(proStatusChange, ID);
        }

        public void DeleteProStatusChange(ProStatusChange proStatusChange)
        {
            ProStatusChangeDAL dal = new ProStatusChangeDAL();
            dal.DeleteProStatusChange(proStatusChange);
        }

        public IList GetAllProStatusChanges(string strHQL)
        {
            ProStatusChangeDAL dal = new ProStatusChangeDAL();
            return dal.GetAllProStatusChanges(strHQL);
        }
    }
}