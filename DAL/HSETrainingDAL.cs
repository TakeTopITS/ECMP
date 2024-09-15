using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSETrainingDAL
    {
        private EntityControl control;

        public HSETrainingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSETraining(HSETraining hSETraining)
        {
            control.AddEntity(hSETraining);
        }

        public void UpdateHSETraining(HSETraining hSETraining, string Code)
        {
            control.UpdateEntity(hSETraining, Code);
        }

        public void DeleteHSETraining(HSETraining hSETraining)
        {
            control.DeleteEntity(hSETraining);
        }

        public IList GetAllHSETrainings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}