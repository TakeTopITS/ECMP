using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocumentBLL
    {
        public void AddDocument(Document document)
        {
            DocumentDAL dal = new DocumentDAL();
            dal.AddDocument(document);
        }

        public void UpdateDocument(Document document, int DocID)
        {
            DocumentDAL dal = new DocumentDAL();
            dal.UpdateDocument(document, DocID);
        }

        public void DeleteDocument(Document document)
        {
            DocumentDAL dal = new DocumentDAL();
            dal.DeleteDocument(document);
        }

        public IList GetAllDocuments(string strHQL)
        {
            DocumentDAL dal = new DocumentDAL();
            return dal.GetAllDocuments(strHQL);
        }
    }
}