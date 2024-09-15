using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TransferProjectBLL
    {
        public void AddTransferProject(TransferProject transferProject)
        {
            TransferProjectDAL dal = new TransferProjectDAL();
            dal.AddTransferProject(transferProject);
        }

        public void UpdateTransferProject(TransferProject transferProject, int ID)
        {
            TransferProjectDAL dal = new TransferProjectDAL();
            dal.UpdateTransferProject(transferProject, ID);
        }

        public void DeleteTransferProject(TransferProject transferProject)
        {
            TransferProjectDAL dal = new TransferProjectDAL();
            dal.DeleteTransferProject(transferProject);
        }

        public IList GetAllTransferProjects(string strHQL)
        {
            TransferProjectDAL dal = new TransferProjectDAL();
            return dal.GetAllTransferProjects(strHQL);
        }
    }
}