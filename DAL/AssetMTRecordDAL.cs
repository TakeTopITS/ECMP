using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetMTRecordDAL
    {
        private EntityControl control;

        public AssetMTRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetMTRecord(AssetMTRecord assetMTRecord)
        {
            control.AddEntity(assetMTRecord);
        }

        public void UpdateAssetMTRecord(AssetMTRecord assetMTRecord, int ID)
        {
            control.UpdateEntity(assetMTRecord, ID);
        }

        public void DeleteAssetMTRecord(AssetMTRecord assetMTRecord)
        {
            control.DeleteEntity(assetMTRecord);
        }

        public IList GetAllAssetMTRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}