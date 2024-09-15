using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DataBaseSystem_YYUPDAL
    {
        private EntityControl control;

        public DataBaseSystem_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP)
        {
            control.AddEntity(dataBaseSystem_YYUP);
        }

        public void UpdateDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP, int ID)
        {
            control.UpdateEntity(dataBaseSystem_YYUP, ID);
        }

        public void DeleteDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP)
        {
            control.DeleteEntity(dataBaseSystem_YYUP);
        }

        public IList GetAllDataBaseSystem_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}