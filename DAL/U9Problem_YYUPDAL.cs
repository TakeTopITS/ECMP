using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class U9Problem_YYUPDAL
    {
        private EntityControl control;

        public U9Problem_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP)
        {
            control.AddEntity(u9Problem_YYUP);
        }

        public void UpdateU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP, int ID)
        {
            control.UpdateEntity(u9Problem_YYUP, ID);
        }

        public void DeleteU9Problem_YYUP(U9Problem_YYUP u9Problem_YYUP)
        {
            control.DeleteEntity(u9Problem_YYUP);
        }

        public IList GetAllU9Problem_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}