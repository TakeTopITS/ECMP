using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 应急预案编制
    /// </summary>
    public class HSEEmergencyCompileDAL
    {
        private EntityControl control;

        public HSEEmergencyCompileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile)
        {
            control.AddEntity(hSEEmergencyCompile);
        }

        public void UpdateHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile, string Code)
        {
            control.UpdateEntity(hSEEmergencyCompile, Code);
        }

        public void DeleteHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile)
        {
            control.DeleteEntity(hSEEmergencyCompile);
        }

        public IList GetAllHSEEmergencyCompiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}