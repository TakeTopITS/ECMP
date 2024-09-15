using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMOverAllEvaluationDAL
    {
        private EntityControl control;

        public QMOverAllEvaluationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation)
        {
            control.AddEntity(qMOverAllEvaluation);
        }

        public void UpdateQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation, string Code)
        {
            control.UpdateEntity(qMOverAllEvaluation, Code);
        }

        public void DeleteQMOverAllEvaluation(QMOverAllEvaluation qMOverAllEvaluation)
        {
            control.DeleteEntity(qMOverAllEvaluation);
        }

        public IList GetAllQMOverAllEvaluations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}