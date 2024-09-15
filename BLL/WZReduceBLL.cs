using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZReduceBLL
    {
        public void AddWZReduce(WZReduce wZReduce)
        {
            WZReduceDAL dal = new WZReduceDAL();
            dal.AddWZReduce(wZReduce);
        }

        public void UpdateWZReduce(WZReduce wZReduce, string strReduceCode)
        {
            WZReduceDAL dal = new WZReduceDAL();
            dal.UpdateWZReduce(wZReduce, strReduceCode);
        }

        public void DeleteWZReduce(WZReduce wZReduce)
        {
            WZReduceDAL dal = new WZReduceDAL();
            dal.DeleteWZReduce(wZReduce);
        }

        public IList GetAllWZReduces(string strHQL)
        {
            WZReduceDAL dal = new WZReduceDAL();
            return dal.GetAllWZReduces(strHQL);
        }
    }
}