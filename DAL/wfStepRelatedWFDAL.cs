using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WFStepRelatedWFDAL
    {
        private EntityControl control;

        public WFStepRelatedWFDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF)
        {
            control.AddEntity(wfStepRelatedWF);
        }

        public void UpdateWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF, int ID)
        {
            control.UpdateEntity(wfStepRelatedWF, ID);
        }

        public void DeleteWFStepRelatedWF(WFStepRelatedWF wfStepRelatedWF)
        {
            control.DeleteEntity(wfStepRelatedWF);
        }

        public IList GetAllWFStepRelatedWFs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}