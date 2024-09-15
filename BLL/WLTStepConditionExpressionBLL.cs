using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WLTStepConditionExpressionBLL
    {
        public void AddWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression)
        {
            WLTStepConditionExpressionDAL dal = new WLTStepConditionExpressionDAL();
            dal.AddWLTStepConditionExpression(wlTStepConditionExpression);
        }

        public void UpdateWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression, int ID)
        {
            WLTStepConditionExpressionDAL dal = new WLTStepConditionExpressionDAL();
            dal.UpdateWLTStepConditionExpression(wlTStepConditionExpression, ID);
        }

        public void DeleteWLTStepConditionExpression(WLTStepConditionExpression wlTStepConditionExpression)
        {
            WLTStepConditionExpressionDAL dal = new WLTStepConditionExpressionDAL();
            dal.DeleteWLTStepConditionExpression(wlTStepConditionExpression);
        }

        public IList GetAllWLTStepConditionExpressions(string strHQL)
        {
            WLTStepConditionExpressionDAL dal = new WLTStepConditionExpressionDAL();
            return dal.GetAllWLTStepConditionExpressions(strHQL);
        }
    }
}