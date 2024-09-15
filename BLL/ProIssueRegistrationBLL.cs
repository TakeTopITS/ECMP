using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 发文登记表
    /// </summary>
    public class ProIssueRegistrationBLL
    {
        public void AddProIssueRegistration(ProIssueRegistration proIssueRegistration)
        {
            ProIssueRegistrationDAL dal = new ProIssueRegistrationDAL();
            dal.AddProIssueRegistration(proIssueRegistration);
        }

        public void UpdateProIssueRegistration(ProIssueRegistration proIssueRegistration, int ID)
        {
            ProIssueRegistrationDAL dal = new ProIssueRegistrationDAL();
            dal.UpdateProIssueRegistration(proIssueRegistration, ID);
        }

        public void DeleteProIssueRegistration(ProIssueRegistration proIssueRegistration)
        {
            ProIssueRegistrationDAL dal = new ProIssueRegistrationDAL();
            dal.DeleteProIssueRegistration(proIssueRegistration);
        }

        public IList GetAllProIssueRegistrations(string strHQL)
        {
            ProIssueRegistrationDAL dal = new ProIssueRegistrationDAL();
            return dal.GetAllProIssueRegistrations(strHQL);
        }
    }
}