using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class U8Problem_YYUPDAL
    {
        private EntityControl control;

        public U8Problem_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP)
        {
            control.AddEntity(u8Problem_YYUP);
        }

        public void UpdateU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP, int ID)
        {
            control.UpdateEntity(u8Problem_YYUP, ID);
        }

        public void DeleteU8Problem_YYUP(U8Problem_YYUP u8Problem_YYUP)
        {
            control.DeleteEntity(u8Problem_YYUP);
        }

        public IList GetAllU8Problem_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}