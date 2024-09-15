using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsUserRecordBLL
    {
        public void AddGoodsUserRecord(GoodsUserRecord goodsUserRecord)
        {
            GoodsUserRecordDAL dal = new GoodsUserRecordDAL();
            dal.AddGoodsUserRecord(goodsUserRecord);
        }

        public void UpdateGoodsUserRecord(GoodsUserRecord goodsUserRecord, int ID)
        {
            GoodsUserRecordDAL dal = new GoodsUserRecordDAL();
            dal.UpdateGoodsUserRecord(goodsUserRecord, ID);
        }

        public void DeleteGoodsUserRecord(GoodsUserRecord goodsUserRecord)
        {
            GoodsUserRecordDAL dal = new GoodsUserRecordDAL();
            dal.DeleteGoodsUserRecord(goodsUserRecord);
        }

        public IList GetAllGoodsUserRecords(string strHQL)
        {
            GoodsUserRecordDAL dal = new GoodsUserRecordDAL();
            return dal.GetAllGoodsUserRecords(strHQL);
        }
    }
}