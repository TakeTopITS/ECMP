using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ApplicationHardware_YYUPDAL
    {
        private EntityControl control;

        public ApplicationHardware_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP)
        {
            control.AddEntity(applicationHardware_YYUP);
        }

        public void UpdateApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP, int ID)
        {
            control.UpdateEntity(applicationHardware_YYUP, ID);
        }

        public void DeleteApplicationHardware_YYUP(ApplicationHardware_YYUP applicationHardware_YYUP)
        {
            control.DeleteEntity(applicationHardware_YYUP);
        }

        public IList GetAllApplicationHardware_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}