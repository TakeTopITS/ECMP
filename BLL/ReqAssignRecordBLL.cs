using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReqAssignRecordBLL
    {
        public void AddReqAssignRecord(ReqAssignRecord reqAssignRecord)
        {
            ReqAssignRecordDAL dal = new ReqAssignRecordDAL();
            dal.AddReqAssignRecord(reqAssignRecord);
        }

        public void UpdateReqAssignRecord(ReqAssignRecord reqAssignRecord, int ID)
        {
            ReqAssignRecordDAL dal = new ReqAssignRecordDAL();
            dal.UpdateReqAssignRecord(reqAssignRecord, ID);
        }

        public void DeleteReqAssignRecord(ReqAssignRecord reqAssignRecord)
        {
            ReqAssignRecordDAL dal = new ReqAssignRecordDAL();
            dal.DeleteReqAssignRecord(reqAssignRecord);
        }

        public IList GetAllReqAssignRecords(string strHQL)
        {
            ReqAssignRecordDAL dal = new ReqAssignRecordDAL();
            return dal.GetAllReqAssignRecords(strHQL);
        }
    }
}