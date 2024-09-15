using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWProMatchBLL
    {
        public void AddDWProMatch(DWProMatch dWProMatch)
        {
            DWProMatchDAL dal = new DWProMatchDAL();
            dal.AddDWProMatch(dWProMatch);
        }

        public void UpdateDWProMatch(DWProMatch dWProMatch, int ID)
        {
            DWProMatchDAL dal = new DWProMatchDAL();
            dal.UpdateDWProMatch(dWProMatch, ID);
        }

        public void DeleteDWProMatch(DWProMatch dWProMatch)
        {
            DWProMatchDAL dal = new DWProMatchDAL();
            dal.DeleteDWProMatch(dWProMatch);
        }

        public IList GetAllDWProMatchs(string strHQL)
        {
            DWProMatchDAL dal = new DWProMatchDAL();
            return dal.GetAllDWProMatchs(strHQL);
        }
    }
}