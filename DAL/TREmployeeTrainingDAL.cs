using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 员工培训
    /// </summary>
    public class TREmployeeTrainingDAL
    {
        private EntityControl control;

        public TREmployeeTrainingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTREmployeeTraining(TREmployeeTraining tREmployeeTraining)
        {
            control.AddEntity(tREmployeeTraining);
        }

        public void UpdateTREmployeeTraining(TREmployeeTraining tREmployeeTraining, int ID)
        {
            control.UpdateEntity(tREmployeeTraining, ID);
        }

        public void DeleteTREmployeeTraining(TREmployeeTraining tREmployeeTraining)
        {
            control.DeleteEntity(tREmployeeTraining);
        }

        public IList GetAllTREmployeeTrainings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}