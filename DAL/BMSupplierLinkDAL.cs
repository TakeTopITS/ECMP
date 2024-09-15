using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商联系人
    /// </summary>
    public class BMSupplierLinkDAL
    {
        private EntityControl control;

        public BMSupplierLinkDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierLink(BMSupplierLink bMSupplierLink)
        {
            control.AddEntity(bMSupplierLink);
        }

        public void UpdateBMSupplierLink(BMSupplierLink bMSupplierLink, int ID)
        {
            control.UpdateEntity(bMSupplierLink, ID);
        }

        public void DeleteBMSupplierLink(BMSupplierLink bMSupplierLink)
        {
            control.DeleteEntity(bMSupplierLink);
        }

        public IList GetAllBMSupplierLinks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}