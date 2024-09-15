using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MemberLevelDAL
    {
        private EntityControl control;

        public MemberLevelDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMemberLevel(MemberLevel memberLevel)
        {
            control.AddEntity(memberLevel);
        }

        public void UpdateMemberLevel(MemberLevel memberLevel, int ID)
        {
            control.UpdateEntity(memberLevel, ID);
        }

        public void DeleteMemberLevel(MemberLevel memberLevel)
        {
            control.DeleteEntity(memberLevel);
        }

        public IList GetAllMemberLevels(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}