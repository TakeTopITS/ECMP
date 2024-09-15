using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class JNUnitBLL
    {
        public void AddJNUnit(JNUnit jnUnit)
        {
            JNUnitDAL dal = new JNUnitDAL();
            dal.AddJNUnit(jnUnit);
        }

        public void UpdateJNUnit(JNUnit jnUnit, string UnitName)
        {
            JNUnitDAL dal = new JNUnitDAL();
            dal.UpdateJNUnit(jnUnit, UnitName);
        }

        public void DeleteJNUnit(JNUnit jnUnit)
        {
            JNUnitDAL dal = new JNUnitDAL();
            dal.DeleteJNUnit(jnUnit);
        }

        public IList GetAllJNUnits(string strHQL)
        {
            JNUnitDAL dal = new JNUnitDAL();
            return dal.GetAllJNUnits(strHQL);
        }
    }
}