using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProStatusGroupDAL
    {
        private EntityControl control;

        public ProStatusGroupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProStatusGroup(ProStatusGroup proStatusGroup)
        {
            control.AddEntity(proStatusGroup);
        }

        public void UpdateProStatusGroup(ProStatusGroup proStatusGroup, string Status)
        {
            control.UpdateEntity(proStatusGroup, Status);
        }

        public void DeleteProStatusGroup(ProStatusGroup proStatusGroup)
        {
            control.DeleteEntity(proStatusGroup);
        }

        public IList GetAllProStatusGroups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}