using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkExperienceBLL
    {
        public void AddWorkExperience(WorkExperience workExperience)
        {
            WorkExperienceDAL dal = new WorkExperienceDAL();
            dal.AddWorkExperience(workExperience);
        }

        public void UpdateWorkExperience(WorkExperience workExperience, int ID)
        {
            WorkExperienceDAL dal = new WorkExperienceDAL();
            dal.UpdateWorkExperience(workExperience, ID);
        }

        public void DeleteWorkExperience(WorkExperience workExperience)
        {
            WorkExperienceDAL dal = new WorkExperienceDAL();
            dal.DeleteWorkExperience(workExperience);
        }

        public IList GetAllWorkExperiences(string strHQL)
        {
            WorkExperienceDAL dal = new WorkExperienceDAL();
            return dal.GetAllWorkExperiences(strHQL);
        }
    }
}