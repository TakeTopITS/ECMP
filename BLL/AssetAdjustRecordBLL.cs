using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetAdjustRecordBLL
    {
        public void AddAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord)
        {
            AssetAdjustRecordDAL dal = new AssetAdjustRecordDAL();
            dal.AddAssetAdjustRecord(assetAdjustRecord);
        }

        public void UpdateAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord, int ID)
        {
            AssetAdjustRecordDAL dal = new AssetAdjustRecordDAL();
            dal.UpdateAssetAdjustRecord(assetAdjustRecord, ID);
        }

        public void DeleteAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord)
        {
            AssetAdjustRecordDAL dal = new AssetAdjustRecordDAL();
            dal.DeleteAssetAdjustRecord(assetAdjustRecord);
        }

        public IList GetAllAssetAdjustRecords(string strHQL)
        {
            AssetAdjustRecordDAL dal = new AssetAdjustRecordDAL();
            return dal.GetAllAssetAdjustRecords(strHQL);
        }
    }
}