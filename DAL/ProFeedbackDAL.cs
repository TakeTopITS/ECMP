using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProFeedbackDAL
    {
        private EntityControl control;

        public ProFeedbackDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProFeedback(ProFeedback proFeedback)
        {
            control.AddEntity(proFeedback);
        }

        public void UpdateProFeedback(ProFeedback proFeedback, int ID)
        {
            control.UpdateEntity(proFeedback, ID);
        }

        public void DeleteProFeedback(ProFeedback proFeedback)
        {
            control.DeleteEntity(proFeedback);
        }

        public IList GetAllProFeedbacks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}