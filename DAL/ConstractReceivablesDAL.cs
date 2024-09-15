using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractReceivablesDAL
    {
        private EntityControl control;

        public ConstractReceivablesDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractReceivables(ConstractReceivables constractReceivables)
        {
            control.AddEntity(constractReceivables);
        }

        public void UpdateConstractReceivables(ConstractReceivables constractReceivables, int ID)
        {
            control.UpdateEntity(constractReceivables, ID);
        }

        public void DeleteConstractReceivables(ConstractReceivables constractReceivables)
        {
            control.DeleteEntity(constractReceivables);
        }

        public IList GetAllConstractReceivabless(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}