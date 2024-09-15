using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 焊接任务单
    /// </summary>
    public class WPQMWeldTaskListDAL
    {
        private EntityControl control;

        public WPQMWeldTaskListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList)
        {
            control.AddEntity(wPQMWeldTaskList);
        }

        public void UpdateWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList, int ID)
        {
            control.UpdateEntity(wPQMWeldTaskList, ID);
        }

        public void DeleteWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList)
        {
            control.DeleteEntity(wPQMWeldTaskList);
        }

        public IList GetAllWPQMWeldTaskLists(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}