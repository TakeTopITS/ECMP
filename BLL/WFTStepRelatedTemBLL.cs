using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WFTStepRelatedTemBLL
    {
        public void AddWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem)
        {
            WFTStepRelatedTemDAL dal = new WFTStepRelatedTemDAL();
            dal.AddWFTStepRelatedTem(wfTStepRelatedTem);
        }

        public void UpdateWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem, int ID)
        {
            WFTStepRelatedTemDAL dal = new WFTStepRelatedTemDAL();
            dal.UpdateWFTStepRelatedTem(wfTStepRelatedTem, ID);
        }

        public void DeleteWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem)
        {
            WFTStepRelatedTemDAL dal = new WFTStepRelatedTemDAL();
            dal.DeleteWFTStepRelatedTem(wfTStepRelatedTem);
        }

        public IList GetAllWFTStepRelatedTems(string strHQL)
        {
            WFTStepRelatedTemDAL dal = new WFTStepRelatedTemDAL();
            return dal.GetAllWFTStepRelatedTems(strHQL);
        }
    }
}