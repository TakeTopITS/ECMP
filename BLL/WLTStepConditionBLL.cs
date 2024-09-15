using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WLTStepConditionBLL
    {
        public void AddWLTStepCondition(WLTStepCondition wlTStepCondition)
        {
            WLTStepConditionDAL dal = new WLTStepConditionDAL();
            dal.AddWLTStepCondition(wlTStepCondition);
        }

        public void UpdateWLTStepCondition(WLTStepCondition wlTStepCondition, int ConID)
        {
            WLTStepConditionDAL dal = new WLTStepConditionDAL();
            dal.UpdateWLTStepCondition(wlTStepCondition, ConID);
        }

        public void DeleteWLTStepCondition(WLTStepCondition wlTStepCondition)
        {
            WLTStepConditionDAL dal = new WLTStepConditionDAL();
            dal.DeleteWLTStepCondition(wlTStepCondition);
        }

        public IList GetAllWLTStepConditions(string strHQL)
        {
            WLTStepConditionDAL dal = new WLTStepConditionDAL();
            return dal.GetAllWLTStepConditions(strHQL);
        }
    }
}