using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TriggerTableToFromDAL
    {
        private EntityControl control;

        public TriggerTableToFromDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom)
        {
            control.AddEntity(triggerTableToFrom);
        }

        public void UpdateTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom, int ID)
        {
            control.UpdateEntity(triggerTableToFrom, ID);
        }

        public void DeleteTriggerTableToFrom(TriggerTableToFrom triggerTableToFrom)
        {
            control.DeleteEntity(triggerTableToFrom);
        }

        public IList GetAllTriggerTableToFroms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}