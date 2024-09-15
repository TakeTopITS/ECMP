using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierApplyCommentBLL
    {
        public void AddWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment)
        {
            WZSupplierApplyCommentDAL dal = new WZSupplierApplyCommentDAL();
            dal.AddWZSupplierApplyComment(wZSupplierApplyComment);
        }

        public void UpdateWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment, int ID)
        {
            WZSupplierApplyCommentDAL dal = new WZSupplierApplyCommentDAL();
            dal.UpdateWZSupplierApplyComment(wZSupplierApplyComment, ID);
        }

        public void DeleteWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment)
        {
            WZSupplierApplyCommentDAL dal = new WZSupplierApplyCommentDAL();
            dal.DeleteWZSupplierApplyComment(wZSupplierApplyComment);
        }

        public IList GetAllWZSupplierApplyComments(string strHQL)
        {
            WZSupplierApplyCommentDAL dal = new WZSupplierApplyCommentDAL();
            return dal.GetAllWZSupplierApplyComments(strHQL);
        }
    }
}