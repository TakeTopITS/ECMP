using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEEnvirFactorSurveyDAL
    {
        private EntityControl control;

        public HSEEnvirFactorSurveyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey)
        {
            control.AddEntity(hSEEnvirFactorSurvey);
        }

        public void UpdateHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey, string Code)
        {
            control.UpdateEntity(hSEEnvirFactorSurvey, Code);
        }

        public void DeleteHSEEnvirFactorSurvey(HSEEnvirFactorSurvey hSEEnvirFactorSurvey)
        {
            control.DeleteEntity(hSEEnvirFactorSurvey);
        }

        public IList GetAllHSEEnvirFactorSurveys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}