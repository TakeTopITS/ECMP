using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DataBaseHardware_YYUPDAL
    {
        private EntityControl control;

        public DataBaseHardware_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP)
        {
            control.AddEntity(dataBaseHardware_YYUP);
        }

        public void UpdateDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP, int ID)
        {
            control.UpdateEntity(dataBaseHardware_YYUP, ID);
        }

        public void DeleteDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP)
        {
            control.DeleteEntity(dataBaseHardware_YYUP);
        }

        public IList GetAllDataBaseHardware_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}