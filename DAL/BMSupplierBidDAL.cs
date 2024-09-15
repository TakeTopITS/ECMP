using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商投标
    /// </summary>
    public class BMSupplierBidDAL
    {
        private EntityControl control;

        public BMSupplierBidDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierBid(BMSupplierBid bMSupplierBid)
        {
            control.AddEntity(bMSupplierBid);
        }

        public void UpdateBMSupplierBid(BMSupplierBid bMSupplierBid, int ID)
        {
            control.UpdateEntity(bMSupplierBid, ID);
        }

        public void DeleteBMSupplierBid(BMSupplierBid bMSupplierBid)
        {
            control.DeleteEntity(bMSupplierBid);
        }

        public IList GetAllBMSupplierBids(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}