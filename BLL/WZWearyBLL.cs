using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZWearyBLL
    {
        public void AddWZWeary(WZWeary wZWeary)
        {
            WZWearyDAL dal = new WZWearyDAL();
            dal.AddWZWeary(wZWeary);
        }

        public void UpdateWZWeary(WZWeary wZWeary, string strWearyCode)
        {
            WZWearyDAL dal = new WZWearyDAL();
            dal.UpdateWZWeary(wZWeary, strWearyCode);
        }

        public void DeleteWZWeary(WZWeary wZWeary)
        {
            WZWearyDAL dal = new WZWearyDAL();
            dal.DeleteWZWeary(wZWeary);
        }

        public IList GetAllWZWearys(string strHQL)
        {
            WZWearyDAL dal = new WZWearyDAL();
            return dal.GetAllWZWearys(strHQL);
        }
    }
}