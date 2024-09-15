using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWMatchDAL
    {
        private EntityControl control;

        public DWMatchDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWMatch(DWMatch dWMatch)
        {
            control.AddEntity(dWMatch);
        }

        public void UpdateDWMatch(DWMatch dWMatch, int ID)
        {
            control.UpdateEntity(dWMatch, ID);
        }

        public void DeleteDWMatch(DWMatch dWMatch)
        {
            control.DeleteEntity(dWMatch);
        }

        public IList GetAllDWMatchs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}