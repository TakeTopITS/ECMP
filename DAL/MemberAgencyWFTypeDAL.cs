using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MemberAgencyWFTypeDAL
    {
        private EntityControl control;

        public MemberAgencyWFTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType)
        {
            control.AddEntity(memberAgencyWFType);
        }

        public void UpdateMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType, int ID)
        {
            control.UpdateEntity(memberAgencyWFType, ID);
        }

        public void DeleteMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType)
        {
            control.DeleteEntity(memberAgencyWFType);
        }

        public IList GetAllMemberAgencyWFTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}