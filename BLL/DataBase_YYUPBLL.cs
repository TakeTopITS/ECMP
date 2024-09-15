using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DataBase_YYUPBLL
    {
        public void AddDataBase_YYUP(DataBase_YYUP dataBase_YYUP)
        {
            DataBase_YYUPDAL dal = new DataBase_YYUPDAL();
            dal.AddDataBase_YYUP(dataBase_YYUP);
        }

        public void UpdateDataBase_YYUP(DataBase_YYUP dataBase_YYUP, int ID)
        {
            DataBase_YYUPDAL dal = new DataBase_YYUPDAL();
            dal.UpdateDataBase_YYUP(dataBase_YYUP, ID);
        }

        public void DeleteDataBase_YYUP(DataBase_YYUP dataBase_YYUP)
        {
            DataBase_YYUPDAL dal = new DataBase_YYUPDAL();
            dal.DeleteDataBase_YYUP(dataBase_YYUP);
        }

        public IList GetAllDataBase_YYUPs(string strHQL)
        {
            DataBase_YYUPDAL dal = new DataBase_YYUPDAL();
            return dal.GetAllDataBase_YYUPs(strHQL);
        }
    }
}