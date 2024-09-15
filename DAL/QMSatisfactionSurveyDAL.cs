using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMSatisfactionSurveyDAL
    {
        private EntityControl control;

        public QMSatisfactionSurveyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey)
        {
            control.AddEntity(qMSatisfactionSurvey);
        }

        public void UpdateQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey, string Code)
        {
            control.UpdateEntity(qMSatisfactionSurvey, Code);
        }

        public void DeleteQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey)
        {
            control.DeleteEntity(qMSatisfactionSurvey);
        }

        public IList GetAllQMSatisfactionSurveys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}