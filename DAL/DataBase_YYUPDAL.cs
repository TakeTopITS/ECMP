using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DataBase_YYUPDAL
    {
        private EntityControl control;

        public DataBase_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDataBase_YYUP(DataBase_YYUP dataBase_YYUP)
        {
            control.AddEntity(dataBase_YYUP);
        }

        public void UpdateDataBase_YYUP(DataBase_YYUP dataBase_YYUP, int ID)
        {
            control.UpdateEntity(dataBase_YYUP, ID);
        }

        public void DeleteDataBase_YYUP(DataBase_YYUP dataBase_YYUP)
        {
            control.DeleteEntity(dataBase_YYUP);
        }

        public IList GetAllDataBase_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}