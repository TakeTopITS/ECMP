using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReqTypeBLL
    {
        public void AddReqType(ReqType reqType)
        {
            ReqTypeDAL dal = new ReqTypeDAL();
            dal.AddReqType(reqType);
        }

        public void UpdateReqType(ReqType reqType, string Type)
        {
            ReqTypeDAL dal = new ReqTypeDAL();
            dal.UpdateReqType(reqType, Type);
        }

        public void DeleteReqType(ReqType reqType)
        {
            ReqTypeDAL dal = new ReqTypeDAL();
            dal.DeleteReqType(reqType);
        }

        public IList GetAllReqTypes(string strHQL)
        {
            ReqTypeDAL dal = new ReqTypeDAL();
            return dal.GetAllReqTypes(strHQL);
        }
    }
}