using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RTXConfigBLL
    {
        public void AddRTXConfig(RTXConfig rtxConfig)
        {
            RTXConfigDAL dal = new RTXConfigDAL();
            dal.AddRTXConfig(rtxConfig);
        }

        public void UpdateRTXConfig(RTXConfig rtxConfig, string ServerIP)
        {
            RTXConfigDAL dal = new RTXConfigDAL();
            dal.UpdateRTXConfig(rtxConfig, ServerIP);
        }

        public void DeleteRTXConfig(RTXConfig rtxConfig)
        {
            RTXConfigDAL dal = new RTXConfigDAL();
            dal.DeleteRTXConfig(rtxConfig);
        }

        public IList GetAllRTXConfigs(string strHQL)
        {
            RTXConfigDAL dal = new RTXConfigDAL();
            return dal.GetAllRTXConfigs(strHQL);
        }
    }
}