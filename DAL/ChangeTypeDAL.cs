using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ChangeTypeDAL
    {
        private EntityControl control;

        public ChangeTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddChangeType(ChangeType changeType)
        {
            control.AddEntity(changeType);
        }

        public void UpdateChangeType(ChangeType changeType, string Type)
        {
            control.UpdateEntity(changeType, Type);
        }

        public void DeleteChangeType(ChangeType changeType)
        {
            control.DeleteEntity(changeType);
        }

        public IList GetAllChangeTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}