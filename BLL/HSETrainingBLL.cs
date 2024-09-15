using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSETrainingBLL
    {
        public void AddHSETraining(HSETraining hSETraining)
        {
            HSETrainingDAL dal = new HSETrainingDAL();
            dal.AddHSETraining(hSETraining);
        }

        public void UpdateHSETraining(HSETraining hSETraining, string Code)
        {
            HSETrainingDAL dal = new HSETrainingDAL();
            dal.UpdateHSETraining(hSETraining, Code);
        }

        public void DeleteHSETraining(HSETraining hSETraining)
        {
            HSETrainingDAL dal = new HSETrainingDAL();
            dal.DeleteHSETraining(hSETraining);
        }

        public IList GetAllHSETrainings(string strHQL)
        {
            HSETrainingDAL dal = new HSETrainingDAL();
            return dal.GetAllHSETrainings(strHQL);
        }
    }
}