using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZReduceDAL
    {
        private EntityControl control;

        public WZReduceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZReduce(WZReduce wZReduce)
        {
            control.AddEntity(wZReduce);
        }

        public void UpdateWZReduce(WZReduce wZReduce, string strReduceCode)
        {
            control.UpdateEntity(wZReduce, strReduceCode);
        }

        public void DeleteWZReduce(WZReduce wZReduce)
        {
            control.DeleteEntity(wZReduce);
        }

        public IList GetAllWZReduces(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}