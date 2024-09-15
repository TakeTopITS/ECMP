using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMOverAllEvaluationBLL
    {
        public void AddQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation)
        {
            QMOverAllEvaluationDAL dal = new QMOverAllEvaluationDAL();
            dal.AddQMOverAllEvaluation(qMOverAllEvaluation);
        }

        public void UpdateQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation, string Code)
        {
            QMOverAllEvaluationDAL dal = new QMOverAllEvaluationDAL();
            dal.UpdateQMOverAllEvaluation(qMOverAllEvaluation, Code);
        }

        public void DeleteQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation)
        {
            QMOverAllEvaluationDAL dal = new QMOverAllEvaluationDAL();
            dal.DeleteQMOverAllEvaluation(qMOverAllEvaluation);
        }

        public IList GetAllQMOverAllEvaluations(string strHQL)
        {
            QMOverAllEvaluationDAL dal = new QMOverAllEvaluationDAL();
            return dal.GetAllQMOverAllEvaluations(strHQL);
        }
    }
}