using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReqStatusDAL
    {
        private EntityControl control;

        public ReqStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReqStatus(ReqStatus reqStatus)
        {
            control.AddEntity(reqStatus);
        }

        public void UpdateReqStatus(ReqStatus reqStatus, string Status)
        {
            control.UpdateEntity(reqStatus, Status);
        }

        public void DeleteReqStatus(ReqStatus reqStatus)
        {
            control.DeleteEntity(reqStatus);
        }

        public IList GetAllReqStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}