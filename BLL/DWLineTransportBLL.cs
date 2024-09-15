using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWLineTransportBLL
    {
        public void AddDWLineTransport(DWLineTransport dWLineTransport)
        {
            DWLineTransportDAL dal = new DWLineTransportDAL();
            dal.AddDWLineTransport(dWLineTransport);
        }

        public void UpdateDWLineTransport(DWLineTransport dWLineTransport, int ID)
        {
            DWLineTransportDAL dal = new DWLineTransportDAL();
            dal.UpdateDWLineTransport(dWLineTransport, ID);
        }

        public void DeleteDWLineTransport(DWLineTransport dWLineTransport)
        {
            DWLineTransportDAL dal = new DWLineTransportDAL();
            dal.DeleteDWLineTransport(dWLineTransport);
        }

        public IList GetAllDWLineTransports(string strHQL)
        {
            DWLineTransportDAL dal = new DWLineTransportDAL();
            return dal.GetAllDWLineTransports(strHQL);
        }
    }
}