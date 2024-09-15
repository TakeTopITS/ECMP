using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractPayableVisaDAL
    {
        private EntityControl control;

        public ConstractPayableVisaDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractPayableVisa(ConstractPayableVisa constractPayableVisa)
        {
            control.AddEntity(constractPayableVisa);
        }

        public void UpdateConstractPayableVisa(ConstractPayableVisa constractPayableVisa, int ID)
        {
            control.UpdateEntity(constractPayableVisa, ID);
        }

        public void DeleteConstractPayableVisa(ConstractPayableVisa constractPayableVisa)
        {
            control.DeleteEntity(constractPayableVisa);
        }

        public IList GetAllConstractPayableVisas(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}