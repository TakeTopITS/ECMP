using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractTypeBLL
    {
        public void AddConstractType(ConstractType constractType)
        {
            ConstractTypeDAL dal = new ConstractTypeDAL();
            dal.AddConstractType(constractType);
        }

        public void UpdateConstractType(ConstractType constractType, string Type)
        {
            ConstractTypeDAL dal = new ConstractTypeDAL();
            dal.UpdateConstractType(constractType, Type);
        }

        public void DeleteConstractType(ConstractType constractType)
        {
            ConstractTypeDAL dal = new ConstractTypeDAL();
            dal.DeleteConstractType(constractType);
        }

        public IList GetAllConstractTypes(string strHQL)
        {
            ConstractTypeDAL dal = new ConstractTypeDAL();
            return dal.GetAllConstractTypes(strHQL);
        }
    }
}