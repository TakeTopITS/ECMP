using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ApplicationSystem_YYUPBLL
    {
        public void AddApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP)
        {
            ApplicationSystem_YYUPDAL dal = new ApplicationSystem_YYUPDAL();
            dal.AddApplicationSystem_YYUP(applicationSystem_YYUP);
        }

        public void UpdateApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP, int ID)
        {
            ApplicationSystem_YYUPDAL dal = new ApplicationSystem_YYUPDAL();
            dal.UpdateApplicationSystem_YYUP(applicationSystem_YYUP, ID);
        }

        public void DeleteApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP)
        {
            ApplicationSystem_YYUPDAL dal = new ApplicationSystem_YYUPDAL();
            dal.DeleteApplicationSystem_YYUP(applicationSystem_YYUP);
        }

        public IList GetAllApplicationSystem_YYUPs(string strHQL)
        {
            ApplicationSystem_YYUPDAL dal = new ApplicationSystem_YYUPDAL();
            return dal.GetAllApplicationSystem_YYUPs(strHQL);
        }
    }
}