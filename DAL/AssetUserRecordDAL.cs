using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetUserRecordDAL
    {
        private EntityControl control;

        public AssetUserRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetUserRecord(AssetUserRecord assetPurRecord)
        {
            control.AddEntity(assetPurRecord);
        }

        public void UpdateAssetUserRecord(AssetUserRecord assetPurRecord, int ID)
        {
            control.UpdateEntity(assetPurRecord, ID);
        }

        public void DeleteAssetUserRecord(AssetUserRecord assetPurRecord)
        {
            control.DeleteEntity(assetPurRecord);
        }

        public IList GetAllAssetUserRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}