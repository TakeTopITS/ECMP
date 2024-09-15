using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSETrainingPlanDAL
    {
        private EntityControl control;

        public HSETrainingPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSETrainingPlan(HSETrainingPlan hSETrainingPlan)
        {
            control.AddEntity(hSETrainingPlan);
        }

        public void UpdateHSETrainingPlan(HSETrainingPlan hSETrainingPlan, string Code)
        {
            control.UpdateEntity(hSETrainingPlan, Code);
        }

        public void DeleteHSETrainingPlan(HSETrainingPlan hSETrainingPlan)
        {
            control.DeleteEntity(hSETrainingPlan);
        }

        public IList GetAllHSETrainingPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}