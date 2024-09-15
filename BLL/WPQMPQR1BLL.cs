using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// PQR-1
    /// </summary>
    public class WPQMPQR1BLL
    {
        public void AddWPQMPQR1(WPQMPQR1 wPQMPQR1)
        {
            WPQMPQR1DAL dal = new WPQMPQR1DAL();
            dal.AddWPQMPQR1(wPQMPQR1);
        }

        public void UpdateWPQMPQR1(WPQMPQR1 wPQMPQR1, int ID)
        {
            WPQMPQR1DAL dal = new WPQMPQR1DAL();
            dal.UpdateWPQMPQR1(wPQMPQR1, ID);
        }

        public void DeleteWPQMPQR1(WPQMPQR1 wPQMPQR1)
        {
            WPQMPQR1DAL dal = new WPQMPQR1DAL();
            dal.DeleteWPQMPQR1(wPQMPQR1);
        }

        public IList GetAllWPQMPQR1s(string strHQL)
        {
            WPQMPQR1DAL dal = new WPQMPQR1DAL();
            return dal.GetAllWPQMPQR1s(strHQL);
        }
    }
}