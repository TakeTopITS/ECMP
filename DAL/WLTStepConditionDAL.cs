using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WLTStepConditionDAL
    {
        private EntityControl control;

        public WLTStepConditionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWLTStepCondition(WLTStepCondition wlTStepCondition)
        {
            control.AddEntity(wlTStepCondition);
        }

        public void UpdateWLTStepCondition(WLTStepCondition wlTStepCondition, int ConID)
        {
            control.UpdateEntity(wlTStepCondition, ConID);
        }

        public void DeleteWLTStepCondition(WLTStepCondition wlTStepCondition)
        {
            control.DeleteEntity(wlTStepCondition);
        }

        public IList GetAllWLTStepConditions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}