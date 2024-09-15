using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WFTStepRelatedTemDAL
    {
        private EntityControl control;

        public WFTStepRelatedTemDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem)
        {
            control.AddEntity(wfTStepRelatedTem);
        }

        public void UpdateWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem, int ID)
        {
            control.UpdateEntity(wfTStepRelatedTem, ID);
        }

        public void DeleteWFTStepRelatedTem(WFTStepRelatedTem wfTStepRelatedTem)
        {
            control.DeleteEntity(wfTStepRelatedTem);
        }

        public IList GetAllWFTStepRelatedTems(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}