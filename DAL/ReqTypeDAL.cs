using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReqTypeDAL
    {
        private EntityControl control;

        public ReqTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReqType(ReqType reqType)
        {
            control.AddEntity(reqType);
        }

        public void UpdateReqType(ReqType reqType, string Type)
        {
            control.UpdateEntity(reqType, Type);
        }

        public void DeleteReqType(ReqType reqType)
        {
            control.DeleteEntity(reqType);
        }

        public IList GetAllReqTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}