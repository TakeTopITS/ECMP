using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedEntryOrderForInnerDAL
    {
        private EntityControl control;

        public ConstractRelatedEntryOrderForInnerDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner)
        {
            control.AddEntity(constractRelatedEntryOrderForInner);
        }

        public void UpdateConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner, int ID)
        {
            control.UpdateEntity(constractRelatedEntryOrderForInner, ID);
        }

        public void DeleteConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner)
        {
            control.DeleteEntity(constractRelatedEntryOrderForInner);
        }

        public IList GetAllConstractRelatedEntryOrderForInners(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}