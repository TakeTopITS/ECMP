using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SystemMDIStyleDAL
    {
        private EntityControl control;

        public SystemMDIStyleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSystemMDIStyle(SystemMDIStyle systemMDIStyle)
        {
            control.AddEntity(systemMDIStyle);
        }

        public void UpdateSystemMDIStyle(SystemMDIStyle systemMDIStyle, string MDIStyle)
        {
            control.UpdateEntity(systemMDIStyle, MDIStyle);
        }

        public void DeleteSystemMDIStyle(SystemMDIStyle systemMDIStyle)
        {
            control.DeleteEntity(systemMDIStyle);
        }

        public IList GetAllSystemMDIStyles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}