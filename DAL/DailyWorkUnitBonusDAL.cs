using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DailyWorkUnitBonusDAL
    {
        private EntityControl control;

        public DailyWorkUnitBonusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus)
        {
            control.AddEntity(dailyWorkUnitBonus);
        }

        public void UpdateDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus, int ID)
        {
            control.UpdateEntity(dailyWorkUnitBonus, ID);
        }

        public void DeleteDailyWorkUnitBonus(DailyWorkUnitBonus dailyWorkUnitBonus)
        {
            control.DeleteEntity(dailyWorkUnitBonus);
        }

        public IList GetAllDailyWorkUnitBonuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}