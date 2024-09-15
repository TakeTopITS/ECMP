using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierApplyCommentDAL
    {
        private EntityControl control;

        public WZSupplierApplyCommentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment)
        {
            control.AddEntity(wZSupplierApplyComment);
        }

        public void UpdateWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment, int ID)
        {
            control.UpdateEntity(wZSupplierApplyComment, ID);
        }

        public void DeleteWZSupplierApplyComment(WZSupplierApplyComment wZSupplierApplyComment)
        {
            control.DeleteEntity(wZSupplierApplyComment);
        }

        public IList GetAllWZSupplierApplyComments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}