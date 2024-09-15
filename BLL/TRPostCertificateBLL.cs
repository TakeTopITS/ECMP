using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 岗位证书
    /// </summary>
    public class TRPostCertificateBLL
    {
        public void AddTRPostCertificate(TRPostCertificate tRPostCertificate)
        {
            TRPostCertificateDAL dal = new TRPostCertificateDAL();
            dal.AddTRPostCertificate(tRPostCertificate);
        }

        public void UpdateTRPostCertificate(TRPostCertificate tRPostCertificate, int ID)
        {
            TRPostCertificateDAL dal = new TRPostCertificateDAL();
            dal.UpdateTRPostCertificate(tRPostCertificate, ID);
        }

        public void DeleteTRPostCertificate(TRPostCertificate tRPostCertificate)
        {
            TRPostCertificateDAL dal = new TRPostCertificateDAL();
            dal.DeleteTRPostCertificate(tRPostCertificate);
        }

        public IList GetAllTRPostCertificates(string strHQL)
        {
            TRPostCertificateDAL dal = new TRPostCertificateDAL();
            return dal.GetAllTRPostCertificates(strHQL);
        }
    }
}