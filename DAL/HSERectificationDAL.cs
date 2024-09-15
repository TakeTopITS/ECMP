using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 安全隐患整改
    /// </summary>
    public class HSERectificationDAL
    {
        private EntityControl control;

        public HSERectificationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSERectification(HSERectification hSERectification)
        {
            control.AddEntity(hSERectification);
        }

        public void UpdateHSERectification(HSERectification hSERectification, string Code)
        {
            control.UpdateEntity(hSERectification, Code);
        }

        public void DeleteHSERectification(HSERectification hSERectification)
        {
            control.DeleteEntity(hSERectification);
        }

        public IList GetAllHSERectifications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}