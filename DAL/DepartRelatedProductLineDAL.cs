using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedProductLineDAL
    {
        private EntityControl control;

        public DepartRelatedProductLineDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine)
        {
            control.AddEntity(departRelatedProductLine);
        }

        public void UpdateDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine, int ID)
        {
            control.UpdateEntity(departRelatedProductLine, ID);
        }

        public void DeleteDepartRelatedProductLine(DepartRelatedProductLine departRelatedProductLine)
        {
            control.DeleteEntity(departRelatedProductLine);
        }

        public IList GetAllDepartRelatedProductLines(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}