using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RelatedDefectBLL
    {
        public void AddRelatedDefect(RelatedDefect relatedDefect)
        {
            RelatedDefectDAL dal = new RelatedDefectDAL();
            dal.AddRelatedDefect(relatedDefect);
        }

        public void UpdateRelatedDefect(RelatedDefect relatedDefect, int ID)
        {
            RelatedDefectDAL dal = new RelatedDefectDAL();
            dal.UpdateRelatedDefect(relatedDefect, ID);
        }

        public void DeleteRelatedDefect(RelatedDefect relatedDefect)
        {
            RelatedDefectDAL dal = new RelatedDefectDAL();
            dal.DeleteRelatedDefect(relatedDefect);
        }

        public IList GetAllRelatedDefects(string strHQL)
        {
            RelatedDefectDAL dal = new RelatedDefectDAL();
            return dal.GetAllRelatedDefects(strHQL);
        }
    }
}