using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractReceivablesBLL
    {
        public void AddConstractReceivables(ConstractReceivables constractReceivables)
        {
            ConstractReceivablesDAL dal = new ConstractReceivablesDAL();
            dal.AddConstractReceivables(constractReceivables);
        }

        public void UpdateConstractReceivables(ConstractReceivables constractReceivables, int ID)
        {
            ConstractReceivablesDAL dal = new ConstractReceivablesDAL();
            dal.UpdateConstractReceivables(constractReceivables, ID);
        }

        public void DeleteConstractReceivables(ConstractReceivables constractReceivables)
        {
            ConstractReceivablesDAL dal = new ConstractReceivablesDAL();
            dal.DeleteConstractReceivables(constractReceivables);
        }

        public IList GetAllConstractReceivabless(string strHQL)
        {
            ConstractReceivablesDAL dal = new ConstractReceivablesDAL();
            return dal.GetAllConstractReceivabless(strHQL);
        }
    }
}