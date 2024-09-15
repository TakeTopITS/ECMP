using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCardBLL
    {
        public void AddWZCard(WZCard wZCard)
        {
            WZCardDAL dal = new WZCardDAL();
            dal.AddWZCard(wZCard);
        }

        public void UpdateWZCard(WZCard wZCard, string strCardCode)
        {
            WZCardDAL dal = new WZCardDAL();
            dal.UpdateWZCard(wZCard, strCardCode);
        }

        public void DeleteWZCard(WZCard wZCard)
        {
            WZCardDAL dal = new WZCardDAL();
            dal.DeleteWZCard(wZCard);
        }

        public IList GetAllWZCards(string strHQL)
        {
            WZCardDAL dal = new WZCardDAL();
            return dal.GetAllWZCards(strHQL);
        }
    }
}