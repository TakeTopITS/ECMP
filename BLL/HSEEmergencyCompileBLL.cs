using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 应急预案编制
    /// </summary>
    public class HSEEmergencyCompileBLL
    {
        public void AddHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile)
        {
            HSEEmergencyCompileDAL dal = new HSEEmergencyCompileDAL();
            dal.AddHSEEmergencyCompile(hSEEmergencyCompile);
        }

        public void UpdateHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile, string Code)
        {
            HSEEmergencyCompileDAL dal = new HSEEmergencyCompileDAL();
            dal.UpdateHSEEmergencyCompile(hSEEmergencyCompile, Code);
        }

        public void DeleteHSEEmergencyCompile(HSEEmergencyCompile hSEEmergencyCompile)
        {
            HSEEmergencyCompileDAL dal = new HSEEmergencyCompileDAL();
            dal.DeleteHSEEmergencyCompile(hSEEmergencyCompile);
        }

        public IList GetAllHSEEmergencyCompiles(string strHQL)
        {
            HSEEmergencyCompileDAL dal = new HSEEmergencyCompileDAL();
            return dal.GetAllHSEEmergencyCompiles(strHQL);
        }
    }
}