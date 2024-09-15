using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractDAL
    {
        private EntityControl control;

        public ConstractDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstract(Constract constract)
        {
            control.AddEntity(constract);
        }

        public void UpdateConstract(Constract constract, int ConstractID)
        {
            control.UpdateEntity(constract, ConstractID);
        }

        public void DeleteConstract(Constract constract)
        {
            control.DeleteEntity(constract);
        }

        public IList GetAllConstracts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}