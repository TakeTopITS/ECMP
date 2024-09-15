using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 应急预案演练
    /// </summary>
    public class HSEEmergencyRehearseDAL
    {
        private EntityControl control;

        public HSEEmergencyRehearseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse)
        {
            control.AddEntity(hSEEmergencyRehearse);
        }

        public void UpdateHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse, string Code)
        {
            control.UpdateEntity(hSEEmergencyRehearse, Code);
        }

        public void DeleteHSEEmergencyRehearse(HSEEmergencyRehearse hSEEmergencyRehearse)
        {
            control.DeleteEntity(hSEEmergencyRehearse);
        }

        public IList GetAllHSEEmergencyRehearses(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}