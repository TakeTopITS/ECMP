using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class OfficialDocumentDAL
    {
        private EntityControl control;

        public OfficialDocumentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddOfficialDocument(OfficialDocument officialDocument)
        {
            control.AddEntity(officialDocument);
        }

        public void UpdateOfficialDocument(OfficialDocument officialDocument, int ID)
        {
            control.UpdateEntity(officialDocument, ID);
        }

        public void DeleteOfficialDocument(OfficialDocument officialDocument)
        {
            control.DeleteEntity(officialDocument);
        }

        public IList GetAllOfficialDocuments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}