using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReqStatusBLL
    {
        public void AddReqStatus(ReqStatus reqStatus)
        {
            ReqStatusDAL dal = new ReqStatusDAL();
            dal.AddReqStatus(reqStatus);
        }

        public void UpdateReqStatus(ReqStatus reqStatus, string Status)
        {
            ReqStatusDAL dal = new ReqStatusDAL();
            dal.UpdateReqStatus(reqStatus, Status);
        }

        public void DeleteReqStatus(ReqStatus reqStatus)
        {
            ReqStatusDAL dal = new ReqStatusDAL();
            dal.DeleteReqStatus(reqStatus);
        }

        public IList GetAllReqStatuss(string strHQL)
        {
            ReqStatusDAL dal = new ReqStatusDAL();
            return dal.GetAllReqStatuss(strHQL);
        }
    }
}