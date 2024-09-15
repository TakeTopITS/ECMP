using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReportRelatedUserBLL
    {
        public void AddReportRelatedUser(ReportRelatedUser reportRelatedUser)
        {
            ReportRelatedUserDAL dal = new ReportRelatedUserDAL();
            dal.AddReportRelatedUser(reportRelatedUser);
        }

        public void UpdateReportRelatedUser(ReportRelatedUser reportRelatedUser, int ID)
        {
            ReportRelatedUserDAL dal = new ReportRelatedUserDAL();
            dal.UpdateReportRelatedUser(reportRelatedUser, ID);
        }

        public void DeleteReportRelatedUser(ReportRelatedUser reportRelatedUser)
        {
            ReportRelatedUserDAL dal = new ReportRelatedUserDAL();
            dal.DeleteReportRelatedUser(reportRelatedUser);
        }

        public IList GetAllReportRelatedUsers(string strHQL)
        {
            ReportRelatedUserDAL dal = new ReportRelatedUserDAL();
            return dal.GetAllReportRelatedUsers(strHQL);
        }
    }
}