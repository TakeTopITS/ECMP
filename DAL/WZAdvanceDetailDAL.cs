using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZAdvanceDetailDAL
    {
        private EntityControl control;

        public WZAdvanceDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail)
        {
            control.AddEntity(wZAdvanceDetail);
        }

        public void UpdateWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail, int ID)
        {
            control.UpdateEntity(wZAdvanceDetail, ID);
        }

        public void DeleteWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail)
        {
            control.DeleteEntity(wZAdvanceDetail);
        }

        public IList GetAllWZAdvanceDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}