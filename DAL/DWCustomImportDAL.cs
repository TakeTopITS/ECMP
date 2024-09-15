using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWCustomImportDAL
    {
        private EntityControl control;

        public DWCustomImportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWCustomImport(DWCustomImport dWCustomImport)
        {
            control.AddEntity(dWCustomImport);
        }

        public void UpdateDWCustomImport(DWCustomImport dWCustomImport, int ID)
        {
            control.UpdateEntity(dWCustomImport, ID);
        }

        public void DeleteDWCustomImport(DWCustomImport dWCustomImport)
        {
            control.DeleteEntity(dWCustomImport);
        }

        public IList GetAllDWCustomImports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}