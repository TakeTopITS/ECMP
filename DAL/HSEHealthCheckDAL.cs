using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEHealthCheckDAL
    {
        private EntityControl control;

        public HSEHealthCheckDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEHealthCheck(HSEHealthCheck hSEHealthCheck)
        {
            control.AddEntity(hSEHealthCheck);
        }

        public void UpdateHSEHealthCheck(HSEHealthCheck hSEHealthCheck, string Code)
        {
            control.UpdateEntity(hSEHealthCheck, Code);
        }

        public void DeleteHSEHealthCheck(HSEHealthCheck hSEHealthCheck)
        {
            control.DeleteEntity(hSEHealthCheck);
        }

        public IList GetAllHSEHealthChecks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}