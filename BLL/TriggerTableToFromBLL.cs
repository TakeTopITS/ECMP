using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TriggerTableToFromBLL
    {
        public void AddTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom)
        {
            TriggerTableToFromDAL triggerTableToFromDAL = new TriggerTableToFromDAL();
            triggerTableToFromDAL.AddTriggerTableToFrom(triggerTableToFrom);
        }

        public void UpdateTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom, int ID)
        {
            TriggerTableToFromDAL triggerTableToFromDAL = new TriggerTableToFromDAL();
            triggerTableToFromDAL.UpdateTriggerTableToFrom(triggerTableToFrom, ID);
        }

        public void DeleteTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom)
        {
            TriggerTableToFromDAL triggerTableToFromDAL = new TriggerTableToFromDAL();
            triggerTableToFromDAL.DeleteTriggerTableToFrom(triggerTableToFrom);
        }

        public IList GetAllTriggerTableToFroms(string strHQL)
        {
            TriggerTableToFromDAL triggerTableToFromDAL = new TriggerTableToFromDAL();
            return triggerTableToFromDAL.GetAllTriggerTableToFroms(strHQL);
        }
    }
}