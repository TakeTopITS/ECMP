using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkExperienceDAL
    {
        private EntityControl control;

        public WorkExperienceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkExperience(WorkExperience workExperience)
        {
            control.AddEntity(workExperience);
        }

        public void UpdateWorkExperience(WorkExperience workExperience, int ID)
        {
            control.UpdateEntity(workExperience, ID);
        }

        public void DeleteWorkExperience(WorkExperience workExperience)
        {
            control.DeleteEntity(workExperience);
        }

        public IList GetAllWorkExperiences(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}