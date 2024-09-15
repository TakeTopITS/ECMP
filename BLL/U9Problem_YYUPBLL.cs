using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class U9Problem_YYUPBLL
    {
        public void AddU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP)
        {
            U9Problem_YYUPDAL dal = new U9Problem_YYUPDAL();
            dal.AddU9Problem_YYUP(u9Problem_YYUP);
        }

        public void UpdateU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP, int ID)
        {
            U9Problem_YYUPDAL dal = new U9Problem_YYUPDAL();
            dal.UpdateU9Problem_YYUP(u9Problem_YYUP, ID);
        }

        public void DeleteU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP)
        {
            U9Problem_YYUPDAL dal = new U9Problem_YYUPDAL();
            dal.DeleteU9Problem_YYUP(u9Problem_YYUP);
        }

        public IList GetAllU9Problem_YYUPs(string strHQL)
        {
            U9Problem_YYUPDAL dal = new U9Problem_YYUPDAL();
            return dal.GetAllU9Problem_YYUPs(strHQL);
        }
    }
}