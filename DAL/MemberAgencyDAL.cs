using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MemberAgencyDAL
    {
        private EntityControl control;

        public MemberAgencyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMemberAgency(MemberAgency memberAgency)
        {
            control.AddEntity(memberAgency);
        }

        public void UpdateMemberAgency(MemberAgency memberAgency, int ID)
        {
            control.UpdateEntity(memberAgency, ID);
        }

        public void DeleteMemberAgency(MemberAgency memberAgency)
        {
            control.DeleteEntity(memberAgency);
        }

        public IList GetAllMemberAgencys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}