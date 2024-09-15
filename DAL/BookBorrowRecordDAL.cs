using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookBorrowRecordDAL
    {
        private EntityControl control;

        public BookBorrowRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookBorrowRecord(BookBorrowRecord bookBorrowRecord)
        {
            control.AddEntity(bookBorrowRecord);
        }

        public void UpdateBookBorrowRecord(BookBorrowRecord bookBorrowRecord, int ID)
        {
            control.UpdateEntity(bookBorrowRecord, ID);
        }

        public void DeleteBookBorrowRecord(BookBorrowRecord bookBorrowRecord)
        {
            control.DeleteEntity(bookBorrowRecord);
        }

        public IList GetAllBookBorrowRecord(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}