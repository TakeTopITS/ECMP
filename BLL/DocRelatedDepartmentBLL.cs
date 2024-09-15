using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocRelatedDepartmentBLL
    {
        public void AddDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment)
        {
            DocRelatedDepartmentDAL dal = new DocRelatedDepartmentDAL();
            dal.AddDocRelatedDepartment(docRelatedDepartment);
        }

        public void UpdateDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment, int ID)
        {
            DocRelatedDepartmentDAL dal = new DocRelatedDepartmentDAL();
            dal.UpdateDocRelatedDepartment(docRelatedDepartment, ID);
        }

        public void DeleteDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment)
        {
            DocRelatedDepartmentDAL dal = new DocRelatedDepartmentDAL();
            dal.DeleteDocRelatedDepartment(docRelatedDepartment);
        }

        public IList GetAllDocRelatedDepartments(string strHQL)
        {
            DocRelatedDepartmentDAL dal = new DocRelatedDepartmentDAL();
            return dal.GetAllDocRelatedDepartments(strHQL);
        }
    }
}