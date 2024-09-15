using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocRelatedDepartmentDAL
    {
        private EntityControl control;

        public DocRelatedDepartmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment)
        {
            control.AddEntity(docRelatedDepartment);
        }

        public void UpdateDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment, int ID)
        {
            control.UpdateEntity(docRelatedDepartment, ID);
        }

        public void DeleteDocRelatedDepartment(DocRelatedDepartment docRelatedDepartment)
        {
            control.DeleteEntity(docRelatedDepartment);
        }

        public IList GetAllDocRelatedDepartments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}