using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWMatchBLL
    {
        public void AddDWMatch(DWMatch dWMatch)
        {
            DWMatchDAL dal = new DWMatchDAL();
            dal.AddDWMatch(dWMatch);
        }

        public void UpdateDWMatch(DWMatch dWMatch, int ID)
        {
            DWMatchDAL dal = new DWMatchDAL();
            dal.UpdateDWMatch(dWMatch, ID);
        }

        public void DeleteDWMatch(DWMatch dWMatch)
        {
            DWMatchDAL dal = new DWMatchDAL();
            dal.DeleteDWMatch(dWMatch);
        }

        public IList GetAllDWMatchs(string strHQL)
        {
            DWMatchDAL dal = new DWMatchDAL();
            return dal.GetAllDWMatchs(strHQL);
        }
    }
}