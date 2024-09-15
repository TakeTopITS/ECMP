using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BookClassificationDAL
    {
        private EntityControl control;

        public BookClassificationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBookClassification(BookClassification bookClassification)
        {
            control.AddEntity(bookClassification);
        }

        public void UpdateBookClassification(BookClassification bookClassification, int ID)
        {
            control.UpdateEntity(bookClassification, ID);
        }

        public void DeleteBookClassification(BookClassification bookClassification)
        {
            control.DeleteEntity(bookClassification);
        }

        public IList GetAllBookClassification(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}