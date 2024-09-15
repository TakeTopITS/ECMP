using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RTXConfigDAL
    {
        private EntityControl control;

        public RTXConfigDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRTXConfig(RTXConfig rtxConfig)
        {
            control.AddEntity(rtxConfig);
        }

        public void UpdateRTXConfig(RTXConfig rtxConfig, string ServerIP)
        {
            control.UpdateEntity(rtxConfig, ServerIP);
        }

        public void DeleteRTXConfig(RTXConfig rtxConfig)
        {
            control.DeleteEntity(rtxConfig);
        }

        public IList GetAllRTXConfigs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}