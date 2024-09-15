using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZMaterialXLDAL
    {
        private EntityControl control;

        public WZMaterialXLDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZMaterialXL(WZMaterialXL wZMaterialXL)
        {
            control.AddEntity(wZMaterialXL);
        }

        public void UpdateWZMaterialXL(WZMaterialXL wZMaterialXL, string strXLCode)
        {
            control.UpdateEntity(wZMaterialXL, strXLCode);
        }

        public void DeleteWZMaterialXL(WZMaterialXL wZMaterialXL)
        {
            control.DeleteEntity(wZMaterialXL);
        }

        public IList GetAllWZMaterialXLs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}