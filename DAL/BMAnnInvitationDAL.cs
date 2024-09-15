using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标公告/招标邀请函
    /// </summary>
    public class BMAnnInvitationDAL
    {
        private EntityControl control;

        public BMAnnInvitationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMAnnInvitation(BMAnnInvitation bMAnnInvitation)
        {
            control.AddEntity(bMAnnInvitation);
        }

        public void UpdateBMAnnInvitation(BMAnnInvitation bMAnnInvitation, int ID)
        {
            control.UpdateEntity(bMAnnInvitation, ID);
        }

        public void DeleteBMAnnInvitation(BMAnnInvitation bMAnnInvitation)
        {
            control.DeleteEntity(bMAnnInvitation);
        }

        public IList GetAllBMAnnInvitations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}