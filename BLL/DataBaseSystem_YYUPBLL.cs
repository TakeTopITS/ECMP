using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DataBaseSystem_YYUPBLL
    {
        public void AddDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP)
        {
            DataBaseSystem_YYUPDAL dal = new DataBaseSystem_YYUPDAL();
            dal.AddDataBaseSystem_YYUP(dataBaseSystem_YYUP);
        }

        public void UpdateDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP, int ID)
        {
            DataBaseSystem_YYUPDAL dal = new DataBaseSystem_YYUPDAL();
            dal.UpdateDataBaseSystem_YYUP(dataBaseSystem_YYUP, ID);
        }

        public void DeleteDataBaseSystem_YYUP(DataBaseSystem_YYUP dataBaseSystem_YYUP)
        {
            DataBaseSystem_YYUPDAL dal = new DataBaseSystem_YYUPDAL();
            dal.DeleteDataBaseSystem_YYUP(dataBaseSystem_YYUP);
        }

        public IList GetAllDataBaseSystem_YYUPs(string strHQL)
        {
            DataBaseSystem_YYUPDAL dal = new DataBaseSystem_YYUPDAL();
            return dal.GetAllDataBaseSystem_YYUPs(strHQL);
        }
    }
}