using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetPurRecordDAL
    {
        private EntityControl control;

        public AssetPurRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetPurRecord(AssetPurRecord assetPurRecord)
        {
            control.AddEntity(assetPurRecord);
        }

        public void UpdateAssetPurRecord(AssetPurRecord assetPurRecord, int ID)
        {
            control.UpdateEntity(assetPurRecord, ID);
        }

        public void DeleteAssetPurRecord(AssetPurRecord assetPurRecord)
        {
            control.DeleteEntity(assetPurRecord);
        }

        public IList GetAllAssetPurRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}