using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SMSNetSegmentDAL
    {
        private EntityControl control;

        public SMSNetSegmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSMSNetSegment(SMSNetSegment smsNetSegment)
        {
            control.AddEntity(smsNetSegment);
        }

        public void UpdateSMSNetSegment(SMSNetSegment smsNetSegment, int ID)
        {
            control.UpdateEntity(smsNetSegment, ID);
        }

        public void DeleteSMSNetSegment(SMSNetSegment smsNetSegment)
        {
            control.DeleteEntity(smsNetSegment);
        }

        public IList GetAllSMSNetSegments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}