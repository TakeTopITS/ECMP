using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReportRelatedUserDAL
    {
        private EntityControl control;

        public ReportRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReportRelatedUser(ReportRelatedUser reportRelatedUser)
        {
            control.AddEntity(reportRelatedUser);
        }

        public void UpdateReportRelatedUser(ReportRelatedUser reportRelatedUser, int ID)
        {
            control.UpdateEntity(reportRelatedUser, ID);
        }

        public void DeleteReportRelatedUser(ReportRelatedUser reportRelatedUser)
        {
            control.DeleteEntity(reportRelatedUser);
        }

        public IList GetAllReportRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}