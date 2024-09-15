using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 安全隐患整改
    /// </summary>
    public class HSERectificationBLL
    {
        public void AddHSERectification(HSERectification hSERectification)
        {
            HSERectificationDAL dal = new HSERectificationDAL();
            dal.AddHSERectification(hSERectification);
        }

        public void UpdateHSERectification(HSERectification hSERectification, string Code)
        {
            HSERectificationDAL dal = new HSERectificationDAL();
            dal.UpdateHSERectification(hSERectification, Code);
        }

        public void DeleteHSERectification(HSERectification hSERectification)
        {
            HSERectificationDAL dal = new HSERectificationDAL();
            dal.DeleteHSERectification(hSERectification);
        }

        public IList GetAllHSERectifications(string strHQL)
        {
            HSERectificationDAL dal = new HSERectificationDAL();
            return dal.GetAllHSERectifications(strHQL);
        }
    }
}