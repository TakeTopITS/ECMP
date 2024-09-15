using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetReturnOrderBLL
    {
        public void AddAssetReturnOrder(AssetReturnOrder assetReturnOrder)
        {
            AssetReturnOrderDAL dal = new AssetReturnOrderDAL();
            dal.AddAssetReturnOrder(assetReturnOrder);
        }

        public void UpdateAssetReturnOrder(AssetReturnOrder assetReturnOrder, int ROID)
        {
            AssetReturnOrderDAL dal = new AssetReturnOrderDAL();
            dal.UpdateAssetReturnOrder(assetReturnOrder, ROID);
        }

        public void DeleteAssetReturnOrder(AssetReturnOrder assetReturnOrder)
        {
            AssetReturnOrderDAL dal = new AssetReturnOrderDAL();
            dal.DeleteAssetReturnOrder(assetReturnOrder);
        }

        public IList GetAllAssetReturnOrders(string strHQL)
        {
            AssetReturnOrderDAL dal = new AssetReturnOrderDAL();
            return dal.GetAllAssetReturnOrders(strHQL);
        }
    }
}