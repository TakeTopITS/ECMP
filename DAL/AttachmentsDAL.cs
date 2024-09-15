using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AttachmentsDAL
    {
        private EntityControl control;

        public AttachmentsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAttachments(Attachments attachments)
        {
            control.AddEntity(attachments);
        }

        public void UpdateAttachments(Attachments attachments, int AttachmentID)
        {
            control.UpdateEntity(attachments, AttachmentID);
        }

        public void DeleteAttachments(Attachments attachments)
        {
            control.DeleteEntity(attachments);
        }

        public IList GetAllAttachmentss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}