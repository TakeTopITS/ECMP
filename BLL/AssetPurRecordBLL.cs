using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetPurRecordBLL
    {
        public void AddAssetPurRecord(AssetPurRecord assetPurRecord)
        {
            AssetPurRecordDAL dal = new AssetPurRecordDAL();
            dal.AddAssetPurRecord(assetPurRecord);
        }

        public void UpdateAssetPurRecord(AssetPurRecord assetPurRecord, int ID)
        {
            AssetPurRecordDAL dal = new AssetPurRecordDAL();
            dal.UpdateAssetPurRecord(assetPurRecord, ID);
        }

        public void DeleteAssetPurRecord(AssetPurRecord assetPurRecord)
        {
            AssetPurRecordDAL dal = new AssetPurRecordDAL();
            dal.DeleteAssetPurRecord(assetPurRecord);
        }

        public IList GetAllAssetPurRecords(string strHQL)
        {
            AssetPurRecordDAL dal = new AssetPurRecordDAL();
            return dal.GetAllAssetPurRecords(strHQL);
        }
    }
}