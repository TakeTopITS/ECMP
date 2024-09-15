using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// PWPS1
    /// </summary>
    public class WPQMPWPS1BLL
    {
        public void AddWPQMPWPS1(WPQMPWPS1 wPQMPWPS1)
        {
            WPQMPWPS1DAL dal = new WPQMPWPS1DAL();
            dal.AddWPQMPWPS1(wPQMPWPS1);
        }

        public void UpdateWPQMPWPS1(WPQMPWPS1 wPQMPWPS1, int ID)
        {
            WPQMPWPS1DAL dal = new WPQMPWPS1DAL();
            dal.UpdateWPQMPWPS1(wPQMPWPS1, ID);
        }

        public void DeleteWPQMPWPS1(WPQMPWPS1 wPQMPWPS1)
        {
            WPQMPWPS1DAL dal = new WPQMPWPS1DAL();
            dal.DeleteWPQMPWPS1(wPQMPWPS1);
        }

        public IList GetAllWPQMPWPS1s(string strHQL)
        {
            WPQMPWPS1DAL dal = new WPQMPWPS1DAL();
            return dal.GetAllWPQMPWPS1s(strHQL);
        }
    }
}