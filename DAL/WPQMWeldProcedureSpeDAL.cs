using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 管板预焊接工艺规程
    /// </summary>
    public class WPQMWeldProcedureSpeDAL
    {
        private EntityControl control;

        public WPQMWeldProcedureSpeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe)
        {
            control.AddEntity(wPQMWeldProcedureSpe);
        }

        public void UpdateWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe, int ID)
        {
            control.UpdateEntity(wPQMWeldProcedureSpe, ID);
        }

        public void DeleteWPQMWeldProcedureSpe(WPQMWeldProcedureSpe wPQMWeldProcedureSpe)
        {
            control.DeleteEntity(wPQMWeldProcedureSpe);
        }

        public IList GetAllWPQMWeldProcedureSpes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}