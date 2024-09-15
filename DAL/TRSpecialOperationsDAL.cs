using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 特种作业
    /// </summary>
    public class TRSpecialOperationsDAL
    {
        private EntityControl control;

        public TRSpecialOperationsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTRSpecialOperations(TRSpecialOperations tRSpecialOperations)
        {
            control.AddEntity(tRSpecialOperations);
        }

        public void UpdateTRSpecialOperations(TRSpecialOperations tRSpecialOperations, int ID)
        {
            control.UpdateEntity(tRSpecialOperations, ID);
        }

        public void DeleteTRSpecialOperations(TRSpecialOperations tRSpecialOperations)
        {
            control.DeleteEntity(tRSpecialOperations);
        }

        public IList GetAllTRSpecialOperationss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}