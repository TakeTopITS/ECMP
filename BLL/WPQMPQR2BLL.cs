using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// PQR-2
    /// </summary>
    public class WPQMPQR2BLL
    {
        public void AddWPQMPQR2(WPQMPQR2 wPQMPQR2)
        {
            WPQMPQR2DAL dal = new WPQMPQR2DAL();
            dal.AddWPQMPQR2(wPQMPQR2);
        }

        public void UpdateWPQMPQR2(WPQMPQR2 wPQMPQR2, int ID)
        {
            WPQMPQR2DAL dal = new WPQMPQR2DAL();
            dal.UpdateWPQMPQR2(wPQMPQR2, ID);
        }

        public void DeleteWPQMPQR2(WPQMPQR2 wPQMPQR2)
        {
            WPQMPQR2DAL dal = new WPQMPQR2DAL();
            dal.DeleteWPQMPQR2(wPQMPQR2);
        }

        public IList GetAllWPQMPQR2s(string strHQL)
        {
            WPQMPQR2DAL dal = new WPQMPQR2DAL();
            return dal.GetAllWPQMPQR2s(strHQL);
        }
    }
}