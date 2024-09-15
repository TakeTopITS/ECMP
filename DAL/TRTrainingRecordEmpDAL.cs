using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 员工培训记录
    /// </summary>
    public class TRTrainingRecordEmpDAL
    {
        private EntityControl control;

        public TRTrainingRecordEmpDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp)
        {
            control.AddEntity(tRTrainingRecordEmp);
        }

        public void UpdateTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp, int ID)
        {
            control.UpdateEntity(tRTrainingRecordEmp, ID);
        }

        public void DeleteTRTrainingRecordEmp(TRTrainingRecordEmp tRTrainingRecordEmp)
        {
            control.DeleteEntity(tRTrainingRecordEmp);
        }

        public IList GetAllTRTrainingRecordEmps(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}