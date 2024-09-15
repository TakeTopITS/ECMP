using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 项目文控类型
    /// </summary>
    public class ProDocGraphControlBLL
    {
        public void AddProDocGraphControl(ProDocGraphControl proDocGraphControl)
        {
            ProDocGraphControlDAL dal = new ProDocGraphControlDAL();
            dal.AddProDocGraphControl(proDocGraphControl);
        }

        public void UpdateProDocGraphControl(ProDocGraphControl proDocGraphControl, int ID)
        {
            ProDocGraphControlDAL dal = new ProDocGraphControlDAL();
            dal.UpdateProDocGraphControl(proDocGraphControl, ID);
        }

        public void DeleteProDocGraphControl(ProDocGraphControl proDocGraphControl)
        {
            ProDocGraphControlDAL dal = new ProDocGraphControlDAL();
            dal.DeleteProDocGraphControl(proDocGraphControl);
        }

        public IList GetAllProDocGraphControls(string strHQL)
        {
            ProDocGraphControlDAL dal = new ProDocGraphControlDAL();
            return dal.GetAllProDocGraphControls(strHQL);
        }
    }
}