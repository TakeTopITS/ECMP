using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMSupplierBidRecordFileDAL
    {
        private EntityControl control;

        public BMSupplierBidRecordFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile)
        {
            control.AddEntity(bMSupplierBidRecordFile);
        }

        public void UpdateBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile, int ID)
        {
            control.UpdateEntity(bMSupplierBidRecordFile, ID);
        }

        public void DeleteBMSupplierBidRecordFile(BMSupplierBidRecordFile bMSupplierBidRecordFile)
        {
            control.DeleteEntity(bMSupplierBidRecordFile);
        }

        public IList GetAllBMSupplierBidRecordFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}