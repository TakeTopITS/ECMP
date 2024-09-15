using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class U8Problem_YYUPBLL
    {
        public void AddU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP)
        {
            U8Problem_YYUPDAL dal = new U8Problem_YYUPDAL();
            dal.AddU8Problem_YYUP(u8Problem_YYUP);
        }

        public void UpdateU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP, int ID)
        {
            U8Problem_YYUPDAL dal = new U8Problem_YYUPDAL();
            dal.UpdateU8Problem_YYUP(u8Problem_YYUP, ID);
        }

        public void DeleteU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP)
        {
            U8Problem_YYUPDAL dal = new U8Problem_YYUPDAL();
            dal.DeleteU8Problem_YYUP(u8Problem_YYUP);
        }

        public IList GetAllU8Problem_YYUPs(string strHQL)
        {
            U8Problem_YYUPDAL dal = new U8Problem_YYUPDAL();
            return dal.GetAllU8Problem_YYUPs(strHQL);
        }
    }
}