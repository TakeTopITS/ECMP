using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ApplicationHardware_YYUPBLL
    {
        public void AddApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP)
        {
            ApplicationHardware_YYUPDAL dal = new ApplicationHardware_YYUPDAL();
            dal.AddApplicationHardware_YYUP(applicationHardware_YYUP);
        }

        public void UpdateApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP, int ID)
        {
            ApplicationHardware_YYUPDAL dal = new ApplicationHardware_YYUPDAL();
            dal.UpdateApplicationHardware_YYUP(applicationHardware_YYUP, ID);
        }

        public void DeleteApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP)
        {
            ApplicationHardware_YYUPDAL dal = new ApplicationHardware_YYUPDAL();
            dal.DeleteApplicationHardware_YYUP(applicationHardware_YYUP);
        }

        public IList GetAllApplicationHardware_YYUPs(string strHQL)
        {
            ApplicationHardware_YYUPDAL dal = new ApplicationHardware_YYUPDAL();
            return dal.GetAllApplicationHardware_YYUPs(strHQL);
        }
    }
}