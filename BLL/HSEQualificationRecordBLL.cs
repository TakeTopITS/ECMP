using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 资质备案
    /// </summary>
    public class HSEQualificationRecordBLL
    {
        public void AddHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord)
        {
            HSEQualificationRecordDAL dal = new HSEQualificationRecordDAL();
            dal.AddHSEQualificationRecord(hSEQualificationRecord);
        }

        public void UpdateHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord, string Code)
        {
            HSEQualificationRecordDAL dal = new HSEQualificationRecordDAL();
            dal.UpdateHSEQualificationRecord(hSEQualificationRecord, Code);
        }

        public void DeleteHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord)
        {
            HSEQualificationRecordDAL dal = new HSEQualificationRecordDAL();
            dal.DeleteHSEQualificationRecord(hSEQualificationRecord);
        }

        public IList GetAllHSEQualificationRecords(string strHQL)
        {
            HSEQualificationRecordDAL dal = new HSEQualificationRecordDAL();
            return dal.GetAllHSEQualificationRecords(strHQL);
        }
    }
}