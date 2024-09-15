using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZMaterialZLDAL
    {
        private EntityControl control;

        public WZMaterialZLDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZMaterialZL(WZMaterialZL wZMaterialZL)
        {
            control.AddEntity(wZMaterialZL);
        }

        public void UpdateWZMaterialZL(WZMaterialZL wZMaterialZL, string strZLCode)
        {
            control.UpdateEntity(wZMaterialZL, strZLCode);
        }

        public void DeleteWZMaterialZL(WZMaterialZL wZMaterialZL)
        {
            control.DeleteEntity(wZMaterialZL);
        }

        public IList GetAllWZMaterialZLs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}