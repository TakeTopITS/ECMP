using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedProductLineBLL
    {
        public void AddDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine)
        {
            DepartRelatedProductLineDAL dal = new DepartRelatedProductLineDAL();
            dal.AddDepartRelatedProductLine(departRelatedProductLine);
        }

        public void UpdateDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine, int ID)
        {
            DepartRelatedProductLineDAL dal = new DepartRelatedProductLineDAL();
            dal.UpdateDepartRelatedProductLine(departRelatedProductLine, ID);
        }

        public void DeleteDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine)
        {
            DepartRelatedProductLineDAL dal = new DepartRelatedProductLineDAL();
            dal.DeleteDepartRelatedProductLine(departRelatedProductLine);
        }

        public IList GetAllDepartRelatedProductLines(string strHQL)
        {
            DepartRelatedProductLineDAL dal = new DepartRelatedProductLineDAL();
            return dal.GetAllDepartRelatedProductLines(strHQL);
        }
    }
}