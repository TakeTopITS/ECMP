using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookPublishersBLL
    {
        public void AddBookPublishers(BookPublishers bookPublishers)
        {
            BookPublishersDAL dal = new BookPublishersDAL();
            dal.AddBookPublishers(bookPublishers);
        }

        public void UpdateBookPublishers(BookPublishers bookPublishers, int ID)
        {
            BookPublishersDAL dal = new BookPublishersDAL();
            dal.UpdateBookPublishers(bookPublishers, ID);
        }

        public void DeleteBookPublishers(BookPublishers bookPublishers)
        {
            BookPublishersDAL dal = new BookPublishersDAL();
            dal.DeleteBookPublishers(bookPublishers);
        }

        public IList GetAllBookPublishers(string strHQL)
        {
            BookPublishersDAL dal = new BookPublishersDAL();
            return dal.GetAllBookPublishers(strHQL);
        }
    }
}