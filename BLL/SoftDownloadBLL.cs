using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SoftDownloadBLL
    {
        public void AddSoftDownload(SoftDownload softDownload)
        {
            SoftDownloadDAL dal = new SoftDownloadDAL();
            dal.AddSoftDownload(softDownload);
        }

        public void UpdateSoftDownload(SoftDownload softDownload, int ID)
        {
            SoftDownloadDAL dal = new SoftDownloadDAL();
            dal.UpdateSoftDownload(softDownload, ID);
        }

        public void DeleteSoftDownload(SoftDownload softDownload)
        {
            SoftDownloadDAL dal = new SoftDownloadDAL();
            dal.DeleteSoftDownload(softDownload);
        }

        public IList GetAllSoftDownloads(string strHQL)
        {
            SoftDownloadDAL dal = new SoftDownloadDAL();
            return dal.GetAllSoftDownloads(strHQL);
        }
    }
}