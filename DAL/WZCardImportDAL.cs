using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCardImportDAL
    {
        private EntityControl control;

        public WZCardImportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCardImport(WZCardImport wZCardImport)
        {
            control.AddEntity(wZCardImport);
        }

        public void UpdateWZCardImport(WZCardImport wZCardImport, int ID)
        {
            control.UpdateEntity(wZCardImport, ID);
        }

        public void DeleteWZCardImport(WZCardImport wZCardImport)
        {
            control.DeleteEntity(wZCardImport);
        }

        public IList GetAllWZCardImports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}