using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class Network_YYUPDAL
    {
        private EntityControl control;

        public Network_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddNetwork_YYUP(Network_YYUP network_YYUP)
        {
            control.AddEntity(network_YYUP);
        }

        public void UpdateNetwork_YYUP(Network_YYUP network_YYUP, int ID)
        {
            control.UpdateEntity(network_YYUP, ID);
        }

        public void DeleteNetwork_YYUP(Network_YYUP network_YYUP)
        {
            control.DeleteEntity(network_YYUP);
        }

        public IList GetAllNetwork_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}