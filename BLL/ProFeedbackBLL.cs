using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProFeedbackBLL
    {
        public void AddProFeedback(ProFeedback proFeedback)
        {
            ProFeedbackDAL dal = new ProFeedbackDAL();
            dal.AddProFeedback(proFeedback);
        }

        public void UpdateProFeedback(ProFeedback proFeedback, int ID)
        {
            ProFeedbackDAL dal = new ProFeedbackDAL();
            dal.UpdateProFeedback(proFeedback, ID);
        }

        public void DeleteProFeedback(ProFeedback proFeedback)
        {
            ProFeedbackDAL dal = new ProFeedbackDAL();
            dal.DeleteProFeedback(proFeedback);
        }

        public IList GetAllProFeedbacks(string strHQL)
        {
            ProFeedbackDAL dal = new ProFeedbackDAL();
            return dal.GetAllProFeedbacks(strHQL);
        }
    }
}