using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 发文登记表
    /// </summary>
    public class ProIssueRegistrationDAL
    {
        private EntityControl control;

        public ProIssueRegistrationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProIssueRegistration(ProIssueRegistration proIssueRegistration)
        {
            control.AddEntity(proIssueRegistration);
        }

        public void UpdateProIssueRegistration(ProIssueRegistration proIssueRegistration, int ID)
        {
            control.UpdateEntity(proIssueRegistration, ID);
        }

        public void DeleteProIssueRegistration(ProIssueRegistration proIssueRegistration)
        {
            control.DeleteEntity(proIssueRegistration);
        }

        public IList GetAllProIssueRegistrations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}