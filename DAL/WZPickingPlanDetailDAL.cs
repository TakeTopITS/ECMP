using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPickingPlanDetailDAL
    {
        private EntityControl control;

        public WZPickingPlanDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail)
        {
            control.AddEntity(wZPickingPlanDetail);
        }

        public void UpdateWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail, int ID)
        {
            control.UpdateEntity(wZPickingPlanDetail, ID);
        }

        public void DeleteWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail)
        {
            control.DeleteEntity(wZPickingPlanDetail);
        }

        public IList GetAllWZPickingPlanDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}