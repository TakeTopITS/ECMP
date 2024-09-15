using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetApplicationReportDAL
    {
        private EntityControl control;

        public AssetApplicationReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetApplicationReport(AssetApplicationReport assetApplicationReport)
        {
            control.AddEntity(assetApplicationReport);
        }

        public void UpdateAssetApplicationReport(AssetApplicationReport assetApplicationReport, int ID)
        {
            control.UpdateEntity(assetApplicationReport, ID);
        }

        public void DeleteAssetApplicationReport(AssetApplicationReport assetApplicationReport)
        {
            control.DeleteEntity(assetApplicationReport);
        }

        public IList GetAllAssetApplicationReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}