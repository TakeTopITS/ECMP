using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookInformationDAL
    {
        private EntityControl control;

        public BookInformationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookInformation(BookInformation bookInformation)
        {
            control.AddEntity(bookInformation);
        }

        public void UpdateBookInformation(BookInformation bookInformation, int ID)
        {
            control.UpdateEntity(bookInformation, ID);
        }

        public void DeleteBookInformation(BookInformation bookInformation)
        {
            control.DeleteEntity(bookInformation);
        }

        public IList GetAllBookInformation(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}