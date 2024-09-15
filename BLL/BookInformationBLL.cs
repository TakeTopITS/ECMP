using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BookInformationBLL
    {
        public void AddBookInformation(BookInformation bookInformation)
        {
            BookInformationDAL dal = new BookInformationDAL();
            dal.AddBookInformation(bookInformation);
        }

        public void UpdateBookInformation(BookInformation bookInformation, int ID)
        {
            BookInformationDAL dal = new BookInformationDAL();
            dal.UpdateBookInformation(bookInformation, ID);
        }

        public void DeleteBookInformation(BookInformation bookInformation)
        {
            BookInformationDAL dal = new BookInformationDAL();
            dal.DeleteBookInformation(bookInformation);
        }

        public IList GetAllBookInformation(string strHQL)
        {
            BookInformationDAL dal = new BookInformationDAL();
            return dal.GetAllBookInformation(strHQL);
        }
    }
}