using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标公告/招标邀请函
    /// </summary>
    public class BMAnnInvitationBLL
    {
        public void AddBMAnnInvitation(BMAnnInvitation bMAnnInvitation)
        {
            BMAnnInvitationDAL dal = new BMAnnInvitationDAL();
            dal.AddBMAnnInvitation(bMAnnInvitation);
        }

        public void UpdateBMAnnInvitation(BMAnnInvitation bMAnnInvitation, int ID)
        {
            BMAnnInvitationDAL dal = new BMAnnInvitationDAL();
            dal.UpdateBMAnnInvitation(bMAnnInvitation, ID);
        }

        public void DeleteBMAnnInvitation(BMAnnInvitation bMAnnInvitation)
        {
            BMAnnInvitationDAL dal = new BMAnnInvitationDAL();
            dal.DeleteBMAnnInvitation(bMAnnInvitation);
        }

        public IList GetAllBMAnnInvitations(string strHQL)
        {
            BMAnnInvitationDAL dal = new BMAnnInvitationDAL();
            return dal.GetAllBMAnnInvitations(strHQL);
        }
    }
}