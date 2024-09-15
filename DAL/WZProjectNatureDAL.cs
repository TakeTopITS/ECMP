using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZProjectNatureDAL
    {
        private EntityControl control;

        public WZProjectNatureDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZProjectNature(WZProjectNature wZProjectNature)
        {
            control.AddEntity(wZProjectNature);
        }

        public void UpdateWZProjectNature(WZProjectNature wZProjectNature, int ID)
        {
            control.UpdateEntity(wZProjectNature, ID);
        }

        public void DeleteWZProjectNature(WZProjectNature wZProjectNature)
        {
            control.DeleteEntity(wZProjectNature);
        }

        public IList GetAllWZProjectNatures(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}