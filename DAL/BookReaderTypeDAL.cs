using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookReaderTypeDAL
    {
        private EntityControl control;

        public BookReaderTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookReaderType(BookReaderType bookReaderType)
        {
            control.AddEntity(bookReaderType);
        }

        public void UpdateBookReaderType(BookReaderType bookReaderType, int ID)
        {
            control.UpdateEntity(bookReaderType, ID);
        }

        public void DeleteBookReaderType(BookReaderType bookReaderType)
        {
            control.DeleteEntity(bookReaderType);
        }

        public IList GetAllBookReaderType(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}