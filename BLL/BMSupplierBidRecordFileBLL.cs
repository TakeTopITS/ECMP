using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMSupplierBidRecordFileBLL
    {
        public void AddBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile)
        {
            BMSupplierBidRecordFileDAL dal = new BMSupplierBidRecordFileDAL();
            dal.AddBMSupplierBidRecordFile(bMSupplierBidRecordFile);
        }

        public void UpdateBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile, int ID)
        {
            BMSupplierBidRecordFileDAL dal = new BMSupplierBidRecordFileDAL();
            dal.UpdateBMSupplierBidRecordFile(bMSupplierBidRecordFile, ID);
        }

        public void DeleteBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile)
        {
            BMSupplierBidRecordFileDAL dal = new BMSupplierBidRecordFileDAL();
            dal.DeleteBMSupplierBidRecordFile(bMSupplierBidRecordFile);
        }

        public IList GetAllBMSupplierBidRecordFiles(string strHQL)
        {
            BMSupplierBidRecordFileDAL dal = new BMSupplierBidRecordFileDAL();
            return dal.GetAllBMSupplierBidRecordFiles(strHQL);
        }
    }
}