using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookReaderTypeBLL
    {
        public void AddBookReaderType(BookReaderType bookReaderType)
        {
            BookReaderTypeDAL dal = new BookReaderTypeDAL();
            dal.AddBookReaderType(bookReaderType);
        }

        public void UpdateBookReaderType(BookReaderType bookReaderType, int ID)
        {
            BookReaderTypeDAL dal = new BookReaderTypeDAL();
            dal.UpdateBookReaderType(bookReaderType, ID);
        }

        public void DeleteBookReaderType(BookReaderType bookReaderType)
        {
            BookReaderTypeDAL dal = new BookReaderTypeDAL();
            dal.DeleteBookReaderType(bookReaderType);
        }

        public IList GetAllBookReaderType(string strHQL)
        {
            BookReaderTypeDAL dal = new BookReaderTypeDAL();
            return dal.GetAllBookReaderType(strHQL);
        }
    }
}