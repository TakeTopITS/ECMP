using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractBigTypeBLL
    {
        public void AddConstractBigType(ConstractBigType constractBigType)
        {
            ConstractBigTypeDAL dal = new ConstractBigTypeDAL();
            dal.AddConstractBigType(constractBigType);
        }

        public void UpdateConstractBigType(ConstractBigType constractBigType, string BigType)
        {
            ConstractBigTypeDAL dal = new ConstractBigTypeDAL();
            dal.UpdateConstractBigType(constractBigType, BigType);
        }

        public void DeleteConstractBigType(ConstractBigType constractBigType)
        {
            ConstractBigTypeDAL dal = new ConstractBigTypeDAL();
            dal.DeleteConstractBigType(constractBigType);
        }

        public IList GetAllConstractBigTypes(string strHQL)
        {
            ConstractBigTypeDAL dal = new ConstractBigTypeDAL();
            return dal.GetAllConstractBigTypes(strHQL);
        }
    }
}