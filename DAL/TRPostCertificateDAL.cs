using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 岗位证书
    /// </summary>
    public class TRPostCertificateDAL
    {
        private EntityControl control;

        public TRPostCertificateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTRPostCertificate(TRPostCertificate tRPostCertificate)
        {
            control.AddEntity(tRPostCertificate);
        }

        public void UpdateTRPostCertificate(TRPostCertificate tRPostCertificate, int ID)
        {
            control.UpdateEntity(tRPostCertificate, ID);
        }

        public void DeleteTRPostCertificate(TRPostCertificate tRPostCertificate)
        {
            control.DeleteEntity(tRPostCertificate);
        }

        public IList GetAllTRPostCertificates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}