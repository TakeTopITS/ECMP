using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetShipmentDetailBLL
    {
        public void AddAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail)
        {
            AssetShipmentDetailDAL dal = new AssetShipmentDetailDAL();
            dal.AddAssetShipmentDetail(assetShipmentDetail);
        }

        public void UpdateAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail, int ID)
        {
            AssetShipmentDetailDAL dal = new AssetShipmentDetailDAL();
            dal.UpdateAssetShipmentDetail(assetShipmentDetail, ID);
        }

        public void DeleteAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail)
        {
            AssetShipmentDetailDAL dal = new AssetShipmentDetailDAL();
            dal.DeleteAssetShipmentDetail(assetShipmentDetail);
        }

        public IList GetAllAssetShipmentDetails(string strHQL)
        {
            AssetShipmentDetailDAL dal = new AssetShipmentDetailDAL();
            return dal.GetAllAssetShipmentDetails(strHQL);
        }
    }
}