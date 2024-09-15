using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DayHourNumDAL
    {
        private EntityControl control;

        public DayHourNumDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDayHourNum(DayHourNum dayHourNum)
        {
            control.AddEntity(dayHourNum);
        }

        public void UpdateDayHourNum(DayHourNum dayHourNum, int ID)
        {
            control.UpdateEntity(dayHourNum, ID);
        }

        public void DeleteDayHourNum(DayHourNum dayHourNum)
        {
            control.DeleteEntity(dayHourNum);
        }

        public IList GetAllDayHourNums(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}