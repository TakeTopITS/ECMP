using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TransferProjectDAL
    {
        private EntityControl control;

        public TransferProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTransferProject(TransferProject transferProject)
        {
            control.AddEntity(transferProject);
        }

        public void UpdateTransferProject(TransferProject transferProject, int ID)
        {
            control.UpdateEntity(transferProject, ID);
        }

        public void DeleteTransferProject(TransferProject transferProject)
        {
            control.DeleteEntity(transferProject);
        }

        public IList GetAllTransferProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}