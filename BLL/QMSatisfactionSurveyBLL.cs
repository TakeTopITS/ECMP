using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMSatisfactionSurveyBLL
    {
        public void AddQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey)
        {
            QMSatisfactionSurveyDAL dal = new QMSatisfactionSurveyDAL();
            dal.AddQMSatisfactionSurvey(qMSatisfactionSurvey);
        }

        public void UpdateQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey, string Code)
        {
            QMSatisfactionSurveyDAL dal = new QMSatisfactionSurveyDAL();
            dal.UpdateQMSatisfactionSurvey(qMSatisfactionSurvey, Code);
        }

        public void DeleteQMSatisfactionSurvey(QMSatisfactionSurvey qMSatisfactionSurvey)
        {
            QMSatisfactionSurveyDAL dal = new QMSatisfactionSurveyDAL();
            dal.DeleteQMSatisfactionSurvey(qMSatisfactionSurvey);
        }

        public IList GetAllQMSatisfactionSurveys(string strHQL)
        {
            QMSatisfactionSurveyDAL dal = new QMSatisfactionSurveyDAL();
            return dal.GetAllQMSatisfactionSurveys(strHQL);
        }
    }
}