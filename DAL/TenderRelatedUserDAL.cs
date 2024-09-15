using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TenderRelatedUserDAL
    {
        private EntityControl control;

        public TenderRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTenderRelatedUser(TenderRelatedUser tenderRelatedUser)
        {
            control.AddEntity(tenderRelatedUser);
        }

        public void UpdateTenderRelatedUser(TenderRelatedUser tenderRelatedUser, int ID)
        {
            control.UpdateEntity(tenderRelatedUser, ID);
        }

        public void DeleteTenderRelatedUser(TenderRelatedUser tenderRelatedUser)
        {
            control.DeleteEntity(tenderRelatedUser);
        }

        public IList GetAllTenderRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}