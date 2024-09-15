using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCardDAL
    {
        private EntityControl control;

        public WZCardDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCard(WZCard wZCard)
        {
            control.AddEntity(wZCard);
        }

        public void UpdateWZCard(WZCard wZCard, string strCardCode)
        {
            control.UpdateEntity(wZCard, strCardCode);
        }

        public void DeleteWZCard(WZCard wZCard)
        {
            control.DeleteEntity(wZCard);
        }

        public IList GetAllWZCards(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}