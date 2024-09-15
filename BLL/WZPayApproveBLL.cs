using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPayApproveBLL
    {
        public void AddWZPayApprove(WZPayApprove wZPayApprove)
        {
            WZPayApproveDAL dal = new WZPayApproveDAL();
            dal.AddWZPayApprove(wZPayApprove);
        }

        public void UpdateWZPayApprove(WZPayApprove wZPayApprove, int ID)
        {
            WZPayApproveDAL dal = new WZPayApproveDAL();
            dal.UpdateWZPayApprove(wZPayApprove, ID);
        }

        public void DeleteWZPayApprove(WZPayApprove wZPayApprove)
        {
            WZPayApproveDAL dal = new WZPayApproveDAL();
            dal.DeleteWZPayApprove(wZPayApprove);
        }

        public IList GetAllWZPayApproves(string strHQL)
        {
            WZPayApproveDAL dal = new WZPayApproveDAL();
            return dal.GetAllWZPayApproves(strHQL);
        }
    }
}