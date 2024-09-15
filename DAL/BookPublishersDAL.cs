using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookPublishersDAL
    {
        private EntityControl control;

        public BookPublishersDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookPublishers(BookPublishers bookPublishers)
        {
            control.AddEntity(bookPublishers);
        }

        public void UpdateBookPublishers(BookPublishers bookPublishers, int ID)
        {
            control.UpdateEntity(bookPublishers, ID);
        }

        public void DeleteBookPublishers(BookPublishers bookPublishers)
        {
            control.DeleteEntity(bookPublishers);
        }

        public IList GetAllBookPublishers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}