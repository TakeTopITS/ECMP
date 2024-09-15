using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ContactInforBLL
    {
        public void AddContactInfor(ContactInfor contactInfor)
        {
            ContactInforDAL dal = new ContactInforDAL();
            dal.AddContactInfor(contactInfor);
        }

        public void UpdateContactInfor(ContactInfor contactInfor, int ID)
        {
            ContactInforDAL dal = new ContactInforDAL();
            dal.UpdateContactInfor(contactInfor, ID);
        }

        public void DeleteContactInfor(ContactInfor contactInfor)
        {
            ContactInforDAL dal = new ContactInforDAL();
            dal.DeleteContactInfor(contactInfor);
        }

        public IList GetAllContactInfors(string strHQL)
        {
            ContactInforDAL dal = new ContactInforDAL();
            return dal.GetAllContactInfors(strHQL);
        }
    }
}