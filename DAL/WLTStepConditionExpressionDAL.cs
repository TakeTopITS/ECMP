using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WLTStepConditionExpressionDAL
    {
        private EntityControl control;

        public WLTStepConditionExpressionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression)
        {
            control.AddEntity(wlTStepConditionExpression);
        }

        public void UpdateWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression, int ID)
        {
            control.UpdateEntity(wlTStepConditionExpression, ID);
        }

        public void DeleteWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression)
        {
            control.DeleteEntity(wlTStepConditionExpression);
        }

        public IList GetAllWLTStepConditionExpressions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}