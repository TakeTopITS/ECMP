using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class U8KeyApply_YYUPDAL
    {
        private EntityControl control;

        public U8KeyApply_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP)
        {
            control.AddEntity(u8KeyApply_YYUP);
        }

        public void UpdateU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP, int ID)
        {
            control.UpdateEntity(u8KeyApply_YYUP, ID);
        }

        public void DeleteU8KeyApply_YYUP(U8KeyApply_YYUP u8KeyApply_YYUP)
        {
            control.DeleteEntity(u8KeyApply_YYUP);
        }

        public IList GetAllU8KeyApply_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}