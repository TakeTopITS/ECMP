using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocumentDAL
    {
        private EntityControl control;

        public DocumentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocument(Document document)
        {
            control.AddEntity(document);
        }

        public void UpdateDocument(Document document, int DocID)
        {
            control.UpdateEntity(document, DocID);
        }

        public void DeleteDocument(Document document)
        {
            control.DeleteEntity(document);
        }

        public IList GetAllDocuments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}