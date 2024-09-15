using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class VendorRelatedGoodsInforDAL
    {
        private EntityControl control;

        public VendorRelatedGoodsInforDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddVendorRelatedGoodsInfor(VendorRelatedGoodsInfor constractRelatedGoods)
        {
            control.AddEntity(constractRelatedGoods);
        }

        public void UpdateVendorRelatedGoodsInfor(VendorRelatedGoodsInfor constractRelatedGoods, int ID)
        {
            control.UpdateEntity(constractRelatedGoods, ID);
        }

        public void DeleteVendorRelatedGoodsInfor(VendorRelatedGoodsInfor constractRelatedGoods)
        {
            control.DeleteEntity(constractRelatedGoods);
        }

        public IList GetAllVendorRelatedGoodsInfors(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}