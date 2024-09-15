using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WFStepRelatedWFBLL
    {
        public void AddWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF)
        {
            WFStepRelatedWFDAL dal = new WFStepRelatedWFDAL();
            dal.AddWFStepRelatedWF(wfStepRelatedWF);
        }

        public void UpdateWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF, int ID)
        {
            WFStepRelatedWFDAL dal = new WFStepRelatedWFDAL();
            dal.UpdateWFStepRelatedWF(wfStepRelatedWF, ID);
        }

        public void DeleteWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF)
        {
            WFStepRelatedWFDAL dal = new WFStepRelatedWFDAL();
            dal.DeleteWFStepRelatedWF(wfStepRelatedWF);
        }

        public IList GetAllWFStepRelatedWFs(string strHQL)
        {
            WFStepRelatedWFDAL dal = new WFStepRelatedWFDAL();
            return dal.GetAllWFStepRelatedWFs(strHQL);
        }
    }
}