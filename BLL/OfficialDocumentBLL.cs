using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class OfficialDocumentBLL
    {
        public void AddOfficialDocument(OfficialDocument officialDocument)
        {
            OfficialDocumentDAL dal = new OfficialDocumentDAL();
            dal.AddOfficialDocument(officialDocument);
        }

        public void UpdateOfficialDocument(OfficialDocument officialDocument, int ID)
        {
            OfficialDocumentDAL dal = new OfficialDocumentDAL();
            dal.UpdateOfficialDocument(officialDocument, ID);
        }

        public void DeleteOfficialDocument(OfficialDocument officialDocument)
        {
            OfficialDocumentDAL dal = new OfficialDocumentDAL();
            dal.DeleteOfficialDocument(officialDocument);
        }

        public IList GetAllOfficialDocuments(string strHQL)
        {
            OfficialDocumentDAL dal = new OfficialDocumentDAL();
            return dal.GetAllOfficialDocuments(strHQL);
        }
    }
}