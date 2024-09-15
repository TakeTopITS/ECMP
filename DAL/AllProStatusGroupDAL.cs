using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AllProStatusGroupDAL
    {
        private EntityControl control;

        public AllProStatusGroupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAllProStatusGroup(AllProStatusGroup allProStatusGroup)
        {
            control.AddEntity(allProStatusGroup);
        }

        public void UpdateAllProStatusGroup(AllProStatusGroup allProStatusGroup, string Status)
        {
            control.UpdateEntity(allProStatusGroup, Status);
        }

        public void DeleteAllProStatusGroup(AllProStatusGroup allProStatusGroup)
        {
            control.DeleteEntity(allProStatusGroup);
        }

        public IList GetAllAllProStatusGroups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}