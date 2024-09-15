using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartNewsNoticeRelatedUserDAL
    {
        private EntityControl control;

        public DepartNewsNoticeRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser)
        {
            control.AddEntity(departNewsNoticeRelatedUser);
        }

        public void UpdateDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser, int ID)
        {
            control.UpdateEntity(departNewsNoticeRelatedUser, ID);
        }

        public void DeleteDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser)
        {
            control.DeleteEntity(departNewsNoticeRelatedUser);
        }

        public IList GetAllDepartNewsNoticeRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}