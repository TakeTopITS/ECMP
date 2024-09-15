using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemMainPlanDetailDAL
    {
        private EntityControl control;

        public ItemMainPlanDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail)
        {
            control.AddEntity(itemMainPlanDetail);
        }

        public void UpdateItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail, int ID)
        {
            control.UpdateEntity(itemMainPlanDetail, ID);
        }

        public void DeleteItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail)
        {
            control.DeleteEntity(itemMainPlanDetail);
        }

        public IList GetAllItemMainPlanDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}