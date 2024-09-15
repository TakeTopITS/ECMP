using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetAdjustRecordDAL
    {
        private EntityControl control;

        public AssetAdjustRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord)
        {
            control.AddEntity(assetAdjustRecord);
        }

        public void UpdateAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord, int ID)
        {
            control.UpdateEntity(assetAdjustRecord, ID);
        }

        public void DeleteAssetAdjustRecord(AssetAdjustRecord assetAdjustRecord)
        {
            control.DeleteEntity(assetAdjustRecord);
        }

        public IList GetAllAssetAdjustRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}