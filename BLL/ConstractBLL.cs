using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractBLL
    {
        public void AddConstract(Constract constract)
        {
            ConstractDAL dal = new ConstractDAL();
            dal.AddConstract(constract);
        }

        public void UpdateConstract(Constract constract, int ConstractID)
        {
            ConstractDAL dal = new ConstractDAL();
            dal.UpdateConstract(constract, ConstractID);
        }

        public void DeleteConstract(Constract constract)
        {
            ConstractDAL dal = new ConstractDAL();
            dal.DeleteConstract(constract);
        }

        public IList GetAllConstracts(string strHQL)
        {
            ConstractDAL dal = new ConstractDAL();
            return dal.GetAllConstracts(strHQL);
        }
    }
}