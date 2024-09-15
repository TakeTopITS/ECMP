using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsPurRecordBLL
    {
        public void AddGoodsPurRecord(GoodsPurRecord goodsPurRecord)
        {
            GoodsPurRecordDAL dal = new GoodsPurRecordDAL();
            dal.AddGoodsPurRecord(goodsPurRecord);
        }

        public void UpdateGoodsPurRecord(GoodsPurRecord goodsPurRecord, int ID)
        {
            GoodsPurRecordDAL dal = new GoodsPurRecordDAL();
            dal.UpdateGoodsPurRecord(goodsPurRecord, ID);
        }

        public void DeleteGoodsPurRecord(GoodsPurRecord goodsPurRecord)
        {
            GoodsPurRecordDAL dal = new GoodsPurRecordDAL();
            dal.DeleteGoodsPurRecord(goodsPurRecord);
        }

        public IList GetAllGoodsPurRecords(string strHQL)
        {
            GoodsPurRecordDAL dal = new GoodsPurRecordDAL();
            return dal.GetAllGoodsPurRecords(strHQL);
        }
    }
}