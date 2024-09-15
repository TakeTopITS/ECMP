using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetApplicationReportBLL
    {
        public void AddAssetApplicationReport(AssetApplicationReport assetApplicationReport)
        {
            AssetApplicationReportDAL dal = new AssetApplicationReportDAL();
            dal.AddAssetApplicationReport(assetApplicationReport);
        }

        public void UpdateAssetApplicationReport(AssetApplicationReport assetApplicationReport, int ID)
        {
            AssetApplicationReportDAL dal = new AssetApplicationReportDAL();
            dal.UpdateAssetApplicationReport(assetApplicationReport, ID);
        }

        public void DeleteAssetApplicationReport(AssetApplicationReport assetApplicationReport)
        {
            AssetApplicationReportDAL dal = new AssetApplicationReportDAL();
            dal.DeleteAssetApplicationReport(assetApplicationReport);
        }

        public IList GetAllAssetApplicationReports(string strHQL)
        {
            AssetApplicationReportDAL dal = new AssetApplicationReportDAL();
            return dal.GetAllAssetApplicationReports(strHQL);
        }
    }
}