using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 员工培训记录
    /// </summary>
    public class TRTrainingRecordEmpBLL
    {
        public void AddTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp)
        {
            TRTrainingRecordEmpDAL dal = new TRTrainingRecordEmpDAL();
            dal.AddTRTrainingRecordEmp(tRTrainingRecordEmp);
        }

        public void UpdateTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp, int ID)
        {
            TRTrainingRecordEmpDAL dal = new TRTrainingRecordEmpDAL();
            dal.UpdateTRTrainingRecordEmp(tRTrainingRecordEmp, ID);
        }

        public void DeleteTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp)
        {
            TRTrainingRecordEmpDAL dal = new TRTrainingRecordEmpDAL();
            dal.DeleteTRTrainingRecordEmp(tRTrainingRecordEmp);
        }

        public IList GetAllTRTrainingRecordEmps(string strHQL)
        {
            TRTrainingRecordEmpDAL dal = new TRTrainingRecordEmpDAL();
            return dal.GetAllTRTrainingRecordEmps(strHQL);
        }
    }
}