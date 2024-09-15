using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookCertificateDAL
    {
        private EntityControl control;

        public BookCertificateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookCertificate(BookCertificate bookCertificate)
        {
            control.AddEntity(bookCertificate);
        }

        public void UpdateBookCertificate(BookCertificate bookCertificate, int ID)
        {
            control.UpdateEntity(bookCertificate, ID);
        }

        public void DeleteBookCertificate(BookCertificate bookCertificate)
        {
            control.DeleteEntity(bookCertificate);
        }

        public IList GetAllBookCertificate(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}