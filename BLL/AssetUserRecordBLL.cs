using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetUserRecordBLL
    {
        public void AddAssetUserRecord(AssetUserRecord assetUserRecord)
        {
            AssetUserRecordDAL dal = new AssetUserRecordDAL();
            dal.AddAssetUserRecord(assetUserRecord);
        }

        public void UpdateAssetUserRecord(AssetUserRecord assetUserRecord, int ID)
        {
            AssetUserRecordDAL dal = new AssetUserRecordDAL();
            dal.UpdateAssetUserRecord(assetUserRecord, ID);
        }

        public void DeleteAssetUserRecord(AssetUserRecord assetUserRecord)
        {
            AssetUserRecordDAL dal = new AssetUserRecordDAL();
            dal.DeleteAssetUserRecord(assetUserRecord);
        }

        public IList GetAllAssetUserRecords(string strHQL)
        {
            AssetUserRecordDAL dal = new AssetUserRecordDAL();
            return dal.GetAllAssetUserRecords(strHQL);
        }
    }
}