using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SoftDownloadDAL
    {
        private EntityControl control;

        public SoftDownloadDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSoftDownload(SoftDownload softDownload)
        {
            control.AddEntity(softDownload);
        }

        public void UpdateSoftDownload(SoftDownload softDownload, int ID)
        {
            control.UpdateEntity(softDownload, ID);
        }

        public void DeleteSoftDownload(SoftDownload softDownload)
        {
            control.DeleteEntity(softDownload);
        }

        public IList GetAllSoftDownloads(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}