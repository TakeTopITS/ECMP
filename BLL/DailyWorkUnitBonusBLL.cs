using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DailyWorkUnitBonusBLL
    {
        public void AddDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus)
        {
            DailyWorkUnitBonusDAL dal = new DailyWorkUnitBonusDAL();
            dal.AddDailyWorkUnitBonus(dailyWorkUnitBonus);
        }

        public void UpdateDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus, int ID)
        {
            DailyWorkUnitBonusDAL dal = new DailyWorkUnitBonusDAL();
            dal.UpdateDailyWorkUnitBonus(dailyWorkUnitBonus, ID);
        }

        public void DeleteDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus)
        {
            DailyWorkUnitBonusDAL dal = new DailyWorkUnitBonusDAL();
            dal.DeleteDailyWorkUnitBonus(dailyWorkUnitBonus);
        }

        public IList GetAllDailyWorkUnitBonuss(string strHQL)
        {
            DailyWorkUnitBonusDAL dal = new DailyWorkUnitBonusDAL();
            return dal.GetAllDailyWorkUnitBonuss(strHQL);
        }
    }
}