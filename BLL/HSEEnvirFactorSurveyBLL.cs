using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEEnvirFactorSurveyBLL
    {
        public void AddHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey)
        {
            HSEEnvirFactorSurveyDAL dal = new HSEEnvirFactorSurveyDAL();
            dal.AddHSEEnvirFactorSurvey(hSEEnvirFactorSurvey);
        }

        public void UpdateHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey, string Code)
        {
            HSEEnvirFactorSurveyDAL dal = new HSEEnvirFactorSurveyDAL();
            dal.UpdateHSEEnvirFactorSurvey(hSEEnvirFactorSurvey, Code);
        }

        public void DeleteHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey)
        {
            HSEEnvirFactorSurveyDAL dal = new HSEEnvirFactorSurveyDAL();
            dal.DeleteHSEEnvirFactorSurvey(hSEEnvirFactorSurvey);
        }

        public IList GetAllHSEEnvirFactorSurveys(string strHQL)
        {
            HSEEnvirFactorSurveyDAL dal = new HSEEnvirFactorSurveyDAL();
            return dal.GetAllHSEEnvirFactorSurveys(strHQL);
        }
    }
}