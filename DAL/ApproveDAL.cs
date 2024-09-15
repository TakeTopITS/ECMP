using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ApproveDAL
    {
        private EntityControl control;

        public ApproveDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddApprove(Approve approve)
        {
            control.AddEntity(approve);
        }

        public void UpdateApprove(Approve approve, int ID)
        {
            control.UpdateEntity(approve, ID);
        }

        public void DeleteApprove(Approve approve)
        {
            control.DeleteEntity(approve);
        }

        public IList GetAllApproves(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}