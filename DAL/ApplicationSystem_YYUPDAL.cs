using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ApplicationSystem_YYUPDAL
    {
        private EntityControl control;

        public ApplicationSystem_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP)
        {
            control.AddEntity(applicationSystem_YYUP);
        }

        public void UpdateApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP, int ID)
        {
            control.UpdateEntity(applicationSystem_YYUP, ID);
        }

        public void DeleteApplicationSystem_YYUP(ApplicationSystem_YYUP applicationSystem_YYUP)
        {
            control.DeleteEntity(applicationSystem_YYUP);
        }

        public IList GetAllApplicationSystem_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}