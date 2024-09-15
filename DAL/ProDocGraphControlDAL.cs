using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 项目文控类型
    /// </summary>
    public class ProDocGraphControlDAL
    {
        private EntityControl control;

        public ProDocGraphControlDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProDocGraphControl(ProDocGraphControl proDocGraphControl)
        {
            control.AddEntity(proDocGraphControl);
        }

        public void UpdateProDocGraphControl(ProDocGraphControl proDocGraphControl, int ID)
        {
            control.UpdateEntity(proDocGraphControl, ID);
        }

        public void DeleteProDocGraphControl(ProDocGraphControl proDocGraphControl)
        {
            control.DeleteEntity(proDocGraphControl);
        }

        public IList GetAllProDocGraphControls(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}