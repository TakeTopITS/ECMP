using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocTypeBLL
    {
        public void AddDocType(DocType docType)
        {
            DocTypeDAL dal = new DocTypeDAL();
            dal.AddDocType(docType);
        }

        public void UpdateDocType(DocType docType, int ID)
        {
            DocTypeDAL dal = new DocTypeDAL();
            dal.UpdateDocType(docType, ID);
        }

        public void DeleteDocType(DocType docType)
        {
            DocTypeDAL dal = new DocTypeDAL();
            dal.DeleteDocType(docType);
        }

        public IList GetAllDocTypes(string strHQL)
        {
            DocTypeDAL dal = new DocTypeDAL();
            return dal.GetAllDocTypes(strHQL);
        }
    }
}