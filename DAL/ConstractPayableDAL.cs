using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractPayableDAL
    {
        private EntityControl control;

        public ConstractPayableDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractPayable(ConstractPayable constractPayable)
        {
            control.AddEntity(constractPayable);
        }

        public void UpdateConstractPayable(ConstractPayable constractPayable, int ID)
        {
            control.UpdateEntity(constractPayable, ID);
        }

        public void DeleteConstractPayable(ConstractPayable constractPayable)
        {
            control.DeleteEntity(constractPayable);
        }

        public IList GetAllConstractPayables(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}