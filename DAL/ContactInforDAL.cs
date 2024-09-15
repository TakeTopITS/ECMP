using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ContactInforDAL
    {
        private EntityControl control;

        public ContactInforDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddContactInfor(ContactInfor contactInfor)
        {
            control.AddEntity(contactInfor);
        }

        public void UpdateContactInfor(ContactInfor contactInfor, int ID)
        {
            control.UpdateEntity(contactInfor, ID);
        }

        public void DeleteContactInfor(ContactInfor contactInfor)
        {
            control.DeleteEntity(contactInfor);
        }

        public IList GetAllContactInfors(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}