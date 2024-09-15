using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class EducationExperienceBLL
    {
        public void AddEducationExperience(EducationExperience educationExperience)
        {
            EducationExperienceDAL dal = new EducationExperienceDAL();
            dal.AddEducationExperience(educationExperience);
        }

        public void UpdateEducationExperience(EducationExperience educationExperience, int ID)
        {
            EducationExperienceDAL dal = new EducationExperienceDAL();
            dal.UpdateEducationExperience(educationExperience, ID);
        }

        public void DeleteEducationExperience(EducationExperience educationExperience)
        {
            EducationExperienceDAL dal = new EducationExperienceDAL();
            dal.DeleteEducationExperience(educationExperience);
        }

        public IList GetAllEducationExperiences(string strHQL)
        {
            EducationExperienceDAL dal = new EducationExperienceDAL();
            return dal.GetAllEducationExperiences(strHQL);
        }
    }
}