using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 应急预案演练
    /// </summary>
    public class HSEEmergencyRehearseBLL
    {
        public void AddHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse)
        {
            HSEEmergencyRehearseDAL dal = new HSEEmergencyRehearseDAL();
            dal.AddHSEEmergencyRehearse(hSEEmergencyRehearse);
        }

        public void UpdateHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse, string Code)
        {
            HSEEmergencyRehearseDAL dal = new HSEEmergencyRehearseDAL();
            dal.UpdateHSEEmergencyRehearse(hSEEmergencyRehearse, Code);
        }

        public void DeleteHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse)
        {
            HSEEmergencyRehearseDAL dal = new HSEEmergencyRehearseDAL();
            dal.DeleteHSEEmergencyRehearse(hSEEmergencyRehearse);
        }

        public IList GetAllHSEEmergencyRehearses(string strHQL)
        {
            HSEEmergencyRehearseDAL dal = new HSEEmergencyRehearseDAL();
            return dal.GetAllHSEEmergencyRehearses(strHQL);
        }
    }
}