using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZMaterialDLDAL
    {
        private EntityControl control;

        public WZMaterialDLDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZMaterialDL(WZMaterialDL wZMaterialDL)
        {
            control.AddEntity(wZMaterialDL);
        }

        public void UpdateWZMaterialDL(WZMaterialDL wZMaterialDL, string strDLCode)
        {
            control.UpdateEntity(wZMaterialDL, strDLCode);
        }

        public void DeleteWZMaterialDL(WZMaterialDL wZMaterialDL)
        {
            control.DeleteEntity(wZMaterialDL);
        }

        public IList GetAllWZMaterialDLs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}