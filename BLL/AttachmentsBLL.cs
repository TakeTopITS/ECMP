using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AttachmentsBLL
    {
        public void AddAttachments(Attachments attachments)
        {
            AttachmentsDAL dal = new AttachmentsDAL();
            dal.AddAttachments(attachments);
        }

        public void UpdateAttachments(Attachments attachments, int AttachmentID)
        {
            AttachmentsDAL dal = new AttachmentsDAL();
            dal.UpdateAttachments(attachments, AttachmentID);
        }

        public void DeleteAttachments(Attachments attachments)
        {
            AttachmentsDAL dal = new AttachmentsDAL();
            dal.DeleteAttachments(attachments);
        }

        public IList GetAllAttachmentss(string strHQL)
        {
            AttachmentsDAL dal = new AttachmentsDAL();
            return dal.GetAllAttachmentss(strHQL);
        }
    }
}