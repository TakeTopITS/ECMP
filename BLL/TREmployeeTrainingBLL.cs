using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 员工培训
    /// </summary>
    public class TREmployeeTrainingBLL
    {
        public void AddTREmployeeTraining(TREmployeeTraining tREmployeeTraining)
        {
            TREmployeeTrainingDAL dal = new TREmployeeTrainingDAL();
            dal.AddTREmployeeTraining(tREmployeeTraining);
        }

        public void UpdateTREmployeeTraining(TREmployeeTraining tREmployeeTraining, int ID)
        {
            TREmployeeTrainingDAL dal = new TREmployeeTrainingDAL();
            dal.UpdateTREmployeeTraining(tREmployeeTraining, ID);
        }

        public void DeleteTREmployeeTraining(TREmployeeTraining tREmployeeTraining)
        {
            TREmployeeTrainingDAL dal = new TREmployeeTrainingDAL();
            dal.DeleteTREmployeeTraining(tREmployeeTraining);
        }

        public IList GetAllTREmployeeTrainings(string strHQL)
        {
            TREmployeeTrainingDAL dal = new TREmployeeTrainingDAL();
            return dal.GetAllTREmployeeTrainings(strHQL);
        }
    }
}