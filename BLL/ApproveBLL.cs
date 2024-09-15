using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ApproveBLL
    {
        public void AddApprove(Approve approve)
        {
            ApproveDAL dal = new ApproveDAL();
            dal.AddApprove(approve);
        }

        public void UpdateApprove(Approve approve, int ID)
        {
            ApproveDAL dal = new ApproveDAL();
            dal.UpdateApprove(approve, ID);
        }

        public void DeleteApprove(Approve approve)
        {
            ApproveDAL dal = new ApproveDAL();
            dal.DeleteApprove(approve);
        }

        public IList GetAllApproves(string strHQL)
        {
            ApproveDAL dal = new ApproveDAL();
            return dal.GetAllApproves(strHQL);
        }
    }
}