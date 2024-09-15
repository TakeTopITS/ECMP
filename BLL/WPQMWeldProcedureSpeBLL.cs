using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 管板预焊接工艺规程
    /// </summary>
    public class WPQMWeldProcedureSpeBLL
    {
        public void AddWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe)
        {
            WPQMWeldProcedureSpeDAL dal = new WPQMWeldProcedureSpeDAL();
            dal.AddWPQMWeldProcedureSpe(wPQMWeldProcedureSpe);
        }

        public void UpdateWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe, int ID)
        {
            WPQMWeldProcedureSpeDAL dal = new WPQMWeldProcedureSpeDAL();
            dal.UpdateWPQMWeldProcedureSpe(wPQMWeldProcedureSpe, ID);
        }

        public void DeleteWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe)
        {
            WPQMWeldProcedureSpeDAL dal = new WPQMWeldProcedureSpeDAL();
            dal.DeleteWPQMWeldProcedureSpe(wPQMWeldProcedureSpe);
        }

        public IList GetAllWPQMWeldProcedureSpes(string strHQL)
        {
            WPQMWeldProcedureSpeDAL dal = new WPQMWeldProcedureSpeDAL();
            return dal.GetAllWPQMWeldProcedureSpes(strHQL);
        }
    }
}