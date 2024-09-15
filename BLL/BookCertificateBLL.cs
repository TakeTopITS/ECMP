using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookCertificateBLL
    {
        public void AddBookCertificate(BookCertificate bookCertificate)
        {
            BookCertificateDAL dal = new BookCertificateDAL();
            dal.AddBookCertificate(bookCertificate);
        }

        public void UpdateBookCertificate(BookCertificate bookCertificate, int ID)
        {
            BookCertificateDAL dal = new BookCertificateDAL();
            dal.UpdateBookCertificate(bookCertificate, ID);
        }

        public void DeleteBookCertificate(BookCertificate bookCertificate)
        {
            BookCertificateDAL dal = new BookCertificateDAL();
            dal.DeleteBookCertificate(bookCertificate);
        }

        public IList GetAllBookCertificate(string strHQL)
        {
            BookCertificateDAL dal = new BookCertificateDAL();
            return dal.GetAllBookCertificate(strHQL);
        }
    }
}