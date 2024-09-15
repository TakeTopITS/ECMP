using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocTypeDAL
    {
        private EntityControl control;

        public DocTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocType(DocType docType)
        {
            control.AddEntity(docType);
        }

        public void UpdateDocType(DocType docType, int ID)
        {
            control.UpdateEntity(docType, ID);
        }

        public void DeleteDocType(DocType docType)
        {
            control.DeleteEntity(docType);
        }

        public IList GetAllDocTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}