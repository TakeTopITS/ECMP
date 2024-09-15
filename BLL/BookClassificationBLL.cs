using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookClassificationBLL
    {
        public void AddBookClassification(BookClassification bookClassification)
        {
            BookClassificationDAL dal = new BookClassificationDAL();
            dal.AddBookClassification(bookClassification);
        }

        public void UpdateBookClassification(BookClassification bookClassification, int ID)
        {
            BookClassificationDAL dal = new BookClassificationDAL();
            dal.UpdateBookClassification(bookClassification, ID);
        }

        public void DeleteBookClassification(BookClassification bookClassification)
        {
            BookClassificationDAL dal = new BookClassificationDAL();
            dal.DeleteBookClassification(bookClassification);
        }

        public IList GetAllBookClassification(string strHQL)
        {
            BookClassificationDAL dal = new BookClassificationDAL();
            return dal.GetAllBookClassification(strHQL);
        }
    }
}