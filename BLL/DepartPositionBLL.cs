using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartPositionBLL
    {
        public void AddDepartPosition(DepartPosition departPosition)
        {
            DepartPositionDAL dal = new DepartPositionDAL();
            dal.AddDepartPosition(departPosition);
        }

        public void UpdateDepartPosition(DepartPosition departPosition, int ID)
        {
            DepartPositionDAL dal = new DepartPositionDAL();
            dal.UpdateDepartPosition(departPosition, ID);
        }

        public void DeleteDepartPosition(DepartPosition departPosition)
        {
            DepartPositionDAL dal = new DepartPositionDAL();
            dal.DeleteDepartPosition(departPosition);
        }

        public IList GetAllDepartPositions(string strHQL)
        {
            DepartPositionDAL dal = new DepartPositionDAL();
            return dal.GetAllDepartPositions(strHQL);
        }
    }
}