using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// PQR3
    /// </summary>
    public class WPQMPQR3BLL
    {
        public void AddWPQMPQR3(WPQMPQR3 wPQMPQR3)
        {
            WPQMPQR3DAL dal = new WPQMPQR3DAL();
            dal.AddWPQMPQR3(wPQMPQR3);
        }

        public void UpdateWPQMPQR3(WPQMPQR3 wPQMPQR3, int ID)
        {
            WPQMPQR3DAL dal = new WPQMPQR3DAL();
            dal.UpdateWPQMPQR3(wPQMPQR3, ID);
        }

        public void DeleteWPQMPQR3(WPQMPQR3 wPQMPQR3)
        {
            WPQMPQR3DAL dal = new WPQMPQR3DAL();
            dal.DeleteWPQMPQR3(wPQMPQR3);
        }

        public IList GetAllWPQMPQR3s(string strHQL)
        {
            WPQMPQR3DAL dal = new WPQMPQR3DAL();
            return dal.GetAllWPQMPQR3s(strHQL);
        }
    }
}