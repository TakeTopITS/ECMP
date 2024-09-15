using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseFileDAL
    {
        private EntityControl control;

        public WZPurchaseFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseFile(WZPurchaseFile wZPurchaseFile)
        {
            control.AddEntity(wZPurchaseFile);
        }

        public void UpdateWZPurchaseFile(WZPurchaseFile wZPurchaseFile, int ID)
        {
            control.UpdateEntity(wZPurchaseFile, ID);
        }

        public void DeleteWZPurchaseFile(WZPurchaseFile wZPurchaseFile)
        {
            control.DeleteEntity(wZPurchaseFile);
        }

        public IList GetAllWZPurchaseFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}