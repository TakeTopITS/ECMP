using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 采购申请
    /// </summary>
    public class BMPurchaseApplicationDAL
    {
        private EntityControl control;

        public BMPurchaseApplicationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication)
        {
            control.AddEntity(bMPurchaseApplication);
        }

        public void UpdateBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication, int ID)
        {
            control.UpdateEntity(bMPurchaseApplication, ID);
        }

        public void DeleteBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication)
        {
            control.DeleteEntity(bMPurchaseApplication);
        }

        public IList GetAllBMPurchaseApplications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}