using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReqAssignRecordDAL
    {
        private EntityControl control;

        public ReqAssignRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReqAssignRecord(ReqAssignRecord reqAssignRecord)
        {
            control.AddEntity(reqAssignRecord);
        }

        public void UpdateReqAssignRecord(ReqAssignRecord reqAssignRecord, int ID)
        {
            control.UpdateEntity(reqAssignRecord, ID);
        }

        public void DeleteReqAssignRecord(ReqAssignRecord reqAssignRecord)
        {
            control.DeleteEntity(reqAssignRecord);
        }

        public IList GetAllReqAssignRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}