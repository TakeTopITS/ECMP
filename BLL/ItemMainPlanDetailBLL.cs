using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemMainPlanDetailBLL
    {
        public void AddItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail)
        {
            ItemMainPlanDetailDAL dal = new ItemMainPlanDetailDAL();
            dal.AddItemMainPlanDetail(itemMainPlanDetail);
        }

        public void UpdateItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail, int ID)
        {
            ItemMainPlanDetailDAL dal = new ItemMainPlanDetailDAL();
            dal.UpdateItemMainPlanDetail(itemMainPlanDetail, ID);
        }

        public void DeleteItemMainPlanDetail(ItemMainPlanDetail itemMainPlanDetail)
        {
            ItemMainPlanDetailDAL dal = new ItemMainPlanDetailDAL();
            dal.DeleteItemMainPlanDetail(itemMainPlanDetail);
        }

        public IList GetAllItemMainPlanDetails(string strHQL)
        {
            ItemMainPlanDetailDAL dal = new ItemMainPlanDetailDAL();
            return dal.GetAllItemMainPlanDetails(strHQL);
        }
    }
}