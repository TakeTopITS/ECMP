using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// PWPS2
    /// </summary>
    public class WPQMPWPS2BLL
    {
        public void AddWPQMPWPS2(WPQMPWPS2 wPQMPWPS2)
        {
            WPQMPWPS2DAL dal = new WPQMPWPS2DAL();
            dal.AddWPQMPWPS2(wPQMPWPS2);
        }

        public void UpdateWPQMPWPS2(WPQMPWPS2 wPQMPWPS2, int ID)
        {
            WPQMPWPS2DAL dal = new WPQMPWPS2DAL();
            dal.UpdateWPQMPWPS2(wPQMPWPS2, ID);
        }

        public void DeleteWPQMPWPS2(WPQMPWPS2 wPQMPWPS2)
        {
            WPQMPWPS2DAL dal = new WPQMPWPS2DAL();
            dal.DeleteWPQMPWPS2(wPQMPWPS2);
        }

        public IList GetAllWPQMPWPS2s(string strHQL)
        {
            WPQMPWPS2DAL dal = new WPQMPWPS2DAL();
            return dal.GetAllWPQMPWPS2s(strHQL);
        }
    }
}