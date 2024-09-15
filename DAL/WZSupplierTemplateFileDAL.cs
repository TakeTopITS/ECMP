using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierTemplateFileDAL
    {
        private EntityControl control;

        public WZSupplierTemplateFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile)
        {
            control.AddEntity(wZSupplierTemplateFile);
        }

        public void UpdateWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile, int ID)
        {
            control.UpdateEntity(wZSupplierTemplateFile, ID);
        }

        public void DeleteWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile)
        {
            control.DeleteEntity(wZSupplierTemplateFile);
        }

        public IList GetAllWZSupplierTemplateFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}