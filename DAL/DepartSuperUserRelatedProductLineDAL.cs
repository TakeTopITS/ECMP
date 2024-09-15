using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartSuperUserRelatedProductLineDAL
    {
        private EntityControl control;

        public DepartSuperUserRelatedProductLineDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine)
        {
            control.AddEntity(departRelatedProductLine);
        }

        public void UpdateDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine, int ID)
        {
            control.UpdateEntity(departRelatedProductLine, ID);
        }

        public void DeleteDepartSuperUserRelatedProductLine(DepartSuperUserRelatedProductLine departRelatedProductLine)
        {
            control.DeleteEntity(departRelatedProductLine);
        }

        public IList GetAllDepartSuperUserRelatedProductLines(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}