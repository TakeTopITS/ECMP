using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZExpertDAL
    {
        private EntityControl control;

        public WZExpertDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZExpert(WZExpert wZExpert)
        {
            control.AddEntity(wZExpert);
        }

        public void UpdateWZExpert(WZExpert wZExpert, int strID)
        {
            control.UpdateEntity(wZExpert, strID);
        }

        public void DeleteWZExpert(WZExpert wZExpert)
        {
            control.DeleteEntity(wZExpert);
        }

        public IList GetAllWZExperts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}