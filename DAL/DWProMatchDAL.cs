using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWProMatchDAL
    {
        private EntityControl control;

        public DWProMatchDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWProMatch(DWProMatch dWProMatch)
        {
            control.AddEntity(dWProMatch);
        }

        public void UpdateDWProMatch(DWProMatch dWProMatch, int ID)
        {
            control.UpdateEntity(dWProMatch, ID);
        }

        public void DeleteDWProMatch(DWProMatch dWProMatch)
        {
            control.DeleteEntity(dWProMatch);
        }

        public IList GetAllDWProMatchs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}