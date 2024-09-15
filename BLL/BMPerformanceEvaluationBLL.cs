using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 业绩评价
    /// </summary>
    public class BMPerformanceEvaluationBLL
    {
        public void AddBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation)
        {
            BMPerformanceEvaluationDAL dal = new BMPerformanceEvaluationDAL();
            dal.AddBMPerformanceEvaluation(bMPerformanceEvaluation);
        }

        public void UpdateBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation, int ID)
        {
            BMPerformanceEvaluationDAL dal = new BMPerformanceEvaluationDAL();
            dal.UpdateBMPerformanceEvaluation(bMPerformanceEvaluation, ID);
        }

        public void DeleteBMPerformanceEvaluation(BMPerformanceEvaluation bMPerformanceEvaluation)
        {
            BMPerformanceEvaluationDAL dal = new BMPerformanceEvaluationDAL();
            dal.DeleteBMPerformanceEvaluation(bMPerformanceEvaluation);
        }

        public IList GetAllBMPerformanceEvaluations(string strHQL)
        {
            BMPerformanceEvaluationDAL dal = new BMPerformanceEvaluationDAL();
            return dal.GetAllBMPerformanceEvaluations(strHQL);
        }
    }
}