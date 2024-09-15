using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSETrainingPlanBLL
    {
        public void AddHSETrainingPlan(HSETrainingPlan hSETrainingPlan)
        {
            HSETrainingPlanDAL dal = new HSETrainingPlanDAL();
            dal.AddHSETrainingPlan(hSETrainingPlan);
        }

        public void UpdateHSETrainingPlan(HSETrainingPlan hSETrainingPlan, string Code)
        {
            HSETrainingPlanDAL dal = new HSETrainingPlanDAL();
            dal.UpdateHSETrainingPlan(hSETrainingPlan, Code);
        }

        public void DeleteHSETrainingPlan(HSETrainingPlan hSETrainingPlan)
        {
            HSETrainingPlanDAL dal = new HSETrainingPlanDAL();
            dal.DeleteHSETrainingPlan(hSETrainingPlan);
        }

        public IList GetAllHSETrainingPlans(string strHQL)
        {
            HSETrainingPlanDAL dal = new HSETrainingPlanDAL();
            return dal.GetAllHSETrainingPlans(strHQL);
        }
    }
}