using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 特种作业
    /// </summary>
    public class TRSpecialOperationsBLL
    {
        public void AddTRSpecialOperations(TRSpecialOperations tRSpecialOperations)
        {
            TRSpecialOperationsDAL dal = new TRSpecialOperationsDAL();
            dal.AddTRSpecialOperations(tRSpecialOperations);
        }

        public void UpdateTRSpecialOperations(TRSpecialOperations tRSpecialOperations, int ID)
        {
            TRSpecialOperationsDAL dal = new TRSpecialOperationsDAL();
            dal.UpdateTRSpecialOperations(tRSpecialOperations, ID);
        }

        public void DeleteTRSpecialOperations(TRSpecialOperations tRSpecialOperations)
        {
            TRSpecialOperationsDAL dal = new TRSpecialOperationsDAL();
            dal.DeleteTRSpecialOperations(tRSpecialOperations);
        }

        public IList GetAllTRSpecialOperationss(string strHQL)
        {
            TRSpecialOperationsDAL dal = new TRSpecialOperationsDAL();
            return dal.GetAllTRSpecialOperationss(strHQL);
        }
    }
}