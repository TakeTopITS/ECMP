using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedProjectLeaderDAL
    {
        private EntityControl control;

        public DepartRelatedProjectLeaderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader)
        {
            control.AddEntity(departRelatedProjectLeader);
        }

        public void UpdateDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader, int ID)
        {
            control.UpdateEntity(departRelatedProjectLeader, ID);
        }

        public void DeleteDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader)
        {
            control.DeleteEntity(departRelatedProjectLeader);
        }

        public IList GetAllDepartRelatedProjectLeaders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}