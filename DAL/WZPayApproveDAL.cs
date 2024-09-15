using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPayApproveDAL
    {
        private EntityControl control;

        public WZPayApproveDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPayApprove(WZPayApprove wZPayApprove)
        {
            control.AddEntity(wZPayApprove);
        }

        public void UpdateWZPayApprove(WZPayApprove wZPayApprove, int ID)
        {
            control.UpdateEntity(wZPayApprove, ID);
        }

        public void DeleteWZPayApprove(WZPayApprove wZPayApprove)
        {
            control.DeleteEntity(wZPayApprove);
        }

        public IList GetAllWZPayApproves(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}