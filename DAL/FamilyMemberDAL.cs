using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class FamilyMemberDAL
    {
        private EntityControl control;

        public FamilyMemberDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddFamilyMember(FamilyMember familyMember)
        {
            control.AddEntity(familyMember);
        }

        public void UpdateFamilyMember(FamilyMember familyMember, int ID)
        {
            control.UpdateEntity(familyMember, ID);
        }

        public void DeleteFamilyMember(FamilyMember familyMember)
        {
            control.DeleteEntity(familyMember);
        }

        public IList GetAllFamilyMembers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}