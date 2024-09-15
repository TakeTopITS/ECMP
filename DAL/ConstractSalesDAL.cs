using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractSalesDAL
    {
        private EntityControl control;

        public ConstractSalesDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractSales(ConstractSales constractSales)
        {
            control.AddEntity(constractSales);
        }

        public void UpdateConstractSales(ConstractSales constractSales, int GroupID)
        {
            control.UpdateEntity(constractSales, GroupID);
        }

        public void DeleteConstractSales(ConstractSales constractSales)
        {
            control.DeleteEntity(constractSales);
        }

        public IList GetAllConstractSaless(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}