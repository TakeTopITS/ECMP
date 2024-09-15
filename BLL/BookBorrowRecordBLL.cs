using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookBorrowRecordBLL
    {
        public void AddBookBorrowRecord(BookBorrowRecord bookBorrowRecord)
        {
            BookBorrowRecordDAL dal = new BookBorrowRecordDAL();
            dal.AddBookBorrowRecord(bookBorrowRecord);
        }

        public void UpdateBookBorrowRecord(BookBorrowRecord bookBorrowRecord, int ID)
        {
            BookBorrowRecordDAL dal = new BookBorrowRecordDAL();
            dal.UpdateBookBorrowRecord(bookBorrowRecord, ID);
        }

        public void DeleteBookBorrowRecord(BookBorrowRecord bookBorrowRecord)
        {
            BookBorrowRecordDAL dal = new BookBorrowRecordDAL();
            dal.DeleteBookBorrowRecord(bookBorrowRecord);
        }

        public IList GetAllBookBorrowRecord(string strHQL)
        {
            BookBorrowRecordDAL dal = new BookBorrowRecordDAL();
            return dal.GetAllBookBorrowRecord(strHQL);
        }
    }
}