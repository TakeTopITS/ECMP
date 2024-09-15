using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPayDetailDAL
    {
        private EntityControl control;

        public WZPayDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPayDetail(WZPayDetail wZPayDetail)
        {
            control.AddEntity(wZPayDetail);
        }

        public void UpdateWZPayDetail(WZPayDetail wZPayDetail, int ID)
        {
            control.UpdateEntity(wZPayDetail, ID);
        }

        public void DeleteWZPayDetail(WZPayDetail wZPayDetail)
        {
            control.DeleteEntity(wZPayDetail);
        }

        public IList GetAllWZPayDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}