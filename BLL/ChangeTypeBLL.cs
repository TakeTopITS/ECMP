using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ChangeTypeBLL
    {
        public void AddChangeType(ChangeType changeType)
        {
            ChangeTypeDAL dal = new ChangeTypeDAL();
            dal.AddChangeType(changeType);
        }

        public void UpdateChangeType(ChangeType changeType, string Type)
        {
            ChangeTypeDAL dal = new ChangeTypeDAL();
            dal.UpdateChangeType(changeType, Type);
        }

        public void DeleteChangeType(ChangeType changeType)
        {
            ChangeTypeDAL dal = new ChangeTypeDAL();
            dal.DeleteChangeType(changeType);
        }

        public IList GetAllChangeTypes(string strHQL)
        {
            ChangeTypeDAL dal = new ChangeTypeDAL();
            return dal.GetAllChangeTypes(strHQL);
        }
    }
}