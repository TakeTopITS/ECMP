using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocTypeFilterDAL
    {
        private EntityControl control;

        public DocTypeFilterDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocTypeFilter(DocTypeFilter docTypeFilter)
        {
            control.AddEntity(docTypeFilter);
        }

        public void UpdateDocTypeFilter(DocTypeFilter docTypeFilter, string DocType)
        {
            control.UpdateEntity(docTypeFilter, DocType);
        }

        public void DeleteDocTypeFilter(DocTypeFilter docTypeFilter)
        {
            control.DeleteEntity(docTypeFilter);
        }

        public IList GetAllDocTypeFilters(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}