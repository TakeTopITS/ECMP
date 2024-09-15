using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProExpenseDAL
    {
        private EntityControl control;

        public ProExpenseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProExpense(ProExpense proExpense)
        {
            control.AddEntity(proExpense);
        }

        public void UpdateProExpense(ProExpense proExpense, int ID)
        {
            control.UpdateEntity(proExpense, ID);
        }

        public void DeleteProExpense(ProExpense proExpense)
        {
            control.DeleteEntity(proExpense);
        }

        public IList GetAllProExpenses(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}