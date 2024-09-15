using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsAdjustRecordBLL
    {
        public void AddGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord)
        {
            GoodsAdjustRecordDAL dal = new GoodsAdjustRecordDAL();
            dal.AddGoodsAdjustRecord(goodsAdjustRecord);
        }

        public void UpdateGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord, int ID)
        {
            GoodsAdjustRecordDAL dal = new GoodsAdjustRecordDAL();
            dal.UpdateGoodsAdjustRecord(goodsAdjustRecord, ID);
        }

        public void DeleteGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord)
        {
            GoodsAdjustRecordDAL dal = new GoodsAdjustRecordDAL();
            dal.DeleteGoodsAdjustRecord(goodsAdjustRecord);
        }

        public IList GetAllGoodsAdjustRecords(string strHQL)
        {
            GoodsAdjustRecordDAL dal = new GoodsAdjustRecordDAL();
            return dal.GetAllGoodsAdjustRecords(strHQL);
        }
    }
}