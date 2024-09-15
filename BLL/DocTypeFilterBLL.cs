using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocTypeFilterBLL
    {
        public void AddDocTypeFilter(DocTypeFilter docTypeFilter)
        {
            DocTypeFilterDAL dal = new DocTypeFilterDAL();
            dal.AddDocTypeFilter(docTypeFilter);
        }

        public void UpdateDocTypeFilter(DocTypeFilter docTypeFilter, string DocType)
        {
            DocTypeFilterDAL dal = new DocTypeFilterDAL();
            dal.UpdateDocTypeFilter(docTypeFilter, DocType);
        }

        public void DeleteDocTypeFilter(DocTypeFilter docTypeFilter)
        {
            DocTypeFilterDAL dal = new DocTypeFilterDAL();
            dal.DeleteDocTypeFilter(docTypeFilter);
        }

        public IList GetAllDocTypeFilters(string strHQL)
        {
            DocTypeFilterDAL dal = new DocTypeFilterDAL();
            return dal.GetAllDocTypeFilters(strHQL);
        }
    }
}