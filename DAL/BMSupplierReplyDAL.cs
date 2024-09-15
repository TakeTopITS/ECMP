using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 回函信息
    /// </summary>
    public class BMSupplierReplyDAL
    {
        private EntityControl control;

        public BMSupplierReplyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierReply(BMSupplierReply bMSupplierReply)
        {
            control.AddEntity(bMSupplierReply);
        }

        public void UpdateBMSupplierReply(BMSupplierReply bMSupplierReply, int ID)
        {
            control.UpdateEntity(bMSupplierReply, ID);
        }

        public void DeleteBMSupplierReply(BMSupplierReply bMSupplierReply)
        {
            control.DeleteEntity(bMSupplierReply);
        }

        public IList GetAllBMSupplierReplys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}