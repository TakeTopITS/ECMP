using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class Network_YYUPBLL
    {
        public void AddNetwork_YYUP(Network_YYUP network_YYUP)
        {
            Network_YYUPDAL dal = new Network_YYUPDAL();
            dal.AddNetwork_YYUP(network_YYUP);
        }

        public void UpdateNetwork_YYUP(Network_YYUP network_YYUP, int ID)
        {
            Network_YYUPDAL dal = new Network_YYUPDAL();
            dal.UpdateNetwork_YYUP(network_YYUP, ID);
        }

        public void DeleteNetwork_YYUP(Network_YYUP network_YYUP)
        {
            Network_YYUPDAL dal = new Network_YYUPDAL();
            dal.DeleteNetwork_YYUP(network_YYUP);
        }

        public IList GetAllNetwork_YYUPs(string strHQL)
        {
            Network_YYUPDAL dal = new Network_YYUPDAL();
            return dal.GetAllNetwork_YYUPs(strHQL);
        }
    }
}