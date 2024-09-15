using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetMTRecordBLL
    {
        public void AddAssetMTRecord(AssetMTRecord assetMTRecord)
        {
            AssetMTRecordDAL dal = new AssetMTRecordDAL();
            dal.AddAssetMTRecord(assetMTRecord);
        }

        public void UpdateAssetMTRecord(AssetMTRecord assetMTRecord, int ID)
        {
            AssetMTRecordDAL dal = new AssetMTRecordDAL();
            dal.UpdateAssetMTRecord(assetMTRecord, ID);
        }

        public void DeleteAssetMTRecord(AssetMTRecord assetMTRecord)
        {
            AssetMTRecordDAL dal = new AssetMTRecordDAL();
            dal.DeleteAssetMTRecord(assetMTRecord);
        }

        public IList GetAllAssetMTRecords(string strHQL)
        {
            AssetMTRecordDAL dal = new AssetMTRecordDAL();
            return dal.GetAllAssetMTRecords(strHQL);
        }
    }
}