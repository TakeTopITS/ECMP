using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartSuperUserRelatedProductLineBLL
    {
        public void AddDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine)
        {
            DepartSuperUserRelatedProductLineDAL dal = new DepartSuperUserRelatedProductLineDAL();
            dal.AddDepartSuperUserRelatedProductLine(departRelatedProductLine);
        }

        public void UpdateDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine, int ID)
        {
            DepartSuperUserRelatedProductLineDAL dal = new DepartSuperUserRelatedProductLineDAL();
            dal.UpdateDepartSuperUserRelatedProductLine(departRelatedProductLine, ID);
        }

        public void DeleteDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine)
        {
            DepartSuperUserRelatedProductLineDAL dal = new DepartSuperUserRelatedProductLineDAL();
            dal.DeleteDepartSuperUserRelatedProductLine(departRelatedProductLine);
        }

        public IList GetAllDepartSuperUserRelatedProductLines(string strHQL)
        {
            DepartSuperUserRelatedProductLineDAL dal = new DepartSuperUserRelatedProductLineDAL();
            return dal.GetAllDepartSuperUserRelatedProductLines(strHQL);
        }
    }
}