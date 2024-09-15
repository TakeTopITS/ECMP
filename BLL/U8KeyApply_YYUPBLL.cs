using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class U8KeyApply_YYUPBLL
    {
        public void AddU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP)
        {
            U8KeyApply_YYUPDAL dal = new U8KeyApply_YYUPDAL();
            dal.AddU8KeyApply_YYUP(u8KeyApply_YYUP);
        }

        public void UpdateU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP, int ID)
        {
            U8KeyApply_YYUPDAL dal = new U8KeyApply_YYUPDAL();
            dal.UpdateU8KeyApply_YYUP(u8KeyApply_YYUP, ID);
        }

        public void DeleteU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP)
        {
            U8KeyApply_YYUPDAL dal = new U8KeyApply_YYUPDAL();
            dal.DeleteU8KeyApply_YYUP(u8KeyApply_YYUP);
        }

        public IList GetAllU8KeyApply_YYUPs(string strHQL)
        {
            U8KeyApply_YYUPDAL dal = new U8KeyApply_YYUPDAL();
            return dal.GetAllU8KeyApply_YYUPs(strHQL);
        }
    }
}