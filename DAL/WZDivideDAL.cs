using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZDivideDAL
    {
        private EntityControl control;

        public WZDivideDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZDivide(WZDivide wZDivide)
        {
            control.AddEntity(wZDivide);
        }

        public void UpdateWZDivide(WZDivide wZDivide, string strDivideCode)
        {
            control.UpdateEntity(wZDivide, strDivideCode);
        }

        public void DeleteWZDivide(WZDivide wZDivide)
        {
            control.DeleteEntity(wZDivide);
        }

        public IList GetAllWZDivides(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}