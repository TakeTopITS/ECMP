using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 焊接任务单
    /// </summary>
    public class WPQMWeldTaskListBLL
    {
        public void AddWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList)
        {
            WPQMWeldTaskListDAL dal = new WPQMWeldTaskListDAL();
            dal.AddWPQMWeldTaskList(wPQMWeldTaskList);
        }

        public void UpdateWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList, int ID)
        {
            WPQMWeldTaskListDAL dal = new WPQMWeldTaskListDAL();
            dal.UpdateWPQMWeldTaskList(wPQMWeldTaskList, ID);
        }

        public void DeleteWPQMWeldTaskList(WPQMWeldTaskList wPQMWeldTaskList)
        {
            WPQMWeldTaskListDAL dal = new WPQMWeldTaskListDAL();
            dal.DeleteWPQMWeldTaskList(wPQMWeldTaskList);
        }

        public IList GetAllWPQMWeldTaskLists(string strHQL)
        {
            WPQMWeldTaskListDAL dal = new WPQMWeldTaskListDAL();
            return dal.GetAllWPQMWeldTaskLists(strHQL);
        }
    }
}