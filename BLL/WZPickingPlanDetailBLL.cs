using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPickingPlanDetailBLL
    {
        public void AddWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail)
        {
            WZPickingPlanDetailDAL dal = new WZPickingPlanDetailDAL();
            dal.AddWZPickingPlanDetail(wZPickingPlanDetail);
        }

        public void UpdateWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail, int ID)
        {
            WZPickingPlanDetailDAL dal = new WZPickingPlanDetailDAL();
            dal.UpdateWZPickingPlanDetail(wZPickingPlanDetail, ID);
        }

        public void DeleteWZPickingPlanDetail(WZPickingPlanDetail wZPickingPlanDetail)
        {
            WZPickingPlanDetailDAL dal = new WZPickingPlanDetailDAL();
            dal.DeleteWZPickingPlanDetail(wZPickingPlanDetail);
        }

        public IList GetAllWZPickingPlanDetails(string strHQL)
        {
            WZPickingPlanDetailDAL dal = new WZPickingPlanDetailDAL();
            return dal.GetAllWZPickingPlanDetails(strHQL);
        }
    }
}