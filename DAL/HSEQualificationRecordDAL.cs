using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 资质备案
    /// </summary>
    public class HSEQualificationRecordDAL
    {
        private EntityControl control;

        public HSEQualificationRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord)
        {
            control.AddEntity(hSEQualificationRecord);
        }

        public void UpdateHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord, string Code)
        {
            control.UpdateEntity(hSEQualificationRecord, Code);
        }

        public void DeleteHSEQualificationRecord(HSEQualificationRecord hSEQualificationRecord)
        {
            control.DeleteEntity(hSEQualificationRecord);
        }

        public IList GetAllHSEQualificationRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}