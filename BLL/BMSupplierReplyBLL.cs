using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 回函信息
    /// </summary>
    public class BMSupplierReplyBLL
    {
        public void AddBMSupplierReply(BMSupplierReply bMSupplierReply)
        {
            BMSupplierReplyDAL dal = new BMSupplierReplyDAL();
            dal.AddBMSupplierReply(bMSupplierReply);
        }

        public void UpdateBMSupplierReply(BMSupplierReply bMSupplierReply, int ID)
        {
            BMSupplierReplyDAL dal = new BMSupplierReplyDAL();
            dal.UpdateBMSupplierReply(bMSupplierReply, ID);
        }

        public void DeleteBMSupplierReply(BMSupplierReply bMSupplierReply)
        {
            BMSupplierReplyDAL dal = new BMSupplierReplyDAL();
            dal.DeleteBMSupplierReply(bMSupplierReply);
        }

        public IList GetAllBMSupplierReplys(string strHQL)
        {
            BMSupplierReplyDAL dal = new BMSupplierReplyDAL();
            return dal.GetAllBMSupplierReplys(strHQL);
        }
    }
}