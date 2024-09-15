using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class EducationExperienceDAL
    {
        private EntityControl control;

        public EducationExperienceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddEducationExperience(EducationExperience educationExperience)
        {
            control.AddEntity(educationExperience);
        }

        public void UpdateEducationExperience(EducationExperience educationExperience, int ID)
        {
            control.UpdateEntity(educationExperience, ID);
        }

        public void DeleteEducationExperience(EducationExperience educationExperience)
        {
            control.DeleteEntity(educationExperience);
        }

        public IList GetAllEducationExperiences(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}