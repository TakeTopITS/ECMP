using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DataBaseHardware_YYUPBLL
    {
        public void AddDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP)
        {
            DataBaseHardware_YYUPDAL dal = new DataBaseHardware_YYUPDAL();
            dal.AddDataBaseHardware_YYUP(dataBaseHardware_YYUP);
        }

        public void UpdateDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP, int ID)
        {
            DataBaseHardware_YYUPDAL dal = new DataBaseHardware_YYUPDAL();
            dal.UpdateDataBaseHardware_YYUP(dataBaseHardware_YYUP, ID);
        }

        public void DeleteDataBaseHardware_YYUP(DataBaseHardware_YYUP dataBaseHardware_YYUP)
        {
            DataBaseHardware_YYUPDAL dal = new DataBaseHardware_YYUPDAL();
            dal.DeleteDataBaseHardware_YYUP(dataBaseHardware_YYUP);
        }

        public IList GetAllDataBaseHardware_YYUPs(string strHQL)
        {
            DataBaseHardware_YYUPDAL dal = new DataBaseHardware_YYUPDAL();
            return dal.GetAllDataBaseHardware_YYUPs(strHQL);
        }
    }
}