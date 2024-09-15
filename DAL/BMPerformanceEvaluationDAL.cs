using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 业绩评价
    /// </summary>
    public class BMPerformanceEvaluationDAL
    {
        private EntityControl control;

        public BMPerformanceEvaluationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation)
        {
            control.AddEntity(bMPerformanceEvaluation);
        }

        public void UpdateBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation, int ID)
        {
            control.UpdateEntity(bMPerformanceEvaluation, ID);
        }

        public void DeleteBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation)
        {
            control.DeleteEntity(bMPerformanceEvaluation);
        }

        public IList GetAllBMPerformanceEvaluations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}